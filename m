Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw087-0002TD-Fq
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 01:52:57 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand:  assign mtd->name in find_full_id_nand
Date: Thu, 26 Dec 2013 01:51:58 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F25E47E20@SZXEMA512-MBX.china.huawei.com>
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
Date: Wed, 25 Dec 2013 21:19:21 +0800
Subject: [PATCH] mtd: nand: assign mtd->name in find_full_id_nand

This patch assigned the type->name to mtd->name when mtd->name is
NULL in function "find_full_id_nand".
mtd->name is NULL may cause some problem.

Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
---
 drivers/mtd/nand/nand_base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9b3bb3c..404e83d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3327,6 +3327,9 @@ static bool find_full_id_nand(struct mtd_info *mtd, s=
truct nand_chip *chip,
=20
 		*busw =3D type->options & NAND_BUSWIDTH_16;
=20
+		if (!mtd->name)
+			mtd->name =3D type->name;
+
 		return true;
 	}
 	return false;
--=20
1.8.1.5
