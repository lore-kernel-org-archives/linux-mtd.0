Received: from longford.logfs.org ([213.229.74.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XROsm-0005rt-IM
 for linux-mtd@lists.infradead.org; Tue, 09 Sep 2014 17:07:09 +0000
Date: Tue, 9 Sep 2014 13:02:31 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Rodrigo Freire <rfreire@redhat.com>
Subject: Re: [PATCH] block2mtd: mtd: Present block2mtd timely on boot time
Message-ID: <20140909170231.GA14429@logfs.org>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
Cc: linux-mtd@lists.infradead.org, Felix Fietkau <nbd@openwrt.org>,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 8 September 2014 16:04:40 -0400, Rodrigo Freire wrote:
> 
> From: Felix Fietkau <nbd@openwrt.org>
> 
> block2mtd: Ensure that block2mtd is presented in a timely fashion 
> 
> Currently, a block MTD device is not presented to the system on time, in 
> order to start mounting the filesystems. This patch ensures that block2mtd 
> is presented at the right time, so filesystems can be mounted on boot time.
> This issue was seen on BCM2708 (Raspberry Pi) systems when mounting JFFS2 
> block2mtd filesystems.
> This patchset also adds a MTD device name and a timeout option to the driver.

Looks fine once the comments below are addressed.

> Original patchset:
> https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.12/440-block2mtd_init.patch?rev=40444
> https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.12/441-block2mtd_probe.patch?rev=40444
> 
> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
> Signed-off-by: Rodrigo Freire <rfreire@redhat.com> 
> 
> --- a/drivers/mtd/devices/block2mtd.c	2014-09-05 11:13:39.143698413 -0300
> +++ b/drivers/mtd/devices/block2mtd.c	2014-09-05 17:50:28.107366433 -0300
> @@ -9,7 +9,15 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +/*
> +* When the first attempt at device initialization fails, we may need to
> +* wait a little bit and retry. This timeout, by default 3 seconds, gives
> +* device time to start up. Required on BCM2708 and a few other chipsets.
> +*/
> +#define MTD_DEFAULT_TIMEOUT	3
> +
>  #include <linux/module.h>
> +#include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/blkdev.h>
>  #include <linux/bio.h>
> @@ -17,6 +25,7 @@
>  #include <linux/list.h>
>  #include <linux/init.h>
>  #include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
>  #include <linux/mutex.h>
>  #include <linux/mount.h>
>  #include <linux/slab.h>
> @@ -209,12 +218,14 @@ static void block2mtd_free_device(struct
>  }
>  
>  
> -static struct block2mtd_dev *add_device(char *devname, int erase_size)
> +static struct block2mtd_dev *add_device(char *devname, int erase_size, const char *mtdname, int timeout)
>  {
>  	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
> -	struct block_device *bdev;
> +	struct block_device *bdev = ERR_PTR(-ENODEV);
>  	struct block2mtd_dev *dev;
> +	struct mtd_partition *part;
>  	char *name;
> +	int i;
>  
>  	if (!devname)
>  		return NULL;
> @@ -225,15 +236,28 @@ static struct block2mtd_dev *add_device(
>  
>  	/* Get a handle on the device */
>  	bdev = blkdev_get_by_path(devname, mode, dev);
> -#ifndef MODULE
> -	if (IS_ERR(bdev)) {
>  
> -		/* We might not have rootfs mounted at this point. Try
> -		   to resolve the device name by other means. */
> -
> -		dev_t devt = name_to_dev_t(devname);
> -		if (devt)
> -			bdev = blkdev_get_by_dev(devt, mode, dev);
> +#ifndef MODULE
> +/*
> +* We might not have the root device mounted at this point.
> +* Try to resolve the device name by other means.
> +*/
> +	for (i = 0; IS_ERR(bdev) && i <= timeout; i++) {
> +		dev_t devt;
> +
> +		if (i)
> +			/*
> +			 * Calling wait_for_device_probe in the first loop 
> +			 * was not enough, sleep for a bit in subsequent
> +			 * go-arounds.
> +			*/
> +			msleep(1000);
> +		wait_for_device_probe();
> +
> +		devt = name_to_dev_t(devname);
> +		if (!devt)
> +			continue;
> +		bdev = blkdev_get_by_dev(devt, mode, dev);
>  	}
>  #endif
>  
> @@ -257,13 +281,15 @@ static struct block2mtd_dev *add_device(
>  
>  	/* Setup the MTD structure */
>  	/* make the name contain the block device in */
> -	name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
> +	if (!mtdname)
> +		mtdname = devname;
> +	name = kmalloc(strlen(mtdname) + 1, GFP_KERNEL);
>  	if (!name)
>  		goto err_destroy_mutex;
>  
> +	strcpy(name, mtdname);

kstrdup.

And see below for the ABI change.

>  	dev->mtd.name = name;
> -
> -	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
> +	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK & ~(erase_size - 1);

PAGE_MASK is no longer needed with the new term.  Or does anyone
seriously want to support erase_size < PAGE_SIZE?

>  	dev->mtd.erasesize = erase_size;
>  	dev->mtd.writesize = 1;
>  	dev->mtd.writebufsize = PAGE_SIZE;
> @@ -276,15 +302,19 @@ static struct block2mtd_dev *add_device(
>  	dev->mtd.priv = dev;
>  	dev->mtd.owner = THIS_MODULE;
>  
> -	if (mtd_device_register(&dev->mtd, NULL, 0)) {
> +	part = kzalloc(sizeof(struct mtd_partition), GFP_KERNEL);
> +	part->name = name;
> +	part->offset = 0;
> +	part->size = dev->mtd.size;
> +	if (mtd_device_register(&dev->mtd, part, 1)) {
>  		/* Device didn't get added, so free the entry */
>  		goto err_destroy_mutex;
>  	}
> +
>  	list_add(&dev->list, &blkmtd_device_list);
>  	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
>  		dev->mtd.index,
> -		dev->mtd.name + strlen("block2mtd: "),
> -		dev->mtd.erasesize >> 10, dev->mtd.erasesize);
> +		mtdname, dev->mtd.erasesize >> 10, dev->mtd.erasesize);
>  	return dev;
>  
>  err_destroy_mutex:
> @@ -353,11 +383,12 @@ static char block2mtd_paramline[80 + 12]
>  
>  static int block2mtd_setup2(const char *val)
>  {
> -	char buf[80 + 12]; /* 80 for device, 12 for erase size */
> +	char buf[80 + 12 + 80 + 8]; /* 80 for device, 12 for erase size, 80 for name, 8 for timeout */
>  	char *str = buf;
> -	char *token[2];
> +	char *token[4];
>  	char *name;
>  	size_t erase_size = PAGE_SIZE;
> +	unsigned long timeout = MTD_DEFAULT_TIMEOUT;
>  	int i, ret;
>  
>  	if (strnlen(val, sizeof(buf)) >= sizeof(buf)) {
> @@ -368,7 +399,7 @@ static int block2mtd_setup2(const char *
>  	strcpy(str, val);
>  	kill_final_newline(str);
>  
> -	for (i = 0; i < 2; i++)
> +	for (i = 0; i < 4; i++)
>  		token[i] = strsep(&str, ",");
>  
>  	if (str) {
> @@ -395,7 +426,13 @@ static int block2mtd_setup2(const char *
>  		}
>  	}
>  
> -	add_device(name, erase_size);
> +	if (token[2] && (strlen(token[2]) + 1 > 80))
> +		pr_err("mtd device name too long");

Timeout has a default value, but name defaults to NULL.  Add three
devices without specifying the name and you get funny results.

If we handled the NULL case by doing what the driver used to do before
this patch, I think this would be fine.

> +
> +	if (token[3] && kstrtoul(token[3], 0, &timeout))
> +		pr_err("invalid timeout");
> +	add_device(name, erase_size, token[2], timeout);
>  
>  	return 0;
>  }
> @@ -429,7 +466,7 @@ static int block2mtd_setup(const char *v
>  
>  
>  module_param_call(block2mtd, block2mtd_setup, NULL, NULL, 0200);
> -MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,<erasesize>]\"");
> +MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,<erasesize>[,<name>[,<timeout>]]]\"");
>  
>  static int __init block2mtd_init(void)
>  {
> @@ -463,8 +500,7 @@ static void block2mtd_exit(void)
>  	}
>  }
>  
> -
> -module_init(block2mtd_init);
> +late_initcall(block2mtd_init);
>  module_exit(block2mtd_exit);
>  
>  MODULE_LICENSE("GPL");

Jörn

--
Most compromises I've seen have been have been a result of gross stupidity,
not incredible technical skill on the part of the attacker.
-- pr0f
