Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948CEC38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 12:12:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BBC32075E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 12:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bTe5hVgo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BBC32075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jD+8H9klwO8+diQK/ICwSkzsoJpoYPmDHASCYjWxWk=; b=bTe5hVgob/UArG
	w8OwhZqk1fWJRRtS2B+Lj+yurROsRsJss6D+tMEya/DhMWQIFcQ/jmC/De+qkZQMiY6mQKjh+IMFu
	UJPj3HHkChx/8z775ZuRYbf/KoFN6Ix3whR2AnjJ8eF87SD2auaBa9cM9xtSiWJ2MdHoGllcuLmnz
	wUoal5RcIX1VODV69kBDLyBgwRmD/w9A9dyA08lCfdHeAvgG0tcMEVN1NFjGt9toMWtsVxhdItqur
	5yz5C9tqWN8V5wn2/plavMk7UHn8DSNI1vfzgA2AoZW1jb+CgEFYCa/guGEaAXHrgdIKxHK4Fh7s5
	5RLaIgi9gsREthzBJBYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWfNg-0000eX-Bj; Thu, 07 May 2020 12:12:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWfNc-0000dZ-Tm
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 12:11:58 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8AA152A0342;
 Thu,  7 May 2020 13:11:55 +0100 (BST)
Date: Thu, 7 May 2020 14:11:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 03/13] mtd: rawnand: Rename a NAND chip option
Message-ID: <20200507141152.25c980cd@collabora.com>
In-Reply-To: <20200507105241.14299-4-miquel.raynal@bootlin.com>
References: <20200507105241.14299-1-miquel.raynal@bootlin.com>
 <20200507105241.14299-4-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_051157_217379_F69FD6ED 
X-CRM114-Status: GOOD (  22.85  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  7 May 2020 12:52:31 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> NAND controller drivers can set the NAND_USE_BOUNCE_BUFFER flag to a
> chip 'option' field. With this flag, the core is responsible of
> providing DMA-able buffers.
> 
> The current behavior is to not force the use of a bounce buffer when
> the core thinks this is not needed. So in the end the name is a bit
> misleading, because in theory we will always have a DMA buffer but in
> practice it will not always be a bounce buffer.
> 
> Rename this flag NAND_USES_DMA to be more accurate.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c     | 2 +-
>  drivers/mtd/nand/raw/denali.c                | 2 +-
>  drivers/mtd/nand/raw/meson_nand.c            | 2 +-
>  drivers/mtd/nand/raw/mtk_nand.c              | 2 +-
>  drivers/mtd/nand/raw/nand_base.c             | 4 ++--
>  drivers/mtd/nand/raw/qcom_nandc.c            | 2 +-
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c       | 2 +-
>  drivers/mtd/nand/raw/sunxi_nand.c            | 2 +-
>  drivers/mtd/nand/raw/tango_nand.c            | 2 +-
>  drivers/mtd/nand/raw/tegra_nand.c            | 2 +-
>  include/linux/mtd/rawnand.h                  | 2 +-
>  12 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 3ba17a98df4d..46a3724a788e 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1494,7 +1494,7 @@ static void atmel_nand_init(struct atmel_nand_controller *nc,
>  	 * suitable for DMA.
>  	 */
>  	if (nc->dmac)
> -		chip->options |= NAND_USE_BOUNCE_BUFFER;
> +		chip->options |= NAND_USES_DMA;
>  
>  	/* Default to HW ECC if pmecc is available. */
>  	if (nc->pmecc)
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index e4e3ceeac38f..949f50e5b817 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -2577,7 +2577,7 @@ static int brcmnand_attach_chip(struct nand_chip *chip)
>  	 * to/from, and have nand_base pass us a bounce buffer instead, as
>  	 * needed.
>  	 */
> -	chip->options |= NAND_USE_BOUNCE_BUFFER;
> +	chip->options |= NAND_USES_DMA;
>  
>  	if (chip->bbt_options & NAND_BBT_USE_FLASH)
>  		chip->bbt_options |= NAND_BBT_NO_OOB;
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index 6a6c919b2569..d40f9c8e2241 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1203,7 +1203,7 @@ int denali_chip_init(struct denali_controller *denali,
>  		mtd->name = "denali-nand";
>  
>  	if (denali->dma_avail) {
> -		chip->options |= NAND_USE_BOUNCE_BUFFER;
> +		chip->options |= NAND_USES_DMA;
>  		chip->buf_align = 16;
>  	}
>  
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index e961f7bebf0a..3f376471f3f7 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1269,7 +1269,7 @@ meson_nfc_nand_chip_init(struct device *dev,
>  	nand_set_flash_node(nand, np);
>  	nand_set_controller_data(nand, nfc);
>  
> -	nand->options |= NAND_USE_BOUNCE_BUFFER;
> +	nand->options |= NAND_USES_DMA;
>  	mtd = nand_to_mtd(nand);
>  	mtd->owner = THIS_MODULE;
>  	mtd->dev.parent = dev;
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index ef149e8b26d0..e7ec30e784fd 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1380,7 +1380,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>  	nand_set_flash_node(nand, np);
>  	nand_set_controller_data(nand, nfc);
>  
> -	nand->options |= NAND_USE_BOUNCE_BUFFER | NAND_SUBPAGE_READ;
> +	nand->options |= NAND_USES_DMA | NAND_SUBPAGE_READ;
>  	nand->legacy.dev_ready = mtk_nfc_dev_ready;
>  	nand->legacy.select_chip = mtk_nfc_select_chip;
>  	nand->legacy.write_byte = mtk_nfc_write_byte;
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 27ed6189f227..82f7544f58b7 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -3191,7 +3191,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
>  
>  		if (!aligned)
>  			use_bufpoi = 1;
> -		else if (chip->options & NAND_USE_BOUNCE_BUFFER)
> +		else if (chip->options & NAND_USES_DMA)
>  			use_bufpoi = !virt_addr_valid(buf) ||
>  				     !IS_ALIGNED((unsigned long)buf,
>  						 chip->buf_align);
> @@ -4017,7 +4017,7 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
>  
>  		if (part_pagewr)
>  			use_bufpoi = 1;
> -		else if (chip->options & NAND_USE_BOUNCE_BUFFER)
> +		else if (chip->options & NAND_USES_DMA)
>  			use_bufpoi = !virt_addr_valid(buf) ||
>  				     !IS_ALIGNED((unsigned long)buf,
>  						 chip->buf_align);
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 5b11c7061497..9ab22c5d4166 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2836,7 +2836,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
>  	chip->legacy.block_markbad	= qcom_nandc_block_markbad;
>  
>  	chip->controller = &nandc->controller;
> -	chip->options |= NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER |
> +	chip->options |= NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA |
>  			 NAND_SKIP_BBTSCAN;
>  
>  	/* set up initial status value */
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 46b7d04e2c87..c5fde09e0175 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -1987,7 +1987,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>  
>  	chip->controller = &fmc2->base;
>  	chip->options |= NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
> -			 NAND_USE_BOUNCE_BUFFER;
> +			 NAND_USES_DMA;
>  
>  	/* Default ECC settings */
>  	chip->ecc.mode = NAND_ECC_HW;
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 18ac0b36abfa..26d862213cac 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1698,7 +1698,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>  		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
>  		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
>  		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
> -		nand->options |= NAND_USE_BOUNCE_BUFFER;
> +		nand->options |= NAND_USES_DMA;
>  	} else {
>  		ecc->read_page = sunxi_nfc_hw_ecc_read_page;
>  		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage;
> diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
> index 9acf2de37ee0..b92de603e6db 100644
> --- a/drivers/mtd/nand/raw/tango_nand.c
> +++ b/drivers/mtd/nand/raw/tango_nand.c
> @@ -568,7 +568,7 @@ static int chip_init(struct device *dev, struct device_node *np)
>  	chip->legacy.select_chip = tango_select_chip;
>  	chip->legacy.cmd_ctrl = tango_cmd_ctrl;
>  	chip->legacy.dev_ready = tango_dev_ready;
> -	chip->options = NAND_USE_BOUNCE_BUFFER |
> +	chip->options = NAND_USES_DMA |
>  			NAND_NO_SUBPAGE_WRITE |
>  			NAND_WAIT_TCCS;
>  	chip->controller = &nfc->hw;
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
> index 6a255ba0f288..f9d046b2cd3b 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -1115,7 +1115,7 @@ static int tegra_nand_chips_init(struct device *dev,
>  	if (!mtd->name)
>  		mtd->name = "tegra_nand";
>  
> -	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER;
> +	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA;
>  
>  	ret = nand_scan(chip, 1);
>  	if (ret)
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index e70fea67030b..d1f5c5258e35 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -185,7 +185,7 @@ enum nand_ecc_algo {
>   * This option could be defined by controller drivers to protect against
>   * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
>   */
> -#define NAND_USE_BOUNCE_BUFFER	BIT(20)
> +#define NAND_USES_DMA		BIT(20)
>  
>  /*
>   * In case your controller is implementing ->legacy.cmd_ctrl() and is relying


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
