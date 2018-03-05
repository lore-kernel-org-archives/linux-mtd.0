Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esrV4-0006eN-4F
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2018 14:54:06 +0000
Received: by mail-pg0-x243.google.com with SMTP id l4so6899369pgp.11
 for <linux-mtd@lists.infradead.org>; Mon, 05 Mar 2018 06:53:51 -0800 (PST)
From: OuYang ZhiZhong <oyzhizhong@gmail.com>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, vdavydov.dev@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, oyzhizhong@gmail.com
Subject: [PATCH] mtdchar: fix usage of mtd_ooblayout_ecc()
Date: Mon,  5 Mar 2018 22:53:46 +0800
Message-Id: <1520261626-17395-1-git-send-email-oyzhizhong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Section was not properly computed. The value of OOB region definition is
always ECC section 0 information in the OOB area, but we want to get all
the ECC bytes information, so we should call
mtd_ooblayout_ecc(mtd, section++, &oobregion) until it returns -ERANGE.

This is fixed by using i instead of section.

Signed-off-by: OuYang ZhiZhong <oyzhizhong@gmail.com>
---
 drivers/mtd/mtdchar.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index de8c902..0cc929e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -468,7 +468,7 @@ static int shrink_ecclayout(struct mtd_info *mtd,
 			    struct nand_ecclayout_user *to)
 {
 	struct mtd_oob_region oobregion;
-	int i, section = 0, ret;
+	int i, ret;
 
 	if (!mtd || !to)
 		return -EINVAL;
@@ -479,7 +479,7 @@ static int shrink_ecclayout(struct mtd_info *mtd,
 	for (i = 0; i < MTD_MAX_ECCPOS_ENTRIES;) {
 		u32 eccpos;
 
-		ret = mtd_ooblayout_ecc(mtd, section, &oobregion);
+		ret = mtd_ooblayout_ecc(mtd, i, &oobregion);
 		if (ret < 0) {
 			if (ret != -ERANGE)
 				return ret;
@@ -515,7 +515,7 @@ static int shrink_ecclayout(struct mtd_info *mtd,
 static int get_oobinfo(struct mtd_info *mtd, struct nand_oobinfo *to)
 {
 	struct mtd_oob_region oobregion;
-	int i, section = 0, ret;
+	int i, ret;
 
 	if (!mtd || !to)
 		return -EINVAL;
@@ -526,7 +526,7 @@ static int get_oobinfo(struct mtd_info *mtd, struct nand_oobinfo *to)
 	for (i = 0; i < ARRAY_SIZE(to->eccpos);) {
 		u32 eccpos;
 
-		ret = mtd_ooblayout_ecc(mtd, section, &oobregion);
+		ret = mtd_ooblayout_ecc(mtd, i, &oobregion);
 		if (ret < 0) {
 			if (ret != -ERANGE)
 				return ret;
-- 
1.7.9.5
