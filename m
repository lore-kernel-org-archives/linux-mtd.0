Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xwmgk-0002Yh-Rw
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 06:48:27 +0000
Message-ID: <54815522.6000004@broadcom.com>
Date: Thu, 4 Dec 2014 22:48:02 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/3] mtd: implement common reboot notifier boilerplate
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: cdoban@broadcom.com, rjui@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You need to change some spaces to tabs in the patch.

Tested-by: Scott Branden <sbranden@broadcom.com>

On 14-12-04 06:36 PM, Brian Norris wrote:
> cfi_cmdset_000{1,2}.c already implement their own reboot notifiers, and
> we're going to add one for NAND. Let's put the boilerplate in one place.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>   drivers/mtd/mtdcore.c   | 20 ++++++++++++++++++++
>   include/linux/mtd/mtd.h |  1 +
>   2 files changed, 21 insertions(+)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 4c611871d7e6..b80d44f9751d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -37,6 +37,7 @@
>   #include <linux/backing-dev.h>
>   #include <linux/gfp.h>
>   #include <linux/slab.h>
> +#include <linux/reboot.h>
>
>   #include <linux/mtd/mtd.h>
>   #include <linux/mtd/partitions.h>
> @@ -365,6 +366,17 @@ static struct device_type mtd_devtype = {
>   	.release	= mtd_release,
>   };
>
> +static int mtd_reboot_notifier(struct notifier_block *n, unsigned long state,
> +			       void *cmd)
> +{
> +       struct mtd_info *mtd;
You need tabs here instead of spaces to pass checkpatch
> +
> +       mtd = container_of(n, struct mtd_info, reboot_notifier);
> +       mtd->_reboot(mtd);
> +
> +       return NOTIFY_DONE;
> +}
> +
>   /**
>    *	add_mtd_device - register an MTD device
>    *	@mtd: pointer to new MTD device info structure
> @@ -565,6 +577,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>   			err = -ENODEV;
>   	}
>
> +	if (mtd->_reboot) {
> +		mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
> +		register_reboot_notifier(&mtd->reboot_notifier);
> +	}
You need tabs here instead of spaces to pass checkpatch
> +
>   	return err;
>   }
>   EXPORT_SYMBOL_GPL(mtd_device_parse_register);
> @@ -579,6 +596,9 @@ int mtd_device_unregister(struct mtd_info *master)
>   {
>   	int err;
>
> +	if (master->_reboot)
> +		unregister_reboot_notifier(&master->reboot_notifier);
> +
>   	err = del_mtd_partitions(master);
>   	if (err)
>   		return err;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 031ff3a9a0bd..c06f5373d870 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -227,6 +227,7 @@ struct mtd_info {
>   	int (*_block_markbad) (struct mtd_info *mtd, loff_t ofs);
>   	int (*_suspend) (struct mtd_info *mtd);
>   	void (*_resume) (struct mtd_info *mtd);
> +	void (*_reboot) (struct mtd_info *mtd);
>   	/*
>   	 * If the driver is something smart, like UBI, it may need to maintain
>   	 * its own reference counting. The below functions are only for driver.
>
