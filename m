Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wex7l-00057r-Jx
 for linux-mtd@lists.infradead.org; Tue, 29 Apr 2014 01:46:24 +0000
Message-ID: <535F040C.8010903@huawei.com>
Date: Tue, 29 Apr 2014 09:44:44 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: Remove unused variables in ubifs_budget_space
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found two variables in ubifs_budget_space declared but not
use. This state remains since the first commit 1e5176. So just
remove them.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/budget.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index e8e01d7..eb997e9 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -437,7 +437,6 @@ static int calc_dd_growth(const struct ubifs_info *c,
  */
 int ubifs_budget_space(struct ubifs_info *c, struct ubifs_budget_req *req)
 {
-	int uninitialized_var(cmt_retries), uninitialized_var(wb_retries);
 	int err, idx_growth, data_growth, dd_growth, retried = 0;

 	ubifs_assert(req->new_page <= 1);
-- 
1.8.5.5
