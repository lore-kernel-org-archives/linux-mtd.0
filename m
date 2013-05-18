Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UdiBm-0000Mc-Gd
 for linux-mtd@lists.infradead.org; Sat, 18 May 2013 14:32:52 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 1/1] ubi: Introduce block devices for UBI volumes
Date: Sat, 18 May 2013 11:31:54 -0300
Message-Id: <1368887515-10536-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1368887515-10536-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1368887515-10536-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Tim Bird <tim.bird@am.sony.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Block device emulation on top of ubi volumes with read/write support.

Given UBI takes care of wear leveling and bad block management it's possible
to add a thin layer to enable block device access to UBI volumes.
This allows to use a block-oriented filesystem on a flash device.

In a similar fashion to mtdblock, two 1-LEB size caches have been implemented:
one for reading and one for writing.

Every read and every write goes through one of these caches.
Read requests can be satisfied through the read cache or the write cache.
Write requests always fill the write cache (possibly flushing it).
This fill is done through the read cache, if this is possible.
If the requested leb is not cached, it's loaded to the associated cache.

The flash device is written when the write cache is flushed on:
* block device release (detach)
* a different than cached leb is accessed
* io-barrier is received through a REQ_FLUSH request

By creating two caches we decouple read access from write access,
in an effort to improve wear leveling.

Despite this efforts, it's very important to remember that regular
block-oriented filesystems have no care at all about wear leveling;
they will access the block device randomly, only caring for performance.
Therefore, write support should be selected only for development and
with extreme caution.

Both caches are 1-LEB bytes, vmalloced at open() and freed at release();
in addition, each block device has a workqueue associated.

Block devices are created upon user request through new ioctls:
UBI_IOCVOLATTBLK to attach and UBI_IOCVOLDETBLK to detach.
Also, a new UBI module parameter is added 'ubi.block'. This parameter is
needed in order to attach a block device on boot-up time, allowing to
mount the rootfs on a ubiblock device.
For instance, you could have these kernel parameters:

  ubi.mtd=5 ubi.block=0,0 root=/dev/ubiblock0_0

Or, if you compile ubi as a module:

  $ modprobe ubi mtd=/dev/mtd5 block=/dev/ubi0_0

Cc: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/Kconfig     |  24 ++
 drivers/mtd/ubi/Makefile    |   1 +
 drivers/mtd/ubi/block.c     | 894 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/build.c     |   5 +
 drivers/mtd/ubi/cdev.c      |  20 +
 drivers/mtd/ubi/ubi.h       |  14 +
 include/uapi/mtd/ubi-user.h |  11 +
 7 files changed, 969 insertions(+)
 create mode 100644 drivers/mtd/ubi/block.c

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 36663af..caebe2a 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -87,4 +87,28 @@ config MTD_UBI_GLUEBI
 	   work on top of UBI. Do not enable this unless you use legacy
 	   software.
 
+config MTD_UBI_BLOCK
+	bool "Block device access to UBI volumes"
+	default n
+	help
+	   Since UBI already takes care of eraseblock wear leveling
+	   and bad block handling, it's possible to implement a block
+	   device on top of it and therefore mount regular filesystems
+	   (i.e. not flash-oriented, as ext4).
+
+	   In other words, this is a software flash translation layer.
+
+	   If in doubt, say "N".
+
+config MTD_UBI_BLOCK_WRITE_SUPPORT
+	bool "Enable write support (DANGEROUS)"
+	default n
+	depends on MTD_UBI_BLOCK
+	help
+	   This is a *very* dangerous feature. Using a regular block-oriented
+	   filesystem might impact heavily on a flash device wear.
+	   Use with extreme caution.
+
+	   If in doubt, say "N".
+
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index b46b0c97..4e3c3d7 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_MTD_UBI) += ubi.o
 ubi-y += vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o attach.o
 ubi-y += misc.o debug.o
 ubi-$(CONFIG_MTD_UBI_FASTMAP) += fastmap.o
+ubi-$(CONFIG_MTD_UBI_BLOCK) += block.o
 
 obj-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
new file mode 100644
index 0000000..5ec0626
--- /dev/null
+++ b/drivers/mtd/ubi/block.c
@@ -0,0 +1,894 @@
+/*
+ * Copyright (c) 2012 Ezequiel Garcia
+ * Copyright (c) 2011 Free Electrons
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, version 2.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/mtd/ubi.h>
+#include <linux/workqueue.h>
+#include <linux/blkdev.h>
+#include <linux/hdreg.h>
+
+#include "ubi-media.h"
+#include "ubi.h"
+
+/* Maximum number of supported devices */
+#define UBIBLOCK_MAX_DEVICES 32
+
+/* Maximum length of the 'block=' parameter */
+#define UBIBLOCK_PARAM_LEN 64
+
+/* Maximum number of comma-separated items in the 'block=' parameter */
+#define UBIBLOCK_PARAM_COUNT 2
+
+struct ubiblock_param {
+	int ubi_num;
+	int vol_id;
+	char name[UBIBLOCK_PARAM_LEN];
+};
+
+/* Numbers of elements set in the @ubiblock_param array */
+static int __initdata ubiblock_devs;
+
+/* MTD devices specification parameters */
+static struct ubiblock_param __initdata ubiblock_param[UBIBLOCK_MAX_DEVICES];
+
+struct ubiblock_cache {
+	char *buffer;
+	enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } state;
+	int leb_num;
+};
+
+struct ubiblock {
+	struct ubi_volume_desc *desc;
+	struct ubi_volume_info *vi;
+	int ubi_num;
+	int vol_id;
+	int refcnt;
+
+	struct gendisk *gd;
+	struct request_queue *rq;
+
+	struct workqueue_struct *wq;
+	struct work_struct work;
+
+	struct mutex vol_mutex;
+	spinlock_t queue_lock;
+	struct list_head list;
+
+	int leb_size;
+	struct ubiblock_cache read_cache;
+	struct ubiblock_cache write_cache;
+};
+
+/* Linked list of all ubiblock instances */
+static LIST_HEAD(ubiblock_devices);
+static DEFINE_MUTEX(devices_mutex);
+static int ubiblock_major;
+
+/* Ugh! this parameter parsing code is awful */
+static int __init ubiblock_set_param(const char *val,
+				     const struct kernel_param *kp)
+{
+	int len, i, ret;
+	struct ubiblock_param *param;
+	char buf[UBIBLOCK_PARAM_LEN];
+	char *pbuf = &buf[0];
+	char *tokens[UBIBLOCK_PARAM_COUNT];
+
+	if (!val)
+		return -EINVAL;
+
+	len = strnlen(val, UBIBLOCK_PARAM_LEN);
+	if (len == 0) {
+		ubi_warn("block: empty 'blk=' parameter - ignored\n");
+		return 0;
+	}
+
+	if (len == UBIBLOCK_PARAM_LEN) {
+		ubi_err("block: parameter \"%s\" is too long, max. is %d\n",
+			val, UBIBLOCK_PARAM_LEN);
+		return -EINVAL;
+	}
+
+	strcpy(buf, val);
+
+	/* Get rid of the final newline */
+	if (buf[len - 1] == '\n')
+		buf[len - 1] = '\0';
+
+	for (i = 0; i < UBIBLOCK_PARAM_COUNT; i++)
+		tokens[i] = strsep(&pbuf, ",");
+
+	param = &ubiblock_param[ubiblock_devs];
+	if (tokens[1]) {
+		/* Two parameters: can be 'ubi, vol_id' or 'ubi, vol_name' */
+		ret = kstrtoint(tokens[0], 10, &param->ubi_num);
+		if (ret < 0)
+			return -EINVAL;
+
+		/* Second param can be a number or a name */
+		ret = kstrtoint(tokens[1], 10, &param->vol_id);
+		if (ret < 0) {
+			param->vol_id = -1;
+			strcpy(param->name, tokens[1]);
+		}
+
+	} else {
+		/* One parameter: must be device path */
+		strcpy(param->name, tokens[0]);
+		param->ubi_num = -1;
+		param->vol_id = -1;
+	}
+
+	ubiblock_devs++;
+
+	return 0;
+}
+
+static const struct kernel_param_ops ubiblock_param_ops = {
+	.set    = ubiblock_set_param,
+};
+module_param_cb(block, &ubiblock_param_ops, NULL, 0);
+MODULE_PARM_DESC(block, "Attach block devices to UBI volumes.");
+/*
+ * A bunch of examples worth a thousand words.
+ *
+ * If you want to attach a block device on bootup time, e.g. in order
+ * to mount the rootfs on such a block device:
+ *
+ * Using the UBI volume path:
+ *  ubi.block=/dev/ubi0_0
+ *
+ * Using the UBI device, and the volume name:
+ *  ubi.block=0,rootfs
+ *
+ * Using both UBI device number and UBI volume number:
+ *  ubi.block=0,0
+ *
+ * In this case you would have such kernel parameters:
+ *  ubi.mtd=5 ubi.block=0,0 root=/dev/ubiblock0_0
+ *
+ * Of course, if you compile ubi as a module you can use this
+ * parameter on module insertion time:
+ *  modprobe ubi mtd=/dev/mtd5 block=/dev/ubi0_0
+ */
+
+static struct ubiblock *find_dev_nolock(int ubi_num, int vol_id)
+{
+	struct ubiblock *dev;
+
+	list_for_each_entry(dev, &ubiblock_devices, list)
+		if (dev->ubi_num == ubi_num && dev->vol_id == vol_id)
+			return dev;
+	return NULL;
+}
+
+static bool leb_on_cache(struct ubiblock_cache *cache, int leb_num)
+{
+	return cache->leb_num == leb_num;
+}
+
+static int ubiblock_fill_cache(struct ubiblock *dev, int leb_num,
+			       struct ubiblock_cache *cache,
+			       struct ubiblock_cache *aux_cache)
+{
+	int ret;
+
+	/* Warn if we fill cache while being dirty */
+	WARN_ON(cache->state == STATE_DIRTY);
+
+	cache->leb_num = leb_num;
+	cache->state = STATE_CLEAN;
+
+	/*
+	 * If leb is on auxiliary cache, we use it to fill
+	 * the cache. This auxiliary cache needs to be invalidated.
+	 */
+	if (aux_cache && leb_on_cache(aux_cache, leb_num)) {
+
+		/*
+		 * Maybe it's possible to flip pointers instead of
+		 * memcpy'ing, but let's try to keep it simple for now.
+		 */
+		aux_cache->leb_num = -1;
+		aux_cache->state = STATE_EMPTY;
+		memcpy(cache->buffer, aux_cache->buffer, dev->leb_size);
+	} else {
+
+		ret = ubi_read(dev->desc, leb_num, cache->buffer, 0,
+			       dev->leb_size);
+		if (ret) {
+			ubi_err("%s ubi_read error %d",
+				dev->gd->disk_name, ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+#ifdef CONFIG_MTD_UBI_BLOCK_WRITE_SUPPORT
+static int ubiblock_flush(struct ubiblock *dev, bool sync)
+{
+	struct ubiblock_cache *cache = &dev->write_cache;
+	int ret = 0;
+
+	if (cache->state != STATE_DIRTY)
+		return 0;
+
+	/*
+	 * mtdblock sets STATE_EMPTY, arguing that it prevents the
+	 * underlying media to get changed without notice.
+	 * I'm not fully convinced, so I just put STATE_CLEAN.
+	 */
+	cache->state = STATE_CLEAN;
+
+	/* Atomically change leb with buffer contents */
+	ret = ubi_leb_change(dev->desc, cache->leb_num,
+			     cache->buffer, dev->leb_size);
+	if (ret) {
+		ubi_err("%s ubi_leb_change error %d",
+			dev->gd->disk_name, ret);
+		return ret;
+	}
+
+	/* Sync ubi device when device is released and on block flush ioctl */
+	if (sync)
+		ret = ubi_sync(dev->ubi_num);
+
+	return ret;
+}
+
+static int ubiblock_write(struct ubiblock *dev, const char *buffer,
+			 int pos, int len)
+{
+	int leb, offset, ret;
+	int bytes_left = len;
+	int to_write = len;
+	struct ubiblock_cache *cache = &dev->write_cache;
+
+	/* Get (leb:offset) address to write */
+	leb = pos / dev->leb_size;
+	offset = pos % dev->leb_size;
+
+	while (bytes_left) {
+		/*
+		 * We can only write one leb at a time.
+		 * Therefore if the write length is larger than
+		 * one leb size, we split the operation.
+		 */
+		if (offset + to_write > dev->leb_size)
+			to_write = dev->leb_size - offset;
+
+		/*
+		 * If leb is not on write cache, we flush current cached
+		 * leb to disk. Cache contents will be filled either
+		 * by using read cache or by reading device.
+		 */
+		if (!leb_on_cache(cache, leb)) {
+
+			ret = ubiblock_flush(dev, false);
+			if (ret)
+				return ret;
+
+			ret = ubiblock_fill_cache(dev, leb,
+				cache, &dev->read_cache);
+			if (ret)
+				return ret;
+		}
+
+		memcpy(cache->buffer + offset, buffer, to_write);
+
+		/* This is the only place where we dirt the write cache */
+		cache->state = STATE_DIRTY;
+
+		buffer += to_write;
+		bytes_left -= to_write;
+		to_write = bytes_left;
+		offset = 0;
+		leb++;
+	}
+	return 0;
+}
+#else
+static int ubiblock_flush(struct ubiblock *dev, bool sync)
+{
+	return -EPERM;
+}
+
+static int ubiblock_write(struct ubiblock *dev, const char *buffer,
+			  int pos, int len)
+{
+	return -EPERM;
+}
+#endif
+
+static int ubiblock_read(struct ubiblock *dev, char *buffer,
+			 int pos, int len)
+{
+	int leb, offset, ret;
+	int bytes_left = len;
+	int to_read = len;
+	char *cache_buffer;
+
+	/* Get leb:offset address to read from */
+	leb = pos / dev->leb_size;
+	offset = pos % dev->leb_size;
+
+	while (bytes_left) {
+
+		/*
+		 * We can only read one leb at a time.
+		 * Therefore if the read length is larger than
+		 * one leb size, we split the operation.
+		 */
+		if (offset + to_read > dev->leb_size)
+			to_read = dev->leb_size - offset;
+
+		/*
+		 * 1) First try on read cache, if not there...
+		 * 2) then try on write cache, if not there...
+		 * 3) finally load this leb on read_cache
+		 *
+		 * Note that reading never flushes to disk!
+		 */
+		if (leb_on_cache(&dev->read_cache, leb)) {
+			cache_buffer = dev->read_cache.buffer;
+
+#ifdef CONFIG_MTD_UBI_BLOCK_WRITE_SUPPORT
+		} else if (leb_on_cache(&dev->write_cache, leb)) {
+			cache_buffer = dev->write_cache.buffer;
+#endif
+
+		} else {
+			/* Leb is not in any cache: fill read_cache */
+			ret = ubiblock_fill_cache(dev, leb,
+				&dev->read_cache, NULL);
+			if (ret)
+				return ret;
+			cache_buffer = dev->read_cache.buffer;
+		}
+
+		memcpy(buffer, cache_buffer + offset, to_read);
+		buffer += to_read;
+		bytes_left -= to_read;
+		to_read = bytes_left;
+		leb++;
+		offset = 0;
+	}
+	return 0;
+}
+
+static int do_ubiblock_request(struct ubiblock *dev, struct request *req)
+{
+	int pos, len;
+
+	if (req->cmd_flags & REQ_FLUSH)
+		return ubiblock_flush(dev, true);
+
+	if (req->cmd_type != REQ_TYPE_FS)
+		return -EIO;
+
+	if (blk_rq_pos(req) + blk_rq_cur_sectors(req) >
+	    get_capacity(req->rq_disk))
+		return -EIO;
+
+	pos = blk_rq_pos(req) << 9;
+	len = blk_rq_cur_bytes(req);
+
+	switch (rq_data_dir(req)) {
+	case READ:
+		return ubiblock_read(dev, req->buffer, pos, len);
+	case WRITE:
+		return ubiblock_write(dev, req->buffer, pos, len);
+	default:
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void ubiblock_do_work(struct work_struct *work)
+{
+	struct ubiblock *dev =
+		container_of(work, struct ubiblock, work);
+	struct request_queue *rq = dev->rq;
+	struct request *req;
+	int res;
+
+	spin_lock_irq(rq->queue_lock);
+
+	req = blk_fetch_request(rq);
+	while (req) {
+
+		spin_unlock_irq(rq->queue_lock);
+
+		mutex_lock(&dev->vol_mutex);
+		res = do_ubiblock_request(dev, req);
+		mutex_unlock(&dev->vol_mutex);
+
+		spin_lock_irq(rq->queue_lock);
+
+		/*
+		 * If we're done with this request,
+		 * we need to fetch a new one
+		 */
+		if (!__blk_end_request_cur(req, res))
+			req = blk_fetch_request(rq);
+	}
+
+	spin_unlock_irq(rq->queue_lock);
+}
+
+static void ubiblock_request(struct request_queue *rq)
+{
+	struct ubiblock *dev;
+	struct request *req;
+
+	dev = rq->queuedata;
+
+	if (!dev)
+		while ((req = blk_fetch_request(rq)) != NULL)
+			__blk_end_request_all(req, -ENODEV);
+	else
+		queue_work(dev->wq, &dev->work);
+}
+
+static int ubiblock_alloc_cache(struct ubiblock_cache *cache, int size)
+{
+	cache->state = STATE_EMPTY;
+	cache->leb_num = -1;
+	cache->buffer = vmalloc(size);
+	if (!cache->buffer)
+		return -ENOMEM;
+	return 0;
+}
+
+static void ubiblock_free_cache(struct ubiblock_cache *cache)
+{
+	cache->leb_num = -1;
+	cache->state = STATE_EMPTY;
+	vfree(cache->buffer);
+	cache->buffer = NULL;
+}
+
+static int ubiblock_open(struct block_device *bdev, fmode_t mode)
+{
+	struct ubiblock *dev = bdev->bd_disk->private_data;
+	int ubi_mode = UBI_READONLY;
+	int ret;
+#ifdef CONFIG_MTD_UBI_BLOCK_WRITE_SUPPORT
+	const bool allow_write = true;
+#else
+	const bool allow_write = false;
+#endif
+
+	mutex_lock(&dev->vol_mutex);
+	if (dev->refcnt > 0) {
+		/*
+		 * The volume is already opened,
+		 * just increase the reference counter
+		 *
+		 * If the first user has oppened this as read-only,
+		 * we don't allow to open as read-write.
+		 * This is the simplest solution. A better one would
+		 * be to re-open the volume as writable and allocate
+		 * the write-cache.
+		 */
+		if ((mode & FMODE_WRITE) &&
+		    (dev->desc->mode != UBI_READWRITE)) {
+			ret = -EBUSY;
+			goto out_unlock;
+		}
+		dev->refcnt++;
+		mutex_unlock(&dev->vol_mutex);
+		return 0;
+	}
+
+	if (allow_write) {
+		if (mode & FMODE_WRITE)
+			ubi_mode = UBI_READWRITE;
+	} else {
+		if (mode & FMODE_WRITE) {
+			ret = -EPERM;
+			goto out_unlock;
+		}
+	}
+
+	dev->desc = ubi_open_volume(dev->ubi_num, dev->vol_id, ubi_mode);
+	if (IS_ERR(dev->desc)) {
+		ubi_err("%s failed to open ubi volume %d_%d",
+			dev->gd->disk_name, dev->ubi_num, dev->vol_id);
+
+		ret = PTR_ERR(dev->desc);
+		dev->desc = NULL;
+		goto out_unlock;
+	}
+
+	dev->vi = kzalloc(sizeof(struct ubi_volume_info), GFP_KERNEL);
+	if (!dev->vi) {
+		ret = -ENOMEM;
+		goto out_close;
+	}
+	ubi_get_volume_info(dev->desc, dev->vi);
+	dev->leb_size = dev->vi->usable_leb_size;
+
+	ret = ubiblock_alloc_cache(&dev->read_cache, dev->leb_size);
+	if (ret)
+		goto out_free;
+
+	/*
+	 * The device can be read-only by user request or by kernel
+	 * configuration. Only alloc the cache if needed.
+	 */
+	if (allow_write && ubi_mode == UBI_READWRITE) {
+		ret = ubiblock_alloc_cache(&dev->write_cache, dev->leb_size);
+		if (ret) {
+			ubiblock_free_cache(&dev->read_cache);
+			goto out_free;
+		}
+	}
+
+	dev->refcnt++;
+	mutex_unlock(&dev->vol_mutex);
+	return 0;
+
+out_free:
+	kfree(dev->vi);
+out_close:
+	ubi_close_volume(dev->desc);
+	dev->desc = NULL;
+out_unlock:
+	mutex_unlock(&dev->vol_mutex);
+	return ret;
+}
+
+static void ubiblock_release(struct gendisk *gd, fmode_t mode)
+{
+	struct ubiblock *dev = gd->private_data;
+
+	mutex_lock(&dev->vol_mutex);
+
+	dev->refcnt--;
+	if (dev->refcnt == 0) {
+		ubiblock_flush(dev, true);
+
+		ubiblock_free_cache(&dev->read_cache);
+		ubiblock_free_cache(&dev->write_cache);
+
+		kfree(dev->vi);
+		ubi_close_volume(dev->desc);
+
+		dev->vi = NULL;
+		dev->desc = NULL;
+	}
+
+	mutex_unlock(&dev->vol_mutex);
+}
+
+static int ubiblock_ioctl(struct block_device *bdev, fmode_t mode,
+			      unsigned int cmd, unsigned long arg)
+{
+	struct ubiblock *dev = bdev->bd_disk->private_data;
+	int ret = -ENXIO;
+
+	if (!dev)
+		return ret;
+
+	mutex_lock(&dev->vol_mutex);
+
+	/* I can't get this to get called. What's going on? */
+	switch (cmd) {
+	case BLKFLSBUF:
+		ret = ubiblock_flush(dev, true);
+		break;
+	default:
+		ret = -ENOTTY;
+	}
+
+	mutex_unlock(&dev->vol_mutex);
+	return ret;
+}
+
+static int ubiblock_getgeo(struct block_device *bdev, struct hd_geometry *geo)
+{
+	/* Some tools might require this information */
+	geo->heads = 1;
+	geo->cylinders = 1;
+	geo->sectors = get_capacity(bdev->bd_disk);
+	geo->start = 0;
+	return 0;
+}
+
+static const struct block_device_operations ubiblock_ops = {
+	.owner = THIS_MODULE,
+	.open = ubiblock_open,
+	.release = ubiblock_release,
+	.ioctl = ubiblock_ioctl,
+	.getgeo	= ubiblock_getgeo,
+};
+
+int ubiblock_add(struct ubi_volume_info *vi)
+{
+	struct ubiblock *dev;
+	struct gendisk *gd;
+	int disk_capacity;
+	int ret;
+
+	/* Check that the volume isn't already handled */
+	mutex_lock(&devices_mutex);
+	if (find_dev_nolock(vi->ubi_num, vi->vol_id)) {
+		mutex_unlock(&devices_mutex);
+		return -EEXIST;
+	}
+	mutex_unlock(&devices_mutex);
+
+	dev = kzalloc(sizeof(struct ubiblock), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	mutex_init(&dev->vol_mutex);
+
+	dev->ubi_num = vi->ubi_num;
+	dev->vol_id = vi->vol_id;
+
+	/* Set both caches as empty */
+	dev->read_cache.state = STATE_EMPTY;
+	dev->write_cache.state = STATE_EMPTY;
+	dev->read_cache.leb_num = -1;
+	dev->write_cache.leb_num = -1;
+
+	/* Initialize the gendisk of this ubiblock device */
+	gd = alloc_disk(1);
+	if (!gd) {
+		ubi_err("block: alloc_disk failed");
+		ret = -ENODEV;
+		goto out_free_dev;
+	}
+
+	gd->fops = &ubiblock_ops;
+	gd->major = ubiblock_major;
+	gd->first_minor = dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
+	gd->private_data = dev;
+	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
+	disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
+	set_capacity(gd, disk_capacity);
+	dev->gd = gd;
+
+	spin_lock_init(&dev->queue_lock);
+	dev->rq = blk_init_queue(ubiblock_request, &dev->queue_lock);
+	if (!dev->rq) {
+		ubi_err("block: blk_init_queue failed");
+		ret = -ENODEV;
+		goto out_put_disk;
+	}
+
+	dev->rq->queuedata = dev;
+	dev->gd->queue = dev->rq;
+
+	blk_queue_flush(dev->rq, REQ_FLUSH);
+
+	/*
+	 * Create one workqueue per volume (per registered block device).
+	 * Rembember workqueues are cheap, they're not threads.
+	 */
+	dev->wq = alloc_workqueue(gd->disk_name, 0, 0);
+	if (!dev->wq)
+		goto out_free_queue;
+	INIT_WORK(&dev->work, ubiblock_do_work);
+
+	mutex_lock(&devices_mutex);
+	list_add_tail(&dev->list, &ubiblock_devices);
+	mutex_unlock(&devices_mutex);
+
+	/* Must be the last step: anyone can call file ops from now on */
+	add_disk(dev->gd);
+
+	ubi_msg("%s created from ubi%d:%d(%s)",
+		dev->gd->disk_name, dev->ubi_num, dev->vol_id, vi->name);
+
+	return 0;
+
+out_free_queue:
+	blk_cleanup_queue(dev->rq);
+out_put_disk:
+	put_disk(dev->gd);
+out_free_dev:
+	kfree(dev);
+
+	return ret;
+}
+
+static void ubiblock_cleanup(struct ubiblock *dev)
+{
+	del_gendisk(dev->gd);
+	blk_cleanup_queue(dev->rq);
+	ubi_msg("%s released", dev->gd->disk_name);
+	put_disk(dev->gd);
+}
+
+void ubiblock_del(struct ubi_volume_info *vi)
+{
+	struct ubiblock *dev;
+
+	mutex_lock(&devices_mutex);
+	dev = find_dev_nolock(vi->ubi_num, vi->vol_id);
+	if (!dev) {
+		mutex_unlock(&devices_mutex);
+		return;
+	}
+	/* Remove from device list */
+	list_del(&dev->list);
+	mutex_unlock(&devices_mutex);
+
+	/* Flush pending work and stop this workqueue */
+	destroy_workqueue(dev->wq);
+
+	mutex_lock(&dev->vol_mutex);
+
+	/*
+	 * This means that ubiblock device is opened and in usage.
+	 * However, this shouldn't happen, since we have
+	 * called ubi_open_volume() at open() time, thus preventing
+	 * volume removal.
+	 */
+	WARN_ON(dev->desc);
+	ubiblock_cleanup(dev);
+	mutex_unlock(&dev->vol_mutex);
+	kfree(dev);
+}
+
+static void ubiblock_resize(struct ubi_volume_info *vi)
+{
+	struct ubiblock *dev;
+	int disk_capacity;
+
+	/*
+	 * Need to lock the device list until we stop using the device,
+	 * otherwise the device struct might get released in ubiblock_del().
+	 */
+	mutex_lock(&devices_mutex);
+	dev = find_dev_nolock(vi->ubi_num, vi->vol_id);
+	if (!dev) {
+		mutex_unlock(&devices_mutex);
+		return;
+	}
+
+	mutex_lock(&dev->vol_mutex);
+	disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
+	set_capacity(dev->gd, disk_capacity);
+	ubi_msg("%s resized to %d LEBs", dev->gd->disk_name, vi->size);
+	mutex_unlock(&dev->vol_mutex);
+	mutex_unlock(&devices_mutex);
+}
+
+static int ubiblock_notify(struct notifier_block *nb,
+			 unsigned long notification_type, void *ns_ptr)
+{
+	struct ubi_notification *nt = ns_ptr;
+
+	switch (notification_type) {
+	case UBI_VOLUME_ADDED:
+		/*
+		 * We want to enforce explicit block device attaching for
+		 * volumes; so when a volume is added we do nothing.
+		 */
+		break;
+	case UBI_VOLUME_REMOVED:
+		ubiblock_del(&nt->vi);
+		break;
+	case UBI_VOLUME_RESIZED:
+		ubiblock_resize(&nt->vi);
+		break;
+	default:
+		break;
+	}
+	return NOTIFY_OK;
+}
+
+static struct notifier_block ubiblock_notifier = {
+	.notifier_call = ubiblock_notify,
+};
+
+static struct ubi_volume_desc * __init
+open_volume_desc(const char *name, int ubi_num, int vol_id)
+{
+	if (ubi_num == -1)
+		/* No ubi num, name must be a vol device path */
+		return ubi_open_volume_path(name, UBI_READONLY);
+	else if (vol_id == -1)
+		/* No vol_id, must be vol_name */
+		return ubi_open_volume_nm(ubi_num, name, UBI_READONLY);
+	else
+		return ubi_open_volume(ubi_num, vol_id, UBI_READONLY);
+}
+
+static void __init ubiblock_add_from_param(void)
+{
+	int i, ret;
+	struct ubiblock_param *p;
+	struct ubi_volume_desc *desc;
+	struct ubi_volume_info vi;
+
+	for (i = 0; i < ubiblock_devs; i++) {
+		p = &ubiblock_param[i];
+
+		desc = open_volume_desc(p->name, p->ubi_num, p->vol_id);
+		if (IS_ERR(desc)) {
+			ubi_warn("block: can't open volume, err=%ld\n",
+				 PTR_ERR(desc));
+			continue;
+		}
+
+		ubi_get_volume_info(desc, &vi);
+		ret = ubiblock_add(&vi);
+		if (ret)
+			ubi_warn("block: can't add '%s' volume, err=%d\n",
+				 vi.name, ret);
+		ubi_close_volume(desc);
+	}
+}
+
+int __init ubiblock_init(void)
+{
+	int ret;
+
+	ubiblock_major = register_blkdev(0, "ubiblock");
+	if (ubiblock_major < 0)
+		return ubiblock_major;
+
+	/* Attach block devices from 'block=' module param */
+	ubiblock_add_from_param();
+
+	/*
+	 * Blocks devices needs to be attached to volumes explicitly
+	 * upon user request. So we ignore existing volumes.
+	 */
+	ret = ubi_register_volume_notifier(&ubiblock_notifier, 1);
+	if (ret < 0)
+		unregister_blkdev(ubiblock_major, "ubiblock");
+	return ret;
+}
+
+void __exit ubiblock_exit(void)
+{
+	struct ubiblock *next;
+	struct ubiblock *dev;
+
+	ubi_unregister_volume_notifier(&ubiblock_notifier);
+
+	list_for_each_entry_safe(dev, next, &ubiblock_devices, list) {
+
+		/* Flush pending work and stop workqueue */
+		destroy_workqueue(dev->wq);
+
+		/* The module is being forcefully removed */
+		WARN_ON(dev->desc);
+
+		/* Remove from device list */
+		list_del(&dev->list);
+
+		ubiblock_cleanup(dev);
+
+		kfree(dev);
+	}
+
+	unregister_blkdev(ubiblock_major, "ubiblock");
+}
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a561335..0dbb183 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1290,6 +1290,9 @@ static int __init ubi_init(void)
 		}
 	}
 
+	if (ubiblock_init() < 0)
+		ubi_warn("cannot init block device access");
+
 	return 0;
 
 out_detach:
@@ -1318,6 +1321,8 @@ static void __exit ubi_exit(void)
 {
 	int i;
 
+	ubiblock_exit();
+
 	for (i = 0; i < UBI_MAX_DEVICES; i++)
 		if (ubi_devices[i]) {
 			mutex_lock(&ubi_devices_mutex);
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 4f02848..8562bea 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -585,6 +585,26 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 		break;
 	}
 
+	/* Attach a block device to an UBI volume */
+	case UBI_IOCVOLATTBLK:
+	{
+		struct ubi_volume_info vi;
+
+		ubi_get_volume_info(desc, &vi);
+		err = ubiblock_add(&vi);
+		break;
+	}
+
+	/* Dettach a block device from an UBI volume */
+	case UBI_IOCVOLDETBLK:
+	{
+		struct ubi_volume_info vi;
+
+		ubi_get_volume_info(desc, &vi);
+		ubiblock_del(&vi);
+		break;
+	}
+
 	default:
 		err = -ENOTTY;
 		break;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 8ea6297..618d460 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -864,6 +864,20 @@ int ubi_update_fastmap(struct ubi_device *ubi);
 int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		     int fm_anchor);
 
+/* block.c */
+#ifdef CONFIG_MTD_UBI_BLOCK
+int ubiblock_init(void);
+void ubiblock_exit(void);
+int ubiblock_add(struct ubi_volume_info *vi);
+void ubiblock_del(struct ubi_volume_info *vi);
+#else
+static inline int ubiblock_init(void) { return 0; }
+static inline void ubiblock_exit(void) {}
+static inline int ubiblock_add(struct ubi_volume_info *vi) { return -ENOTTY; }
+static inline void ubiblock_del(struct ubi_volume_info *vi) {}
+#endif
+
+
 /*
  * ubi_rb_for_each_entry - walk an RB-tree.
  * @rb: a pointer to type 'struct rb_node' to use as a loop counter
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 53cae1e..f3e7657 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -134,6 +134,13 @@
  * used. A pointer to a &struct ubi_set_vol_prop_req object is expected to be
  * passed. The object describes which property should be set, and to which value
  * it should be set.
+ *
+ * Block device access to UBI volumes
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ * To attach or detach a block device from an UBI volume the %UBI_IOCVOLATTBLK
+ * and %UBI_IOCVOLDETBLK ioctl commands should be used, respectively.
+ * These commands take no arguments.
  */
 
 /*
@@ -188,6 +195,10 @@
 /* Set an UBI volume property */
 #define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
 			       struct ubi_set_vol_prop_req)
+/* Attach a block device to an UBI volume */
+#define UBI_IOCVOLATTBLK _IO(UBI_VOL_IOC_MAGIC, 7)
+/* Detach a block device from an UBI volume */
+#define UBI_IOCVOLDETBLK _IO(UBI_VOL_IOC_MAGIC, 8)
 
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
-- 
1.8.1.5
