Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsaLB-0006Hk-2M
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 08:08:01 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 09:08:55 +0200
Message-Id: <1150787336.6780.102.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-20 at 08:54 +0200, Andrew Victor wrote:
> This is a NAND drivers for the Atmel AT91RM9200 SoC.
> 
> (No changes since it was committed to the MTD CVS on 21/02/2006)

As I pointed out in my previous mail, the driver needs to be updated to
work with the latest changes in the nand driver.

> +/*
> + * Hardware specific access to control-lines
> + */
> +static void at91_nand_hwcontrol(struct mtd_info *mtd, int cmd)

This function needs to be adjusted.

> +#ifdef CONFIG_MTD_PARTITIONS
> +	if (host->board->partition_info)
> +		partitions = host->board->partition_info(mtd->size, &num_partitions);
> +
> +	if ((!partitions) || (num_partitions == 0)) {
> +		printk(KERN_ERR "at91_nand: No parititions defined, or unsupported device.\n");
> +		res = ENXIO;
> +		goto out;
> +	}
> +
> +	res = add_mtd_partitions(mtd, partitions, num_partitions);
> +#else
> +	res = add_mtd_device(mtd);
> +#endif
> +
> +out:

If you error out after a sucessful nand_scan() - i.e. chip was detected
- you have to call nand_release(). nand_scan() allocates memory which
gets freed inside nand_release()

> +	if (res) {
> +		at91_nand_disable(host);
> +		platform_set_drvdata(pdev, NULL);
> +
> +		iounmap(host->io_base);
> +		kfree(host);
> +	}
> +
> +	return res;
> +}
> +
> +/*
> + * Remove a NAND device.
> + */
> +static int __devexit at91_nand_remove(struct platform_device *pdev)
> +{
> +	struct at91_nand_host *host = platform_get_drvdata(pdev);
> +	struct mtd_info *mtd = &host->mtd;
> +
> +	del_mtd_partitions(mtd);
> +	del_mtd_device(mtd);

nand_release() does this and you have to call it - otherwise you get a
memory leak !

	tglx
