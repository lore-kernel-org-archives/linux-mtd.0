Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zctif-0005eF-NV
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 11:20:47 +0000
Date: Fri, 18 Sep 2015 13:20:06 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: Jan Kara <jack@suse.cz>, viro@ZenIV.linux.org.uk, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 36/39] ubifs: implement ubifs_get_qsize to get quota
 size in ubifs
Message-ID: <20150918112006.GA16306@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-37-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150916100007.GD13325@quack.suse.cz>
 <55FA6A5F.1010702@cn.fujitsu.com>
 <20150917120044.GC32280@quack.suse.cz>
 <55FBABD8.9030002@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55FBABD8.9030002@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri 18-09-15 14:14:48, Dongsheng Yang wrote:
> On 09/17/2015 08:00 PM, Jan Kara wrote:
> >On Thu 17-09-15 15:23:11, Dongsheng Yang wrote:
> >>On 09/16/2015 06:00 PM, Jan Kara wrote:
> >>>On Tue 15-09-15 17:02:31, Dongsheng Yang wrote:
> >>>>We only care the size of regular file in ubifs for quota.
> >>>>The reason is similar with the comment in ubifs_getattr().
> >>>>
> >>>>Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> >>>>---
> >>>>  fs/ubifs/dir.c   |  3 +++
> >>>>  fs/ubifs/file.c  | 22 ++++++++++++++++++++++
> >>>>  fs/ubifs/ubifs.h |  1 +
> >>>>  3 files changed, 26 insertions(+)
> >>>>
> >>>>diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> >>>>index 802c6ad..0d3d6d3 100644
> >>>>--- a/fs/ubifs/dir.c
> >>>>+++ b/fs/ubifs/dir.c
> >>>>@@ -1205,6 +1205,9 @@ const struct inode_operations ubifs_dir_inode_operations = {
> >>>>  #ifdef CONFIG_UBIFS_ATIME_SUPPORT
> >>>>  	.update_time = ubifs_update_time,
> >>>>  #endif
> >>>>+#ifdef CONFIG_QUOTA
> >>>>+	.get_qsize	= ubifs_get_qsize,
> >>>>+#endif
> >>>>  };
> >>>>
> >>>>  const struct file_operations ubifs_dir_operations = {
> >>>>diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> >>>>index b57ccf3..f1d792a 100644
> >>>>--- a/fs/ubifs/file.c
> >>>>+++ b/fs/ubifs/file.c
> >>>>@@ -1636,6 +1636,22 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
> >>>>  	return 0;
> >>>>  }
> >>>>
> >>>>+/*
> >>>>+ * ubifs_get_qsize: get the quota size of a file
> >>>>+ * @inode: inode which we are going to get the qsize
> >>>>+ *
> >>>>+ * We only care the size of regular file in ubifs
> >>>>+ * for quota. The reason is similar with the comment
> >>>>+ * in ubifs_getattr().
> >>>>+ */
> >>>>+ssize_t ubifs_get_qsize(struct inode *inode)
> >>>>+{
> >>>>+	if (S_ISREG(inode->i_mode))
> >>>>+		return i_size_read(inode);
> >>>>+	else
> >>>>+		return 0;
> >>>>+}
> >>>>+
> >>>
> >>>The quota space is accounted in bytes. So why don't you store appropriate
> >>>number of bytes the file consumes in i_blocks / i_bytes? Reiserfs can also
> >>>have files occupying only say 100 bytes and everything works properly
> >>>there so I don't see why ubifs needs to differ.
> >>
> >>Ha, yes, we did not keep i_blocks in ubifs currently. Because we have
> >>no blocks in ubifs. Although we can simulate a i_block for quota, I
> >>did not do it. Let me try to show what I am thinking here.
> >>
> >>(1).Block file system are counting space with blocks. Then the quota
> >>could works in (dquot_alloc_block & i_blocks) way. I mean, account
> >>spaces by dquot_alloc_block() and FIOQSIZE can get the qsize from
> >>i_blocks.
> >>
> >>(2). But ubifs has no blocks, then I choose another way to do it,
> >>(quot_alloc_space & i_size). That means, we account quota spaces
> >>in ubifs by dquot_alloc_space() and want FIOSIZE to get i_size
> >>of inodes. Then there is no notion of *block* but only space.
> >>
> >>So, I want to make FIOSIZE more flexible here to introduce a get_qsize()
> >>into inode_operations.
> >
> >But when you use dquot_alloc_space(), then i_blocks / i_bytes will be
> >updated accordingly by quota code (after all, those values are used when
> >inode gets transferred between users on chown to update quota information
> >accordingly). So I don't see a reason why you should need to use i_size in
> >FIOSIZE.
> 
> Yes, dquot_alloc_space() would update i_blocks. But ubifs_iget() would
> never set i_blocks. So i_blocks would be 0 if you get inode from flash
> again. Yes, I can make ubifs to maintain a i_blocks. But.....
> >
> >As a side note, I think that using inode size as the amount of space used
> >is wrong. I believe even ubifs has a notion of how many bytes of storage
> >the file occupies and *this* information should be fed into quota subsystem
> >and updated via dquot_alloc_space(). That way it will be more or less
> >consistent with how quota for other filesystems works as well.
> 
> .... TBH, there is a little different with other filesystems. I did not
> use the "disk" space, but the file space in ubifs quota, although dquot
> means disk quota. Same with btrfs quota. If we use disk space for quota,
> the most common problem from user is that: why I did not reach the limit
> but I can not write any byte. COW in btrfs or out-place-updating in
> ubifs makes this problem much worse.
> 
> So I choose file space here for ubifs.

OK, so these are really two separate questions. I understand your choice of
using file space as the amount of space to account for quota purposes and
I'm fine with that choice. Another thing is that regardless of how you
decide to do quota accounting, you must maintain i_blocks / i_bytes to
contain proper value because dquot_transfer() uses that information to update
quota usage when inode owner is changed.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
