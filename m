Received: from [45.249.212.35] (helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRX7j-0002PZ-H2
 for linux-mtd@lists.infradead.org; Wed, 20 Dec 2017 05:41:01 +0000
From: Wei Yongjun <weiyongjun1@huawei.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andrea Adami <andrea.adami@gmail.com>, "Colin
 Ian King" <colin.king@canonical.com>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] mtd: sharpslpart: make local function
 sharpsl_nand_cleanup_ftl() static
Date: Wed, 20 Dec 2017 05:45:36 +0000
Message-ID: <1513748736-165067-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes the following sparse warnings:

drivers/mtd/parsers/sharpslpart.c:222:6: warning:
 symbol 'sharpsl_nand_cleanup_ftl' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mtd/parsers/sharpslpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/sharpslpart.c b/drivers/mtd/parsers/sharpslpart.c
index 0ddb79a..8893dc8 100644
--- a/drivers/mtd/parsers/sharpslpart.c
+++ b/drivers/mtd/parsers/sharpslpart.c
@@ -219,7 +219,7 @@ static int sharpsl_nand_init_ftl(struct mtd_info *mtd, struct sharpsl_ftl *ftl)
 	return ret;
 }
 
-void sharpsl_nand_cleanup_ftl(struct sharpsl_ftl *ftl)
+static void sharpsl_nand_cleanup_ftl(struct sharpsl_ftl *ftl)
 {
 	kfree(ftl->log2phy);
 }
