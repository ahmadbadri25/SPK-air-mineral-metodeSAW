<?php require_once('includes/init.php'); ?>
<?php cek_login($role = array(1, 2)); ?>

<?php
$ada_error = false;
$result = '';

$id_air = (isset($_GET['id'])) ? trim($_GET['id']) : '';

if(!$id_air) {
	$ada_error = 'Maaf, data tidak dapat diproses.';
} else {
	$query = $pdo->prepare('SELECT id_air FROM air WHERE id_air = :id_air');
	$query->execute(array('id_air' => $id_air));
	$result = $query->fetch();
	
	if(empty($result)) {
		$ada_error = 'Maaf, data tidak dapat diproses.';
	} else {
		
		$handle = $pdo->prepare('DELETE FROM nilai_air WHERE id_air = :id_air');				
		$handle->execute(array(
			'id_air' => $result['id_air']
		));
		$handle = $pdo->prepare('DELETE FROM air WHERE id_air = :id_air');				
		$handle->execute(array(
			'id_air' => $result['id_air']
		));
		redirect_to('list-air.php?status=sukses-hapus');
		
	}
}
?>

<?php
$judul_page = 'Hapus Air Mineral';
require_once('template-parts/header.php');
?>

	<div class="main-content-row">
	<div class="container clearfix">
	
		<?php include_once('template-parts/sidebar-air.php'); ?>
	
		<div class="main-content the-content">
			<h1><?php echo $judul_page; ?></h1>
			
			<?php if($ada_error): ?>
			
				<?php echo '<p>'.$ada_error.'</p>'; ?>	
			
			<?php endif; ?>
			
		</div>
	
	</div><!-- .container -->
	</div><!-- .main-content-row -->


<?php
require_once('template-parts/footer.php');