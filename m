Received: from yw-out-1718.google.com ([74.125.46.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW2zN-0006fI-K3
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 05:45:41 +0000
Received: by yw-out-1718.google.com with SMTP id 5so73928ywm.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 22:45:41 -0700 (PDT)
Message-ID: <48AD0111.50204@gmail.com>
Date: Wed, 20 Aug 2008 22:45:53 -0700
From: Jared Hulbert <jaredeh@gmail.com>
MIME-Version: 1.0
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM,
	cotte@de.ibm.com, nickpiggin@yahoo.com.au
Subject: [PATCH 08/10] AXFS: axfs_mtd.c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Reply-To: jaredeh@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While we use mtd_super.c for most MTD mounting there are several things
 we do here to interface with the MTD devices.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
diff --git a/fs/axfs/axfs_mtd.c b/fs/axfs/axfs_mtd.c
new file mode 100644
index 0000000..35c8a98
--- /dev/null
+++ b/fs/axfs/axfs_mtd.c
@@ -0,0 +1,233 @@
+/*
+ * Advanced XIP File System for Linux - AXFS
+ *   Readonly, compressed, and XIP filesystem for Linux systems big and small
+ *
+ * Copyright(c) 2008 Numonyx
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * Authors:
+ *  Jared Hulbert <jaredeh@gmail.com>
+ *
+ * Project url: http://axfs.sourceforge.net
+ *
+ * axfs_mtd.c -
+ *   Allows axfs to use mtd devices or has dummy functions if mtd
+ *   device support is compiled out of the kernel.
+ */
+
+#include <linux/axfs.h>
+#include <linux/fs.h>
+#include <linux/mount.h>
+#include <linux/ctype.h>
+#include <linux/namei.h>
+
+#ifdef CONFIG_MTD
+#include <linux/mtd/super.h>
+
+int axfs_fill_super(struct super_block *, void *, int);
+
+static struct mtd_info *axfs_get_mtd_device(int mtdnr)
+{
+	struct mtd_info *device;
+
+	device = get_mtd_device(NULL, mtdnr);
+
+	if (!PTR_ERR(device))
+		return NULL;
+
+	return device;
+}
+
+int axfs_is_dev_mtd(char *path, int *mtdnr)
+{
+	char *off = NULL;
+	char *endptr = NULL;
+	char dev[] = "/dev/\0";
+	char mtd[] = "mtd\0";
+	char mtdblk[] = "mtdblock\0";
+
+	if (!path || !*path)
+		return FALSE;
+
+	off = path;
+
+	if (strncmp(dev, off, strlen(dev)) == 0)
+		off += strlen(dev);
+
+	if (!strncmp(mtd, off, strlen(mtd)) && isdigit(off[strlen(mtd)]))
+		off += strlen(mtd);
+
+	if (!strncmp(mtdblk, off, strlen(mtdblk))
+	    && isdigit(off[strlen(mtdblk)]))
+		off += strlen(mtdblk);
+
+	*mtdnr = simple_strtoul(off, &endptr, 0);
+
+	if (!*endptr)
+		return TRUE;
+
+	return FALSE;
+}
+
+static struct mtd_info *axfs_get_mtd_info(struct super_block *sb, u64 fsoffset)
+{
+	struct axfs_super *sbi = AXFS_SB(sb);
+
+	if (fsoffset == 0)
+		return (struct mtd_info *)AXFS_MTD0(sb);
+
+	if (fsoffset < sbi->mmap_size)
+		return (struct mtd_info *)AXFS_MTD0(sb);
+
+	if (AXFS_MTD1(sb) != NULL)
+		return (struct mtd_info *)AXFS_MTD1(sb);
+
+	return (struct mtd_info *)AXFS_MTD0(sb);
+}
+
+int axfs_copy_mtd(struct super_block *sb, void *dst, u64 fsoffset, u64 len)
+{
+	struct axfs_super *sbi = AXFS_SB(sb);
+	u64 offset = AXFS_FSOFFSET_2_DEVOFFSET(sbi, fsoffset);
+	struct mtd_info *mtd;
+	u_char *mtdbuf = (u_char *) dst;
+	size_t retlen;
+	int err;
+
+	if (len == 0)
+		return 0;
+
+	mtd = axfs_get_mtd_info(sb, fsoffset);
+	err = mtd->read(mtd, (loff_t) offset, (size_t) len, &retlen, mtdbuf);
+
+	if (len != retlen)
+		return -EIO;
+
+	return err;
+}
+
+/******************************************************************************
+ *
+ * axfs_map_mtd
+ *
+ * Description: When provided, uses the mtd point() capability to map allow
+ *              axfs a direct memory access to the filesystem.
+ *
+ * Parameters:
+ *    (IN) sb - pointer to the super_block structure
+ *
+ * Returns:
+ *    0 or error number
+ *
+ *****************************************************************************/
+int axfs_map_mtd(struct super_block *sb)
+{
+	struct axfs_super *sbi = AXFS_SB(sb);
+	struct mtd_info *mtd = (struct mtd_info *)AXFS_MTD0(sb);
+	size_t retlen;
+	int err = 0;
+	void *virt;
+	resource_size_t phys;
+
+	if (!mtd->point || !mtd->unpoint)
+		return 0;
+
+	err = mtd->point(mtd, 0, sbi->mmap_size, &retlen, &virt, &phys);
+	if (err)
+		return err;
+
+	if (retlen != sbi->mmap_size) {
+		mtd->unpoint(mtd, 0, retlen);
+		return -EINVAL;
+	}
+
+	sbi->virt_start_addr = (unsigned long)virt;
+	sbi->phys_start_addr = (unsigned long)phys;
+	sbi->mtd_pointed = TRUE;
+
+	return 0;
+}
+
+void axfs_unmap_mtd(struct super_block *sb)
+{
+	struct axfs_super *sbi = AXFS_SB(sb);
+	struct mtd_info *mtd = (struct mtd_info *)AXFS_MTD0(sb);
+
+	if (!sbi)
+		return;
+
+	if (AXFS_MTD1(sb))
+		put_mtd_device((struct mtd_info *)AXFS_MTD1(sb));
+
+	if (AXFS_IS_POINTED(sbi)) {
+		mtd->unpoint(mtd, 0, sbi->mmap_size);
+	} else {
+		if (AXFS_MTD0(sb))
+			put_mtd_device((struct mtd_info *)AXFS_MTD0(sb));
+	}
+}
+
+
+int axfs_get_sb_mtd(struct file_system_type *fs_type, int flags,
+		    const char *dev_name, struct axfs_super *sbi,
+		    struct vfsmount *mnt, int *err)
+{
+	int nflags, mtdnr;
+
+	if (axfs_is_dev_mtd(sbi->second_dev, &mtdnr)) {
+		sbi->mtd1 = (void *)axfs_get_mtd_device(mtdnr);
+		if (!sbi->mtd1) {
+			*err = -EINVAL;
+			return FALSE;
+		}
+	}
+	nflags = flags & MS_SILENT;
+
+	*err = get_sb_mtd(fs_type, nflags, dev_name, sbi, axfs_fill_super, mnt);
+	if (*err)
+		return FALSE;
+
+	sbi->mtd0 = mnt->mnt_sb->s_mtd;
+	return TRUE;
+}
+
+void axfs_kill_mtd_super(struct super_block *sb)
+{
+	kill_mtd_super(sb);
+}
+#else
+
+int axfs_map_mtd(struct super_block *sb)
+{
+	return 0;
+}
+
+void axfs_unmap_mtd(struct super_block *sb)
+{
+}
+
+int axfs_copy_mtd(struct super_block *sb, void *dst, u64 fsoffset, u64 len)
+{
+	return -EINVAL;
+}
+
+int axfs_get_sb_mtd(struct file_system_type *fs_type, int flags,
+		    const char *dev_name, char *second_dev,
+		    struct axfs_super *sbi, struct vfsmount *mnt, int *err)
+{
+	return FALSE;
+}
+
+int axfs_is_dev_mtd(char *path, int *mtdnr)
+{
+	return FALSE;
+}
+
+void axfs_kill_mtd_super(struct super_block *sb)
+{
+}
+
+#endif /* CONFIG_MTD */
