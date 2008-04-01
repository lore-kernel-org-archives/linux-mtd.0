Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JhTEg-0004s6-1r
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 17:28:26 +0000
Message-Id: <20080401181332.853833014@logfs.org>
References: <20080401181308.512473173@logfs.org>
Date: Tue, 01 Apr 2008 20:13:08 +0200
To: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [patch 14/15] fs/logfs/dev_bdev.c
From: joern@logfs.org
Cc: Jens Axboe <jens.axboe@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- /dev/null	2008-03-30 12:15:48.586669308 +0200
+++ linux-2.6.24logfs/fs/logfs/dev_bdev.c	2008-03-28 20:04:13.961033452 +0100
@@ -0,0 +1,146 @@
+/*
+ * fs/logfs/dev_bdev.c	- Device access methods for block devices
+ *
+ * As should be obvious for Linux kernel code, license is GPLv2
+ *
+ * Copyright (c) 2005-2007 Joern Engel <joern@logfs.org>
+ */
+#include "logfs.h"
+#include <linux/buffer_head.h>
+
+#define PAGE_OFS(ofs) ((ofs) & (PAGE_SIZE-1))
+
+static int bdev_read(struct super_block *sb, loff_t from, size_t len, void *buf)
+{
+	struct block_device *bdev = logfs_super(sb)->s_bdev;
+	struct address_space *mapping = bdev->bd_inode->i_mapping;
+	struct page *page;
+	long index = from >> PAGE_SHIFT;
+	long offset = from & (PAGE_SIZE-1);
+	long copylen;
+
+	while (len) {
+		copylen = min((ulong)len, PAGE_SIZE - offset);
+
+		page = read_cache_page(mapping, index,
+				(filler_t *)mapping->a_ops->readpage, NULL);
+		if (!page)
+			return -ENOMEM;
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		memcpy(buf, page_address(page) + offset, copylen);
+		page_cache_release(page);
+
+		buf += copylen;
+		len -= copylen;
+		offset = 0;
+		index++;
+	}
+	return 0;
+}
+
+static int bdev_write(struct super_block *sb, loff_t to, size_t len, void *buf)
+{
+	struct block_device *bdev = logfs_super(sb)->s_bdev;
+	struct address_space *mapping = bdev->bd_inode->i_mapping;
+	struct page *page;
+	long index = to >> PAGE_SHIFT;
+	long offset = to & (PAGE_SIZE-1);
+	long copylen;
+
+	if (logfs_super(sb)->s_flags & LOGFS_SB_FLAG_RO)
+		return -EROFS;
+
+	while (len) {
+		copylen = min((ulong)len, PAGE_SIZE - offset);
+
+		page = read_cache_page(mapping, index,
+				(filler_t *)mapping->a_ops->readpage, NULL);
+		if (!page)
+			return -ENOMEM;
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+		lock_page(page);
+		memcpy(page_address(page) + offset, buf, copylen);
+		set_page_dirty(page);
+		unlock_page(page);
+		page_cache_release(page);
+
+		buf += copylen;
+		len -= copylen;
+		offset = 0;
+		index++;
+	}
+	return 0;
+}
+
+static int bdev_erase(struct super_block *sb, loff_t to, size_t len)
+{
+	struct block_device *bdev = logfs_super(sb)->s_bdev;
+	struct address_space *mapping = bdev->bd_inode->i_mapping;
+	struct page *page;
+	long index = to >> PAGE_SHIFT;
+	long offset = to & (PAGE_SIZE-1);
+	long copylen;
+
+	if (logfs_super(sb)->s_flags & LOGFS_SB_FLAG_RO)
+		return -EROFS;
+
+	while (len) {
+		copylen = min((ulong)len, PAGE_SIZE - offset);
+
+		page = read_cache_page(mapping, index,
+				(filler_t *)mapping->a_ops->readpage, NULL);
+		if (!page)
+			return -ENOMEM;
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+		lock_page(page);
+		memset(page_address(page) + offset, 0xFF, copylen);
+		set_page_dirty(page);
+		unlock_page(page);
+		page_cache_release(page);
+
+		len -= copylen;
+		offset = 0;
+		index++;
+	}
+	return 0;
+}
+
+static void bdev_sync(struct super_block *sb)
+{
+	sync_blockdev(logfs_super(sb)->s_bdev);
+}
+
+static s64 bdev_find_sb(struct super_block *sb)
+{
+	return 0;
+}
+
+static const struct logfs_device_ops bd_devops = {
+	.find_sb	= bdev_find_sb,
+	.read		= bdev_read,
+	.write		= bdev_write,
+	.erase		= bdev_erase,
+	.sync		= bdev_sync,
+};
+
+int logfs_get_sb_bdev(struct file_system_type *type, int flags,
+		const char *devname, struct vfsmount *mnt)
+{
+	struct block_device *bdev;
+
+	bdev = open_bdev_excl(devname, O_RDWR, NULL);
+	if (IS_ERR(bdev))
+		return PTR_ERR(bdev);
+
+	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
+		int mtdnr = MINOR(bdev->bd_dev);
+		close_bdev_excl(bdev);
+		return logfs_get_sb_mtd(type, flags, mtdnr, mnt);
+	}
+
+	return logfs_get_sb_device(type, flags, NULL, bdev, &bd_devops, mnt);
+}
