Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4zfl-00048w-Rb
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 14:13:29 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 1/5] UBI: add UBI control device
Date: Wed, 19 Dec 2007 15:11:59 +0100
References: <20071219154137.23264.28116.sendpatchset@golum>
	<20071219154142.23264.345.sendpatchset@golum>
In-Reply-To: <20071219154142.23264.345.sendpatchset@golum>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200712191512.00951.arnd@arndb.de>
Cc: Frank Haverkamp <haver@vnet.ibm.com>, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 19 December 2007, Artem Bityutskiy wrote:
> From 4820ff7357b102cea37ec581d6d0ffd5a24348d2 Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Sun, 16 Dec 2007 16:59:31 +0200
> Subject: [PATCH] UBI: add UBI control device
> 
> This patch is a preparation to make UBI devices dynamic. It
> adds an UBI control device which has dynamically allocated
> major number and registers itself as "ubi_ctrl". It does not
> do anything so far. The idea is that this device will allow
> to attach/detach MTD devices from userspace.
> 
> This is symilar to what the Linux device mapper has.

I don't really like the idea of a separate device node, the
point that device mapper does it is not a particularly strong
argument.

A better alternative would be probably be to do it similar
to the loopback device, where you attach the device node itself
with a back-end (file in case of loop).


>  /*
> - * This file includes UBI initialization and building of UBI devices. At the
> - * moment UBI devices may only be added while UBI is initialized, but dynamic
> - * device add/remove functionality is planned. Also, at the moment we only
> - * attach UBI devices by scanning, which will become a bottleneck when flashes
> - * reach certain large size. Then one may improve UBI and add other methods.
> + * This file includes UBI initialization and building of UBI devices.
> + *
> + * When UBI is initialized, it attaches all the MTD devices specified as the
> + * module load parameters or the kernel boot parameters. If MTD devices were
> + * specified, UBI does not attach any MTD device, but it is possible to do
> + * later using the "UBI control device".
> + *
> + * At the moment we only attach UBI devices by scanning, which will become a
> + * bottleneck when flashes reach certain large size. Then one may improve UBI
> + * and add other methods, although it does not seem to be easy to do.
>   */

I'd say a more natural approach would be to use attributes in sysfs to allow the
probing and destruction of the UBI devices. That way, you could use much
simpler hooks into udev to create them, without the need of a special user
ioctl interface.

  
>  #include <linux/err.h>
> @@ -70,6 +75,11 @@ struct kmem_cache *ubi_ltree_slab;
>  /* Slab cache for wear-leveling entries */
>  struct kmem_cache *ubi_wl_entry_slab;
>  
> +/* UBI control character device major number */
> +static int ubi_ctrl_major;

Why do you need you own major number? I think if you really want this ioctl
interface, a misc device would be completely sufficient.

> +/* Linux device model object corresponding to the control UBI device */
> +static struct device ubi_ctrl_dev;

What is this device used for?

> +	/* Create base sysfs directory and sysfs files */
>  	ubi_class = class_create(THIS_MODULE, UBI_NAME_STR);
> -	if (IS_ERR(ubi_class))
> -		return PTR_ERR(ubi_class);
> +	if (IS_ERR(ubi_class)) {
> +		err = PTR_ERR(ubi_class);
> +		printk(KERN_ERR "UBI error: cannot create UBI class\n");
> +		goto out_cdev_unreg;
> +	}
>  
>  	err = class_create_file(ubi_class, &ubi_version);
> -	if (err)
> +	if (err) {
> +		printk(KERN_ERR "UBI error: cannot create sysfs file\n");
>  		goto out_class;
> +	}
> +
> +	/* Register the control device in the Linux device system */
> +	ubi_ctrl_dev.release = ctrl_dev_release;
> +	ubi_ctrl_dev.devt = MKDEV(ubi_ctrl_major, 0);
> +	ubi_ctrl_dev.class = ubi_class;
> +	sprintf(&ubi_ctrl_dev.bus_id[0], "ubi_ctrl");
> +	err = device_register(&ubi_ctrl_dev);
> +	if (err) {
> +		printk(KERN_ERR "UBI error: cannot register device\n");
> +		goto out_version;
> +	}

This looks like overengineering, you can simplify this a lot by using
a misc device.
  
>  	ubi_ltree_slab = kmem_cache_create("ubi_ltree_slab",
>  					   sizeof(struct ubi_ltree_entry), 0,
>  					   0, &ltree_entry_ctor);

How many objects to you expect to have in this cache? Is it just one
object per device? That would hardly be worth creating a special cache.

	Arnd <><
