Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdTuW-0007iH-F1
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 20:04:32 +0000
Message-ID: <4C4DEA3D.5070208@broadcom.com>
Date: Mon, 26 Jul 2010 13:04:13 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd/nand: Support Micron chips, 4KB page
Content-Type: multipart/mixed;
 boundary=------------040104080805040405020203
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


--------------040104080805040405020203
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit

The following parts exhibit some interesting patterns in their ID strings.
Their ID strings are not fully compatible with the current nand_base.c
detection algorithm. In order to detect them properly, I have taken the
liberty to develop a heuristic algorithm. None of these chips have a *good*
detection pattern listed in their datasheets, although MT29F16G08MAA has a
table on p.24 of its data sheet (not included here).

Part			ID String		Block	Page	OOB
MT29F16G08ABABA		2C 48 00 26 89 00 00	512K	4K	224
MT29F16G08CBABA		2C 48 04 46 85 00 00	1024K	4K	224
MT29F16G08MAA		2C D5 94 3E 74 00 00	512K	4K	218

I have attached a table logging most of the relevant data for the many chips
I have researched. The three chips are highlighted red, although there are
variants of the chips listed as well. I believe this patch should correctly
identify all the 5-byte ID Micron chips.

And before the question is asked: I realize that these chips support ONFI,
so that should be the primary means by which to identify them, but I would
still like to be able to detect these properly without ONFI if necessary,
especially considering some of the older NAND controllers we still use do not
support reading ONFI data.

Feedback on my logic is appreciated.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   34 +++++++++++++++++++++++++---------
 drivers/mtd/nand/nand_ids.c  |    1 +
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4a7b864..1ca230d 100644
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
@@ -2867,15 +2870,28 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
+				mtd->oobsize = ((extid & 0x03) == 0x03) ? 218
+					: 224;
+				extid >>= 3;
+				mtd->erasesize = (256 * 1024) << (extid & 0x03);
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
index 89907ed..25f6be2 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -107,6 +107,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	/* 16 Gigabit */
 	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
 	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
+	{"NAND 2GiB 3,3V 8-bit",	0x48, 0, 2048, 0, LP_OPTIONS},
 	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
 	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
 
-- 
1.7.0.4

--------------040104080805040405020203
Content-Type: text/plain;
 name=NAND_Data_mail.csv
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=NAND_Data_mail.csv

"Manufacturer","Part #","Man. ID","ID Code","Full ID","MB","Page","OOB","Block","Bus","ONFI","Bad Block Location","ECC Req.","Bits per cell","ID Length","Notes"
"Toshiba","TC58128AFT","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","All OOB bytes","?","1?",2,
"Samsung","K9F1G08U0B","0xEC","0xF1","0xECF1009540",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,5,
"Toshiba","TC58DVM72A1TG00","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","All OOB bytes","?","1?",2,
"Samsung","K9F5608D0C","0xEC","0x75","0xEC75",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,2,
"Samsung","K9F5608Q0C","0xEC","0x35","0xEC35",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,2,
"Samsung","K9F5608U0C","0xEC","0x75","0xEC75",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,2,
"Samsung","K9F5616D0C","0xEC","0x55","0xEC55",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,2,
"Samsung","K9F5616Q0C","0xEC","0x45","0xEC45",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,2,
"Samsung","K9F5616U0C","0xEC","0x55","0xEC55",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,2,"EDC"
"Samsung","K9F4G08U0A","0xEC","0xDC","0xECDC109554",64,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,5,
"Samsung","K9K8G08U1A","0xEC","0xDC","0xECDC109554",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,5,"Made of two K9F4G08U0As"
"Samsung","K9F4G08U0M","0xEC","0xDC","0xECDC109554",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,5,
"Samsung","K9K8G08U1M","0xEC","0xDC","0xECDC109554",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,5,
"ST","NAND128W3A","0x20","0x73","0x2073",16,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND256R3A","0x20","0x35","0x2035",32,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND256W3A","0x20","0x75","0x2075",32,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND256R4A","0x0020","0x0045","0x2045",32,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND256W4A","0x0020","0x0055","0x2055",32,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND512R3A","0x20","0x36","0x2036",64,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND512W3A","0x20","0x76","0x2076",64,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND512R4A","0x0020","0x0046","0x2046",64,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND512W4A","0x0020","0x0056","0x2056",64,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND01GR3A","0x20","0x39","0x2039",128,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND01GW3A","0x20","0x79","0x2079",128,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND01GR4A","0x0020","0x0049","0x2049",128,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND01GW4A","0x0020","0x0059","0x2059",128,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,2,
"ST","NAND512R3A2C","0x20","0x36","0x2036",64,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,"Similar part, different manufacturer (Numonyx NAND512-A2D); further cycles ignored"
"ST","NAND512W3A2C","0x20","0x76","0x2076",64,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","22-bit/2048-bits",1,2,"Similar part, different manufacturer (Numonyx NAND512-A2D); further cycles ignored"
"ST","NAND512R4A2C","0x0020","0x0046","0x2046",64,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,2,"Similar part, different manufacturer (Numonyx NAND512-A2D); further cycles ignored"
"ST","NAND512W4A2C","0x0020","0x0056","0x2056",64,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,2,"Similar part, different manufacturer (Numonyx NAND512-A2D); further cycles ignored"
"Numonyx","NAND512R3A2D","0x20","0x36","0x2036",64,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","1-bit/512-byte (2-bit detect)",1,2,"further cycles ignored"
"Numonyx","NAND512W3A2D","0x20","0x76","0x2076",64,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","1-bit/512-byte (2-bit detect)",1,2,"further cycles ignored"
"Numonyx","NAND512R4A2D","0x0020","0x0046","0x2046",64,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","1-bit/512-byte (2-bit detect)",1,2,"further cycles ignored"
"Numonyx","NAND512W4A2D","0x0020","0x0056","0x2056",64,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","1-bit/512-byte (2-bit detect)",1,2,"further cycles ignored"
"Numonyx","NAND01GR3A2C","0x20","0x78","0x2078",128,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","1-bit/512-byte (2-bit detect)",1,2,"further cycles ignored"
"Numonyx","NAND01GW3A2C","0x20","0x79","0x2079",128,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)","1-bit/512-byte (2-bit detect)",1,2,"further cycles ignored"
"Numonyx","NAND01GR4A2C","0x0020","0x0072","0x2072",128,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","1-bit/512-byte (2-bit detect)",1,2,"further cycles ignored"
"Numonyx","NAND01GW4A2C","0x0020","0x0074","0x2074",128,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)","1-bit/512-byte (2-bit detect)",1,2,"further cycles ignored"
"Hynix","HY27UF081G2M","0xAD","0xF1","0xADF1XX15",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?",1,4,"remains in Read ID mode"
"Hynix","HY27UF161G2M","0xAD","0xC1","0xADC1XX55",128,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?",1,4,"remains in Read ID mode"
"Hynix","HY27SF081G2M","0xAD","0xA1","0xADA1XX15",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?",1,4,"remains in Read ID mode"
"Hynix","HY27SF161G2M","0xAD","0xAD","0xADADXX55",128,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?",1,4,"remains in Read ID mode"
"Micron","MT29F2G08AAC","0x2C","0xDA","0x2CDAXX15",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte (or 528-byte)","1?",4,"remains in Read ID mode"
"Micron","MT29F2G08ABC","0x2C","0xAA","0x2CAAXX15",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte (or 528-byte)","1?",4,"remains in Read ID mode"
"Micron","MT29F2G16AAC","0x2C","0xCA","0x2CCAXX55",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte (or 528-byte)","1?",4,"remains in Read ID mode"
"Micron","MT29F2G16ABC","0x2C","0xBA","0x2CBAXX55",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte (or 528-byte)","1?",4,"remains in Read ID mode"
"Micron","MT29F4G08BAC","0x2C","0xDC","0x2CDCXX15",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte (or 528-byte)","1?",4,"remains in Read ID mode"
"Micron","MT29F8G08FAC","0x2C","0xDC","0x2CDCXX15",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte (or 528-byte)","1?",4,"remains in Read ID mode; made of two 4Gb sections"
"Micron","MT29F2G08AAB","0x2C","0xDA","0x2CDAXX15",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?","1?",4,"remains in Read ID mode"
"Micron","MT29F2G16AAB","0x2C","0xCA","0x2CCAXX55",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?","1?",4,"remains in Read ID mode"
"Micron","MT29F4G08BAB","0x2C","0xDC","0x2CDCXX15",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?","1?",4,"remains in Read ID mode"
"Micron","MT29F4G16BAB","0x2C","0xCC","0x2CCCXX55",512,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?","1?",4,"remains in Read ID mode"
"Micron","MT29F8G08FAB","0x2C","0xDC","0x2CDCXX15",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","?","1?",4,"remains in Read ID mode"
"Samsung","K9F1208R0B","0xEC","0x36","0xEC36A5C0",64,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,4,"remains in Read ID mode"
"Samsung","K9F1208B0B","0xEC","0x76","0xEC76A5C0",64,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,4,"remains in Read ID mode"
"Samsung","K9F1208U0B","0xEC","0x76","0xEC76A5C0",64,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,4,"remains in Read ID mode"
"Samsung","K9F2G08U0M","0xEC","0xDA","0xECDA8015",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,4,
"Samsung","K9K4G08U1M","0xEC","0xDA","0xECDA8015",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","? (1-bit correct, 2-bit detect)",1,4,
"Samsung","K9F2G08B0B","0xEC","0xDA","0xECDA109544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,"only differ by voltage"
"Samsung","K9F2G08U0B","0xEC","0xDA","0xECDA109544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,"only differ by voltage"
"Samsung","K9F2G08R0A","0xEC","0xAA","0xECAA001544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Samsung","K9F2G08U0A","0xEC","0xDA","0xECDA109544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Samsung","K9F2G08B0B","0xEC","0xDA","0xECDA109544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Samsung","K9F2G08U0B","0xEC","0xDA","0xECDA109544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Samsung","K9GAG08B0D","0xEC","0xD5","0xECD594293441",2048,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","8-bit/512-byte (correction)",2,6,
"Samsung","K9GAG08U0D","0xEC","0xD5","0xECD594293441",2048,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","8-bit/512-byte (correction)",2,6,
"Samsung","K9LBG08U1D","0xEC","0xD5","0xECD594293441",4096,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","8-bit/512-byte (correction)",2,6,"Contains 2 K9GAG08U0D"
"Samsung","K9HCG08U5D","0xEC","0xD5","0xECD594293441",8192,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","8-bit/512-byte (correction)",2,6,"Contains 4 K9GAG08U0D"
"Spansion","S30ML512P","0x01","0x76","0x0176010101",64,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","1-bit/512-byte (correction)","ORNAND","6?","Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
"Spansion","S30ML512P","0x01","0x56","0x0156010101",64,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)","1-bit/512-byte (correction)","ORNAND","6?","Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
"Spansion","S30ML256P","0x01","0x75","0x0175010101",32,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","1-bit/512-byte (correction)","ORNAND","6?","Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
"Spansion","S30ML256P","0x01","0x55","0x0155010101",32,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)","1-bit/512-byte (correction)","ORNAND","6?","Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
"Spansion","S30ML128P","0x01","0x73","0x0173010101",16,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)","1-bit/512-byte (correction)","ORNAND","6?","Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
"Spansion","S30ML128P","0x01","0x53","0x0153030101",16,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)","1-bit/512-byte (correction)","ORNAND","6?","Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x04"
"Samsung","K9K8G08U0A","0xEC","0xD3","0xECD3519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,5,"remains in Read ID mode"
"Samsung","K9WAG08U1A","0xEC","0xD3","0xECD3519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,5,"remains in Read ID mode"
"Samsung","K9NBG08U5A","0xEC","0xD3","0xECD3519558",4096,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,5,"remains in Read ID mode"
"Samsung","K9F8G08B0M","0xEC","0xD3","0xECD310A664",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,"5?",
"Samsung","K9F8G08U0M","0xEC","0xD3","0xECD310A664",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,"5?",
"Samsung","K9F8G08U1M","0xEC","0xD3","0xECD310A664",2048,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/512-byte",1,"5?","contains 2 K9F8G08U0M"
"Numonyx","NAND04GR3B2D","0x20","0xAC","0x20AC101554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode"
"Numonyx","NAND08GR3B4C","0x20","0xAC","0x20AC101554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode; contains two NAND04GR3B2D"
"Numonyx","NAND04GW3B2D","0x20","0xDC","0x20DC109554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode"
"Numonyx","NAND08GW3B4C","0x20","0xDC","0x20DC109554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode; contains two NAND04GW3B2D"
"Numonyx","NAND04GR4B2D","0x0020","0xBC","0x20BC105554",512,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode"
"Numonyx","NAND04GW4B2D","0x0020","0xCC","0x20CC10D554",512,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode"
"Numonyx","NAND08GR3B2C","0x20","0xA3","0x20A3511558",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode"
"Numonyx","NAND08GW3B2C","0x20","0xD3","0x20D3519558",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode"
"Numonyx","NAND08GR4B2C","0x0020","0xB3","0x20B3515558",1024,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode"
"Numonyx","NAND08GW4B2C","0x0020","0xC3","0x20C351D558",1024,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,"embedded 1/528 bit ECC; remains in Read ID mode"
"Micron","MT29F4G08AAA","0x2C","0xDC","0x2CDC909554",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Micron","MT29F8G08BAA","0x2C","0xD3","0x2CD3D19558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Micron","MT29F8G08DAA","0x2C","0xDC","0x2CDC909554",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,"contains 2 MT29F4G08AAA"
"Micron","MT29F16G08FAA","0x2C","0xD3","0x2CD3D19558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,"contains 2 MT29F8G08BAA"
"Micron","MT29F16G08MAA","0x2C","0xD5","0x2CD5943E74",2048,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)","8-bit/539-byte",2,5,
"Micron","MT29F32G08QAA","0x2C","0xD5","0x2CD5943E74",4096,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)","8-bit/539-byte",2,5,
"Micron","MT29F64G08TAA","0x2C","0xD7","0x2CD7D53E78",8192,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)","8-bit/539-byte",2,5,
"Micron","MT29F16G08CBABA","0x2C","0x48","0x2C48044685",2048,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","12-bit/540-byte",2,5,"returns 0x00 after first 5 read ID bytes"
"Micron","MT29F16G08CBABB","0x2C","0x48","0x2C48044685",2048,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","12-bit/540-byte",2,5,"returns 0x00 after first 5 read ID bytes"
"Micron","MT29F8G08MAA","0x2C","0xD3","0x2CD394A564",1024,2048,64,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","4-bit/528-byte",2,5,"remains in Read ID mode"
"Micron","MT29F16G08QAA","0x2C","0xD3","0x2CD394A564",2048,2048,64,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","4-bit/528-byte",2,5,"remains in Read ID mode"
"Micron","MT29F32G08TAA","0x2C","0xD5","0x2CD5D5A568",4096,2048,64,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","4-bit/528-byte",2,5,"remains in Read ID mode"
"ST","NAND04GR3B2D","0x20","0xAC","0x20AC101554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND08GR3B4C","0x20","0xAC","0x20AC101554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND04GW3B2D","0x20","0xDC","0x20DC109554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND08GW3B4C","0x20","0xDC","0x20DC109554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND04GR4B2D","0x0020","0xBC","0x20BC105554",512,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND04GW4B2D","0x0020","0xCC","0x20CC10D554",512,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND08GR3B2C","0x20","0xA3","0x20A3511558",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND08GW3B2C","0x20","0xD3","0x20D3519558",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND08GR4B2C","0x0020","0xB3","0x20B3515558",1024,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,
"ST","NAND08GW4B2C","0x0020","0xC3","0x20C351D558",1024,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,
"Numonyx","NAND02GR3B2D","0x20","0xAA","0x20AA101544",256,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,"remains in Read ID mode"
"Numonyx","NAND02GW3B2D","0x20","0xDA","0x20DA109544",256,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,5,"remains in Read ID mode"
"Numonyx","NAND02GR4B2D","0x0020","0xBA","0x20BA105544",256,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,"remains in Read ID mode"
"Numonyx","NAND02GW4B2D","0x0020","0xCA","0x20CA10D544",256,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,5,"remains in Read ID mode"
"Numonyx","NAND01GR3B2B","0x20","0xA1","0x20A18015",128,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND01GW3B2B","0x20","0xF1","0x20F1801D",128,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND01GR4B2B","0x0020","0xB1","0x20B18055",128,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND01GW4B2B","0x0020","0xC1","0x20C1805D",128,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND02GR3B2C","0x20","0xAA","0x20AA8015",256,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND02GW3B2C","0x20","0xDA","0x20DA801D",256,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND02GR4B2C","0x0020","0xBA","0x20BA8055",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND02GW42C","0x0020","0xCA","0x20CA805D",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND01GR3B2B","0x20","0xA1","0x20A10015",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND01GW3B2B","0x20","0xF1","0x20F1001D",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND01GR4B2B","0x20","0xB1","0x20B10055",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,4,
"Numonyx","NAND01GW4B2B","0x20","0xC1","0x20C1005D",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)","22-bit/2048-bits",1,4,
"Hynix","HY27UF082G2A","0xAD","0xDA","0xADDA801D00",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Hynix","HY27UF162G2A","0xAD","0xCA","0xADCA805D00",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)","1-bit/528-byte",1,5,
"Hynix","HY27UF082G2A","0xAD","0xDA","0xADDA801D00",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Hynix","HY27UF162G2A","0xAD","0xCA","0xADCA805D00",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)","1-bit/528-byte",1,5,
"Samsung","K9G8G08B0A","0xEC","0xD3","0xECD314A564",1024,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","4-bit/512-byte",2,5,
"Samsung","K9G8G08U0A","0xEC","0xD3","0xECD314A564",1024,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","4-bit/512-byte",2,5,
"Samsung","K9LAG08U1A","0xEC","0xD3","0xECD314A564",2048,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","4-bit/512-byte",2,5,
"Samsung","K9LBG08U0D","0xEC","0xD7","0xECD7D5293841",4096,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","8-bit/512-byte (correction)",2,6,
"Samsung","K9HCG08U1D","0xEC","0xD7","0xECD7D5293841",8192,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","8-bit/512-byte (correction)",2,6,
"Samsung","K9XDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)","8-bit/512-byte (correction)",2,6,
"Numonyx","NAND08GW3F2B","0x20","0xD3","0x20D390152441",1024,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)","1-bit/512-byte",1,6,
"Samsung","K9K8G08U0B","0xEC","0xDC","0xECDC519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Samsung","K9WAG08U1B","0xEC","0xDC","0xECDC519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)","1-bit/528-byte",1,5,
"Micron","MT29F16G08ABABA","0x2C","0x48","0x2C48002689",2048,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F16G08ABCBB","0x2C","0x48","0x2C48002689",2048,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F32G08AFABA","0x2C","0x48","0x2C48002689",4096,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F32G08AECBB","0x2C","0x48","0x2C48002689",4096,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F64G08AJABA","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F64G08AKABA","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F64G08AKCBB","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F64G08AMABA","0x2C","0x48","0x2C48002689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F64G08AMCBB","0x2C","0x48","0x2C48002689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F128G08AUABA","0x2C","0x68","0x2C6801A689",16384,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"
"Micron","MT29F128G08AUCBB","0x2C","0x68","0x2C6801A689",16384,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)","4-bit/540-byte",1,5,"Read ID produces 00h after byte 5"

--------------040104080805040405020203
Content-Type: application/vnd.oasis.opendocument.spreadsheet;
 name=NAND_Data_mail.ods
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=NAND_Data_mail.ods

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
k6BHMYlUD8W2wCqqla7jGl132HZfLwwCPb6lrEGWsr5bio8HWWr8jVsKBXGy/YCi01RVWKut
Jjsm4giFaQou52WxftxvphZyjp61z6BbZRarJfadWqSZv9zJML0HLj3a9d5zKngWo8m80BY1
evsKVW//t2urvwFQSwcIhK4pVdIJAAC2TQAAUEsDBBQAAAgAADyu9zwV2jwa6QMAAOkDAAAI
AAAAbWV0YS54bWw8P3htbCB2ZXJzaW9uPSIxLjAiIGVuY29kaW5nPSJVVEYtOCI/Pgo8b2Zm
aWNlOmRvY3VtZW50LW1ldGEgeG1sbnM6b2ZmaWNlPSJ1cm46b2FzaXM6bmFtZXM6dGM6b3Bl
bmRvY3VtZW50OnhtbG5zOm9mZmljZToxLjAiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3Lncz
Lm9yZy8xOTk5L3hsaW5rIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRz
LzEuMS8iIHhtbG5zOm1ldGE9InVybjpvYXNpczpuYW1lczp0YzpvcGVuZG9jdW1lbnQ6eG1s
bnM6bWV0YToxLjAiIHhtbG5zOm9vbz0iaHR0cDovL29wZW5vZmZpY2Uub3JnLzIwMDQvb2Zm
aWNlIiB4bWxuczpncmRkbD0iaHR0cDovL3d3dy53My5vcmcvMjAwMy9nL2RhdGEtdmlldyMi
IG9mZmljZTp2ZXJzaW9uPSIxLjIiIGdyZGRsOnRyYW5zZm9ybWF0aW9uPSJodHRwOi8vZG9j
cy5vYXNpcy1vcGVuLm9yZy9vZmZpY2UvMS4yL3hzbHQvb2RmMnJkZi54c2wiPjxvZmZpY2U6
bWV0YT48bWV0YTppbml0aWFsLWNyZWF0b3I+QnJpYW4gTm9ycmlzPC9tZXRhOmluaXRpYWwt
Y3JlYXRvcj48bWV0YTpjcmVhdGlvbi1kYXRlPjIwMTAtMDYtMDNUMTA6NTg6NDc8L21ldGE6
Y3JlYXRpb24tZGF0ZT48ZGM6Y3JlYXRvcj5CcmlhbiBOb3JyaXM8L2RjOmNyZWF0b3I+PGRj
OmRhdGU+MjAxMC0wNy0yM1QxNDo0OTo1NjwvZGM6ZGF0ZT48bWV0YTplZGl0aW5nLWN5Y2xl
cz41OTwvbWV0YTplZGl0aW5nLWN5Y2xlcz48bWV0YTplZGl0aW5nLWR1cmF0aW9uPlBUNjFI
MDhNMDlTPC9tZXRhOmVkaXRpbmctZHVyYXRpb24+PG1ldGE6Z2VuZXJhdG9yPk9wZW5PZmZp
Y2Uub3JnLzMuMiRVbml4IE9wZW5PZmZpY2Uub3JnX3Byb2plY3QvMzIwbTEyJEJ1aWxkLTk0
ODM8L21ldGE6Z2VuZXJhdG9yPjxtZXRhOmRvY3VtZW50LXN0YXRpc3RpYyBtZXRhOnRhYmxl
LWNvdW50PSIxIiBtZXRhOmNlbGwtY291bnQ9IjIzNzQiIG1ldGE6b2JqZWN0LWNvdW50PSIw
Ii8+PC9vZmZpY2U6bWV0YT48L29mZmljZTpkb2N1bWVudC1tZXRhPlBLAwQUAAgICAA8rvc8
AAAAAAAAAAAAAAAAGAAAAFRodW1ibmFpbHMvdGh1bWJuYWlsLnBuZ3V5dzxb0Rs3VaNGValZ
tPZWu/aorahaRVF7i9KITe3a1N5tjRqxCUHsvVdQIvYKYu/yan/7fT9v7h859zzn3Oe555nf
5355o6FEhE+Nj4GBQaSiLP/27n8WAwMTA+/e3agyXd4VA4NtW0VeVscjczfL85kOiqZnxNHd
Ql/Ze0wukrx47nsVcxdYR7+I7DlzcAS59JdEvHhhY2ZmJ1VoDS90F7Jbh9Az4EgAOgq0UA0O
ppnhpAnQekn5u6xnnt1dIJMg9JlvdtjghxePMFoxLUvFP4weIpM5znTyayZQWOZBohQO0t0x
O5XOrRfTuCxv4/tZUSdhOUYnYg6V5EXMG/rzB3wnPtJt0q4Iy1oWTTZVo6ome9NtR125EnR0
ds4LP5fUTC1Nu2C9N/MDR4unRVk0J2Obl1YiPgjphksfU5DHu6jbR0V6Z5dfbSca33hZ9U2+
TjmHcRKmdUy9Kq67Fu/r5R0GBNq72Yj4M+y2dDj4xPglJJZxc+mc+3pPLvuNR5e9vbANOsE8
sphT7K/ZS7v4efs+cYI+y3vf9XNl0mRQR+ynq37+jTZICaYayJoz7ujma/UZ6nHtaVHbjMaF
ZrznVXvUkYgBOu0Tl88mikhbmOynhCerePV0yq6bzca0kIkrm1f6/A+XjVbct/xd+Vgp75p8
DjWX9rDOyqRqVMyy2qFbz2bBpOTz2wUlHGrf4qzYkroOtUUA2W/JOudnEa0zFhnTLxpC577C
z2b8HU1YzS/AT1bay/ORkslxQ3td16iCBwRl2gs278FpNxuSkUkdP+/nbbd0AqXaeiKIXMlN
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
raClE+PLdYW020x7nJdHxqNAQh1hxwl16WRiWKSHL4VrSo7OEAYARgCNkfWYlqYIRDP4Ia0M
z3K0/84Wx8jK8DbsEQwH/ZlXWN7QucuK6MBiC5nSoYtODGRISKovhfx24d/pdu0eGZXq1Ufn
PMtnxn56QljXFzw/xXC8ONv+NG3+K146C3fLvJ4i/KUlRatDGzRX2bvO/CfLgBtnKbEOdARs
le4OEkjYv7dLanB+B4CGuinDC9NlxfsLg4otAnpjjSGLmX/NPCOS75G2UNDpV82wwpi2uhrs
X98T2u6QKc8/Hq8pRZsthmOSbOhN8UUZBxfcyMyHE05ZTFVT6CPG9VI0VP7Oo/6vrGxUVWb0
lGp1Lh4e3U8rDWw4WMm9g1qRAGMIJX8vhBFMkyVucqYt9/QuDryf5g4lPNxVRimuxYi43VZ5
3dx5eRfkH/tj4dHDtLymVzxGlmqwO4n6oM58lnEAaUMRzb1zojnCKr1AODcciOCqGHqGzK5x
Xpg/yAVi0RKl/jfCPZc207ASyExUjsO4+6koaMiXyX0I/D9QSwcI69ExStknAAAjKQAAUEsD
BBQACAgIADyu9zwAAAAAAAAAAAAAAAAnAAAAQ29uZmlndXJhdGlvbnMyL2FjY2VsZXJhdG9y
L2N1cnJlbnQueG1sAwBQSwcIAAAAAAIAAAAAAAAAUEsDBBQAAAgAADyu9zwAAAAAAAAAAAAA
AAAcAAAAQ29uZmlndXJhdGlvbnMyL3Byb2dyZXNzYmFyL1BLAwQUAAAIAAA8rvc8AAAAAAAA
AAAAAAAAGAAAAENvbmZpZ3VyYXRpb25zMi9mbG9hdGVyL1BLAwQUAAAIAAA8rvc8AAAAAAAA
AAAAAAAAGgAAAENvbmZpZ3VyYXRpb25zMi9wb3B1cG1lbnUvUEsDBBQAAAgAADyu9zwAAAAA
AAAAAAAAAAAYAAAAQ29uZmlndXJhdGlvbnMyL21lbnViYXIvUEsDBBQAAAgAADyu9zwAAAAA
AAAAAAAAAAAYAAAAQ29uZmlndXJhdGlvbnMyL3Rvb2xiYXIvUEsDBBQAAAgAADyu9zwAAAAA
AAAAAAAAAAAfAAAAQ29uZmlndXJhdGlvbnMyL2ltYWdlcy9CaXRtYXBzL1BLAwQUAAAIAAA8
rvc8AAAAAAAAAAAAAAAAGgAAAENvbmZpZ3VyYXRpb25zMi9zdGF0dXNiYXIvUEsDBBQACAgI
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
AAAAAH5UAABDb25maWd1cmF0aW9uczIvcHJvZ3Jlc3NiYXIvUEsBAhQAFAAACAAAPK73PAAA
AAAAAAAAAAAAABgAAAAAAAAAAAAAAAAAuFQAAENvbmZpZ3VyYXRpb25zMi9mbG9hdGVyL1BL
AQIUABQAAAgAADyu9zwAAAAAAAAAAAAAAAAaAAAAAAAAAAAAAAAAAO5UAABDb25maWd1cmF0
aW9uczIvcG9wdXBtZW51L1BLAQIUABQAAAgAADyu9zwAAAAAAAAAAAAAAAAYAAAAAAAAAAAA
AAAAACZVAABDb25maWd1cmF0aW9uczIvbWVudWJhci9QSwECFAAUAAAIAAA8rvc8AAAAAAAA
AAAAAAAAGAAAAAAAAAAAAAAAAABcVQAAQ29uZmlndXJhdGlvbnMyL3Rvb2xiYXIvUEsBAhQA
FAAACAAAPK73PAAAAAAAAAAAAAAAAB8AAAAAAAAAAAAAAAAAklUAAENvbmZpZ3VyYXRpb25z
Mi9pbWFnZXMvQml0bWFwcy9QSwECFAAUAAAIAAA8rvc8AAAAAAAAAAAAAAAAGgAAAAAAAAAA
AAAAAADPVQAAQ29uZmlndXJhdGlvbnMyL3N0YXR1c2Jhci9QSwECFAAUAAgICAA8rvc8TMpt
XNADAABEHAAADAAAAAAAAAAAAAAAAAAHVgAAc2V0dGluZ3MueG1sUEsBAhQAFAAICAgAPK73
PETVgP9KAQAAaAcAABUAAAAAAAAAAAAAAAAAEVoAAE1FVEEtSU5GL21hbmlmZXN0LnhtbFBL
BQYAAAAADwAPAO4DAACeWwAAAAA=
--------------040104080805040405020203--
