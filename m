Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZelH8-00044E-HO
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 14:44:05 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [Resend PATCH 1/2] UBIFS: call dbg_is_power_cut() instead of reading
 c->dbg->pc_happened
Date: Wed, 23 Sep 2015 09:11:39 +0000
Message-ID: <1442999500-5343-2-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
References: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
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

Call dbg_is_power_cut() to emulate power cut instead of reading
c->dbg->pc_happened. Otherwise, the function becomes dead code.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/debug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 4c46a98..595ca0d 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2573,7 +2573,7 @@ int dbg_leb_write(struct ubifs_info *c, int lnum, const void *buf,
 {
 	int err, failing;
 
-	if (c->dbg->pc_happened)
+	if (dbg_is_power_cut(c))
 		return -EROFS;
 
 	failing = power_cut_emulated(c, lnum, 1);
@@ -2595,7 +2595,7 @@ int dbg_leb_change(struct ubifs_info *c, int lnum, const void *buf,
 {
 	int err;
 
-	if (c->dbg->pc_happened)
+	if (dbg_is_power_cut(c))
 		return -EROFS;
 	if (power_cut_emulated(c, lnum, 1))
 		return -EROFS;
@@ -2611,7 +2611,7 @@ int dbg_leb_unmap(struct ubifs_info *c, int lnum)
 {
 	int err;
 
-	if (c->dbg->pc_happened)
+	if (dbg_is_power_cut(c))
 		return -EROFS;
 	if (power_cut_emulated(c, lnum, 0))
 		return -EROFS;
@@ -2627,7 +2627,7 @@ int dbg_leb_map(struct ubifs_info *c, int lnum)
 {
 	int err;
 
-	if (c->dbg->pc_happened)
+	if (dbg_is_power_cut(c))
 		return -EROFS;
 	if (power_cut_emulated(c, lnum, 0))
 		return -EROFS;
-- 
1.9.1
