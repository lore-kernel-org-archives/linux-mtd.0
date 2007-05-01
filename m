Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HirwE-000444-RT
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 08:58:40 -0400
Subject: Re: [patch] generic nand driver for SoCs
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vitalywool@gmail.com>
In-Reply-To: <46373163.7060603@gmail.com>
References: <46373163.7060603@gmail.com>
Content-Type: text/plain
Date: Tue, 01 May 2007 15:00:51 +0200
Message-Id: <1178024451.5791.299.camel@localhost.localdomain>
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

On Tue, 2007-05-01 at 16:24 +0400, Vitaly Wool wrote:
> This is a very first shot on the "generic NAND driver" subject as was 
> discussed by Lennert and Thomas.

> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/io.h>

#include <linux/io.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/slab.h>

#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>

Please

> +struct gen_nand_data {
> +	struct nand_chip	chip;
> +	struct mtd_info		mtd;
> +	void __iomem		*io_base;
> +#ifdef CONFIG_MTD_PARTITIONS
> +	int			nr_parts;
> +	struct mtd_partition	*parts;
> +#endif
> +};
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
> +#endif
> +

Hmm, this should be provided by the platform as well.

> +/*
> + * Probe for the NAND device.
> + */
> +static int __init gen_nand_probe(struct platform_device *pdev)
> +{
> +	struct platform_nand_data *pdata = pdev->dev.platform_data;
> +	struct gen_nand_data *data;
> +	int res;
> +
> +	/* Allocate memory for the device structure (and zero it) */
> +	data = kzalloc(sizeof(struct gen_nand_data), GFP_KERNEL);
> +	if (!data) {
> +		dev_err(&pdev->dev, "failed to allocate device structure.\n");
> +		return -ENOMEM;
> +	}
> +
> +	data->io_base = ioremap(pdev->resource[0].start,
> +				pdev->resource[0].end - pdev->resource[0].start + 1);
> +	if (data->io_base == NULL) {
> +		dev_err(&pdev->dev, "ioremap failed\n");
> +		kfree(data);
> +		return -EIO;
> +	}
> +
> +	data->chip.priv = &data;	/* link the private data structures */

	No comments after code please

> +	data->mtd.priv = &data->chip;
> +	data->mtd.owner = THIS_MODULE;
> +
> +	data->chip.IO_ADDR_R = data->io_base;
> +	data->chip.IO_ADDR_W = data->io_base;
> +	if (pdata->ctrl.cmd_ctrl)
> +		data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
> +	if (pdata->ctrl.dev_ready)
> +		data->chip.dev_ready = pdata->ctrl.dev_ready;
> +	if (pdata->ctrl.select_chip)
> +		data->chip.select_chip = pdata->ctrl.select_chip;
> +	if (pdata->ctrl.hwcontrol)
> +		data->chip.ecc.hwctl = pdata->ctrl.hwcontrol;
> +	if (pdata->chip.ecclayout)
> +		data->chip.ecc.layout = pdata->chip.ecclayout;

	The if(..)s are superfluid. 

> +static int __devexit gen_nand_remove(struct platform_device *pdev)
> +{
> +	struct gen_nand_data *data = platform_get_drvdata(pdev);
> +	struct platform_nand_data *pdata = pdev->dev.platform_data;
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	if (data->parts) {
> +		del_mtd_partitions(&data->mtd);
> +		if (data->parts != pdata->chip.partitions)
> +			kfree(data->parts);
> +	} else
> +		del_mtd_device(&data->mtd);
> +#else
> +	del_mtd_device(&data->mtd);
> +#endif

This all except kfree(data->parts) is done in nand_release !

> +	nand_release(&data->mtd);
> +	iounmap(data->io_base);
> +	kfree(data);
> +
> +	return 0;
> +}
> +

Looks good otherwise.

	tglx
