<?php require_once('includes/init.php'); ?>
<?php cek_login($role = array(1, 2)); ?>

<?php
$errors = array();
$sukses = false;

$ada_error = false;
$result = '';

$id_air = (isset($_GET['id'])) ? trim($_GET['id']) : '';

if(!$id_air) {
	$ada_error = 'Maaf, data tidak dapat diproses.';
} else {
	$query = $pdo->prepare('SELECT * FROM air WHERE id_air = :id_air');
	$query->execute(array('id_air' => $id_air));
	$result = $query->fetch();
	
	if(empty($result)) {
		$ada_error = 'Maaf, data tidak dapat diproses.';
	}

	$id_air = (isset($result['id_air'])) ? trim($result['id_air']) : '';
	$no_kalung = (isset($result['no_kalung'])) ? trim($result['no_kalung']) : '';
	$ciri_khas = (isset($result['ciri_khas'])) ? trim($result['ciri_khas']) : '';
	$tanggal_input = (isset($result['tanggal_input'])) ? trim($result['tanggal_input']) : '';
}

if(isset($_POST['submit'])):	
	
	$no_kalung = (isset($_POST['no_kalung'])) ? trim($_POST['no_kalung']) : '';
	$ciri_khas = (isset($_POST['ciri_khas'])) ? trim($_POST['ciri_khas']) : '';
	$tanggal_input = (isset($_POST['tanggal_input'])) ? trim($_POST['tanggal_input']) : '';
	$kriteria = (isset($_POST['kriteria'])) ? $_POST['kriteria'] : array();
	
	// Validasi ID air
	if(!$id_air) {
		$errors[] = 'ID air tidak ada';
	}
	// Validasi
	if(!$no_kalung) {
		$errors[] = 'Nomor air tidak boleh kosong';
	}
	if(!$tanggal_input) {
		$errors[] = 'Tanggal input tidak boleh kosong';
	}
	
	// Jika lolos validasi lakukan hal di bawah ini
	if(empty($errors)):
		
		$prepare_query = 'UPDATE air SET no_kalung = :no_kalung, ciri_khas = :ciri_khas, tanggal_input = :tanggal_input WHERE id_air = :id_air';
		$data = array(
			'no_kalung' => $no_kalung,
			'ciri_khas' => $ciri_khas,
			'tanggal_input' => $tanggal_input,
			'id_air' => $id_air,
		);		
		$handle = $pdo->prepare($prepare_query);		
		$sukses = $handle->execute($data);
		
		if(!empty($kriteria)):
			foreach($kriteria as $id_kriteria => $nilai):
				$handle = $pdo->prepare('INSERT INTO nilai_air (id_air, id_kriteria, nilai) 
				VALUES (:id_air, :id_kriteria, :nilai)
				ON DUPLICATE KEY UPDATE nilai = :nilai');
				$handle->execute( array(
					'id_air' => $id_air,
					'id_kriteria' => $id_kriteria,
					'nilai' =>$nilai
				) );
			endforeach;
		endif;
		
		redirect_to('list-air.php?status=sukses-edit');
	
	endif;

endif;
?>

<?php
$judul_page = 'Edit Air Mineral';
require_once('template-parts/header.php');
?>

	<div class="main-content-row">
	<div class="container clearfix">
	
		<?php include_once('template-parts/sidebar-air.php'); ?>
	
		<div class="main-content the-content">
			<h1>Edit Data Air Mineral</h1>
			
			<?php if(!empty($errors)): ?>
			
				<div class="msg-box warning-box">
					<p><strong>Error:</strong></p>
					<ul>
						<?php foreach($errors as $error): ?>
							<li><?php echo $error; ?></li>
						<?php endforeach; ?>
					</ul>
				</div>
				
			<?php endif; ?>
			
			<?php if($sukses): ?>
			
				<div class="msg-box">
					<p>Data berhasil disimpan</p>
				</div>	
				
			<?php elseif($ada_error): ?>
				
				<p><?php echo $ada_error; ?></p>
			
			<?php else: ?>				
				
				<form action="edit-air.php?id=<?php echo $id_air; ?>" method="post">
					<div class="field-wrap clearfix">					
						<label>Nama Merek Air Mineral <span class="red">*</span></label>
						<input type="text" name="no_kalung" value="<?php echo $no_kalung; ?>">
					</div>					
					<div class="field-wrap clearfix">					
						<label>Slogan Merek Air Mineral</label>
						<textarea name="ciri_khas" cols="30" rows="2"><?php echo $ciri_khas; ?></textarea>
					</div>
					<div class="field-wrap clearfix">					
						<label>Tanggal Input <span class="red">*</span></label>
						<input type="text" name="tanggal_input" value="<?php echo $tanggal_input; ?>" class="datepicker">
					</div>	
					
					<h3>Nilai Kriteria</h3>
					<?php
					$query2 = $pdo->prepare('SELECT nilai_air.nilai AS nilai, kriteria.nama AS nama, kriteria.id_kriteria AS id_kriteria, kriteria.ada_pilihan AS jenis_nilai 
					FROM kriteria LEFT JOIN nilai_air 
					ON nilai_air.id_kriteria = kriteria.id_kriteria 
					AND nilai_air.id_air = :id_air 
					ORDER BY kriteria.urutan_order ASC');
					$query2->execute(array(
						'id_air' => $id_air
					));
					$query2->setFetchMode(PDO::FETCH_ASSOC);
					
					if($query2->rowCount() > 0):
					
						while($kriteria = $query2->fetch()):
						?>
							<div class="field-wrap clearfix">					
								<label><?php echo $kriteria['nama']; ?></label>
								<?php if(!$kriteria['jenis_nilai']): ?>
									<input type="number" step="0.001" name="kriteria[<?php echo $kriteria['id_kriteria']; ?>]" value="<?php echo ($kriteria['nilai']) ? $kriteria['nilai'] : 0; ?>">								
								<?php else: ?>
									<select name="kriteria[<?php echo $kriteria['id_kriteria']; ?>]">
										<option value="0">-- Pilih Variabel --</option>
										<?php
										$query3 = $pdo->prepare('SELECT * FROM pilihan_kriteria WHERE id_kriteria = :id_kriteria ORDER BY urutan_order ASC');			
										$query3->execute(array(
											'id_kriteria' => $kriteria['id_kriteria']
										));
										// menampilkan berupa nama field
										$query3->setFetchMode(PDO::FETCH_ASSOC);
										if($query3->rowCount() > 0): while($hasl = $query3->fetch()):
										?>
											<option value="<?php echo $hasl['nilai']; ?>" <?php selected($kriteria['nilai'], $hasl['nilai']); ?>><?php echo $hasl['nama']; ?></option>
										<?php
										endwhile; endif;
										?>
									</select>
								<?php endif; ?>
							</div>		
						<?php
						endwhile;
						
					else:					
						echo '<p>Kriteria masih kosong.</p>';						
					endif;
					?>
					
					<div class="field-wrap clearfix">
						<button type="submit" name="submit" value="submit" class="button">Simpan Air Mineral</button>
					</div>
				</form>
				
			<?php endif; ?>			
			
		</div>
	
	</div><!-- .container -->
	</div><!-- .main-content-row -->


<?php
require_once('template-parts/footer.php');