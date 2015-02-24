Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQABy-0002xz-Mf
 for linux-mtd@lists.infradead.org; Tue, 24 Feb 2015 07:46:07 +0000
Received: by pdev10 with SMTP id v10so31580424pde.7
 for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2015 23:45:45 -0800 (PST)
Date: Mon, 23 Feb 2015 23:45:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rodrigo Freire <rfreire@redhat.com>
Subject: Re: [PATCH v3 1/3] mtd: block2mtd: Ensure that block2mtd is
 triggered after block devices are presented.
Message-ID: <20150224074541.GD24441@norris-Latitude-E6410>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
 <2086372266.7454667.1415535533979.JavaMail.zimbra@redhat.com>
 <573958808.7454775.1415535673904.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <573958808.7454775.1415535673904.JavaMail.zimbra@redhat.com>
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You asked for review again... I guess I forgot about this patch series
for some time. I think this patch is OK, except for a trivial comment
below. But I have some comments on the next few.

On Sun, Nov 09, 2014 at 07:21:13AM -0500, Rodrigo Freire wrote:
> From: Felix Fietkau <nbd@openwrt.org>
> 
> mtd: block2mtd: Ensure that block2mtd is triggered after block devices are presented.
> 
> Ensures that block2mtd is triggered after the block devices are enumerated
> at boot time.
> This issue is seen on BCM2835 (Raspberry Pi) systems when mounting JFFS2
> block2mtd filesystems, probably because of the delay on enumerating a USB
> MMC card reader.
> 
> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
> Signed-off-by: Rodrigo Freire <rfreire@redhat.com>
> Signed-off-by: Herton Krzesinski <herton@redhat.com>
> ---
> V3: Separated on a single patch, fixes a compiling warning, cosmethic changes
> V2: Uses kstrdup, removed PAGE_MASK.
> --- a/drivers/mtd/devices/block2mtd.c	2014-11-07 16:40:14.638676860 -0200
> +++ b/drivers/mtd/devices/block2mtd.c	2014-11-07 17:44:45.277769924 -0200
[...]
> @@ -225,15 +237,28 @@ static struct block2mtd_dev *add_device(
>  
>  	/* Get a handle on the device */
>  	bdev = blkdev_get_by_path(devname, mode, dev);
> -#ifndef MODULE
> -	if (IS_ERR(bdev)) {
>  
> -		/* We might not have rootfs mounted at this point. Try
> -		   to resolve the device name by other means. */
> +#ifndef MODULE
> +/*
> + * We might not have the root device mounted at this point.
> + * Try to resolve the device name by other means.
> + */

That's some interesting comment indentation.

> +	for (i = 0; IS_ERR(bdev) && i <= timeout; i++) {
> +		dev_t devt;
>  
> -		dev_t devt = name_to_dev_t(devname);
> -		if (devt)
> -			bdev = blkdev_get_by_dev(devt, mode, dev);
> +		if (i)
> +			/*
> +			 * Calling wait_for_device_probe in the first loop
> +			 * was not enough, sleep for a bit in subsequent
> +			 * go-arounds.
> +			 */
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
> @@ -280,6 +305,7 @@ static struct block2mtd_dev *add_device(
>  		/* Device didn't get added, so free the entry */
>  		goto err_destroy_mutex;
>  	}
> +
>  	list_add(&dev->list, &blkmtd_device_list);
>  	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
>  		dev->mtd.index,
> @@ -348,16 +374,19 @@ static inline void kill_final_newline(ch
>  
>  #ifndef MODULE
>  static int block2mtd_init_called = 0;
> -static char block2mtd_paramline[80 + 12]; /* 80 for device, 12 for erase size */
> +/* 80 for device, 12 for erase size */
> +static char block2mtd_paramline[80 + 12];
>  #endif
>  
>  static int block2mtd_setup2(const char *val)
>  {
> -	char buf[80 + 12]; /* 80 for device, 12 for erase size */
> +	/* 80 for device, 12 for erase size, 80 for name, 8 for timeout */
> +	char buf[80 + 12 + 80 + 8];
>  	char *str = buf;
>  	char *token[2];
>  	char *name;
>  	size_t erase_size = PAGE_SIZE;
> +	unsigned long timeout = MTD_DEFAULT_TIMEOUT;
>  	int i, ret;
>  
>  	if (strnlen(val, sizeof(buf)) >= sizeof(buf)) {
> @@ -395,7 +424,7 @@ static int block2mtd_setup2(const char *
>  		}
>  	}
>  
> -	add_device(name, erase_size);
> +	add_device(name, erase_size, timeout);
>  
>  	return 0;
>  }
> @@ -463,8 +492,7 @@ static void block2mtd_exit(void)
>  	}
>  }
>  
> -
> -module_init(block2mtd_init);
> +late_initcall(block2mtd_init);

This technically could have problems if you want to use block2mtd with
UBI, now, since it also uses late_initcall(), and it can add UBI
attachments via module parameters too (ubi.mtd=<mtd-name>).

I'm not too worried about this, though, since block2mtd is really not
meant for serious use (despite your usage here).

>  module_exit(block2mtd_exit);
>  
>  MODULE_LICENSE("GPL");

Pushed this patch to l2-mtd.git, with comment fixups.

Brian
