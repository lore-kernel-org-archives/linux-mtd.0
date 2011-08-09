Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qqnkg-0001KX-C6
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 14:57:55 +0000
Date: Tue, 9 Aug 2011 16:58:12 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs unmount bug
Message-ID: <20110809145812.GR26160@logfs.org>
References: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
	<20110805160325.GM26160@logfs.org>
	<CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
	<20110808083107.GN26160@logfs.org>
	<CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 8 August 2011 20:14:15 +0530, srimugunthan dhandapani wrote:
> 
> > Not good.  So far I managed to see a (the?) tiobench bug once, but
> > couldn't make it reproduceable.  Nor could I reproduce the bonnie bug.
> > Once the bugs are reproduceable, even my feeble eyes can usually spot
> > the cause sooner or later.  With a backtrace alone and no idea what
> > internal state it depends on, life is much harder.
> >
> 
> I am sorry , i dont know what i am missing. I tried it 5 times. 4/5
> trials, the bonnie test didnt complete. .Even when it completed once,
> the logs show kernel bug.

Ok, since I cannot reproduce this at all, can you try the patch below?
While it may already fix the problem, I am more interested in the
output.

>  do_invalidatepage+0x28/0x30
>  truncate_inode_page+0x92/0xb0
>  truncate_inode_pages_range+0x177/0x4f0
>  truncate_inode_pages+0x15/0x20
>  truncate_pagecache+0x4f/0x70
>  truncate_setsize+0x1f/0x30
>  vmtruncate+0x3e/0x60
>  logfs_truncate+0x263/0x2a0 [logfs]
>  logfs_evict_inode+0xdc/0x190 [logfs]
>  ? do_raw_spin_unlock+0x5e/0xb0
>  evict+0xa9/0x1a0
>  iput+0xfd/0x200

Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca


diff --git a/fs/logfs/file.c b/fs/logfs/file.c
index f2c08bc..7afd9a7 100644
--- a/fs/logfs/file.c
+++ b/fs/logfs/file.c
@@ -168,8 +168,14 @@ static void logfs_invalidatepage(struct page *page, unsigned long offset)
 		struct logfs_super *super = logfs_super(sb);
 
 		super->s_dirty_bytes -= block->reserved_bytes;
-		block->ops->free_block(sb, block);
-		BUG_ON(bitmap_weight(block->alias_map, LOGFS_BLOCK_FACTOR));
+		if (bitmap_weight(block->alias_map, LOGFS_BLOCK_FACTOR)) {
+			printk(KERN_DEBUG"logfs_invalidatepage(%lx, %x, %llx)\n",
+					page->mapping->host->i_ino,
+					page->mapping->host->i_nlink,
+					page->mapping->host->i_size);
+			move_page_to_btree(page);
+		} else
+			block->ops->free_block(sb, block);
 	} else
 		move_page_to_btree(page);
 	BUG_ON(PagePrivate(page) || page->private);
