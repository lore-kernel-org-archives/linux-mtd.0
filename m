Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HLiPv-0001hW-34
	for linux-mtd@lists.infradead.org; Mon, 26 Feb 2007 11:09:37 -0500
Subject: [PATCH] JFFS2: Fix writebuffer recovery in the first page of a block
From: Thomas Gleixner <tglx@linutronix.de>
To: 'linux-mtd' <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Mon, 26 Feb 2007 17:09:09 +0100
Message-Id: <1172506149.32606.8.camel@chaos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vitaly Wool <vwool@ru.mvista.com>

For the case when nand_write_page fail with -EIO for the first page in an
eraseblock, jffs2_wbuf_recover ends up producing a BUG in jffs2_block_refile
as jeb->first_node is not yet set up (it's set up later in jffs2_wbuf_recover).
This BUG is not really a bug; it's just jffs2_wbuf_recover calling
jffs2_block_refile with the wrong second parameter.
This patch takes care of this situation.

 fs/jffs2/wbuf.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletion(-)

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Index: linux-2.6/fs/jffs2/wbuf.c
===================================================================
--- linux-2.6.orig/fs/jffs2/wbuf.c	2006-11-28 17:08:25.000000000 +0300
+++ linux-2.6/fs/jffs2/wbuf.c	2007-02-26 18:29:58.000000000 +0300
@@ -237,7 +237,10 @@
 	jeb = &c->blocks[c->wbuf_ofs / c->sector_size];
 
 	spin_lock(&c->erase_completion_lock);
-	jffs2_block_refile(c, jeb, REFILE_NOTEMPTY);
+	if (c->wbuf_ofs % c->mtd->erasesize)
+		jffs2_block_refile(c, jeb, REFILE_NOTEMPTY);
+	else
+		jffs2_block_refile(c, jeb, REFILE_ANYWAY);
 	spin_unlock(&c->erase_completion_lock);
 
 	BUG_ON(!ref_obsolete(jeb->last_node));
