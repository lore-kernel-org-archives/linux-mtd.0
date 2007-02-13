Received: from smtp.parrot.fr ([213.41.120.202])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGvrR-0004LO-Ae
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 06:30:16 -0500
Message-ID: <45D1A15E.5030109@parrot.fr>
Date: Tue, 13 Feb 2007 12:30:38 +0100
From: Matthieu CASTET <matthieu.castet@parrot.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] S3C2412 fix hw ecc
Content-Type: multipart/mixed; boundary="------------040403010702070700030002"
Cc: Ben Dooks <ben-fbdev@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040403010702070700030002
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

S3C2412 use differents registers than s3c2440 for hw ecc handling.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.fr>




--------------040403010702070700030002
Content-Type: text/plain;
 name="2412_ecc"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="2412_ecc"

Index: linux-2.6.20/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.20.orig/drivers/mtd/nand/s3c2410.c	2007-02-13 10:17:54.000000000 +0100
+++ linux-2.6.20/drivers/mtd/nand/s3c2410.c	2007-02-13 12:07:10.000000000 +0100
@@ -419,6 +419,15 @@
 	writel(ctrl, info->regs + S3C2410_NFCONF);
 }
 
+static void s3c2412_nand_enable_hwecc(struct mtd_info *mtd, int mode)
+{
+	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
+	unsigned long ctrl;
+
+	ctrl = readl(info->regs + S3C2440_NFCONT);
+	writel(ctrl | S3C2412_NFCONT_INIT_MAIN_ECC, info->regs + S3C2440_NFCONT);
+}
+
 static void s3c2440_nand_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
@@ -442,6 +451,20 @@
 	return 0;
 }
 
+static int s3c2412_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
+{
+	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
+	unsigned long ecc = readl(info->regs + S3C2412_NFMECC0);
+
+	ecc_code[0] = ecc;
+	ecc_code[1] = ecc >> 8;
+	ecc_code[2] = ecc >> 16;
+
+	pr_debug("calculate_ecc: returning ecc %02x,%02x,%02x\n", ecc_code[0], ecc_code[1], ecc_code[2]);
+
+	return 0;
+}
+
 static int s3c2440_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
@@ -619,6 +642,10 @@
 			break;
 
 		case TYPE_S3C2412:
+  			chip->ecc.hwctl     = s3c2412_nand_enable_hwecc;
+  			chip->ecc.calculate = s3c2412_nand_calculate_ecc;
+			break;
+
 		case TYPE_S3C2440:
   			chip->ecc.hwctl     = s3c2440_nand_enable_hwecc;
   			chip->ecc.calculate = s3c2440_nand_calculate_ecc;


--------------040403010702070700030002--
