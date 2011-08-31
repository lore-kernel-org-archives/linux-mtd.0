Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyf8S-0000TK-PG
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 07:22:57 +0000
Received: by iacb35 with SMTP id b35so573612iac.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2011 00:22:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110831055854.GA12713@logfs.org>
References: <20110808083107.GN26160@logfs.org>
	<CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
	<20110809145812.GR26160@logfs.org>
	<CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
	<20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
	<CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
	<20110831055854.GA12713@logfs.org>
Date: Wed, 31 Aug 2011 12:52:54 +0530
Message-ID: <CAMjNe_d2pOC9+2nSy2PA=2aigF95vZv3_A-jPyWyTXteW3mqFw@mail.gmail.com>
Subject: Re: logfs unmount bug
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 31, 2011 at 11:28 AM, J=F6rn Engel <joern@logfs.org> wrote:

> I can do. =A0Can you ensure you have my patch applied, rerun the rest
> case and send me the kernel results?

I applied your patch1  and the bonnie output is the same(stuck at
"Creating  files in sequential order ..."). The kernel is from your
git directory(http://git.kernel.org/?p=3Dlinux/kernel/git/joern/logfs.git;a=
=3Dsummary)
I am pretty sure i applied the patch. The git diff output is below[1]

 The kernel log is at
 https://docs.google.com/leaf?id=3D0BycgLWCW61phNjY0ZDg4ZjUtYzAyMy00YTgwLWF=
lMmItNjlmZWIzMWFlNGUy&hl=3Den_US

While i still have your attention, i would like to point out at max
writepage size restriction in logfs. Currently logfs has a max
writepage size as 4K. Currently, large page nand flashes and MLC nand
come in  8K page sizes. As the usecase for logfs is large nand
flashes(mostly with parallel and DMA write capabilities),  it may be
essential to remove the 4K write page size restriction.
I was only able to change the logfs-tools for >4K writepage size. If
you send a patch, that makes logfs useable for writepagesize >4K, i
can try on real hardware, instead of nandsim and give you the results
:-)


[1]
diff --git a/fs/logfs/file.c b/fs/logfs/file.c
index c2ad702..ee3c76a 100644
--- a/fs/logfs/file.c
+++ b/fs/logfs/file.c
@@ -158,7 +158,6 @@ static int logfs_writepage(struct page *page, struct wr=
iteba
        zero_user_segment(page, offset, PAGE_CACHE_SIZE);
        return __logfs_writepage(page);
 }
-
 static void logfs_invalidatepage(struct page *page, unsigned long offset)
 {
        struct logfs_block *block =3D logfs_block(page);
@@ -166,12 +165,24 @@ static void logfs_invalidatepage(struct page *page, u=
nsign
        if (block->reserved_bytes) {
                struct super_block *sb =3D page->mapping->host->i_sb;
                struct logfs_super *super =3D logfs_super(sb);
-
                super->s_dirty_pages -=3D block->reserved_bytes;
-               block->ops->free_block(sb, block);
-               BUG_ON(bitmap_weight(block->alias_map, LOGFS_BLOCK_FACTOR))=
;
+       //      block->ops->free_block(sb, block);
+       //      BUG_ON(bitmap_weight(block->alias_map, LOGFS_BLOCK_FACTOR))=
;
+               if (bitmap_weight(block->alias_map, LOGFS_BLOCK_FACTOR))
+               {
+                       printk(KERN_DEBUG"logfs_invalidatepage(%lx, %x, %ll=
x)\n"
+                                       page->mapping->host->i_ino,
+                                       page->mapping->host->i_nlink,
+                                       page->mapping->host->i_size);
+                       move_page_to_btree(page);
+               } else
+               {
+                       block->ops->free_block(sb, block);
+               }
        } else
+       {
                move_page_to_btree(page);
+       }
        BUG_ON(PagePrivate(page) || page->private);
 }

diff --git a/fs/logfs/logfs.h b/fs/logfs/logfs.h
index 9e74902..24c19a6 100644
--- a/fs/logfs/logfs.h
+++ b/fs/logfs/logfs.h
@@ -35,7 +35,9 @@
 #define LOGFS_DEBUG_BLOCKMOVE  (0x0400)
 #define LOGFS_DEBUG_ALL                (0xffffffff)

-#define LOGFS_DEBUG            (0x01)
+//#define LOGFS_DEBUG          (0x01)
+
+#define LOGFS_DEBUG LOGFS_DEBUG_ALL
 /*
  * To enable specific log messages, simply define LOGFS_DEBUG to match any
  * or all of the above.

Thanks,
mugunthan
