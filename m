Return-Path: <SRS0=6UFQ=ER=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2424C388F9
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 09:39:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E725B206D9
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 09:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ve4UWLe0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E725B206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hp4e4tA6X2x2iXsioRk4cHexCCBAElCjMIAL0OSqrJY=; b=Ve4UWLe0bl7c9gzbAiQtaU9qD
	BUiBKvpJFwRQMTNfDvCK78E8xvf7wLbnersV6/S1DNFkE0twZOwkYImIip9oIRg3lhY43EC/712wL
	OnNbV++Zhwb1acf1sbu+kWhtjTja/vGtPtqmfu43IJQbk7JHX1+FdgjKXpHu8ZfTIUte89GxgWnQO
	gcyk+jszplcS2ogdLK+zlXM6pY6pdRn7h3IE7a8pcgZ+EObB1LhGVUDYju7T1FBLP6woJmuXfyVdT
	3jzFnqlmFNL58thZQUcXf3AJ9oSBe0Z/45sobcgxl/NjAmQCd6Bd0GO1lkPGiBZ+jdhCvNn+hpWId
	nMnWihnMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcmZk-0006Hz-MR; Wed, 11 Nov 2020 09:38:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcmZh-0006H3-F3
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2020 09:37:58 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kcmZe-0002uy-1e; Wed, 11 Nov 2020 10:37:54 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kcmZd-0001Im-99; Wed, 11 Nov 2020 10:37:53 +0100
Date: Wed, 11 Nov 2020 10:37:53 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: mxc: Remove platform data support
Message-ID: <20201111093753.GV29830@pengutronix.de>
References: <20201110121908.19400-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110121908.19400-1-festevam@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:36:40 up 265 days, 17:07, 91 users,  load average: 0.39, 0.43,
 0.39
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_043757_702594_9FC07EE6 
X-CRM114-Status: GOOD (  33.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 10, 2020 at 09:19:08AM -0300, Fabio Estevam wrote:
> i.MX is a devicetree-only platform now and the existing platform data
> support in this driver was only useful for old non-devicetree platforms.
> 
> Get rid of the platform data support since it is no longer used.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Remove more unused structures and inline mxcnd_probe_dt() - Sascha

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
>  drivers/mtd/nand/raw/Kconfig               |  2 +-
>  drivers/mtd/nand/raw/mxc_nand.c            | 75 ++--------------------
>  include/linux/platform_data/mtd-mxc_nand.h | 19 ------
>  3 files changed, 5 insertions(+), 91 deletions(-)
>  delete mode 100644 include/linux/platform_data/mtd-mxc_nand.h
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index cc86d6e4e042..b93e6cd23259 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -292,7 +292,7 @@ config MTD_NAND_VF610_NFC
>  config MTD_NAND_MXC
>  	tristate "Freescale MXC NAND controller"
>  	depends on ARCH_MXC || COMPILE_TEST
> -	depends on HAS_IOMEM
> +	depends on HAS_IOMEM && OF
>  	help
>  	  This enables the driver for the NAND flash controller on the
>  	  MXC processors.
> diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
> index 684c51e5e60d..f896364968d8 100644
> --- a/drivers/mtd/nand/raw/mxc_nand.c
> +++ b/drivers/mtd/nand/raw/mxc_nand.c
> @@ -21,7 +21,6 @@
>  #include <linux/completion.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/platform_data/mtd-mxc_nand.h>
>  
>  #define DRIVER_NAME "mxc_nand"
>  
> @@ -184,7 +183,6 @@ struct mxc_nand_host {
>  	unsigned int		buf_start;
>  
>  	const struct mxc_nand_devtype_data *devtype_data;
> -	struct mxc_nand_platform_data pdata;
>  };
>  
>  static const char * const part_probes[] = {
> @@ -1611,29 +1609,6 @@ static inline int is_imx53_nfc(struct mxc_nand_host *host)
>  	return host->devtype_data == &imx53_nand_devtype_data;
>  }
>  
> -static const struct platform_device_id mxcnd_devtype[] = {
> -	{
> -		.name = "imx21-nand",
> -		.driver_data = (kernel_ulong_t) &imx21_nand_devtype_data,
> -	}, {
> -		.name = "imx27-nand",
> -		.driver_data = (kernel_ulong_t) &imx27_nand_devtype_data,
> -	}, {
> -		.name = "imx25-nand",
> -		.driver_data = (kernel_ulong_t) &imx25_nand_devtype_data,
> -	}, {
> -		.name = "imx51-nand",
> -		.driver_data = (kernel_ulong_t) &imx51_nand_devtype_data,
> -	}, {
> -		.name = "imx53-nand",
> -		.driver_data = (kernel_ulong_t) &imx53_nand_devtype_data,
> -	}, {
> -		/* sentinel */
> -	}
> -};
> -MODULE_DEVICE_TABLE(platform, mxcnd_devtype);
> -
> -#ifdef CONFIG_OF
>  static const struct of_device_id mxcnd_dt_ids[] = {
>  	{
>  		.compatible = "fsl,imx21-nand",
> @@ -1655,26 +1630,6 @@ static const struct of_device_id mxcnd_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
>  
> -static int mxcnd_probe_dt(struct mxc_nand_host *host)
> -{
> -	struct device_node *np = host->dev->of_node;
> -	const struct of_device_id *of_id =
> -		of_match_device(mxcnd_dt_ids, host->dev);
> -
> -	if (!np)
> -		return 1;
> -
> -	host->devtype_data = of_id->data;
> -
> -	return 0;
> -}
> -#else
> -static int mxcnd_probe_dt(struct mxc_nand_host *host)
> -{
> -	return 1;
> -}
> -#endif
> -
>  static int mxcnd_attach_chip(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -1759,6 +1714,7 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
>  
>  static int mxcnd_probe(struct platform_device *pdev)
>  {
> +	const struct of_device_id *of_id;
>  	struct nand_chip *this;
>  	struct mtd_info *mtd;
>  	struct mxc_nand_host *host;
> @@ -1800,20 +1756,8 @@ static int mxcnd_probe(struct platform_device *pdev)
>  	if (IS_ERR(host->clk))
>  		return PTR_ERR(host->clk);
>  
> -	err = mxcnd_probe_dt(host);
> -	if (err > 0) {
> -		struct mxc_nand_platform_data *pdata =
> -					dev_get_platdata(&pdev->dev);
> -		if (pdata) {
> -			host->pdata = *pdata;
> -			host->devtype_data = (struct mxc_nand_devtype_data *)
> -						pdev->id_entry->driver_data;
> -		} else {
> -			err = -ENODEV;
> -		}
> -	}
> -	if (err < 0)
> -		return err;
> +	of_id = of_match_device(mxcnd_dt_ids, host->dev);
> +	host->devtype_data = of_id->data;
>  
>  	if (!host->devtype_data->setup_interface)
>  		this->options |= NAND_KEEP_TIMINGS;
> @@ -1843,14 +1787,6 @@ static int mxcnd_probe(struct platform_device *pdev)
>  
>  	this->legacy.select_chip = host->devtype_data->select_chip;
>  
> -	/* NAND bus width determines access functions used by upper layer */
> -	if (host->pdata.width == 2)
> -		this->options |= NAND_BUSWIDTH_16;
> -
> -	/* update flash based bbt */
> -	if (host->pdata.flash_bbt)
> -		this->bbt_options |= NAND_BBT_USE_FLASH;
> -
>  	init_completion(&host->op_completion);
>  
>  	host->irq = platform_get_irq(pdev, 0);
> @@ -1891,9 +1827,7 @@ static int mxcnd_probe(struct platform_device *pdev)
>  		goto escan;
>  
>  	/* Register the partitions */
> -	err = mtd_device_parse_register(mtd, part_probes, NULL,
> -					host->pdata.parts,
> -					host->pdata.nr_parts);
> +	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
>  	if (err)
>  		goto cleanup_nand;
>  
> @@ -1930,7 +1864,6 @@ static struct platform_driver mxcnd_driver = {
>  		   .name = DRIVER_NAME,
>  		   .of_match_table = of_match_ptr(mxcnd_dt_ids),
>  	},
> -	.id_table = mxcnd_devtype,
>  	.probe = mxcnd_probe,
>  	.remove = mxcnd_remove,
>  };
> diff --git a/include/linux/platform_data/mtd-mxc_nand.h b/include/linux/platform_data/mtd-mxc_nand.h
> deleted file mode 100644
> index d1230030c6db..000000000000
> --- a/include/linux/platform_data/mtd-mxc_nand.h
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Copyright 2004-2007 Freescale Semiconductor, Inc. All Rights Reserved.
> - * Copyright 2008 Sascha Hauer, kernel@pengutronix.de
> - */
> -
> -#ifndef __ASM_ARCH_NAND_H
> -#define __ASM_ARCH_NAND_H
> -
> -#include <linux/mtd/partitions.h>
> -
> -struct mxc_nand_platform_data {
> -	unsigned int width;	/* data bus width in bytes */
> -	unsigned int hw_ecc:1;	/* 0 if suppress hardware ECC */
> -	unsigned int flash_bbt:1; /* set to 1 to use a flash based bbt */
> -	struct mtd_partition *parts;	/* partition table */
> -	int nr_parts;			/* size of parts */
> -};
> -#endif /* __ASM_ARCH_NAND_H */
> -- 
> 2.17.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
