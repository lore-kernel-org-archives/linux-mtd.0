Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73975C4363A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 13:10:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 055D820848
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 13:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7tYUiZ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 055D820848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bBBxyJw/+XAWond1LSg9BaDtRzDis59NPEpTL2qcqwQ=; b=q7tYUiZ1qWzF2+UoNMCZUsz9K
	nCmy0yGXueuD4rabk3OWIkFlmgj3VobdSTgOS5MRtJpgOFHth0tlYn5TUu4tyMVrQ333/p7WD4F4s
	rXeUHnSCzFO2O1sERqOeST5sxjcaT03Xpkq6W1HP8s+JUzt62YeeCr+1tlXIPn60reFeaQw6DxZeZ
	KrOocpmKCTJ5f9J3ELv7bZ8Yk3FHIBDsey8X0drtwRXC4By+O9IU/QeqihALtoAuiQezTZ5M1FxUB
	T0UxG+eTICML8NanmxOoutaEyzkgJpEV4J7CnXuORSK/sdSeNaSWuWnsQ/9AvohFA3zhvh6AO1pRf
	8ePmGxh3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPQF1-0007LW-F9; Mon, 05 Oct 2020 13:09:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPQEy-0007KQ-8I
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 13:09:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DCC4A299698;
 Mon,  5 Oct 2020 14:09:17 +0100 (BST)
Date: Mon, 5 Oct 2020 15:09:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manuel Dipolt <mdipolt@robart.cc>
Subject: Re: [PATCH -next] mtd: sunxi-nand: add dma support for allwinner h3
Message-ID: <20201005150912.65619ca2@collabora.com>
In-Reply-To: <1203329103.515411.1601900419875.JavaMail.zimbra@robart.cc>
References: <1203329103.515411.1601900419875.JavaMail.zimbra@robart.cc>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_090920_522635_F1F58C47 
X-CRM114-Status: GOOD (  34.81  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>, bbrezillon@kernel.org,
 linux-mtd <linux-mtd@lists.infradead.org>, maxime <maxime@cerno.tech>,
 miquel raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 14:20:19 +0200 (CEST)
Manuel Dipolt <mdipolt@robart.cc> wrote:

> The Allwinner H3 soc is using different dma mode,
> see old sunxi drivers https://github.com/allwinner-zh/linux-3.4-sunxi/tree/master/modules/nand
> 
> Added support for it and a compatible option sun8i-h3-nand-controller,
> which using sunxi_nfc_h3_caps with a new dma_option field, which is set to 0 for the H3.

Just a drive-by review.

> 
> 
> 
> Signed-off-by: Manuel Dipolt <manuel.dipolt@robart.cc>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 193 +++++++++++++++++++++---------
>  1 file changed, 137 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 2a7ca3072f35..33f910599275 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -51,6 +51,7 @@
>  #define NFC_REG_USER_DATA(x)	(0x0050 + ((x) * 4))
>  #define NFC_REG_SPARE_AREA	0x00A0
>  #define NFC_REG_PAT_ID		0x00A4
> +#define NFC_REG_MDMA_ADDR	0x00C0
>  #define NFC_REG_MDMA_CNT	0x00C4
>  #define NFC_RAM0_BASE		0x0400
>  #define NFC_RAM1_BASE		0x0800
> @@ -207,12 +208,14 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>   * NAND Controller capabilities structure: stores NAND controller capabilities
>   * for distinction between compatible strings.
>   *
> + * @dma_mode:			use different dma method, required for chips like H3
>   * @extra_mbus_conf:	Contrary to A10, A10s and A13, accessing internal RAM
>   *			through MBUS on A23/A33 needs extra configuration.
>   * @reg_io_data:	I/O data register
>   * @dma_maxburst:	DMA maxburst
>   */
>  struct sunxi_nfc_caps {
> +	unsigned int dma_mode;

Maybe:

	bool has_mdma;

>  	bool extra_mbus_conf;
>  	unsigned int reg_io_data;
>  	unsigned int dma_maxburst;
> @@ -263,9 +266,12 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
>  	if (!(ien & st))
>  		return IRQ_NONE;
>  
> -	if ((ien & st) == ien)
> +	if ((ien & st) == NFC_CMD_INT_ENABLE)        
>  		complete(&nfc->complete);
>  
> +	if ((ien & st) == NFC_DMA_INT_ENABLE)
> +		complete(&nfc->complete);	
> +

If you need to wait on the DMA event, pass the flag to
sunxi_nfc_wait_events().

>  	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
>  	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
>  
> @@ -912,15 +918,31 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
>  	int ret, i, raw_mode = 0;
>  	struct scatterlist sg;
>  	u32 status;
> -
> +	int chunksize;
> +	__u32 mem_addr;
> +    
>  	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
>  	if (ret)
>  		return ret;
>  
> -	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
> -				       DMA_FROM_DEVICE, &sg);
> -	if (ret)
> -		return ret;
> +	if (nfc->caps->dma_mode == 1) {
> +		ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
> +						DMA_FROM_DEVICE, &sg);
> +		if (ret)
> +			return ret;
> +	} else {
> +		chunksize = ecc->size;	
> +		mem_addr = (__u32)dma_map_single(nfc->dev, (void *)buf, nchunks * chunksize, DMA_DEV_TO_MEM);
> +		if (dma_mapping_error(nfc->dev, mem_addr)) {		
> +			dev_err(nfc->dev, "DMA mapping error\n");
> +		}
> +
> +		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD, nfc->regs + NFC_REG_CTL);
> +		writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
> +		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
> +		writel(mem_addr, nfc->regs + NFC_REG_MDMA_ADDR);
> +		writel(chunksize, nfc->regs + NFC_REG_CNT);

This could probably go in an sunxi_nfc_mdma_op_prepare() helper.

> +	}
>  
>  	sunxi_nfc_hw_ecc_enable(nand);
>  	sunxi_nfc_randomizer_config(nand, page, false);
> @@ -929,19 +951,32 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
>  	writel((NAND_CMD_RNDOUTSTART << 16) | (NAND_CMD_RNDOUT << 8) |
>  	       NAND_CMD_READSTART, nfc->regs + NFC_REG_RCMD_SET);
>  
> -	dma_async_issue_pending(nfc->dmac);
> +	if (nfc->caps->dma_mode == 1) {
> +		dma_async_issue_pending(nfc->dmac);
>  
> -	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
> -	       nfc->regs + NFC_REG_CMD);
> +		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
> +	    	   nfc->regs + NFC_REG_CMD);
>  
> -	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
> -	if (ret)
> -		dmaengine_terminate_all(nfc->dmac);
> +		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
> +
> +		if (ret)
> +			dmaengine_terminate_all(nfc->dmac);
> +	} else {
> +		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
> +	    	   nfc->regs + NFC_REG_CMD);
> +
> +		ret = sunxi_nfc_wait_events(nfc, NFC_DMA_INT_FLAG, false, 0);
> +	}

How about:

	u32 wait = NFC_CMD_INT_FLAG;

	if (nfc->caps->has_mdma)
		wait |=  NFC_DMA_INT_FLAG;
	else
		dma_async_issue_pending(nfc->dmac);

	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
	       nfc->regs + NFC_REG_CMD);

	ret = sunxi_nfc_wait_events(nfc, NFC_DMA_INT_FLAG, false, 0);
	if (ret && !nfc->caps->has_mdma)
		dmaengine_terminate_all(nfc->dmac);


>  
>  	sunxi_nfc_randomizer_disable(nand);
>  	sunxi_nfc_hw_ecc_disable(nand);
>  
> -	sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg);
> +	if (nfc->caps->dma_mode == 1) {
> +		sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg);
> +	} else {
> +		dma_unmap_single(nfc->dev, mem_addr, nchunks * chunksize, DMA_DEV_TO_MEM);
> +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,  nfc->regs + NFC_REG_CTL);

I'd suggest moving that to an sunxi_nfc_mdma_op_cleanup() helper. BTW,
why do you need to reset the RAM method here?

> +	}
>  
>  	if (ret)
>  		return ret;
> @@ -1128,7 +1163,7 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
>  					  int oob_required, int page)
>  {
>  	int ret;
> -
> +        
>  	sunxi_nfc_select_chip(nand, nand->cur_cs);
>  
>  	nand_read_page_op(nand, page, 0, NULL, 0);
> @@ -1276,19 +1311,35 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
>  	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
>  	struct nand_ecc_ctrl *ecc = &nand->ecc;
>  	struct scatterlist sg;
> -	int ret, i;
> -
> +	int ret, i, nchunks, chunksize;
> +	__u32 mem_addr;
> +    
>  	sunxi_nfc_select_chip(nand, nand->cur_cs);
>  
>  	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
>  	if (ret)
>  		return ret;
>  
> -	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
> -				       DMA_TO_DEVICE, &sg);
> -	if (ret)
> -		goto pio_fallback;
> +	if (nfc->caps->dma_mode == 1) {
> +		ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
> +						DMA_TO_DEVICE, &sg);
> +		if (ret)
> +			goto pio_fallback;
> +	} else {
> +		chunksize = ecc->size;
> +		nchunks = ecc->steps;
> +		mem_addr = (__u32)dma_map_single(nfc->dev, (void *)buf, nchunks * chunksize, DMA_MEM_TO_DEV);
> +		if (dma_mapping_error(nfc->dev, mem_addr)) {		
> +			dev_err(nfc->dev, "DMA mapping error\n");
> +		}
>  
> +		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD, nfc->regs + NFC_REG_CTL);
> +		writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
> +		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
> +		writel(mem_addr, nfc->regs + NFC_REG_MDMA_ADDR);
> +		writel(chunksize, nfc->regs + NFC_REG_CNT);
> +	}
> +	
>  	for (i = 0; i < ecc->steps; i++) {
>  		const u8 *oob = nand->oob_poi + (i * (ecc->bytes + 4));
>  
> @@ -1304,20 +1355,33 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
>  	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
>  	       nfc->regs + NFC_REG_WCMD_SET);
>  
> -	dma_async_issue_pending(nfc->dmac);
> +	if (nfc->caps->dma_mode == 1) {
> +		dma_async_issue_pending(nfc->dmac);
> +
> +		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
> +			NFC_DATA_TRANS | NFC_ACCESS_DIR,
> +			nfc->regs + NFC_REG_CMD);
>  
> -	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
> +		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
> +		if (ret)
> +			dmaengine_terminate_all(nfc->dmac);
> +	} else {
> +		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
>  	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
>  	       nfc->regs + NFC_REG_CMD);
>  
> -	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
> -	if (ret)
> -		dmaengine_terminate_all(nfc->dmac);
> +		ret = sunxi_nfc_wait_events(nfc, NFC_DMA_INT_FLAG, false, 0);
> +	}
>  
>  	sunxi_nfc_randomizer_disable(nand);
>  	sunxi_nfc_hw_ecc_disable(nand);
>  
> -	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
> +	if (nfc->caps->dma_mode == 1) {
> +		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
> +	} else {
> +		dma_unmap_single(nfc->dev, mem_addr, nchunks * chunksize, DMA_MEM_TO_DEV);
> +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,  nfc->regs + NFC_REG_CTL);
> +	}
>  
>  	if (ret)
>  		return ret;
> @@ -1695,7 +1759,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>  	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
>  	ecc->priv = data;
>  
> -	if (nfc->dmac) {
> +	if (nfc->dmac || nfc->caps->dma_mode == 0) {
>  		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
>  		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
>  		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
> @@ -2132,38 +2196,43 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_ahb_reset_reassert;
>  
> -	nfc->dmac = dma_request_chan(dev, "rxtx");
> -	if (IS_ERR(nfc->dmac)) {
> -		ret = PTR_ERR(nfc->dmac);
> -		if (ret == -EPROBE_DEFER)
> -			goto out_ahb_reset_reassert;
> -
> -		/* Ignore errors to fall back to PIO mode */
> -		dev_warn(dev, "failed to request rxtx DMA channel: %d\n", ret);
> -		nfc->dmac = NULL;
> +	if(nfc->caps->dma_mode == 0) {
> +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL);

This shouldn't be done in the probe helper.

> +        nfc->dmac = NULL;

No need to set that field to NULL, the nfc object is allocated with
kzalloc().

>  	} else {
> -		struct dma_slave_config dmac_cfg = { };
> -
> -		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
> -		dmac_cfg.dst_addr = dmac_cfg.src_addr;
> -		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
> -		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
> -		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
> -		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
> -
> -		if (nfc->caps->extra_mbus_conf)
> -			writel(readl(nfc->regs + NFC_REG_CTL) |
> -			       NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL);
> +		nfc->dmac = dma_request_chan(dev, "rxtx");
> +		if (IS_ERR(nfc->dmac)) {
> +			ret = PTR_ERR(nfc->dmac);
> +			if (ret == -EPROBE_DEFER)
> +				goto out_ahb_reset_reassert;
> +
> +			/* Ignore errors to fall back to PIO mode */
> +			dev_warn(dev, "failed to request rxtx DMA channel: %d\n", ret);
> +			nfc->dmac = NULL;
> +		} else {
> +			struct dma_slave_config dmac_cfg = { };
> +
> +			dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
> +			dmac_cfg.dst_addr = dmac_cfg.src_addr;
> +			dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +			dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
> +			dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
> +			dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
> +			dmaengine_slave_config(nfc->dmac, &dmac_cfg);
> +
> +			if (nfc->caps->extra_mbus_conf)
> +				writel(readl(nfc->regs + NFC_REG_CTL) |
> +					NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL);
> +		}

Can you move that to a sunxi_nfc_dma_init() helper?

>  	}
> +	
> +    platform_set_drvdata(pdev, nfc);
>  
> -	platform_set_drvdata(pdev, nfc);
> -
> -	ret = sunxi_nand_chips_init(dev, nfc);
> -	if (ret) {
> -		dev_err(dev, "failed to init nand chips\n");
> -		goto out_release_dmac;
> -	}
> +    ret = sunxi_nand_chips_init(dev, nfc);
> +    if (ret) {
> +        dev_err(dev, "failed to init nand chips\n");
> +        goto out_release_dmac;
> +    }	
>  
>  	return 0;
>  
> @@ -2197,16 +2266,24 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
>  }
>  
>  static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
> +	.dma_mode = 1,
>  	.reg_io_data = NFC_REG_A10_IO_DATA,
>  	.dma_maxburst = 4,
>  };
>  
>  static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
> +	.dma_mode = 1,

I think the A23 also has an MDMA block.

>  	.extra_mbus_conf = true,
>  	.reg_io_data = NFC_REG_A23_IO_DATA,
>  	.dma_maxburst = 8,
>  };
>  
> +static const struct sunxi_nfc_caps sunxi_nfc_h3_caps = {
> +	.dma_mode = 0,
> +	.reg_io_data = NFC_REG_A23_IO_DATA,
> +	.dma_maxburst = 8,

You don't need to set that field if you use the MDMA.

> +};
> +
>  static const struct of_device_id sunxi_nfc_ids[] = {
>  	{
>  		.compatible = "allwinner,sun4i-a10-nand",
> @@ -2216,6 +2293,10 @@ static const struct of_device_id sunxi_nfc_ids[] = {
>  		.compatible = "allwinner,sun8i-a23-nand-controller",
>  		.data = &sunxi_nfc_a23_caps,
>  	},
> +	{
> +		.compatible = "allwinner,sun8i-h3-nand-controller",
> +		.data = &sunxi_nfc_h3_caps,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
