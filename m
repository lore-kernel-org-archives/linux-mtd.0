Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8bOc-0001Ts-4A
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 06:25:19 -0400
Date: Fri, 26 Aug 2005 12:25:12 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050826102512.GA23886@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trivial patch.  Anyone complaining about this is free to write a
better one.  Can I commit?

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham

Virtual mapping causes random incompatibilities depending on fs size,
cpu architecture and kernel data structures.  Anything is better than
that.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 fs/jffs2/fs.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

--- linux-2.6.13-rc6cow/fs/jffs2/fs.c~jffs2_remove_virtual_mapping	2005-08-17 13:37:22.000000000 +0200
+++ linux-2.6.13-rc6cow/fs/jffs2/fs.c	2005-08-26 12:22:13.000000000 +0200
@@ -468,11 +468,11 @@ int jffs2_do_fill_super(struct super_blo
 	 */
 	c->sector_size = c->mtd->erasesize; 
 	blocks = c->flash_size / c->sector_size;
-	if (!(c->mtd->flags & MTD_NO_VIRTBLOCKS)) {
-		while ((blocks * sizeof (struct jffs2_eraseblock)) > (128 * 1024)) {
-			blocks >>= 1;
-			c->sector_size <<= 1;
-		}	
+	if (!(c->mtd->flags & MTD_NO_VIRTBLOCKS) && (blocks * sizeof (struct jffs2_eraseblock)) > (128 * 1024)) {
+		printk(KERN_ERR "jffs2: Support for virtual blocks was removed\n"
+				"	Please contact JFFS2 maintainers about this.\n");
+		BUG();
+		return -EIO;
 	}
 
 	/*
