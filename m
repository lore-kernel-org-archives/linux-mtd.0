Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vvnmt-00057b-6j
 for linux-mtd@lists.infradead.org; Wed, 25 Dec 2013 12:42:13 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: remove unused function input parameter
Date: Wed, 25 Dec 2013 12:40:50 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F25E47D50@SZXEMA512-MBX.china.huawei.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Cai Zhiyong <caizhiyong@huawei.com>
Date: Wed, 25 Dec 2013 20:11:15 +0800
Subject: [PATCH] mtd: nand: remove unused function input parameter

The nand_get_flash_type parameter "busw" input value is not used by any
branch, and it is updated before use it in the function, so remove it,=20
define the "busw" as an internal variable.

Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
---
 drivers/mtd/nand/nand_base.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9b3bb3c..a123afa 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3337,10 +3337,10 @@ static bool find_full_id_nand(struct mtd_info *mtd,=
 struct nand_chip *chip,
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 						  struct nand_chip *chip,
-						  int busw,
 						  int *maf_id, int *dev_id,
 						  struct nand_flash_dev *type)
 {
+	int busw;
 	int i, maf_idx;
 	u8 id_data[8];
=20
@@ -3497,18 +3497,16 @@ ident_done:
 int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		    struct nand_flash_dev *table)
 {
-	int i, busw, nand_maf_id, nand_dev_id;
+	int i, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip =3D mtd->priv;
 	struct nand_flash_dev *type;
=20
-	/* Get buswidth to select the correct functions */
-	busw =3D chip->options & NAND_BUSWIDTH_16;
 	/* Set the default functions */
-	nand_set_defaults(chip, busw);
+	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
=20
 	/* Read the flash type */
-	type =3D nand_get_flash_type(mtd, chip, busw,
-				&nand_maf_id, &nand_dev_id, table);
+	type =3D nand_get_flash_type(mtd, chip, &nand_maf_id,
+				   &nand_dev_id, table);
=20
 	if (IS_ERR(type)) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
--=20
1.8.1.5
