Received: from mail-pa0-f50.google.com ([209.85.220.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UrZhK-0002a9-Rh
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2013 20:18:43 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb1so13003142pad.23
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2013 13:18:18 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: detect OOB size for Toshiba 24nm raw SLC
Date: Tue, 25 Jun 2013 13:17:59 -0700
Message-Id: <1372191479-28470-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Toshiba NAND datasheets have not been very forthcoming on OOB size
information; they do not provide any bitfields in the ID string for
spare area. In their 24nm technology flash, however, Toshiba migrated
their NAND to have 32 bytes spare per 512 bytes of page area (up from
the traditional 16 bytes), as they now require 8-bit ECC or higher.

I have discussed this issue directly with Toshiba representatives, and
they acknowledge this problem. They recommend detecting these flash
based on their technology node as follows:

  For 24nm Toshiba SLC raw NAND (not BENAND -- Built-in Ecc NAND), there
  are 32 bytes of spare area for every 512 bytes of in-band data area.

We can implement this rule with the following snippet of a device ID
decode table, which applies to all their 43nm, 32nm, and 24nm SLC NAND
(this table is not fully in the NAND datasheets, but it was provided
directly by Toshiba representatives):

  - ID byte 5, bit[7]:
          1    -> BENAND
          0    -> raw SLC

  - ID byte 6, bits[2:0]:
          100b -> 43nm
          101b -> 32nm
          110b -> 24nm
          111b -> Reserved

I'm also working with Toshiba on including this bitfield description for
their 5th and 6th ID bytes in their public data sheets.

I will provide the 8-byte ID strings from the two 24nm Toshiba samples I
have; their first 6 bytes match the documentation I received from
Toshiba:

  24nm SLC 1Gbit TC58NVG0S3HTA00
  0x98 0xf1 0x80 0x15 0x72 0x16 0x08 0x00

  24nm SLC 2Gbit TC58NVG1S3HTA00
  0x98 0xda 0x90 0x15 0x76 0x16 0x08 0x00

I have also tested for regressions with:

  43nm SLC 4Gbit TC58NVG2S3ETA00
  0x98 0xdc 0x90 0x15 0x76 0x14 0x03 0x10

  32nm SLC 8Gbit TC58NVG3SOFA00
  0x98 0xd3 0x90 0x26 0x76 0x15 0x02 0x08

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1cbacff..3e56995 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3079,6 +3079,22 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		extid >>= 2;
 		/* Get buswidth information */
 		*busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
+
+		/*
+		 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
+		 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
+		 * follows:
+		 * - ID byte 6, bits[2:0]: 100b -> 43nm, 101b -> 32nm,
+		 *                         110b -> 24nm
+		 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
+		 */
+		if (id_len >= 6 && id_data[0] == NAND_MFR_TOSHIBA &&
+				!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+				(id_data[5] & 0x7) == 0x6 /* 24nm */ &&
+				!(id_data[4] & 0x80) /* !BENAND */) {
+			mtd->oobsize = 32 * mtd->writesize >> 9;
+		}
+
 	}
 }
 
-- 
1.8.3.1
