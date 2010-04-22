Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O539N-0004Z2-Jz
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 20:37:30 +0000
Date: Thu, 22 Apr 2010 22:33:58 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jens Axboe <jens.axboe@oracle.com>
Subject: [Patch] Catch filesystems lacking s_bdi
Message-ID: <20100422203358.GB30749@logfs.org>
References: <20100417184016.GA17345@logfs.org>
	<20100419073843.GN27497@kernel.dk>
	<20100419101559.GA4145@logfs.org>
	<20100419102056.GS27497@kernel.dk>
	<20100422055448.GA27309@logfs.org>
	<20100422062631.GC27309@logfs.org>
	<alpine.LFD.2.00.1004220724170.9086@i5.linux-foundation.org>
	<alpine.LFD.2.00.1004220730280.9086@i5.linux-foundation.org>
	<20100422162709.GJ27497@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100422162709.GJ27497@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 April 2010 18:27:10 +0200, Jens Axboe wrote:
> 
> > Jens - please help fix this up.
> 
> Of course, I already posted a series of patches to fix this up. I want
> to test them a bit, and I'll send them in tomorrow.

How about something like this to catch future cases?  It compiles and
survived a test boot, so it does seem to work for the common cases like
tmpfs, procfs, etc.

Jens, you know the bdi code 10x better than me, would this work?

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c

noop_backing_dev_info is used only as a flag to mark filesystems that
don't have any backing store, like tmpfs, procfs, spufs, etc.

Signed-off-by: Joern Engel <joern@logfs.org>

diff --git a/fs/super.c b/fs/super.c
index f35ac60..dc72491 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -693,6 +693,7 @@ int set_anon_super(struct super_block *s, void *data)
 		return -EMFILE;
 	}
 	s->s_dev = MKDEV(0, dev & MINORMASK);
+	s->s_bdi = &noop_backing_dev_info;
 	return 0;
 }
 
@@ -954,10 +955,11 @@ vfs_kern_mount(struct file_system_type *type, int flags, const char *name, void
 	if (error < 0)
 		goto out_free_secdata;
 	BUG_ON(!mnt->mnt_sb);
+	BUG_ON(!mnt->mnt_sb->s_bdi);
 
- 	error = security_sb_kern_mount(mnt->mnt_sb, flags, secdata);
- 	if (error)
- 		goto out_sb;
+	error = security_sb_kern_mount(mnt->mnt_sb, flags, secdata);
+	if (error)
+		goto out_sb;
 
 	/*
 	 * filesystems should never set s_maxbytes larger than MAX_LFS_FILESIZE
diff --git a/fs/sync.c b/fs/sync.c
index fc5c3d7..92b2281 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -14,6 +14,7 @@
 #include <linux/pagemap.h>
 #include <linux/quotaops.h>
 #include <linux/buffer_head.h>
+#include <linux/backing-dev.h>
 #include "internal.h"
 
 #define VALID_FLAGS (SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE| \
@@ -32,7 +33,7 @@ static int __sync_filesystem(struct super_block *sb, int wait)
 	 * This should be safe, as we require bdi backing to actually
 	 * write out data in the first place
 	 */
-	if (!sb->s_bdi)
+	if (!sb->s_bdi || sb->s_bdi == &noop_backing_dev_info)
 		return 0;
 
 	if (sb->s_qcop && sb->s_qcop->quota_sync)
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index fcbc26a..f4a1436 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -246,6 +246,7 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
 #endif
 
 extern struct backing_dev_info default_backing_dev_info;
+extern struct backing_dev_info noop_backing_dev_info;
 void default_unplug_io_fn(struct backing_dev_info *bdi, struct page *page);
 
 int writeback_in_progress(struct backing_dev_info *bdi);
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index f13e067..4aba836 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -25,6 +25,11 @@ struct backing_dev_info default_backing_dev_info = {
 };
 EXPORT_SYMBOL_GPL(default_backing_dev_info);
 
+struct backing_dev_info noop_backing_dev_info = {
+	.name		= "noop",
+};
+EXPORT_SYMBOL_GPL(noop_backing_dev_info);
+
 static struct class *bdi_class;
 
 /*
