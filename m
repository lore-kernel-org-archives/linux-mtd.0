Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATFG-0000Si-MQ
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:25:31 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Allow the machine code to get the BBT table
	from NAND
Date: Sat, 30 May 2009 18:41:36 +0100
Message-Id: <1243705298-21814-10-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-9-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-6-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-7-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-8-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-9-git-send-email-ben-linux@fluff.org>
Cc: Michel Pollet <buserror@gmail.com>, Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michel Pollet <buserror@gmail.com>

Added a flag to allow the machine code to tell the NAND
subsystem that it should try to pickup a BBT from the flash,
and also skip the NAND full scan at startup.

Signed-off-by: Michel Pollet <buserror@gmail.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c/include/plat/nand.h |    5 +++++
 drivers/mtd/nand/s3c2410.c            |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c/include/plat/nand.h b/arch/arm/plat-s3c/include/plat/nand.h
index 350ec95..bed4a51 100644
--- a/arch/arm/plat-s3c/include/plat/nand.h
+++ b/arch/arm/plat-s3c/include/plat/nand.h
@@ -13,6 +13,10 @@
 /**
  * struct s3c2410_nand_set - define a set of one or more nand chips
  * @disable_ecc:	Entirely disable ECC - Dangerous
+ * @flash_bbt: 		Openmoko u-boot can create a Bad Block Table
+ *			Setting this flag will allow the kernel to
+ *			look for it at boot time and also skip the NAND
+ *			scan.
  * @nr_chips:		Number of chips in this set
  * @nr_partitions:	Number of partitions pointed to be partitoons (or zero)
  * @name:		Name of set (optional)
@@ -25,6 +29,7 @@
  */
 struct s3c2410_nand_set {
 	unsigned int		disable_ecc:1;
+	unsigned int		flash_bbt:1;
 
 	int			nr_chips;
 	int			nr_partitions;
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index ef56652..d315b51 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -845,6 +845,12 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 		dev_info(info->device, "NAND ECC UNKNOWN\n");
 		break;
 	}
+
+	/* If you use u-boot BBT creation code, specifying this flag will
+	 * let the kernel fish out the BBT from the NAND, and also skip the
+	 * full NAND scan that can take 1/2s or so. Little things... */
+	if (set->flash_bbt)
+		chip->options |= NAND_USE_FLASH_BBT | NAND_SKIP_BBTSCAN;
 }
 
 /**
-- 
1.5.6.5
