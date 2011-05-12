From: nitingarg98@gmail.com (Nitin Garg)
Date: Thu, 12 May 2011 01:31:53 -0500
Subject: [PATCH] Fix ONFI NAND flash size detection by using number of
Message-ID: <mailman.228.1305183942.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Logical Units in device

Signed-off-by: Nitin Garg <nitingarg98@gmail.com>
---
=A0drivers/mtd/nand/nand_base.c | =A0 =A02 +-
=A01 files changed, 1 insertions(+), 1 deletions(-)
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..cdf6015 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2892,7 +2892,7 @@ static int nand_flash_detect_onfi(struct
mtd_info *mtd, struct nand_chip *chip,
=A0 =A0 =A0 =A0mtd->writesize =3D le32_to_cpu(p->byte_per_page);
=A0 =A0 =A0 =A0mtd->erasesize =3D le32_to_cpu(p->pages_per_block) * mtd->wr=
itesize;
=A0 =A0 =A0 =A0mtd->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
- =A0 =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) *
mtd->erasesize;
+ =A0 =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) *
le32_to_cpu(p->lun_count) * mtd->erasesize;
=A0 =A0 =A0 =A0busw =3D 0;
=A0 =A0 =A0 =A0if (le16_to_cpu(p->features) & 1)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0busw =3D NAND_BUSWIDTH_16;
--
1.5.5.6
