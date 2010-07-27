Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Odq2c-0002us-6A
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 19:42:19 +0000
Message-ID: <4C4F3691.9020505@broadcom.com>
Date: Tue, 27 Jul 2010 12:42:09 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
References: <4C4DEA3D.5070208@broadcom.com>
In-Reply-To: <4C4DEA3D.5070208@broadcom.com>
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found some newer Micron parts that introduce an 8K page size, and so
need a modification on the algorithm. Here's the updated list and a
revision to my patch.

Part			ID String		Block	Page	OOB
MT29F16G08ABABA		2C 48 00 26 89 00 00	512K	4K	224
MT29F16G08CBABA		2C 48 04 46 85 00 00	1024K	4K	224
MT29F16G08MAA		2C D5 94 3E 74 00 00	512K	4K	218
MT29F32G08CBACA		2C 68 04 4A A9 00 00	1024K	4K	224
MT29F64G08CBAAA		2C 88 04 4B A9 00 00	2048K	8K	448
MT29F256G08CJAAA	2C A8 05 CB A9 00 00	2048K	8K	448

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   37 ++++++++++++++++++++++++++++---------
 drivers/mtd/nand/nand_ids.c  |   10 ++++++++++
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4a7b864..a9216af 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2846,6 +2846,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		 * Field definitions are in the following datasheets:
 		 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
 		 * New style   (6 byte ID): Samsung K9GAG08U0D (p.40)
+		 * Micron      (5 byte ID): Micron MT29F16G08MAA (p.24)
+		 *      Note: Micron rule is based on heuristics for
+		 *            newer chips
 		 *
 		 * Check for wraparound + Samsung ID + nonzero 6th byte
 		 * to decide what to do.
@@ -2867,15 +2870,31 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			/* Calc pagesize */
 			mtd->writesize = 1024 << (extid & 0x03);
 			extid >>= 2;
-			/* Calc oobsize */
-			mtd->oobsize = (8 << (extid & 0x01)) *
-				(mtd->writesize >> 9);
-			extid >>= 2;
-			/* Calc blocksize. Blocksize is multiples of 64KiB */
-			mtd->erasesize = (64 * 1024) << (extid & 0x03);
-			extid >>= 2;
-			/* Get buswidth information */
-			busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
+			/* Check for 5 byte ID + Micron + read more 0x00 */
+			if (id_data[0] == NAND_MFR_MICRON && id_data[4] != 0x00
+					&& mtd->writesize >= 4096
+					&& id_data[5] == 0x00
+					&& id_data[6] == 0x00) {
+				/* OOB is 218B/224B per 4KiB pagesize */
+				mtd->oobsize = ((extid & 0x03) == 0x03 ? 218 :
+						224) << (mtd->writesize >> 13);
+				extid >>= 3;
+				/* Blocksize is multiple of 64KiB */
+				mtd->erasesize = mtd->writesize <<
+					(extid & 0x03) << 6;
+				/* All Micron have busw x8? */
+				busw = 0;
+			} else {
+				/* Calc oobsize */
+				mtd->oobsize = (8 << (extid & 0x01)) *
+					(mtd->writesize >> 9);
+				extid >>= 2;
+				/* Calc blocksize (multiples of 64KiB) */
+				mtd->erasesize = (64 * 1024) << (extid & 0x03);
+				extid >>= 2;
+				/* Get buswidth information */
+				busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
+			}
 		}
 	} else {
 		/*
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 89907ed..4f6e59a 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -107,9 +107,19 @@ struct nand_flash_dev nand_flash_ids[] = {
 	/* 16 Gigabit */
 	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
 	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
+	{"NAND 2GiB 3,3V 8-bit",	0x48, 0, 2048, 0, LP_OPTIONS},
 	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
 	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
 
+	/* 32 Gigabit */
+	{"NAND 4GiB 3,3V 8-bit",	0x68, 0, 4096, 0, LP_OPTIONS},
+
+	/* 64 Gigabit */
+	{"NAND 8GiB 3,3V 8-bit",	0x88, 0, 8192, 0, LP_OPTIONS},
+
+	/* 256 Gigabit */
+	{"NAND 32GiB 3,3V 8-bit",	0xA8, 0, 32768, 0, LP_OPTIONS},
+
 	/*
 	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
 	 * have a strange page/block layout !  The chosen minimum erasesize is
-- 
1.7.0.4
