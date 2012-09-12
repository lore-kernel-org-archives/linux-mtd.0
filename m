Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBqLm-0000Ov-Nw
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 17:03:43 +0000
Received: by wibhn17 with SMTP id hn17so1699874wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 10:03:40 -0700 (PDT)
From: Peter Senna Tschudin <peter.senna@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 14/15] fs/jffs2/wbuf.c: removes unnecessary semicolon
Date: Wed, 12 Sep 2012 19:03:21 +0200
Message-Id: <1347469402-27557-14-git-send-email-peter.senna@gmail.com>
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 fs/jffs2/wbuf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index a6597d6..bea0487 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1275,7 +1275,7 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 	if ((c->flash_size % c->sector_size) != 0) {
 		c->flash_size = (c->flash_size / c->sector_size) * c->sector_size;
 		pr_warn("flash size adjusted to %dKiB\n", c->flash_size);
-	};
+	}
 
 	c->wbuf_ofs = 0xFFFFFFFF;
 	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
