Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHo4V-0005mA-Bl
 for linux-mtd@lists.infradead.org; Sun, 01 Feb 2015 06:31:52 +0000
Date: Sun, 1 Feb 2015 06:31:16 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Jens Axboe <axboe@fb.com>
Subject: Re: backing_dev_info cleanups & lifetime rule fixes V2
Message-ID: <20150201063116.GP29656@ZenIV.linux.org.uk>
References: <1421228561-16857-1-git-send-email-hch@lst.de>
 <54BEC3C2.7080906@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54BEC3C2.7080906@fb.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Cc: linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tejun Heo <tj@kernel.org>,
 ceph-devel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 20, 2015 at 02:08:18PM -0700, Jens Axboe wrote:
> On 01/14/2015 02:42 AM, Christoph Hellwig wrote:
> >The first 8 patches are unchanged from the series posted a week ago and
> >cleans up how we use the backing_dev_info structure in preparation for
> >fixing the life time rules for it.  The most important change is to
> >split the unrelated nommu mmap flags from it, but it also remove a
> >backing_dev_info pointer from the address_space (and thus the inode)
> >and cleans up various other minor bits.
> >
> >The remaining patches sort out the issues around bdi_unlink and now
> >let the bdi life until it's embedding structure is freed, which must
> >be equal or longer than the superblock using the bdi for writeback,
> >and thus gets rid of the whole mess around reassining inodes to new
> >bdis.
> >
> >Changes since V1:
> >  - various minor documentation updates based on Feedback from Tejun
> 
> I applied this to for-3.20/bdi, only making the change (noticed by
> Jan) to kill the extra WARN_ON() in patch #11.

And at that point we finally can make sb_lock and super_blocks static in
fs/super.c.  Do you want that in your tree, or would you rather have it
done via vfs.git during the merge window after your tree goes in?  It's
as trivial as this:

Make super_blocks and sb_lock static

The only user outside of fs/super.c is gone now

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/fs/super.c b/fs/super.c
index eae088f..91badbb 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -36,8 +36,8 @@
 #include "internal.h"
 
 
-LIST_HEAD(super_blocks);
-DEFINE_SPINLOCK(sb_lock);
+static LIST_HEAD(super_blocks);
+static DEFINE_SPINLOCK(sb_lock);
 
 static char *sb_writers_name[SB_FREEZE_LEVELS] = {
 	"sb_writers",
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 1f3c439..efc384e 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1184,8 +1184,6 @@ struct mm_struct;
 #define UMOUNT_NOFOLLOW	0x00000008	/* Don't follow symlink on umount */
 #define UMOUNT_UNUSED	0x80000000	/* Flag guaranteed to be unused */
 
-extern struct list_head super_blocks;
-extern spinlock_t sb_lock;
 
 /* Possible states of 'frozen' field */
 enum {
