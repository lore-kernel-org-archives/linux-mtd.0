Received: from sg05.corpemail.net ([128.199.149.210])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euvuo-0005tq-Bm
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2018 08:01:22 +0000
From: OuYang ZhiZhong <ouyzz@yealink.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <marek.vasut@gmail.com>, <richard@nod.at>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <oyzhizhong@gmail.com>, <ouyzz@yealink.com>, <stable@vger.kernel.org>
Subject: [PATCH v4] mtdchar: fix usage of mtd_ooblayout_ecc()
Date: Sun, 11 Mar 2018 15:59:07 +0800
Message-ID: <1520755147-4414-1-git-send-email-ouyzz@yealink.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Fixes: c2b78452a9db ("mtd: use mtd_ooblayout_xxx() helpers where appropriate")
Cc: <stable@vger.kernel.org>
Signed-off-by: OuYang ZhiZhong <ouyzz@yealink.com>
---
 drivers/mtd/mtdchar.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index de8c902..7d80a8b 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -479,7 +479,7 @@ static int shrink_ecclayout(struct mtd_info *mtd,
 	for (i = 0; i < MTD_MAX_ECCPOS_ENTRIES;) {
 		u32 eccpos;
 
-		ret = mtd_ooblayout_ecc(mtd, section, &oobregion);
+		ret = mtd_ooblayout_ecc(mtd, section++, &oobregion);
 		if (ret < 0) {
 			if (ret != -ERANGE)
 				return ret;
@@ -526,7 +526,7 @@ static int get_oobinfo(struct mtd_info *mtd, struct nand_oobinfo *to)
 	for (i = 0; i < ARRAY_SIZE(to->eccpos);) {
 		u32 eccpos;
 
-		ret = mtd_ooblayout_ecc(mtd, section, &oobregion);
+		ret = mtd_ooblayout_ecc(mtd, section++, &oobregion);
 		if (ret < 0) {
 			if (ret != -ERANGE)
 				return ret;
-- 
1.7.9.5
