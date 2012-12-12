Received: from mail-ia0-f182.google.com ([209.85.210.182])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tip1G-0003Y1-LY
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 16:18:52 +0000
Received: by mail-ia0-f182.google.com with SMTP id x2so1077360iad.13
 for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2012 08:18:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvw9fL_U-KT9sysdyZOLry5skNWR6AUt_XNT10op38e+Gg@mail.gmail.com>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <CAFLxGvw9fL_U-KT9sysdyZOLry5skNWR6AUt_XNT10op38e+Gg@mail.gmail.com>
Date: Wed, 12 Dec 2012 13:18:48 -0300
Message-ID: <CALF0-+Uy5Cc5DDT_80ArK8r7BE5fg9YgxKGoJ34Q3LzT_jhL+g@mail.gmail.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel@free-electrons.com>, linux-mtd@lists.infradead.org,
 Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Thanks for the feedback.
Yeah I forgot the remove some clumsy or work-in-progress code. Shame on me :-(

Anyway, I wanted to post the new cache shape and the new module parameter
to get some feedback. I'd like to decide if write support is useful or not.

On Wed, Dec 12, 2012 at 12:21 PM, richard -rw- weinberger
<richard.weinberger@gmail.com> wrote:
> Hi!
>
> A few comments...
>
> On Wed, Dec 12, 2012 at 1:21 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>> --- /dev/null
>> +++ b/drivers/mtd/ubi/ubiblock.c
>> @@ -0,0 +1,830 @@
>> +/*
>> + * Copyright (c) 2012 Ezequiel Garcia
>> + * Copyright (c) 2011 Free Electrons
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>
> Linux is GPLv2 and not v2 or any later version...
>

True.

>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
>> + * the GNU General Public License for more details.
>> + *
>> + * TODO: Add parameter for autoloading
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +#include <linux/mtd/ubi.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/blkdev.h>
>> +#include <linux/hdreg.h>
>> +
>> +#include "ubi-media.h"
>> +
>> +#if 0
>> +static bool auto_vol;
>> +module_param(auto_vol, int, 0644);
>> +MODULE_PARM_DESC(auto_vol, "Automatically attach a block layer to each volume")
>> +#endif
>
> Please remove dead code.
>

Actually, I wonder if this parameter auto_vol, is useful or not.
When 'true' it would make ubiblock driver create an ubiblock device
automatically
per ubi volume created.

Ideas?

>> +/* Maximum number of supported devices */
>> +#define UBIBLOCK_MAX_DEVICES 32
>> +
>> +/* Maximum length of the 'vol=' parameter */
>> +#define UBIBLOCK_VOL_PARAM_LEN 64
>> +
>> +/* Maximum number of comma-separated items in the 'vol=' parameter */
>> +#define UBIBLOCK_VOL_PARAM_COUNT 2
>> +
>> +struct ubiblock_vol_param {
>> +       int ubi_num;
>> +       int vol_id;
>> +       char name[UBIBLOCK_VOL_PARAM_LEN];
>> +};
>> +
>> +/* Numbers of elements set in the @ubiblock_vol_param array */
>> +static int ubiblock_devs;
>> +
>> +/* MTD devices specification parameters */
>> +static struct ubiblock_vol_param ubiblock_vol_param[UBIBLOCK_MAX_DEVICES];
>> +
>> +struct ubiblock_cache {
>> +       char *buffer;
>> +       enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } state;
>> +       int leb_num;
>> +};
>> +
>> +struct ubiblock {
>> +       struct ubi_volume_desc *desc;
>> +       struct ubi_volume_info *vi;
>> +       int ubi_num;
>> +       int vol_id;
>> +       int refcnt;
>> +
>> +       struct gendisk *gd;
>> +       struct request_queue *rq;
>> +
>> +       struct workqueue_struct *wq;
>> +       struct work_struct work;
>> +
>> +       struct mutex vol_mutex;
>> +       spinlock_t queue_lock;
>> +       struct list_head list;
>> +
>> +       int leb_size;
>> +       struct ubiblock_cache read_cache;
>> +       struct ubiblock_cache write_cache;
>> +};
>> +
>> +/* Linked list of all ubiblock instances */
>> +static LIST_HEAD(ubiblock_devices);
>> +static DEFINE_MUTEX(devices_mutex);
>> +static int ubiblock_major;
>
> Why is ubiblock_major not embedded in struct ubiblock?
>

Because it's block device wide. When the block driver is registered
there is no ubiblock device allocated. ubiblock device is latter created,
one per ubi volume. See register_blkdev below.

>> +/*
>> + * Ugh, this parameter parsing code is simply awful :(
>> + */
>> +static int ubiblock_set_vol_param(const char *val,
>> +                                 const struct kernel_param *kp)
>> +{
>> +       int len, i, ret;
>> +       struct ubiblock_vol_param *param;
>> +       char buf[UBIBLOCK_VOL_PARAM_LEN];
>> +       char *pbuf = &buf[0];
>> +       char *tokens[UBIBLOCK_VOL_PARAM_COUNT];
>> +
>> +       if (!val)
>> +               return -EINVAL;
>> +
>> +       len = strnlen(val, UBIBLOCK_VOL_PARAM_LEN);
>> +       if (len == 0) {
>> +               pr_warn("empty 'vol=' parameter - ignored\n");
>> +               return 0;
>> +       }
>> +
>> +       if (len == UBIBLOCK_VOL_PARAM_LEN) {
>> +               pr_err("parameter \"%s\" is too long, max. is %d\n",
>> +                       val, UBIBLOCK_VOL_PARAM_LEN);
>> +               return -EINVAL;
>> +       }
>> +
>> +       strcpy(buf, val);
>> +
>> +       /* Get rid of the final newline */
>> +       if (buf[len - 1] == '\n')
>> +               buf[len - 1] = '\0';
>> +
>> +       for (i = 0; i < UBIBLOCK_VOL_PARAM_COUNT; i++)
>> +               tokens[i] = strsep(&pbuf, ",");
>> +
>> +       param = &ubiblock_vol_param[ubiblock_devs];
>> +       if (tokens[1]) {
>> +               /* Two parameters: can be 'ubi, vol_id' or 'ubi, vol_name' */
>> +               ret = kstrtoint(tokens[0], 10, &param->ubi_num);
>> +               if (ret < 0)
>> +                       return -EINVAL;
>> +
>> +               /* Second param can be a number or a name */
>> +               ret = kstrtoint(tokens[1], 10, &param->vol_id);
>> +               if (ret < 0) {
>> +                       param->vol_id = -1;
>> +                       strcpy(param->name, tokens[1]);
>> +               }
>> +
>> +       } else {
>> +               /* One parameter: must be device path */
>> +               strcpy(param->name, tokens[0]);
>> +               param->ubi_num = -1;
>> +               param->vol_id = -1;
>> +       }
>> +
>> +       ubiblock_devs++;
>
> No locking? (I didn't check all callers)
>

This parameter should be set only on module loading, unless I'm
missing something.
I guess you can set it later, but it won't have any effect.
Anyway, this needs some more tought.

>> +       return 0;
>> +}
>> +
>> +static const struct kernel_param_ops ubiblock_param_ops = {
>> +        .set    = ubiblock_set_vol_param,
>> +};
>> +module_param_cb(vol, &ubiblock_param_ops, NULL, 0644);
>> +
>> +static struct ubiblock *find_dev_nolock(int ubi_num, int vol_id)
>> +{
>> +       struct ubiblock *dev;
>> +
>> +       list_for_each_entry(dev, &ubiblock_devices, list)
>> +               if (dev->ubi_num == ubi_num && dev->vol_id == vol_id)
>> +                       return dev;
>> +       return NULL;
>> +}
>> +
>> +static bool leb_on_cache(struct ubiblock_cache *cache, int leb_num)
>> +{
>> +       return cache->leb_num == leb_num;
>> +}
>> +
>> +static int ubiblock_fill_cache(struct ubiblock *dev, int leb_num,
>> +                              struct ubiblock_cache *cache,
>> +                              struct ubiblock_cache *aux_cache)
>> +{
>> +       int ret;
>> +
>> +       /* Warn if we fill cache while being dirty */
>> +       WARN_ON(cache->state == STATE_DIRTY);
>> +
>> +       cache->leb_num = leb_num;
>> +       cache->state = STATE_CLEAN;
>> +
>> +       /*
>> +        * If leb is on auxiliary cache, we use it to fill
>> +        * the cache. This auxiliary cache needs to be invalidated.
>> +        */
>> +       if (aux_cache && leb_on_cache(aux_cache, leb_num)) {
>> +
>
> Why is there a blank line?
>

Looks nicer to me. Does it break any rule?


>> +               aux_cache->leb_num = -1;
>> +               aux_cache->state = STATE_EMPTY;
>> +               memcpy(cache->buffer, aux_cache->buffer, dev->leb_size);
>> +       } else {
>> +
>
> Too.
>

Ditto.

>> +               ret = ubi_read(dev->desc, leb_num, cache->buffer, 0,
>> +                              dev->leb_size);
>> +               if (ret) {
>> +                       dev_err(disk_to_dev(dev->gd), "ubi_read error %d\n",
>> +                               ret);
>> +                       return ret;
>> +               }
>> +       }
>> +       return 0;
>> +}
>> +
>> +static int ubiblock_flush(struct ubiblock *dev, bool sync)
>> +{
>> +       struct ubiblock_cache* cache = &dev->write_cache;
>
> struct ubiblock_cache *cache ...
> please. Didn't checkpatch.pl note that?
>

Oops.

>> +       int ret = 0;
>
> There is no need to initialize ret.
>

True.

>> +       if (cache->state != STATE_DIRTY)
>> +               return 0;
>> +
>> +       /*
>> +        * TODO: mtdblock sets STATE_EMPTY, arguing that it prevents the
>> +        * underlying media to get changed without notice.
>> +        * I'm not fully convinced, so I just put STATE_CLEAN.
>> +        */
>> +       cache->state = STATE_CLEAN;
>> +
>> +       /* Atomically change leb with buffer contents */
>> +       ret = ubi_leb_change(dev->desc, cache->leb_num,
>> +                            cache->buffer, dev->leb_size);
>> +       if (ret) {
>> +               dev_err(disk_to_dev(dev->gd), "ubi_leb_change error %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       /* Sync ubi device when device is released and on block flush ioctl */
>> +       if (sync)
>> +               ret = ubi_sync(dev->ubi_num);
>> +
>> +       return ret;
>> +}
>> +
>> +static int ubiblock_read(struct ubiblock *dev, char *buffer,
>> +                        int pos, int len)
>> +{
>> +       int leb, offset, ret;
>> +       int bytes_left = len;
>> +       int to_read = len;
>>
>> +       char *cache_buffer;
>> +
>> +       /* Get leb:offset address to read from */
>> +       leb = pos / dev->leb_size;
>> +       offset = pos % dev->leb_size;
>> +
>> +       while (bytes_left) {
>> +
>
> Empty line.
>

Ditto. I'll re-read CodingStyle to see if I missed something.


>> +               /*
>> +                * We can only read one leb at a time.
>> +                * Therefore if the read length is larger than
>> +                * one leb size, we split the operation.
>> +                */
>> +               if (offset + to_read > dev->leb_size)
>> +                       to_read = dev->leb_size - offset;
>> +
>> +               /*
>> +                * 1) First try on read cache, if not there...
>> +                * 2) then try on write cache, if not there...
>> +                * 3) finally load this leb on read_cache
>> +                *
>> +                * Note that reading never flushes to disk!
>> +                */
>> +               if (leb_on_cache(&dev->read_cache, leb)) {
>> +                       cache_buffer = dev->read_cache.buffer;
>> +
>> +               } else if (leb_on_cache(&dev->write_cache, leb)) {
>> +                       cache_buffer = dev->write_cache.buffer;
>> +
>> +               } else {
>> +                       /* Leb is not in any cache: fill read_cache */
>> +                       ret = ubiblock_fill_cache(dev, leb,
>> +                               &dev->read_cache, NULL);
>> +                       if (ret)
>> +                               return ret;
>> +                       cache_buffer = dev->read_cache.buffer;
>> +               }
>> +
>> +               memcpy(buffer, cache_buffer + offset, to_read);
>> +               buffer += to_read;
>> +               bytes_left -= to_read;
>> +               to_read = bytes_left;
>> +               leb++;
>> +               offset = 0;
>> +       }
>> +       return 0;
>> +}
>> +
>> +static int ubiblock_write(struct ubiblock *dev, const char *buffer,
>> +                        int pos, int len)
>> +{
>> +       int leb, offset, ret;
>> +       int bytes_left = len;
>> +       int to_write = len;
>> +       struct ubiblock_cache* cache = &dev->write_cache;
>> +
>> +       /* Get (leb:offset) address to write */
>> +       leb = pos / dev->leb_size;
>> +       offset = pos % dev->leb_size;
>> +
>> +       while (bytes_left) {
>> +               /*
>> +                * We can only write one leb at a time.
>> +                * Therefore if the write length is larger than
>> +                * one leb size, we split the operation.
>> +                */
>> +               if (offset + to_write > dev->leb_size)
>> +                       to_write = dev->leb_size - offset;
>> +
>> +               /*
>> +                * If leb is not on write cache, we flush current cached
>> +                * leb to disk. Cache contents will be filled either
>> +                * by using read cache or by reading device.
>> +                */
>> +               if (!leb_on_cache(cache, leb)) {
>> +
>> +                       ret = ubiblock_flush(dev, false);
>> +                       if (ret)
>> +                               return ret;
>> +
>> +                       ret = ubiblock_fill_cache(dev, leb,
>> +                               cache, &dev->read_cache);
>> +                       if (ret)
>> +                               return ret;
>> +               }
>> +
>> +               memcpy(cache->buffer + offset, buffer, to_write);
>> +
>> +               /* This is the only place where we dirt the write cache */
>> +               cache->state = STATE_DIRTY;
>> +
>> +               buffer += to_write;
>> +               bytes_left -= to_write;
>> +               to_write = bytes_left;
>> +               offset = 0;
>> +               leb++;
>> +       }
>> +       return 0;
>> +}
>> +
>> +static int do_ubiblock_request(struct ubiblock *dev, struct request *req)
>> +{
>> +       int pos, len;
>> +
>> +       if (req->cmd_flags & REQ_FLUSH)
>> +               return ubiblock_flush(dev, true);
>> +
>> +       if (req->cmd_type != REQ_TYPE_FS)
>> +               return -EIO;
>> +
>> +       if (blk_rq_pos(req) + blk_rq_cur_sectors(req) >
>> +           get_capacity(req->rq_disk))
>> +               return -EIO;
>> +
>> +       pos = blk_rq_pos(req) << 9;
>> +       len = blk_rq_cur_bytes(req);
>> +
>> +       switch (rq_data_dir(req)) {
>> +       case READ:
>> +               return ubiblock_read(dev, req->buffer, pos, len);
>> +       case WRITE:
>> +               return ubiblock_write(dev, req->buffer, pos, len);
>> +       default:
>> +               return -EIO;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static void ubiblock_do_work(struct work_struct *work)
>> +{
>> +       struct ubiblock *dev =
>> +               container_of(work, struct ubiblock, work);
>> +       struct request_queue *rq = dev->rq;
>> +       struct request *req;
>> +       int res;
>> +
>> +       spin_lock_irq(rq->queue_lock);
>> +
>> +       req = blk_fetch_request(rq);
>> +       while (req) {
>> +
>> +               spin_unlock_irq(rq->queue_lock);
>> +
>> +               mutex_lock(&dev->vol_mutex);
>> +               res = do_ubiblock_request(dev, req);
>> +               mutex_unlock(&dev->vol_mutex);
>> +
>> +               spin_lock_irq(rq->queue_lock);
>> +
>> +               /*
>> +                * If we're done with this request,
>> +                * we need to fetch a new one
>> +                */
>> +               if (!__blk_end_request_cur(req, res))
>> +                       req = blk_fetch_request(rq);
>> +       }
>> +
>> +       spin_unlock_irq(rq->queue_lock);
>> +}
>> +
>> +static void ubiblock_request(struct request_queue *rq)
>> +{
>> +       struct ubiblock *dev;
>> +       struct request *req;
>> +
>> +       dev = rq->queuedata;
>> +
>> +       if (!dev)
>> +               while ((req = blk_fetch_request(rq)) != NULL)
>> +                       __blk_end_request_all(req, -ENODEV);
>> +       else
>> +               queue_work(dev->wq, &dev->work);
>> +}
>> +
>> +static int ubiblock_alloc_cache(struct ubiblock_cache *cache, int size)
>> +{
>> +       cache->state = STATE_EMPTY;
>> +       cache->leb_num = -1;
>> +       cache->buffer = vmalloc(size);
>> +       if (!cache->buffer)
>> +               return -ENOMEM;
>> +       return 0;
>> +}
>> +
>> +static void ubiblock_free_cache(struct ubiblock_cache *cache)
>> +{
>> +       cache->leb_num = -1;
>> +       cache->state = STATE_EMPTY;
>> +       vfree(cache->buffer);
>> +}
>> +
>> +static int ubiblock_open(struct block_device *bdev, fmode_t mode)
>> +{
>> +       struct ubiblock *dev = bdev->bd_disk->private_data;
>> +       int ubi_mode = UBI_READONLY;
>> +       int ret;
>> +
>> +       mutex_lock(&dev->vol_mutex);
>> +       if (dev->refcnt > 0) {
>> +               /*
>> +                * The volume is already opened,
>> +                * just increase the reference counter
>> +                */
>> +               dev->refcnt++;
>> +               mutex_unlock(&dev->vol_mutex);
>> +               return 0;
>> +       }
>> +
>> +       if (mode & FMODE_WRITE)
>> +               ubi_mode = UBI_READWRITE;
>> +
>> +       dev->desc = ubi_open_volume(dev->ubi_num, dev->vol_id, ubi_mode);
>> +       if (IS_ERR(dev->desc)) {
>> +               dev_err(disk_to_dev(dev->gd),
>> +                       "failed to open ubi volume %d_%d\n",
>> +                       dev->ubi_num, dev->vol_id);
>> +
>> +               ret = PTR_ERR(dev->desc);
>> +               dev->desc = NULL;
>> +               goto out_unlock;
>> +       }
>> +
>> +       dev->vi = kzalloc(sizeof(struct ubi_volume_info), GFP_KERNEL);
>> +       if (!dev->vi) {
>> +               ret = -ENOMEM;
>> +               goto out_close;
>> +       }
>> +       ubi_get_volume_info(dev->desc, dev->vi);
>> +       dev->leb_size = dev->vi->usable_leb_size;
>> +
>> +       ret = ubiblock_alloc_cache(&dev->read_cache, dev->leb_size);
>> +       if (ret)
>> +               goto out_free;
>> +
>> +       ret = ubiblock_alloc_cache(&dev->write_cache, dev->leb_size);
>> +       if (ret)
>> +               goto out_free_cache;
>> +
>> +       dev->refcnt++;
>> +       mutex_unlock(&dev->vol_mutex);
>> +       return 0;
>> +
>> +out_free_cache:
>> +       ubiblock_free_cache(&dev->read_cache);
>> +out_free:
>> +       kfree(dev->vi);
>> +out_close:
>> +       ubi_close_volume(dev->desc);
>> +       dev->desc = NULL;
>> +out_unlock:
>> +       mutex_unlock(&dev->vol_mutex);
>> +       return ret;
>> +}
>> +
>> +static int ubiblock_release(struct gendisk *gd, fmode_t mode)
>> +{
>> +       struct ubiblock *dev = gd->private_data;
>> +
>> +       mutex_lock(&dev->vol_mutex);
>> +
>> +       dev->refcnt--;
>> +       if (dev->refcnt == 0) {
>> +               ubiblock_flush(dev, true);
>> +
>> +               ubiblock_free_cache(&dev->read_cache);
>> +               ubiblock_free_cache(&dev->write_cache);
>> +
>> +               kfree(dev->vi);
>> +               ubi_close_volume(dev->desc);
>> +
>> +               dev->vi = NULL;
>> +               dev->desc = NULL;
>> +       }
>> +
>> +       mutex_unlock(&dev->vol_mutex);
>> +       return 0;
>> +}
>> +
>> +static int ubiblock_ioctl(struct block_device *bdev, fmode_t mode,
>> +                             unsigned int cmd, unsigned long arg)
>> +{
>> +       struct ubiblock *dev = bdev->bd_disk->private_data;
>> +       int ret = -ENXIO;
>
> No need to initialize ret.
>

Actually, that's needed because Il return it below. I can change that
to return -ENXIO, of course.

>> +       if (!dev)
>> +               return ret;
>> +
>> +       mutex_lock(&dev->vol_mutex);
>> +
>> +       /* I can't get this to get called. What's going on? */
>> +       switch (cmd) {
>> +       case BLKFLSBUF:
>> +               ret = ubiblock_flush(dev, true);
>> +               break;
>> +       default:
>> +               ret = -ENOTTY;
>> +       }
>> +
>> +       mutex_unlock(&dev->vol_mutex);
>> +       return ret;
>> +}
>> +
>> +static int ubiblock_getgeo(struct block_device *bdev, struct hd_geometry *geo)
>> +{
>> +       /* Some tools might require this information */
>> +       geo->heads = 1;
>> +       geo->cylinders = 1;
>> +       geo->sectors = get_capacity(bdev->bd_disk);
>> +       geo->start = 0;
>> +       return 0;
>> +}
>> +
>> +static const struct block_device_operations ubiblock_ops = {
>> +       .owner = THIS_MODULE,
>> +       .open = ubiblock_open,
>> +       .release = ubiblock_release,
>> +       .ioctl = ubiblock_ioctl,
>> +       .getgeo = ubiblock_getgeo,
>> +};
>> +
>> +static int ubiblock_add(struct ubi_volume_info *vi)
>> +{
>> +       struct ubiblock *dev;
>> +       struct gendisk *gd;
>> +       int disk_capacity;
>> +       int ret;
>
> Please but variables of equal type in the same line.
>

Yes. But is this a CodingStyle rule?

>> +       /* Check that the volume isn't already handled */
>> +       mutex_lock(&devices_mutex);
>> +       if (find_dev_nolock(vi->ubi_num, vi->vol_id)) {
>> +               mutex_unlock(&devices_mutex);
>> +               return -EEXIST;
>> +       }
>> +       mutex_unlock(&devices_mutex);
>> +
>> +       dev = kzalloc(sizeof(struct ubiblock), GFP_KERNEL);
>> +       if (!dev)
>> +               return -ENOMEM;
>> +
>> +       mutex_init(&dev->vol_mutex);
>> +
>> +       dev->ubi_num = vi->ubi_num;
>> +       dev->vol_id = vi->vol_id;
>> +
>> +       /* Initialize the gendisk of this ubiblock device */
>> +       gd = alloc_disk(1);
>> +       if (!gd) {
>> +               pr_err("alloc_disk failed\n");
>> +               ret = -ENODEV;
>> +               goto out_free_dev;
>> +       }
>> +
>> +       gd->fops = &ubiblock_ops;
>> +       gd->major = ubiblock_major;
>> +       gd->first_minor = dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
>> +       gd->private_data = dev;
>> +       sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
>> +       disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
>> +       set_capacity(gd, disk_capacity);
>> +       dev->gd = gd;
>> +
>> +       spin_lock_init(&dev->queue_lock);
>> +       dev->rq = blk_init_queue(ubiblock_request, &dev->queue_lock);
>> +       if (!dev->rq) {
>> +               pr_err("blk_init_queue failed\n");
>> +               ret = -ENODEV;
>> +               goto out_put_disk;
>> +       }
>> +
>> +       dev->rq->queuedata = dev;
>> +       dev->gd->queue = dev->rq;
>> +
>> +       blk_queue_flush(dev->rq, REQ_FLUSH);
>> +
>> +       /* TODO: Is performance better or worse with this flag? */
>
> Find out yourself. Run some benchmarks. :)
>
>> +       /* queue_flag_set_unlocked(QUEUE_FLAG_NONROT, dev->rq);*/
>> +
>> +       /*
>> +        * Create one workqueue per volume (per registered block device).
>> +        * Rembember workqueues are cheap, they're not threads.
>> +        */
>> +       dev->wq = alloc_workqueue(gd->disk_name, 0, 0);
>> +       if (!dev->wq)
>> +               goto out_free_queue;
>> +       INIT_WORK(&dev->work, ubiblock_do_work);
>> +
>> +       mutex_lock(&devices_mutex);
>> +       list_add_tail(&dev->list, &ubiblock_devices);
>> +       mutex_unlock(&devices_mutex);
>> +
>> +       /* Must be the last step: anyone can call file ops from now on */
>> +       add_disk(dev->gd);
>> +
>> +       dev_info(disk_to_dev(dev->gd), "created from ubi%d:%d(%s)\n",
>> +                dev->ubi_num, dev->vol_id, vi->name);
>> +
>> +       return 0;
>> +
>> +out_free_queue:
>> +       blk_cleanup_queue(dev->rq);
>> +out_put_disk:
>> +       put_disk(dev->gd);
>> +out_free_dev:
>> +       kfree(dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static void ubiblock_cleanup(struct ubiblock *dev)
>> +{
>> +       del_gendisk(dev->gd);
>> +       blk_cleanup_queue(dev->rq);
>> +       put_disk(dev->gd);
>> +}
>> +
>> +static void ubiblock_del(struct ubi_volume_info *vi)
>> +{
>> +       struct ubiblock *dev;
>> +
>> +       mutex_lock(&devices_mutex);
>> +       dev = find_dev_nolock(vi->ubi_num, vi->vol_id);
>> +       if (!dev) {
>> +               mutex_unlock(&devices_mutex);
>> +               return;
>> +       }
>> +       /* Remove from device list */
>> +       list_del(&dev->list);
>> +       mutex_unlock(&devices_mutex);
>> +
>> +       /* Flush pending work and stop this workqueue */
>> +       destroy_workqueue(dev->wq);
>> +
>> +       mutex_lock(&dev->vol_mutex);
>> +
>> +       /*
>> +        * This means that ubiblock device is opened and in usage.
>> +        * However, this shouldn't happen, since we have
>> +        * called ubi_open_volume() at open() time, thus preventing
>> +        * volume removal.
>> +        */
>> +       WARN_ON(dev->desc);
>> +       ubiblock_cleanup(dev);
>> +
>> +       mutex_unlock(&dev->vol_mutex);
>> +
>> +       kfree(dev);
>> +}
>> +
>> +static void ubiblock_resize(struct ubi_volume_info *vi)
>> +{
>> +       struct ubiblock *dev;
>> +       int disk_capacity;
>> +
>> +       /*
>> +        * We don't touch the list, but we better lock it: it could be that the
>> +        * device gets removed between the time the device has been found and
>> +        * the time we access dev->gd
>> +        */
>> +       mutex_lock(&devices_mutex);
>> +       dev = find_dev_nolock(vi->ubi_num, vi->vol_id);
>> +       if (!dev) {
>> +               mutex_unlock(&devices_mutex);
>> +               return;
>> +       }
>> +       mutex_unlock(&devices_mutex);
>
> You can unlock the mutex directl after find_dev_nolock().
> No need to write it twice.
>

True.

>> +       mutex_lock(&dev->vol_mutex);
>> +       disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
>> +       set_capacity(dev->gd, disk_capacity);
>> +       dev_dbg(disk_to_dev(dev->gd), "resized to %d LEBs\n", vi->size);
>> +       mutex_unlock(&dev->vol_mutex);
>> +}
>> +
>> +static int ubiblock_notify(struct notifier_block *nb,
>> +                        unsigned long notification_type, void *ns_ptr)
>> +{
>> +       struct ubi_notification *nt = ns_ptr;
>> +
>> +       switch (notification_type) {
>> +       case UBI_VOLUME_ADDED:
>> +               if (0)
>> +                       ubiblock_add(&nt->vi);
>
> if (0) !?
>

Oops, forgot to remove this one.

>> +               break;
>> +       case UBI_VOLUME_REMOVED:
>> +               ubiblock_del(&nt->vi);
>> +               break;
>> +       case UBI_VOLUME_RESIZED:
>> +               ubiblock_resize(&nt->vi);
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +       return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block ubiblock_notifier = {
>> +       .notifier_call = ubiblock_notify,
>> +};
>> +
>> +static struct ubi_volume_desc *
>> +open_volume_desc(const char *name, int ubi_num, int vol_id)
>> +{
>> +       if (ubi_num == -1)
>> +               /* No ubi num, name must be a vol device path */
>> +               return ubi_open_volume_path(name, UBI_READONLY);
>> +       else if (vol_id == -1)
>> +               /* No vol_id, must be vol_name */
>> +               return ubi_open_volume_nm(ubi_num, name, UBI_READONLY);
>> +       else
>> +               return ubi_open_volume(ubi_num, vol_id, UBI_READONLY);
>> +}
>> +
>> +static void ubiblock_register_vol_param(void)
>> +{
>> +       int i, ret;
>> +       struct ubiblock_vol_param *p;
>> +       struct ubi_volume_desc *desc;
>> +       struct ubi_volume_info vi;
>> +
>> +       for (i = 0; i < ubiblock_devs; i++) {
>> +               p = &ubiblock_vol_param[i];
>> +
>> +               desc = open_volume_desc(p->name, p->ubi_num, p->vol_id);
>> +               if (IS_ERR(desc))
>> +                       continue;
>> +
>> +               ubi_get_volume_info(desc, &vi);
>> +               ret = ubiblock_add(&vi);
>> +               if (ret)
>> +                       pr_warn("can't add '%s' volume, err=%d\n",
>> +                               vi.name, ret);
>> +
>> +               ubi_close_volume(desc);
>> +       }
>> +}
>> +
>> +static int __init ubiblock_init(void)
>> +{
>> +       ubiblock_major = register_blkdev(0, "ubiblock");
>> +       if (ubiblock_major < 0)
>> +               return ubiblock_major;
>> +
>> +       ubiblock_register_vol_param();
>> +
>> +       /*
>> +        * Blocks will get registered dynamically.
>> +        * Each ubi volume will get a corresponding block device.
>> +        */
>> +       return ubi_register_volume_notifier(&ubiblock_notifier, 1);
>> +}
>> +
>> +static void __exit ubiblock_exit(void)
>> +{
>> +       struct ubiblock *next;
>> +       struct ubiblock *dev;
>
> No need to write two lines. Put next and dev in the same one.
>

True.

>> +       ubi_unregister_volume_notifier(&ubiblock_notifier);
>> +
>> +       list_for_each_entry_safe(dev, next, &ubiblock_devices, list) {
>> +
>> +               /* Flush pending work and stop workqueue */
>> +               destroy_workqueue(dev->wq);
>> +
>> +               /* The module is being forcefully removed */
>> +               WARN_ON(dev->desc);
>> +
>> +               /* Remove from device list */
>> +               list_del(&dev->list);
>> +
>> +               ubiblock_cleanup(dev);
>> +
>> +               kfree(dev);
>> +       }
>> +
>> +       unregister_blkdev(ubiblock_major, "ubiblock");
>> +}
>> +
>> +module_init(ubiblock_init);
>> +module_exit(ubiblock_exit);
>> +
>> +MODULE_DESCRIPTION("Block device emulation access to UBI volumes");
>
> I'm not a native speaker but this sentence sound strange to me.
>

Could be. Any suggestion?

Thanks!

    Ezequiel
