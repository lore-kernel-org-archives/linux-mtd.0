Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d93Vq-0004hk-BA
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 05:53:16 +0000
Received: by mail-qk0-x242.google.com with SMTP id o85so6584084qkh.0
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 22:52:53 -0700 (PDT)
From: "Mario J. Rugiero" <mrugiero@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: [PATCH v2] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Date: Fri, 12 May 2017 02:52:46 -0300
Message-Id: <20170512055246.10936-1-mrugiero@gmail.com>
In-Reply-To: <20170512053957.10426-1-mrugiero@gmail.com>
References: <20170512053957.10426-1-mrugiero@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some chips used under a custom vendor driver can get their blocks
incorrectly detected as bad blocks, out of incompatibilities
between such drivers and MTD drivers.
When there are too many misdetected bad blocks, the device becomes
unusable because a bad block table can't be allocated, aside from
all the legitimately good blocks which become unusable under these
conditions.
This adds a build option to workaround the issue by enabling the
user to free up space regardless of what the driver thinks about
the blocks.

Example usage: recovering NAND chips on sunxi devices, as explained
here: http://linux-sunxi.org/Mainline_NAND_Howto#Known_issues

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>

v2: Fix a typo in the build option description.

---
 drivers/mtd/nand/Kconfig     | 9 +++++++++
 drivers/mtd/nand/nand_base.c | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index c3029528063b..e0a32a34b6bf 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -36,6 +36,15 @@ config MTD_NAND_ECC_BCH
 	  ECC codes. They are used with NAND devices requiring more than 1 bit
 	  of error correction.
 
+config MTD_NAND_ERASE_BADBLOCKS
+	bool "Enable erasing of bad blocks (DANGEROUS)"
+	default n
+	help
+	  This enables support for attempting to erase bad blocks.
+	  It is needed to workaround too many badblocks issue on chips used
+	  under custom, incompatible vendor drivers.
+	  Say N if unsure.
+
 config MTD_SM_COMMON
 	tristate
 	default n
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d474378ed810..0216dfc67976 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3206,6 +3206,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	instr->state = MTD_ERASING;
 
 	while (len) {
+		#ifndef CONFIG_MTD_NAND_ERASE_BADBLOCKS
 		/* Check if we have a bad block, we do not erase bad blocks! */
 		if (nand_block_checkbad(mtd, ((loff_t) page) <<
 					chip->page_shift, allowbbt)) {
@@ -3214,6 +3215,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			instr->state = MTD_ERASE_FAILED;
 			goto erase_exit;
 		}
+		#endif
 
 		/*
 		 * Invalidate the page cache, if we erase the block which
-- 
2.13.0
