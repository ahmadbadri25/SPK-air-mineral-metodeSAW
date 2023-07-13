<?php
require_once('includes/init.php');
$judul_page = 'Home';
require_once('template-parts/header.php');
?>


<html>
<style>
.ruam {
    padding-top: 150px;
    padding: 100px;
    font-size: 30px;
    font-weight: bold;
    color: black;
    text-align: center;
    align-items: center;
}

.ruam p {
    margin: 0;
    line-height: 1.5;
    /* Menambahkan jarak antara baris */
    font-style: italic;
    /* Menambahkan gaya miring pada teks */
}

.ruam::before {
    content: open-quote;
    /* Menambahkan tanda kutip pembuka sebelum teks */
    font-size: 50px;
    vertical-align: bottom;
}

.ruam::after {
    content: close-quote;
    /* Menambahkan tanda kutip penutup setelah teks */
    font-size: 40px;
    vertical-align: top;
}

/* Memberikan efek bayangan pada teks */
.ruam p {
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
}
</style>
<div class="ruam">
    <article>
        <p>Selamat datang di Rumah Uji Air Mineral (RUAM) untuk kebutuhan SPK Air Mineral - Tempat Terbaik untuk
            Menemukan Solusi Hidrasi Terpercaya!
            Temukan
            air
            mineral terbaik yang menghidupkan kesehatan Anda dengan mudah dan cepat. Dengan informasi yang akurat dan
            rekomendasi khusus, kami akan membantu Anda membuat keputusan yang tepat untuk kebutuhan hidrasi Anda.
            Nikmati
            manfaat segar dan sehat dari air mineral yang berkualitas tinggi, karena kesehatan Anda adalah prioritas
            utama
            bagi
            kami. Bersiaplah untuk merasakan kesegaran dan kesehatan optimal dengan RUAM!</p>
    </article>
</div>

</html>



<?php 
require_once('template-parts/footer.php');
?>