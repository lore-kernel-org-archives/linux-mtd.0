Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecBsy-0005y9-3A
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 15:13:51 +0000
Date: Thu, 18 Jan 2018 16:13:10 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Bradley Bolen <bradleybolen@gmail.com>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, ezequiel@vanguardiasur.com.ar,
 stable@vger.kernel.org
Subject: Re: [PATCH] UBI: block: Fix locking for idr_alloc/idr_remove
Message-ID: <20180118161310.4c1a779a@bbrezillon>
In-Reply-To: <1516283720-11277-1-git-send-email-bbolen@lexmark.com>
References: <1516283720-11277-1-git-send-email-bbolen@lexmark.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 18 Jan 2018 08:55:20 -0500
Bradley Bolen <bradleybolen@gmail.com> wrote:

> From: Bradley Bolen <bradleybolen@gmail.com>
> 
> This fixes a race with idr_alloc where gd->first_minor can be set to the
> same value for two simultaneous calls to ubiblock_create.  Each instance
> calls device_add_disk with the same first_minor.  device_add_disk calls
> bdi_register_owner which generates several warnings.
> 
> WARNING: CPU: 1 PID: 179 at kernel-source/fs/sysfs/dir.c:31
> sysfs_warn_dup+0x68/0x88
> sysfs: cannot create duplicate filename '/devices/virtual/bdi/252:2'
> 
> WARNING: CPU: 1 PID: 179 at kernel-source/lib/kobject.c:240
> kobject_add_internal+0x1ec/0x2f8
> kobject_add_internal failed for 252:2 with -EEXIST, don't try to
> register things with the same name in the same directory
> 
> WARNING: CPU: 1 PID: 179 at kernel-source/fs/sysfs/dir.c:31
> sysfs_warn_dup+0x68/0x88
> sysfs: cannot create duplicate filename '/dev/block/252:2'
> 
> However, device_add_disk does not error out when bdi_register_owner
> returns an error.  Control continues until reaching blk_register_queue.
> It then BUGs.
> 
> kernel BUG at kernel-source/fs/sysfs/group.c:113!
> [<c01e26cc>] (internal_create_group) from [<c01e2950>]
> (sysfs_create_group+0x20/0x24)
> [<c01e2950>] (sysfs_create_group) from [<c00e3d38>]
> (blk_trace_init_sysfs+0x18/0x20)
> [<c00e3d38>] (blk_trace_init_sysfs) from [<c02bdfbc>]
> (blk_register_queue+0xd8/0x154)
> [<c02bdfbc>] (blk_register_queue) from [<c02cec84>]
> (device_add_disk+0x194/0x44c)
> [<c02cec84>] (device_add_disk) from [<c0436ec8>]
> (ubiblock_create+0x284/0x2e0)
> [<c0436ec8>] (ubiblock_create) from [<c0427bb8>]
> (vol_cdev_ioctl+0x450/0x554)
> [<c0427bb8>] (vol_cdev_ioctl) from [<c0189110>] (vfs_ioctl+0x30/0x44)
> [<c0189110>] (vfs_ioctl) from [<c01892e0>] (do_vfs_ioctl+0xa0/0x790)
> [<c01892e0>] (do_vfs_ioctl) from [<c0189a14>] (SyS_ioctl+0x44/0x68)
> [<c0189a14>] (SyS_ioctl) from [<c0010640>] (ret_fast_syscall+0x0/0x34)
> 
> Locking idr_alloc/idr_remove removes the race and keeps gd->first_minor
> unique.
> 
> Fixes: 2bf50d42f3a4 ("UBI: block: Dynamically allocate minor numbers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bradley Bolen <bradleybolen@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/ubi/block.c | 42 ++++++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index b210fdb..b1fc28f 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -99,6 +99,8 @@ struct ubiblock {
>  
>  /* Linked list of all ubiblock instances */
>  static LIST_HEAD(ubiblock_devices);
> +static DEFINE_IDR(ubiblock_minor_idr);
> +/* Protects ubiblock_devices and ubiblock_minor_idr */
>  static DEFINE_MUTEX(devices_mutex);
>  static int ubiblock_major;
>  
> @@ -351,8 +353,6 @@ static int ubiblock_init_request(struct blk_mq_tag_set *set,
>  	.init_request	= ubiblock_init_request,
>  };
>  
> -static DEFINE_IDR(ubiblock_minor_idr);
> -
>  int ubiblock_create(struct ubi_volume_info *vi)
>  {
>  	struct ubiblock *dev;
> @@ -365,14 +365,15 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  	/* Check that the volume isn't already handled */
>  	mutex_lock(&devices_mutex);
>  	if (find_dev_nolock(vi->ubi_num, vi->vol_id)) {
> -		mutex_unlock(&devices_mutex);
> -		return -EEXIST;
> +		ret = -EEXIST;
> +		goto out_unlock;
>  	}
> -	mutex_unlock(&devices_mutex);
>  
>  	dev = kzalloc(sizeof(struct ubiblock), GFP_KERNEL);
> -	if (!dev)
> -		return -ENOMEM;
> +	if (!dev) {
> +		ret = -ENOMEM;
> +		goto out_unlock;
> +	}
>  
>  	mutex_init(&dev->dev_mutex);
>  
> @@ -437,14 +438,13 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  		goto out_free_queue;
>  	}
>  
> -	mutex_lock(&devices_mutex);
>  	list_add_tail(&dev->list, &ubiblock_devices);
> -	mutex_unlock(&devices_mutex);
>  
>  	/* Must be the last step: anyone can call file ops from now on */
>  	add_disk(dev->gd);
>  	dev_info(disk_to_dev(dev->gd), "created from ubi%d:%d(%s)",
>  		 dev->ubi_num, dev->vol_id, vi->name);
> +	mutex_unlock(&devices_mutex);
>  	return 0;
>  
>  out_free_queue:
> @@ -457,6 +457,8 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  	put_disk(dev->gd);
>  out_free_dev:
>  	kfree(dev);
> +out_unlock:
> +	mutex_unlock(&devices_mutex);
>  
>  	return ret;
>  }
> @@ -478,30 +480,36 @@ static void ubiblock_cleanup(struct ubiblock *dev)
>  int ubiblock_remove(struct ubi_volume_info *vi)
>  {
>  	struct ubiblock *dev;
> +	int ret;
>  
>  	mutex_lock(&devices_mutex);
>  	dev = find_dev_nolock(vi->ubi_num, vi->vol_id);
>  	if (!dev) {
> -		mutex_unlock(&devices_mutex);
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto out_unlock;
>  	}
>  
>  	/* Found a device, let's lock it so we can check if it's busy */
>  	mutex_lock(&dev->dev_mutex);
>  	if (dev->refcnt > 0) {
> -		mutex_unlock(&dev->dev_mutex);
> -		mutex_unlock(&devices_mutex);
> -		return -EBUSY;
> +		ret = -EBUSY;
> +		goto out_unlock_dev;
>  	}
>  
>  	/* Remove from device list */
>  	list_del(&dev->list);
> -	mutex_unlock(&devices_mutex);
> -
>  	ubiblock_cleanup(dev);
>  	mutex_unlock(&dev->dev_mutex);
> +	mutex_unlock(&devices_mutex);
> +
>  	kfree(dev);
>  	return 0;
> +
> +out_unlock_dev:
> +	mutex_unlock(&dev->dev_mutex);
> +out_unlock:
> +	mutex_unlock(&devices_mutex);
> +	return ret;
>  }
>  
>  static int ubiblock_resize(struct ubi_volume_info *vi)
> @@ -630,6 +638,7 @@ static void ubiblock_remove_all(void)
>  	struct ubiblock *next;
>  	struct ubiblock *dev;
>  
> +	mutex_lock(&devices_mutex);
>  	list_for_each_entry_safe(dev, next, &ubiblock_devices, list) {
>  		/* The module is being forcefully removed */
>  		WARN_ON(dev->desc);
> @@ -638,6 +647,7 @@ static void ubiblock_remove_all(void)
>  		ubiblock_cleanup(dev);
>  		kfree(dev);
>  	}
> +	mutex_unlock(&devices_mutex);
>  }
>  
>  int __init ubiblock_init(void)
