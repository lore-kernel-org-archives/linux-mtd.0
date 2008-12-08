Received: from ey-out-1920.google.com ([74.125.78.145])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9kOW-0006dO-Kt
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 17:59:45 +0000
Received: by ey-out-1920.google.com with SMTP id 4so503722eyg.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Dec 2008 09:59:44 -0800 (PST)
Subject: [PATCH] [UBI] 4/4 UBI volume notifications - simple FTL
From: dmitry pervushin <dpervushin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 08 Dec 2008 20:59:36 +0300
Message-Id: <1228759176.7622.34.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: dmitry pervushin <dimka@embeddedalley.com>

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index a90d50c..4279c4d 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -318,4 +318,12 @@ source "drivers/mtd/onenand/Kconfig"
 
 source "drivers/mtd/ubi/Kconfig"
 
+config MTD_UBI_BLOCK
+       tristate "Simple mtdblock-like FTL over UBI volumes"
+       depends on MTD_UBI
+       select MTD_BLKDEVS
+       default n
+       help
+         This enables cached block access to UBI volumes
+
 endif # MTD
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 4b77335..a42596b 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -32,3 +32,4 @@ inftl-objs		:= inftlcore.o inftlmount.o
 obj-y		+= chips/ maps/ devices/ nand/ onenand/
 
 obj-$(CONFIG_MTD_UBI)		+= ubi/
+obj-$(CONFIG_MTD_UBI_BLOCK)	+= ubiblock.o
diff --git a/drivers/mtd/ubiblock.c b/drivers/mtd/ubiblock.c
new file mode 100644
index 0000000..7cc53c3
--- /dev/null
+++ b/drivers/mtd/ubiblock.c
@@ -0,0 +1,606 @@
+/*
+ * Direct UBI block device access
+ *
+ * Copyright (C) 2008 Embedded Alley Solutions Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *
+ * Based on mtdblock by:
+ * (C) 2000-2003 Nicolas Pitre <nico@cam.org>
+ * (C) 1999-2003 David Woodhouse <dwmw2@infradead.org>
+ */
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
+#include <linux/genhd.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/blktrans.h>
+#include <linux/mtd/ubi.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
+
+#include "mtdcore.h"
+
+static LIST_HEAD(ubiblk_devices);
+
+struct ubiblk_dev {
+	struct mtd_blktrans_dev m;
+
+	int 			ubi_num;
+	char		       *ubi_vol;
+	int			usecount;
+	struct ubi_volume_desc *ubi;
+
+	struct mutex 		cache_mutex;
+	unsigned char 	       *cache_data;
+	unsigned long 		cache_offset;
+	unsigned int 		cache_size;
+
+	enum {
+		STATE_EMPTY,
+		STATE_CLEAN,
+		STATE_DIRTY
+	} cache_state;
+
+	struct list_head 	list;
+
+	struct work_struct	unbind;
+};
+
+static int ubiblock_open(struct mtd_blktrans_dev *mbd);
+static int ubiblock_release(struct mtd_blktrans_dev *mbd);
+static int ubiblock_flush(struct mtd_blktrans_dev *mbd);
+static int ubiblock_readsect(struct mtd_blktrans_dev *mbd,
+			      unsigned long block, char *buf);
+static int ubiblock_writesect(struct mtd_blktrans_dev *mbd,
+			      unsigned long block, char *buf);
+static int ubiblock_getgeo(struct mtd_blktrans_dev *mbd,
+		struct hd_geometry *geo);
+static void *ubiblk_add(int ubi_num, const char *ubi_vol_id);
+static void *ubiblk_add_locked(int ubi_num, const char *ubi_vol_id);
+static int ubiblk_del(struct ubiblk_dev *u);
+static int ubiblk_del_locked(struct ubiblk_dev *u);
+
+/*
+ * These two routines are just to satify mtd_blkdev's requirements
+ */
+static void ubiblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
+{
+	return;
+}
+
+static void ubiblock_remove_dev(struct mtd_blktrans_dev *mbd)
+{
+	return;
+}
+
+static struct mtd_blktrans_ops ubiblock_tr = {
+
+	.name		= "ubiblk",
+	.major		= 0,
+	.part_bits	= 3,
+	.blksize 	= 512,
+
+	.open		= ubiblock_open,
+	.release	= ubiblock_release,
+	.flush		= ubiblock_flush,
+	.readsect	= ubiblock_readsect,
+	.writesect	= ubiblock_writesect,
+	.getgeo		= ubiblock_getgeo,
+
+	.add_mtd	= ubiblock_add_mtd,
+	.remove_dev	= ubiblock_remove_dev,
+	.owner		= THIS_MODULE,
+};
+
+static int ubiblock_getgeo(struct mtd_blktrans_dev *bdev,
+		struct hd_geometry *geo)
+{
+	return -ENOTTY;
+}
+
+/**
+ * ubiblk_write_cached_data - flush the cache to the UBI volume
+ */
+static int ubiblk_write_cached_data(struct ubiblk_dev *u)
+{
+	int ret;
+
+	if (u->cache_state != STATE_DIRTY)
+		return 0;
+
+	pr_debug("%s: volume %d:%s, writing at %lx of size %x\n",
+		__func__, u->ubi_num, u->ubi_vol,
+		u->cache_offset, u->cache_size);
+
+	ret = ubi_write(u->ubi, u->cache_offset / u->cache_size,
+			u->cache_data, 0, u->cache_size);
+	pr_debug("leb_write status %d\n", ret);
+
+	u->cache_state = STATE_EMPTY;
+	return ret;
+}
+
+/**
+ * ubiblk_do_cached_write - cached write the data to the UBI volume
+ *
+ * @u: ubiblk_dev
+ * @pos: offset on the block device
+ * @len: buffer length
+ * @buf: buffer itself
+ *
+ * if buffer contains one or more whole sectors (=LEBs), write them to the
+ * volume. Otherwise, fill the cache that will be flushed later
+ */
+static int ubiblk_do_cached_write(struct ubiblk_dev *u, unsigned long pos,
+			    int len, const char *buf)
+{
+	unsigned int sect_size = u->cache_size,
+		size, offset;
+	unsigned long sect_start;
+	int ret = 0;
+	int leb;
+
+	pr_debug("%s: volume %d:%s, writing at pos %lx of size %x\n",
+		__func__, u->ubi_num, u->ubi_vol, pos, len);
+
+	while (len > 0) {
+		leb = pos / sect_size;
+		sect_start = leb * sect_size;
+		offset = pos - sect_start;
+		size = sect_size - offset;
+
+		if (size > len)
+			size = len;
+
+		if (size == sect_size) {
+			/*
+			 * We are covering a whole sector.  Thus there is no
+			 * need to bother with the cache while it may still be
+			 * useful for other partial writes.
+			 */
+			ret = ubi_leb_change(u->ubi, leb,
+					buf, size, UBI_UNKNOWN);
+			if (ret)
+				goto out;
+		} else {
+			/* Partial sector: need to use the cache */
+
+			if (u->cache_state == STATE_DIRTY &&
+			    u->cache_offset != sect_start) {
+				ret = ubiblk_write_cached_data(u);
+				if (ret)
+					goto out;
+			}
+
+			if (u->cache_state == STATE_EMPTY ||
+			    u->cache_offset != sect_start) {
+				/* fill the cache with the current sector */
+				u->cache_state = STATE_EMPTY;
+				ret = ubi_leb_read(u->ubi, leb,
+					u->cache_data, 0, u->cache_size, 0);
+				if (ret)
+					return ret;
+				ret = ubi_leb_unmap(u->ubi, leb);
+				if (ret)
+					return ret;
+				ret = ubi_leb_unmap(u->ubi, leb);
+				if (ret)
+					return ret;
+				u->cache_offset = sect_start;
+				u->cache_state = STATE_CLEAN;
+			}
+
+			/* write data to our local cache */
+			memcpy(u->cache_data + offset, buf, size);
+			u->cache_state = STATE_DIRTY;
+		}
+
+		buf += size;
+		pos += size;
+		len -= size;
+	}
+
+out:
+	return ret;
+}
+
+/**
+ * ubiblk_do_cached_read - cached read the data from ubi volume
+ *
+ * @u: ubiblk_dev
+ * @pos: offset on the block device
+ * @len: buffer length
+ * @buf: preallocated buffer
+ *
+ * Cached LEB will be used if possible; otherwise data will be using 
+ * ubi_leb_read
+ */
+static int ubiblk_do_cached_read(struct ubiblk_dev *u, unsigned long pos,
+			   int len, char *buf)
+{
+	unsigned int sect_size = u->cache_size;
+	int err = 0;
+	unsigned long sect_start;
+	unsigned offset, size;
+	int leb;
+
+	pr_debug("%s: read at 0x%lx, size 0x%x\n",
+			__func__, pos, len);
+
+	while (len > 0) {
+
+		leb = pos/sect_size;
+		sect_start = leb*sect_size;
+		offset = pos - sect_start;
+		size = sect_size - offset;
+
+		if (size > len)
+			size = len;
+
+		/*
+		 * Check if the requested data is already cached
+		 * Read the requested amount of data from our internal
+		 * cache if it contains what we want, otherwise we read
+		 * the data directly from flash.
+		 */
+		if (u->cache_state != STATE_EMPTY &&
+		    u->cache_offset == sect_start) {
+			pr_debug("%s: cached, returning back from cache\n",
+					__func__);
+			memcpy(buf, u->cache_data + offset, size);
+			err = 0;
+		} else {
+			pr_debug("%s: pos = %ld, reading leb = %d\n",
+					__func__, pos, leb);
+			err = ubi_leb_read(u->ubi, leb, buf, offset, size, 0);
+			if (err)
+				goto out;
+		}
+
+		buf += size;
+		pos += size;
+		len -= size;
+	}
+
+out:
+	return err;
+}
+
+/**
+ * ubiblock_writesect - write the sector
+ *
+ * Allocate the cache, if necessary and perform actual write using
+ * ubiblk_do_cached_write
+ */
+static int ubiblock_writesect(struct mtd_blktrans_dev *mbd,
+			      unsigned long block, char *buf)
+{
+	struct ubiblk_dev *u = container_of(mbd, struct ubiblk_dev, m);
+
+	if (unlikely(!u->cache_data)) {
+		u->cache_data = vmalloc(u->cache_size);
+		if (!u->cache_data)
+			return -EAGAIN;
+	}
+	return ubiblk_do_cached_write(u, block<<9, 512, buf);
+}
+
+/**
+ * ubiblk_readsect - read the sector
+ *
+ * Allocate the cache, if necessary, and perform actual read using
+ * ubiblk_do_cached_read
+ */
+static int ubiblock_readsect(struct mtd_blktrans_dev *mbd,
+			      unsigned long block, char *buf)
+{
+	struct ubiblk_dev *u = container_of(mbd, struct ubiblk_dev, m);
+
+	if (unlikely(!u->cache_data)) {
+		u->cache_data = vmalloc(u->cache_size);
+		if (!u->cache_data)
+			return -EAGAIN;
+	}
+	return ubiblk_do_cached_read(u, block<<9, 512, buf);
+}
+
+static int ubiblk_flush_locked(struct ubiblk_dev *u)
+{
+	ubiblk_write_cached_data(u);
+	ubi_sync(u->ubi_num);
+	return 0;
+}
+
+static int ubiblock_flush(struct mtd_blktrans_dev *mbd)
+{
+	struct ubiblk_dev *u = container_of(mbd, struct ubiblk_dev, m);
+
+	mutex_lock(&u->cache_mutex);
+	ubiblk_flush_locked(u);
+	mutex_unlock(&u->cache_mutex);
+	return 0;
+}
+
+
+static int ubiblock_open(struct mtd_blktrans_dev *mbd)
+{
+	struct ubiblk_dev *u = container_of(mbd, struct ubiblk_dev, m);
+
+	if (u->usecount == 0) {
+		u->ubi = ubi_open_volume_nm(u->ubi_num, u->ubi_vol,
+				UBI_READWRITE);
+		if (IS_ERR(u->ubi))
+			return PTR_ERR(u->ubi);
+	}
+	u->usecount++;
+	return 0;
+}
+
+static int ubiblock_release(struct mtd_blktrans_dev *mbd)
+{
+	struct ubiblk_dev *u = container_of(mbd, struct ubiblk_dev, m);
+
+	if (--u->usecount == 0) {
+		mutex_lock(&u->cache_mutex);
+		ubiblk_flush_locked(u);
+		vfree(u->cache_data);
+		u->cache_data = NULL;
+		mutex_unlock(&u->cache_mutex);
+		ubi_close_volume(u->ubi);
+		u->ubi = NULL;
+	}
+	return 0;
+}
+
+/* 
+ * sysfs routines. The ubiblk creates two entries under /sys/block/ubiblkX:
+ *  - volume, R/O, which is read like "ubi0:volume_name"
+ *  - unbind, W/O; when user writes something here, the block device is
+ *  removed
+ *
+ *  unbind schedules a work item to perform real unbind, because sysfs entry
+ *  handler cannot delete itself :)
+ */
+ssize_t volume_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct gendisk *gd = dev_to_disk(dev);
+	struct mtd_blktrans_dev *m = gd->private_data;
+	struct ubiblk_dev *u = container_of(m, struct ubiblk_dev, m);
+
+	return sprintf(buf, "%d:%s\n", u->ubi_num, u->ubi_vol);
+}
+
+static void ubiblk_unbind(struct work_struct *ws)
+{
+	struct ubiblk_dev *u = container_of(ws, struct ubiblk_dev, unbind);
+
+	ubiblk_del(u);
+}
+
+ssize_t unbind_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	struct gendisk *gd = dev_to_disk(dev);
+	struct mtd_blktrans_dev *m = gd->private_data;
+	struct ubiblk_dev *u = container_of(m, struct ubiblk_dev, m);
+
+	INIT_WORK(&u->unbind, ubiblk_unbind);
+	schedule_work(&u->unbind);
+	return count;
+}
+
+DEVICE_ATTR(unbind, 0644, NULL, unbind_store);
+DEVICE_ATTR(volume, 0644, volume_show, NULL);
+
+static int ubiblk_sysfs(struct gendisk *hd, int add)
+{
+	int r = 0;
+
+	if (add) {
+		r = device_create_file(disk_to_dev(hd), &dev_attr_unbind);
+		if (r < 0)
+			goto out;
+		r = device_create_file(disk_to_dev(hd), &dev_attr_volume);
+		if (r < 0) {
+			device_remove_file(disk_to_dev(hd), &dev_attr_unbind);
+			goto out;
+		}
+	} else {
+		device_remove_file(disk_to_dev(hd), &dev_attr_unbind);
+		device_remove_file(disk_to_dev(hd), &dev_attr_volume);
+	}
+out:
+	put_disk(hd);
+	return r;
+}
+
+
+/**
+ * add the FTL by registering it with mtd_blkdevs
+ */
+static void *ubiblk_add(int ubi_num, const char *ubi_vol_id)
+{
+	void *p;
+
+	mutex_lock(&mtd_table_mutex);
+	p = ubiblk_add_locked(ubi_num, ubi_vol_id);
+	mutex_unlock(&mtd_table_mutex);
+	return p;
+}
+
+static void *ubiblk_add_locked(int ubi_num, const char *ubi_vol_id)
+{
+	struct ubiblk_dev *u = kzalloc(sizeof(*u), GFP_KERNEL);
+	struct ubi_volume_info uvi;
+	struct ubi_volume_desc *ubi;
+
+	if (!u) {
+		u = ERR_PTR(-ENOMEM);
+		goto out;
+	}
+
+	ubi = ubi_open_volume_nm(ubi_num, ubi_vol_id, UBI_READONLY);
+	if (IS_ERR(u->ubi)) {
+		pr_err("cannot open the volume\n");
+		u = (void *)u->ubi;
+		goto out;
+	}
+
+	ubi_get_volume_info(ubi, &uvi);
+	ubi_close_volume(ubi);
+
+	pr_debug("adding volume of size %d (used_size %lld), LEB size %d\n",
+		uvi.size, uvi.used_bytes, uvi.usable_leb_size);
+
+	u->m.mtd = NULL;
+	u->m.devnum = -1;
+	u->m.size = uvi.used_bytes >> 9;
+	u->m.tr = &ubiblock_tr;
+
+	u->ubi_num = ubi_num;
+	u->ubi_vol = kstrdup(ubi_vol_id, GFP_KERNEL);
+	if (!u->ubi_vol) {
+		kfree(u);
+		u = ERR_PTR(-ENOMEM);
+		goto out;
+	}
+	mutex_init(&u->cache_mutex);
+	u->cache_state = STATE_EMPTY;
+	u->cache_size = uvi.usable_leb_size;
+	u->cache_data = NULL;
+	u->usecount = 0;
+	INIT_LIST_HEAD(&u->list);
+
+	list_add_tail(&u->list, &ubiblk_devices);
+	add_mtd_blktrans_dev(&u->m);
+	ubiblk_sysfs(u->m.blkcore_priv, true);
+out:
+	return u;
+}
+
+static int ubiblk_del(struct ubiblk_dev *u)
+{
+	int r;
+	mutex_lock(&mtd_table_mutex);
+	r = ubiblk_del_locked(u);
+	mutex_unlock(&mtd_table_mutex);
+	return r;
+}
+
+static int ubiblk_del_locked(struct ubiblk_dev *u)
+{
+	if (u->usecount != 0)
+		return -EBUSY;
+	ubiblk_sysfs(u->m.blkcore_priv, false);
+	del_mtd_blktrans_dev(&u->m);
+	list_del(&u->list);
+	kfree(u->ubi_vol);
+	BUG_ON(u->cache_data != NULL); /* who did not free the cache ?! */
+	kfree(u);
+	return 0;
+}
+
+static struct ubiblk_dev *ubiblk_find(int num, const char *vol)
+{
+	struct ubiblk_dev *pos;
+
+	list_for_each_entry(pos, &ubiblk_devices, list)
+		if (pos->ubi_num == num && 
+		    ((!vol && !pos->ubi_vol) || !strcmp(pos->ubi_vol, vol)))
+			return pos;
+	return NULL;
+}
+
+static void ubiblk_change(int ubi_num, const char *vol_id)
+{
+	struct ubiblk_dev *u = ubiblk_find(ubi_num, vol_id);
+
+	if (!u)
+		return;
+	/* FIXME: do some reasonable things. E.g., change size */
+}
+
+static int ubiblock_notification(struct notifier_block *blk,
+		unsigned long type, void *v)
+{
+	struct ubi_volume_notification *nt = v;
+	struct ubiblk_dev *u;
+
+	switch ((enum ubi_volume_notification_type)type) {
+	case UBI_VOLUME_ADDED:
+		ubiblk_add(nt->ubi_device, nt->volume_name);
+		break;
+	case UBI_VOLUME_DELETED:
+		u = ubiblk_find(nt->ubi_device, nt->volume_name);
+		if (u)
+			ubiblk_del(u);
+		break;
+	case UBI_VOLUME_RENAMING:
+		u = ubiblk_find(nt->ubi_device, nt->volume_name);
+		if (u)
+			kfree(u->ubi_vol);
+		break;
+	case UBI_VOLUME_RENAMED:
+		u = ubiblk_find(nt->ubi_device, NULL);
+		if (u)
+			u->ubi_vol = kstrdup(nt->volume_name, GFP_KERNEL);
+		break;
+	case UBI_VOLUME_CHANGED:
+		ubiblk_change(nt->ubi_device, nt->volume_name);
+		break;
+	}
+	return NOTIFY_OK;
+}
+
+static struct notifier_block ubiblock_nb = {
+	.notifier_call = ubiblock_notification,
+};
+
+static int __init ubiblock_init(void)
+{
+	int r;
+
+	r = register_mtd_blktrans(&ubiblock_tr);
+	if (r)
+		goto out;
+	r = ubi_register_volume_notifier(&ubiblock_nb, 0);
+	if (r)
+		goto out_unreg;
+	return 0;
+
+out_unreg:
+	deregister_mtd_blktrans(&ubiblock_tr);
+out:
+	return 0;
+}
+
+static void __exit ubiblock_exit(void)
+{
+	ubi_unregister_volume_notifier(&ubiblock_nb);
+	deregister_mtd_blktrans(&ubiblock_tr);
+}
+
+module_init(ubiblock_init);
+module_exit(ubiblock_exit);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Caching block device emulation access to UBI devices");
+MODULE_AUTHOR("dmitry pervushin <dimka@embeddedalley.com>");
