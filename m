From: <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xiaolei.li@mediatek.com>
Subject: [PATCH] mtd: subpagetest: fix wrong written check in function
 write_eraseblock2
Date: Thu, 1 Jun 2017 17:01:19 +0800
Message-ID: <1496307679-16245-1-git-send-email-xiaolei.li@mediatek.com>
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

From: Xiaolei Li <xiaolei.li@mediatek.com>

Write size in function write_eraseblock2 is subpgsize * k.
It is wrong to check whether written is equal to subpgsize after each
mtd_write.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/tests/subpagetest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index aecc6ce..fa2519a 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -102,7 +102,7 @@ static int write_eraseblock2(int ebnum)
 		if (unlikely(err || written != subpgsize * k)) {
 			pr_err("error: write failed at %#llx\n",
 			       (long long)addr);
-			if (written != subpgsize) {
+			if (written != subpgsize * k) {
 				pr_err("  write size: %#x\n",
 				       subpgsize * k);
 				pr_err("  written: %#08zx\n",
-- 
1.9.1
