<html>
   <head>
      <title>Menampilkan Data Tabel MySQL Dengan mysqli_fetch_array</title>
      <style>
         body {font-family:tahoma, arial}
         table {border-collapse: collapse}
         th, td {font-size: 13px; border: 1px solid #DEDEDE; padding: 3px 5px; color: #303030}
         th {background: #CCCCCC; font-size: 12px; border-color:#B0B0B0}
      </style>
   </head>
   <body>
      <h3>Tabel Supplier (mysqli_fetch_array)</h3>
      <table>
         <thead>
            <tr>
               <th>Kode Supplier</th>
               <th>Nama</th>
            </tr>
         </thead>
         <?php
            include 'koneksi.php';		
            $sql = 'SELECT  * FROM SUPPLIER';
            $query = mysqli_query($koneksi, $sql);		
            while ($row = mysqli_fetch_array($query))
            {
            	?>
         <tbody>
            <tr>
               <td><?php echo $row['IDSUPPLIER'] ?></td>
               <td><?php echo $row['NAMASUPPLIER'] ?></td>
            </tr>
         </tbody>
         <?php
            }
            ?>
      </table>
      <h3>Tabel Barang (mysqli_fetch_row)</h3>
      <table>
         <thead>
            <tr>
               <th>KODE BARANG</th>
               <th>Nama Barang</th>
            </tr>
         </thead>
         <?php
            $sql = 'SELECT  * FROM BARANG';
            $query = mysqli_query($koneksi, $sql);		
            while ($row = mysqli_fetch_array($query))
            {
            	?>
         <tbody>
            <tr>
               <td><?php echo $row[0] ?></td>
               <td><?php echo $row[1] ?></td>
            </tr>
         </tbody>
         <?php
            }
            ?>
      </table>
      </table>
      <h3>Inner Join (mysqli_fetch_assoc)</h3>
      <h4> (mampilkan semua data pelanggan dari tabel pelanggan yang melakukan Pesanan)</h4>
      <table>
         <thead>
            <tr>
               <th>Kode Supplier</th>
               <th>Nama Supplier</th>
               <th>tgl transaksi</th>
               <th>Total transaksi</th>
            </tr>
         </thead>
         <?php
            $sql = 'SELECT 
a.IDSUPPLIER
,a.NAMASUPPLIER
,b.TANGGAL
,b.GRANDTOTAL
FROM SUPPLIER a 
JOIN NOTAPEMBELIAN b USING(IDSUPPLIER)';
            $query = mysqli_query($koneksi, $sql);		
            while ($row = mysqli_fetch_assoc($query))
            {
            	?>
         <tbody>
            <tr>
               <td><?php echo $row['IDSUPPLIER'] ?></td>
               <td><?php echo $row['NAMASUPPLIER'] ?></td>
               <td><?php echo $row['TANGGAL'] ?></td>
               <td><?php echo $row['GRANDTOTAL'] ?></td>
            </tr>
         </tbody>
         <?php
            }
            ?>
      </table>
      </table>
      </table>
      <h3>left outer Join </h3>
      <h4> (MENAMPILKAN DATA TRANSAKSI SUPPLIER DENGAN NOMOR TRANSAKSI )</h4>
      <table>
         <thead>
            <tr>
               <th>IDSUPPLIER</th>
               <th>NAMA SUPPLIER</th>
               <th>TGL TRANSAKSI</th>
               <th>NOMOR TRANSAKSI</th>
		<th>GRAND TOTAL</th>
            </tr>
         </thead>
         <?php
            $sql = 'SELECT a.IDSUPPLIER ,a.NAMASUPPLIER ,b.TANGGAL ,b.NOPEMBELIAN ,b.GRANDTOTAL FROM SUPPLIER a LEFT JOIN NOTAPEMBELIAN b USING(IDSUPPLIER)';
            $query = mysqli_query($koneksi, $sql);		
            while ($row = mysqli_fetch_assoc($query))
            {
            	?>
         <tbody>
            <tr>
               <td><?php echo $row['IDSUPPLIER'] ?></td>
               <td><?php echo $row['NAMASUPPLIER'] ?></td>
               <td><?php echo $row['TANGGAL'] ?></td>
               <td><?php echo $row['NOPEMBELIAN'] ?></td>
<td><?php echo $row['GRANDTOTAL'] ?></td>
            </tr>
         </tbody>
         <?php
            }
            ?>
      </table>
   </body>
</html>