Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wn2iJ-0000LA-8X
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 09:21:31 +0000
Message-ID: <537C6FB1.4020305@huawei.com>
Date: Wed, 21 May 2014 17:19:45 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: Fix dump messages in ubifs_dump_lprops
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

Function ubifs_read_one_lp will not set @lp and returns
an error when ubifs_read_one_lp failed. We should not
perform ubifs_dump_lprop in this case because @lp is not
initialized as we wanted.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/debug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 5157b86..177b015 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -745,8 +745,10 @@ void ubifs_dump_lprops(struct ubifs_info *c)

 	for (lnum = c->main_first; lnum < c->leb_cnt; lnum++) {
 		err = ubifs_read_one_lp(c, lnum, &lp);
-		if (err)
+		if (err) {
 			ubifs_err("cannot read lprops for LEB %d", lnum);
+			continue;
+		}

 		ubifs_dump_lprop(c, &lp);
 	}
-- 
1.8.1.4
