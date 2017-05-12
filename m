Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d95BP-0003l3-TB
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 07:40:17 +0000
Received: by mail-qk0-x243.google.com with SMTP id k74so6786740qke.2
 for <linux-mtd@lists.infradead.org>; Fri, 12 May 2017 00:39:55 -0700 (PDT)
From: "Mario J. Rugiero" <mrugiero@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: [PATCH v3] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Date: Fri, 12 May 2017 04:39:46 -0300
Message-Id: <20170512073946.812-1-mrugiero@gmail.com>
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
the blocks. It still warns about it, since that's potentially
dangerous.

Example usage: recovering NAND chips on sunxi devices, as explained
here: http://linux-sunxi.org/Mainline_NAND_Howto#Known_issues

v3: Warn when erasing a bad block, as suggested by Andrea Scian.

v2: Fix a typo in the config description.

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
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
index d474378ed810..282410813a9c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3211,8 +3211,10 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 					chip->page_shift, allowbbt)) {
 			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
 				    __func__, page);
+			#ifndef CONFIG_MTD_NAND_ERASE_BADBLOCKS
 			instr->state = MTD_ERASE_FAILED;
 			goto erase_exit;
+			#endif
 		}
 
 		/*
-- 
2.13.0
