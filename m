Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyUlG-00077U-Vw
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 16:32:27 +0000
Subject: NAND: S3C2410: Change printk() into dev_dbg()
Message-Id: <20080520163214.086521919@fluff.org.uk>
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Content-Disposition: inline;
	filename=simtec/simtec-drivers-mtd-s3c2410-fixprintk.patch
Date: Tue, 20 May 2008 17:32:14 +0100
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a minor problem with what should have been
debug output by changing printk() to dev_dbg()
inside s3c2410_nand_update_chip().

Thanks to David Woodhouse for pointing this out.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Index: linux-2.6.26-rc3-quilt1/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.26-rc3-quilt1.orig/drivers/mtd/nand/s3c2410.c	2008-05-20 17:16:20.000000000 +0100
+++ linux-2.6.26-rc3-quilt1/drivers/mtd/nand/s3c2410.c	2008-05-20 17:23:20.000000000 +0100
@@ -691,7 +691,8 @@ static void s3c2410_nand_update_chip(str
 {
 	struct nand_chip *chip = &nmtd->chip;
 
-	printk("%s: chip %p: %d\n", __func__, chip, chip->page_shift);
+	dev_dbg(info->device, "chip %p => page shift %d\n",
+		chip, chip->page_shift);
 
 	if (hardware_ecc) {
 		/* change the behaviour depending on wether we are using

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
