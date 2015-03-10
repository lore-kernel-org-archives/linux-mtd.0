Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV9Ms-0001Wu-W5
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 01:53:59 +0000
Received: by pdjy10 with SMTP id y10so29374204pdj.12
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 18:53:37 -0700 (PDT)
Date: Mon, 9 Mar 2015 18:53:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH] mtd: part: Create the master device node when partitioned
Message-ID: <20150310015329.GA32500@ld-irv-0074>
References: <1425680522-7898-1-git-send-email-dehrenberg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425680522-7898-1-git-send-email-dehrenberg@chromium.org>
Cc: richard.weinberger@gmail.com, ezequiel.garcia@imgtec.com,
 namnguyen@chromium.org, linux-mtd@lists.infradead.org, gwendal@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 06, 2015 at 02:22:02PM -0800, Dan Ehrenberg wrote:
> For many use cases, it helps to have a device node for the entire
> MTD device as well as device nodes for the individual partitions.
> For example, this allows querying the entire device's properties.
> A common idiom is to create an additional partition which spans
> over the whole device.
> 
> This patch makes a config option, CONFIG_MTD_PARTITIONED_MASTER,
> which makes the master partition present even when the device is
> partitioned. This isn't turned on by default since it presents
> a backwards-incompatible device numbering.

I kinda like this strategy. If users were flexible enough, I'd like to
be able to make this the default eventually. But that probably won't
happen, so we may have to live with this Kconfig forever, in that case.

BTW, is there any way to tell the difference between a partition and a
master device, from user space?

Also, would we want to address these comments from mtdpart.c?

 * We don't register the master, or expect the caller to have done so,
 * for reasons of data integrity.


        /* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
         * to have the same data be in two different partitions.
         */

First of all, as I mentioned previously, I don't think the argument is
valid. We can't (and shouldn't have to) protect users from themselves
here.

Secondly, I think maybe this should be changed if we register both
master and partition(s). The partition *should* use the master as its
parent if we register both devices.

Side ntoe: that might provide the means for differentiating master and
partition -- check the device parent in sysfs.

Brian

> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> ---
>  drivers/mtd/Kconfig   |  9 +++++++++
>  drivers/mtd/mtdcore.c | 11 ++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 71fea89..92d4bc7 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -309,6 +309,15 @@ config MTD_SWAP
>  	  The driver provides wear leveling by storing erase counter into the
>  	  OOB.
>  
> +config MTD_PARTITIONED_MASTER
> +	bool "Retain master device when partitioned"
> +	default n
> +	depends on MTD
> +	help
> +	  Ordinarily, either a master is present or several partitions
> +	  are present. This config option leaves the master in even if
> +	  the device is partitioned.
> +
>  source "drivers/mtd/chips/Kconfig"
>  
>  source "drivers/mtd/maps/Kconfig"
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 11883bd..c7c1245 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -548,7 +548,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  	}
>  
>  	if (err > 0) {
> -		err = add_mtd_partitions(mtd, real_parts, err);
> +		int nbparts = err;
> +#ifdef CONFIG_MTD_PARTITIONED_MASTER
> +		err = add_mtd_device(mtd);
> +		if (err == 1) {
> +			err = -ENODEV;
> +			goto out;
> +		}
> +#endif
> +		err = add_mtd_partitions(mtd, real_parts, nbparts);
>  		kfree(real_parts);
>  	} else if (err == 0) {
>  		err = add_mtd_device(mtd);
> @@ -569,6 +577,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  		register_reboot_notifier(&mtd->reboot_notifier);
>  	}
>  
> +out:
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(mtd_device_parse_register);
> -- 
> 2.2.0.rc0.207.ga3a616c
> 
