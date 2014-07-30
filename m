Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCJn3-0003XE-E3
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 02:38:54 +0000
Message-ID: <53D85A81.3010106@huawei.com>
Date: Wed, 30 Jul 2014 10:37:53 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH resend] UBIFS: Add log overlap assertions
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

We use a circle area to record the log nodes in ubifs. This log area
should not be overlapped. But after researching the code, I found
some conditions may lead log head wraps log ltail. Although we've
fixed the problems discovered, there may be some other issues still
left.

This patch adds assertions where lhead changes to next leb to make
sure ltail is not wrapped.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/log.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 7e818ec..c14628f 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -244,6 +244,7 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)

 	if (c->lhead_offs > c->leb_size - c->ref_node_alsz) {
 		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
+		ubifs_assert(c->lhead_lnum != c->ltail_lnum);
 		c->lhead_offs = 0;
 	}

@@ -408,6 +409,7 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 	/* Switch to the next log LEB */
 	if (c->lhead_offs) {
 		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
+		ubifs_assert(c->lhead_lnum != c->ltail_lnum);
 		c->lhead_offs = 0;
 	}

-- 
1.8.1.4
