Received: from mailout.stusta.mhn.de ([141.84.69.5] helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HCzRf-0002Wf-DU
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 09:31:22 -0500
Date: Fri, 2 Feb 2007 15:29:19 +0100
From: Adrian Bunk <bunk@stusta.de>
To: dwmw2@infradead.org
Subject: [2.6 patch] drivers/mtd/nand/cafe_ecc.c: fix an off-by-one in a BUG_ON
Message-ID: <20070202142919.GE3754@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

err_pos_lut[4096] of an array with 4096 elements is a bug.

Spotted by the Coverity checker.

While I was at it, I also converted it to ARRAY_SIZE().

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.20-rc6-mm3/drivers/mtd/nand/cafe_ecc.c.old	2007-02-02 14:45:13.000000000 +0100
+++ linux-2.6.20-rc6-mm3/drivers/mtd/nand/cafe_ecc.c	2007-02-02 14:45:42.000000000 +0100
@@ -1045,7 +1045,7 @@
 
 static unsigned short err_pos(unsigned short din)
 {
-	BUG_ON(din > 4096);
+	BUG_ON(din >= ARRAY_SIZE(err_pos_lut));
 	return err_pos_lut[din];
 }
 static int chk_no_err_only(unsigned short *chk_syndrome_list, unsigned short *err_info)
