Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E9gqu-0006yP-SY
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2005 06:27:02 -0400
Date: Mon, 29 Aug 2005 12:26:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050829102654.GC17088@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<431187E8.8010805@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <431187E8.8010805@inf.u-szeged.hu>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 28 August 2005 11:46:16 +0200, Ferenc Havasi wrote:
> 
> Maybe we should use (temporary) vmalloc here instead of simply throwing 
> a BUG(). It's slower I know, but slow working is still better than not 
> working.

That sounded like a good idea, until I had a look at the code.
Basically, we shouldn't use vmalloc, unless we have to.  Using both
kmalloc and vmalloc means that we have to remember our choice of
allocation somewhere.  And once we do that, it's quite a bit of code
and complexity.

All that brainpower should rather go into a decent patch.

But here is the next best thing.  Note the third printk line.

Jörn

-- 
A defeated army first battles and then seeks victory.
-- Sun Tzu



Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 fs/jffs2/fs.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

--- linux-2.6.13-rc6mtd/fs/jffs2/fs.c~jffs2_remove_virtual_mapping	2005-08-26 17:18:04.000000000 +0200
+++ linux-2.6.13-rc6mtd/fs/jffs2/fs.c	2005-08-29 12:23:06.000000000 +0200
@@ -468,11 +468,12 @@ int jffs2_do_fill_super(struct super_blo
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
+				"	Please contact JFFS2 maintainers about this.\n"
+				"	Alternative, add the flag 'MTD_NO_VIRTBLOCKS' to your mapping driver\n");
+		BUG();
+		return -EIO;
 	}
 
 	/*
