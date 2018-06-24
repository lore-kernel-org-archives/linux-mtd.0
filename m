From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com, richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, liang.yang@amlogic.com, yixun.lan@amlogic.com,
 linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/1] mtd: rawnand: hynix: fix decoding the OOB size on
 H27UCG8T2BTR
Date: Sun, 24 Jun 2018 22:53:55 +0200
Message-Id: <20180624205355.20060-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180624205355.20060-1-martin.blumenstingl@googlemail.com>
References: <20180624205355.20060-1-martin.blumenstingl@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The datasheet of the H27UCG8T2BTR states that this chip has a page size
of "16,384 + 1,280(Spare) bytes". The description of the "4th Byte of
Device Identifier Description" indicates that bits 6, 3 and 2 are
encoding the "Redundant Area Size / 8KB", where 640 bytes is a value of
0x6 (110 in binary notation).

hynix_nand_extract_oobsize decodes an OOB size of 640 bytes for this
chip. Kernel boot log extract before this patch:
nand: Could not find valid ONFI parameter page; aborting
nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
nand: Hynix NAND 8GiB 3,3V 8-bit
nand: 8192 MiB, MLC, erase size: 4096 KiB, page size: 16384,
      OOB size: 640

However, based on the description in the datasheet we need to multiply
the OOB size with 2, because it's "640 spare bytes per 8192 bytes page
size" and this NAND chip has a page size of 16384 (= 2 * 8192). After
this patch the kernel boot log reports:
nand: Could not find valid ONFI parameter page; aborting
nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
nand: Hynix NAND 8GiB 3,3V 8-bit
nand: 8192 MiB, MLC, erase size: 4096 KiB, page size: 16384,
      OOB size: 1280

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/nand_hynix.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index d542908a0ebb..8cbe77f447c7 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -473,6 +473,19 @@ static void hynix_nand_extract_oobsize(struct nand_chip *chip,
 			WARN(1, "Invalid OOB size");
 			break;
 		}
+
+		/*
+		 * The datasheet of H27UCG8T2BTR mentions that the "Redundant
+		 * Area Size" is encoded "per 8KB" (page size). This chip uses
+		 * a page size of 16KiB. The datasheet mentions an OOB size of
+		 * 1.280 bytes, but the OOB size encoded in the ID bytes (using
+		 * the existing logic above) is 640 bytes.
+		 * Update the OOB size for this chip by taking the value
+		 * determined above and scaling it to the actual page size (so
+		 * the actual OOB size for this chip is: 640 * 16k / 8k).
+		 */
+		if (chip->id.data[1] == 0xde)
+			mtd->oobsize *= mtd->writesize / SZ_8K;
 	}
 }
 
-- 
2.18.0
