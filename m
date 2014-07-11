Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5QMB-0002Ti-37
 for linux-mtd@lists.infradead.org; Fri, 11 Jul 2014 02:14:39 +0000
Message-ID: <53BF4851.4040105@huawei.com>
Date: Fri, 11 Jul 2014 10:13:37 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: Fix empty_log_bytes()  computing error
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

Hi Artem,

After several days testing, the error we fixed in commit 642f63ed10,
"UBIFS: fix fatal race condition" comes out again. This commit seems
not working for my problem and I have to research into it again.

With the help of my ubidump tool this time, I got the detailed info
of log area and mst nodes and found a terrible mistake in function
empty_log_bytes().

I used to think this helper function was correct but it truns out I
was wrong. We set @c->min_log_bytes to 0 in ubifs_log_start_commit()
and suppose empty_log_bytes() will return 0 when the log area is full.
But it's not true.

If lhead_lnum + 1 == ltail_lnum and c->lhead_offs == c->leb_size, @h
would equal to @t and empty_log_bytes() will return log_bytes expect 0.

I prefer to add a patch like:

+       if (h == t && c->lhead_offs == c->leb_size)
+               return 0;
+

but I think there may be no other situation that lead @h equal to @t.
So just make this helper function return 0 if @h equal to @t.

This patch also adds an assertion to make sure ltail is not wrapped
by lhead.



Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/log.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index ed24422..c5d0e73 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -106,7 +106,7 @@ static inline long long empty_log_bytes(const struct ubifs_info *c)
 	h = (long long)c->lhead_lnum * c->leb_size + c->lhead_offs;
 	t = (long long)c->ltail_lnum * c->leb_size;

-	if (h >= t)
+	if (h > t)
 		return c->log_bytes - h + t;
 	else
 		return t - h;
@@ -240,6 +240,7 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)

 	if (c->lhead_offs > c->leb_size - c->ref_node_alsz) {
 		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
+		ubifs_assert(c->lhead_lnum != c->ltail_lnum);
 		c->lhead_offs = 0;
 	}

-- 
1.8.1.4
