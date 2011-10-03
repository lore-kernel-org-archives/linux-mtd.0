Received: from mail.newtechgroup.ch ([62.12.175.51] helo=newtechgroup.ch)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RAcTe-0000Nd-No
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2011 06:58:15 +0000
From: "Hitz, Christian" <christian.hitz@aizo.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 3 Oct 2011 08:57:59 +0200
Subject: [PATCH] mtd: nand: restore useage of ONFI reported bus width
Message-ID: <CD1B567EF015FE41B29FF476B8600DDD26BBF25958@vsrv-mail01.newtechgroup.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch changes the nand_flash_detect_onfi() function to pass
the NAND bus width it discovered via ONFI back to the caller.

Signed-off-by: Christian Hitz <christian.hitz@aizo.com>
---
 drivers/mtd/nand/nand_base.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a46e9bb..6dae9a0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2829,7 +2829,7 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t le=
n)
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwi=
se
  */
 static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *=
chip,
-					int busw)
+					int *busw)
 {
 	struct nand_onfi_params *p =3D &chip->onfi_params;
 	int i;
@@ -2884,9 +2884,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mt=
d, struct nand_chip *chip,
 	mtd->erasesize =3D le32_to_cpu(p->pages_per_block) * mtd->writesize;
 	mtd->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
 	chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->erases=
ize;
-	busw =3D 0;
+	*busw =3D 0;
 	if (le16_to_cpu(p->features) & 1)
-		busw =3D NAND_BUSWIDTH_16;
+		*busw =3D NAND_BUSWIDTH_16;
=20
 	chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
 	chip->options |=3D (NAND_NO_READRDY |
@@ -2952,7 +2952,7 @@ static struct nand_flash_dev *nand_get_flash_type(str=
uct mtd_info *mtd,
 	chip->onfi_version =3D 0;
 	if (!type->name || !type->pagesize) {
 		/* Check is chip is ONFI compliant */
-		ret =3D nand_flash_detect_onfi(mtd, chip, busw);
+		ret =3D nand_flash_detect_onfi(mtd, chip, &busw);
 		if (ret)
 			goto ident_done;
 	}
--=20
1.7.4.1
