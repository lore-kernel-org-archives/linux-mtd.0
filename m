Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIyLx-0002N1-Eo
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 12:15:01 +0000
Received: by pdrg1 with SMTP id g1so26746818pdr.2
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2015 05:14:36 -0700 (PDT)
From: Joseph East <eastyjr@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joseph East <eastyjr@gmail.com>
Subject: [PATCH] mtd: bcm47xxpart.c: Extra TRX magics, NVRAM part handling
Date: Sat, 25 Jul 2015 21:43:37 +0930
Message-Id: <1437826417-8200-1-git-send-email-eastyjr@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A combination of four patches from the OpenWRT project:

1) Add Xaiomi TRX signatures
2) Detect T-Meter partitions
3) Block reservation if NVRAM partition not found
4) Add Belkin TRX signatures (Play max series)

Based off of dev.openwrt.org repo @44854

<trunk/target/linux/generic/patches-3.18>
431-mtd-bcm47xx.part-support-for-Xaiomi-specific-board_da.patch
432-mtd-bcm47xx.part-detect-T_Meter_partition_da.patch

<trunk/target/linux/brcm47xx/patches-3.18>
400-mtd-bcm47xxpart-get-nvram.patch

Signed-off-by: Joseph East <eastyjr@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index c0720c1..aa9e425 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -33,16 +33,22 @@
 /* Magics */
 #define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
 #define BOARD_DATA_MAGIC2		0xBD0D0BBD
+#define BOARD_DATA_XIAOMI_MAGIC	0x474D4442Q	/* GMDB */
 #define CFE_MAGIC			0x43464531	/* 1EFC */
 #define FACTORY_MAGIC			0x59544346	/* FCTY */
 #define NVRAM_HEADER			0x48534C46	/* FLSH */
 #define POT_MAGIC1			0x54544f50	/* POTT */
 #define POT_MAGIC2			0x504f		/* OP */
+#define T_METER_MAGIC			0x4D540000	/* MT */
 #define ML_MAGIC1			0x39685a42
 #define ML_MAGIC2			0x26594131
 #define TRX_MAGIC			0x30524448
 #define SHSQ_MAGIC			0x71736873	/* shsq (weird ZTE H218N endianness) */
 #define UBI_EC_MAGIC			0x23494255	/* UBI# */
+#define BELKIN_F7D3301_MAGIC		0x20100322	/* Belkin TRX */
+#define BELKIN_F7D3302_MAGIC		0x20090928
+#define BELKIN_F7D4302_MAGIC		0x20101006
+#define BELKIN_F7D4401_MAGIC		0x00018517
 
 struct trx_header {
 	uint32_t magic;
@@ -53,6 +59,19 @@ struct trx_header {
 	uint32_t offset[3];
 } __packed;
 
+static bool is_trx_magic(uint32_t magic) {
+	switch (magic) {
+	case TRX_MAGIC:
+	case BELKIN_F7D3301_MAGIC:
+	case BELKIN_F7D3302_MAGIC:
+	case BELKIN_F7D4302_MAGIC:
+	case BELKIN_F7D4401_MAGIC:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void bcm47xxpart_add_part(struct mtd_partition *part, const char *name,
 				 u64 offset, uint32_t mask_flags)
 {
@@ -95,6 +114,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	int trx_part = -1;
 	int last_trx_part = -1;
 	int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
+	bool found_nvram = false;
 
 	/*
 	 * Some really old flashes (like AT45DB*) had smaller erasesize-s, but
@@ -176,8 +196,17 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			continue;
 		}
 
+		/* T_Meter */
+		if ((le32_to_cpu(buf[0x000 / 4]) & 0xFFFF0000) == T_METER_MAGIC &&
+		    (le32_to_cpu(buf[0x030 / 4]) & 0xFFFF0000) == T_METER_MAGIC &&
+		    (le32_to_cpu(buf[0x060 / 4]) & 0xFFFF0000) == T_METER_MAGIC) {
+			bcm47xxpart_add_part(&parts[curr_part++], "T_Meter", offset,
+					     MTD_WRITEABLE);
+			continue;
+		}
+
 		/* TRX */
-		if (buf[0x000 / 4] == TRX_MAGIC) {
+		if (is_trx_magic(buf[0x000 / 4])) {
 			if (BCM47XXPART_MAX_PARTS - curr_part < 4) {
 				pr_warn("Not enough partitions left to register trx, scanning stopped!\n");
 				break;
@@ -262,7 +291,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Some devices (ex. WNDR3700v3) don't have a standard 'MPFR' */
-		if (buf[0x000 / 4] == BOARD_DATA_MAGIC2) {
+		if (buf[0x000 / 4] == BOARD_DATA_MAGIC2 ||
+		    le32_to_cpu(buf[0x000 / 4]) == BOARD_DATA_XIAOMI_MAGIC) {
 			bcm47xxpart_add_part(&parts[curr_part++], "board_data",
 					     offset, MTD_WRITEABLE);
 			continue;
@@ -288,12 +318,23 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		if (buf[0] == NVRAM_HEADER) {
 			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
 					     master->size - blocksize, 0);
+			found_nvram = true;
 			break;
 		}
 	}
 
 	kfree(buf);
 
+	if (!found_nvram) {
+		pr_err("can not find a nvram partition reserve last block\n");
+		bcm47xxpart_add_part(&parts[curr_part++], "nvram_guess",
+				     master->size - blocksize * 2, MTD_WRITEABLE);
+		for (i = 0; i < curr_part; i++) {
+			if (parts[i].size + parts[i].offset == master->size)
+				parts[i].offset -= blocksize * 2;
+		}
+	}
+
 	/*
 	 * Assume that partitions end at the beginning of the one they are
 	 * followed by.
-- 
2.4.6
