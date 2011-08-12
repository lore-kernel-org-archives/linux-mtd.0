Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qro7n-0005cb-Qy
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2011 09:33:56 +0000
Date: Fri, 12 Aug 2011 11:34:29 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs unmount bug
Message-ID: <20110812093429.GS26160@logfs.org>
References: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
	<20110805160325.GM26160@logfs.org>
	<CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
	<20110808083107.GN26160@logfs.org>
	<CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
	<20110809145812.GR26160@logfs.org>
	<CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 August 2011 16:36:26 +0530, srimugunthan dhandapani wrote:
> 
> > Ok, since I cannot reproduce this at all, can you try the patch below?
> 
> I was using a week-old kernel from git. That may be the problem,
> Can you tell the kernel version that you are using, in which bonnie test passes.
> I am right now trying on kernel 3.0 and i will test and let you know
> the results.

I wouldn't suspect any code changes to cause the different behaviour.
Kernel config and test machine (memsize, etc.) would be more likely
candidates.  So if you could try the patch and send me the output,
that would be useful.

The problem is that two mutually exclusive reasons exist, why
page->private is set.  Either the page is an indirect block and
contains an alias (block->alias_map some bits set) or the page is a
regular data page that is dirty and hasn't been written back yet
(block->reserved_bytes > 0).  There should never be a case when both
happen at the same time.  So what you are seeing is only the symptom
of a bug happening some time before.

Best candidate I have right now would be fixed by the patch below.
But since I cannot reproduce the bug, that patch is just guesswork.

Jörn

-- 
It is the mark of an educated mind to be able to entertain a thought
without accepting it.
-- Aristotle


diff --git a/fs/logfs/readwrite.c b/fs/logfs/readwrite.c
index 6c23507..3b12b4f 100644
--- a/fs/logfs/readwrite.c
+++ b/fs/logfs/readwrite.c
@@ -1538,6 +1538,7 @@ static int grow_inode(struct inode *inode, u64 bix, level_t level)
 static int __logfs_write_buf(struct inode *inode, struct page *page, long flags)
 {
 	struct logfs_super *super = logfs_super(inode->i_sb);
+	struct logfs_block *block = logfs_block(page);
 	pgoff_t index = page->index;
 	u64 bix;
 	level_t level;
@@ -1547,8 +1548,10 @@ static int __logfs_write_buf(struct inode *inode, struct page *page, long flags)
 	inode->i_ctime = inode->i_mtime = CURRENT_TIME;
 
 	logfs_unpack_index(index, &bix, &level);
-	if (logfs_block(page) && logfs_block(page)->reserved_bytes)
-		super->s_dirty_bytes -= logfs_block(page)->reserved_bytes;
+	if (block && block->reserved_bytes) {
+		super->s_dirty_bytes -= block->reserved_bytes;
+		block->reserved_bytes = 0;
+	}
 
 	if (index < I0_BLOCKS)
 		return logfs_write_direct(inode, page, flags);
