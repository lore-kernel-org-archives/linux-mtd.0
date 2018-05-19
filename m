Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fK1EC-0002SR-VE
 for linux-mtd@lists.infradead.org; Sat, 19 May 2018 12:44:54 +0000
Received: by mail-wr0-x244.google.com with SMTP id a15-v6so4431811wrm.0
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2018 05:44:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com, richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/1] mtd: rawnand: hynix: fix decoding the OOB size on
 H27UCG8T2BTR
Date: Sat, 19 May 2018 14:44:31 +0200
Message-Id: <20180519124431.16000-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180519124431.16000-1-martin.blumenstingl@googlemail.com>
References: <20180519124431.16000-1-martin.blumenstingl@googlemail.com>
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
 drivers/mtd/nand/raw/nand_hynix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index d542908a0ebb..60d9c54b769f 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -473,6 +473,10 @@ static void hynix_nand_extract_oobsize(struct nand_chip *chip,
 			WARN(1, "Invalid OOB size");
 			break;
 		}
+
+		/* Reference: H27UCG8T2BTR - "Redundant Area Size / 8KB" */
+		if (mtd->writesize == SZ_16K)
+			mtd->oobsize *= 2;
 	}
 }
 
-- 
2.17.0
