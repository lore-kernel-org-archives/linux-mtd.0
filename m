Return-Path: <SRS0=XyTp=SQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99299C282CE
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 09:06:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670AD20850
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 09:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BTDt54px"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 670AD20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVKOSLF02Xi3Y3BoJ9avcbBZaW//OgACbxKIBDRpkbw=; b=BTDt54pxzMLfUa
	yX7xeMnotNG23SCN/eVj1rimXQuIegiNu/OZmjcbj8O13VjPc0ucU0EEhVF1aILffGZGMuzg1eefm
	r+VWXrxWx+28LfgVXNLOmIx9yVv9E+hLi/NP6rEPV45cUNNIosSZf41KwAvjH5QNaFnligt1GxDuu
	W3QywsGkS45w16ppgxfENEXNdQMsc/2f5jaY4WnDPNlA7Sie8Im3tLuOGSYjxC2uWaWJYzSFAzTSW
	ST9ViUwo/I22dI552QieJFRtJiEdyZxQORe6dpJTJHm4C5Jumpo40cxijrTBUQBA6j6tsDdz6GjDW
	eAnum/vfDzaAooepC49w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFb5O-0004KN-Pa; Sun, 14 Apr 2019 09:06:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFb5H-0004Ez-1n; Sun, 14 Apr 2019 09:05:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4F9D4263959;
 Sun, 14 Apr 2019 10:05:53 +0100 (BST)
Date: Sun, 14 Apr 2019 11:05:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Message-ID: <20190414110549.5c91829d@collabora.com>
In-Reply-To: <20190404162111.22618-3-miquel.raynal@bootlin.com>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_020555_357354_DEE262FC 
X-CRM114-Status: GOOD (  30.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  4 Apr 2019 18:21:10 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Allwinner NAND controllers can make use of DMA to enhance the I/O
> throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> is a bit different than with the older SoCs, hence the introduction of
> a new compatible to handle:
> * the differences between register offsets,
> * the burst length change from 4 to minimum 8,
> * drive SRAM accesses through the AHB bus instead of the MBUS.

Hm, now that you know MBUS accesses are working fine (IIRC, that's what
you used for the SPL DMA-based implementation), why not directly use
MBUS accesses on A33? I mean, it's likely faster than going through
the DMA engine (which is shared by several IPs), and AFAIR, the MBUS
setup is pretty simple.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 75 ++++++++++++++++++++++++++++---
>  1 file changed, 68 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 4282bc477761..49cd5067adaa 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -42,7 +42,8 @@
>  #define NFC_REG_CMD		0x0024
>  #define NFC_REG_RCMD_SET	0x0028
>  #define NFC_REG_WCMD_SET	0x002C
> -#define NFC_REG_IO_DATA		0x0030
> +#define NFC_REG_A10_IO_DATA	0x0030
> +#define NFC_REG_A33_IO_DATA	0x0300
>  #define NFC_REG_ECC_CTL		0x0034
>  #define NFC_REG_ECC_ST		0x0038
>  #define NFC_REG_DEBUG		0x003C
> @@ -200,6 +201,22 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>  	return container_of(nand, struct sunxi_nand_chip, nand);
>  }
>  
> +/*
> + * NAND Controller capabilities structure: stores NAND controller capabilities
> + * for distinction between compatible strings.
> + *
> + * @sram_through_ahb:	On A33, we choose to access the internal RAM through AHB
> + *                      instead of MBUS (less configuration). A10+ use the MBUS
> + *                      but no extra configuration is needed.
> + * @reg_io_data:	I/O data register
> + * @dma_maxburst:	DMA maxburst
> + */
> +struct sunxi_nfc_caps {
> +	bool sram_through_ahb;
> +	unsigned int reg_io_data;
> +	unsigned int dma_maxburst;
> +};
> +
>  /**
>   * struct sunxi_nfc - stores sunxi NAND controller information
>   *
> @@ -228,6 +245,7 @@ struct sunxi_nfc {
>  	struct list_head chips;
>  	struct completion complete;
>  	struct dma_chan *dmac;
> +	const struct sunxi_nfc_caps *caps;
>  };
>  
>  static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
> @@ -350,10 +368,29 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
>  		goto err_unmap_buf;
>  	}
>  
> -	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
> -	       nfc->regs + NFC_REG_CTL);
> +	/*
> +	 * On A33, we suppose the "internal RAM" (p.12 of the user manual)
> +	 * refers to the NAND controller's internal SRAM. This memory is mapped
> +	 * and so is accessible from the AHB. It seems that it can also be
> +	 * accessed by the MBUS. MBUS accesses are mandatory when using the
> +	 * internal DMA instead of the external DMA engine.
> +	 *
> +	 * During DMA I/O operation, either we access this memory from the AHB
> +	 * by clearing the NFC_RAM_METHOD bit, or we set the bit and use the
> +	 * MBUS. In this case, we should also configure the MBUS DMA length
> +	 * NFC_REG_MDMA_CNT(0xC4) to be chunksize * nchunks. NAND I/O over MBUS
> +	 * are also limited to 32kiB pages.
> +	 */
> +	if (nfc->caps->sram_through_ahb)
> +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> +		       nfc->regs + NFC_REG_CTL);
> +	else
> +		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
> +		       nfc->regs + NFC_REG_CTL);
> +
>  	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
>  	writel(chunksize, nfc->regs + NFC_REG_CNT);
> +
>  	dmat = dmaengine_submit(dmad);
>  
>  	ret = dma_submit_error(dmat);
> @@ -2088,6 +2125,12 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  		goto out_mod_clk_unprepare;
>  	}
>  
> +	nfc->caps = of_device_get_match_data(&pdev->dev);
> +	if (!nfc->caps) {
> +		ret = -EINVAL;
> +		goto out_ahb_reset_reassert;
> +	}
> +
>  	ret = sunxi_nfc_rst(nfc);
>  	if (ret)
>  		goto out_ahb_reset_reassert;
> @@ -2102,12 +2145,12 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  	if (nfc->dmac) {
>  		struct dma_slave_config dmac_cfg = { };
>  
> -		dmac_cfg.src_addr = r->start + NFC_REG_IO_DATA;
> +		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
>  		dmac_cfg.dst_addr = dmac_cfg.src_addr;
>  		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>  		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
> -		dmac_cfg.src_maxburst = 4;
> -		dmac_cfg.dst_maxburst = 4;
> +		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
> +		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
>  		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
>  	} else {
>  		dev_warn(dev, "failed to request rxtx DMA channel\n");
> @@ -2152,8 +2195,26 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
> +	.reg_io_data = NFC_REG_A10_IO_DATA,
> +	.dma_maxburst = 4,
> +};
> +
> +static const struct sunxi_nfc_caps sunxi_nfc_a33_caps = {
> +	.sram_through_ahb = true,
> +	.reg_io_data = NFC_REG_A33_IO_DATA,
> +	.dma_maxburst = 8,
> +};
> +
>  static const struct of_device_id sunxi_nfc_ids[] = {
> -	{ .compatible = "allwinner,sun4i-a10-nand" },
> +	{
> +		.compatible = "allwinner,sun4i-a10-nand",
> +		.data = &sunxi_nfc_a10_caps,
> +	},
> +	{
> +		.compatible = "allwinner,sun8i-a33-nand-controller",
> +		.data = &sunxi_nfc_a33_caps,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
