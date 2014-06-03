Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WriY5-0001GQ-7N
 for linux-mtd@lists.infradead.org; Tue, 03 Jun 2014 06:50:18 +0000
Message-ID: <538D6FE7.80209@huawei.com>
Date: Tue, 3 Jun 2014 14:49:11 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: Add an assertion for clean_zn_cnt
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

This patch adds a new ubifs_assert() in ubifs_tnc_close() to check
if there are any leaks of per-filesystem @clean_zn_cnt. This new
assert inspects whether the return value of ubifs_destroy_tnc_subtree()
is equal to @clean_zn_cnt or not while umount.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/tnc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 9083bc7..61914f0 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2859,10 +2859,11 @@ void ubifs_tnc_close(struct ubifs_info *c)
 {
 	tnc_destroy_cnext(c);
 	if (c->zroot.znode) {
-		long n;
+		long n, freed;

-		ubifs_destroy_tnc_subtree(c->zroot.znode);
+		freed = ubifs_destroy_tnc_subtree(c->zroot.znode);
 		n = atomic_long_read(&c->clean_zn_cnt);
+		ubifs_assert(freed == n);
 		atomic_long_sub(n, &ubifs_clean_zn_cnt);
 	}
 	kfree(c->gap_lebs);
-- 
1.8.1.4
