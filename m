Received: from mail.glaze.se ([212.209.188.162] helo=rocket.glaze.se)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMu1I-0006Md-LX
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 17:08:41 -0400
Received: from IBMJP (unknown [10.42.1.6])
	by rocket.glaze.se (Postfix) with ESMTP id E02AE37646A
	for <linux-mtd@lists.infradead.org>;
	Tue,  4 Oct 2005 22:49:18 +0200 (CEST)
From: "Jan Pedersen" <jan.pedersen@glaze.dk>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2005 22:49:21 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <20051004204918.E02AE37646A@rocket.glaze.se>
Subject: [patch] cfi: remove warning message on expected behaivor
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When an erase operation is in progress, the DQ5 (data bit 5 / exceeded
timing limit) pin on the flash chips may raise just before operation
complete is detected. This is expected behaivor because when the erase is
complete, DQ5 switches from 'exceeded timing limit' to 'data bit 5' which
therefore might be read as '1' just before operation complete is detected.
This fix is well tested.

Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
---
diff -Naur linux-2.4.31.org/drivers/mtd/chips/cfi_cmdset_0002.c
linux-2.4.31/drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.4.31.org/drivers/mtd/chips/cfi_cmdset_0002.c	2004-11-17
06:54:21.000000000 -0500
+++ linux-2.4.31/drivers/mtd/chips/cfi_cmdset_0002.c	2005-08-22
12:14:17.000000000 -0400
@@ -950,12 +950,8 @@
 		    oldstatus   = cfi_read( map, adr );
 		    status      = cfi_read( map, adr );
 		    
-		    if( ( oldstatus & 0x00FF ) == ( status & 0x00FF ) )
+		    if( ( oldstatus & 0x00FF ) != ( status & 0x00FF ) )
 		    {
-                printk( "Warning: DQ5 raised while erase operation was in
progress, but erase completed OK\n" ); 		    
-		    } 			
-			else
-            {
 			    /* DQ5 is active so we can do a reset and stop
the erase */
 				cfi_write(map, CMD(0xF0), chip->start);
                 printk( KERN_WARNING "Internal flash device timeout occured
or write operation was performed while flash was erasing\n" );
