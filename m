Received: from mgw2.diku.dk ([130.225.96.92])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ODOpd-0005Dp-PZ
	for linux-mtd@lists.infradead.org; Sat, 15 May 2010 21:23:38 +0000
Date: Sat, 15 May 2010 23:23:31 +0200 (CEST)
From: Julia Lawall <julia@diku.dk>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 34/37] drivers/mtd: Use kmemdup
Message-ID: <Pine.LNX.4.64.1005152323150.21345@ask.diku.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to==NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/mtdconcat.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -183,10 +183,9 @@ concat_writev(struct mtd_info *mtd, cons
 	}
 
 	/* make a copy of vecs */
-	vecs_copy = kmalloc(sizeof(struct kvec) * count, GFP_KERNEL);
+	vecs_copy = kmemdup(vecs, sizeof(struct kvec) * count, GFP_KERNEL);
 	if (!vecs_copy)
 		return -ENOMEM;
-	memcpy(vecs_copy, vecs, sizeof(struct kvec) * count);
 
 	entry_low = 0;
 	for (i = 0; i < concat->num_subdev; i++) {
