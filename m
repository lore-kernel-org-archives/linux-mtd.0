Return-Path: <SRS0=8c9b=DP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E427C4363A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 15:37:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0157F20658
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 15:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1DCLDztZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0157F20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XpAlqSEu6cUR+w7OrDSIPlGgE7l9Fb0ErY2kTnTN3oQ=; b=1DCLDztZayd8d1Bu4LQqDsQPu
	Cj/oc1/mKNv6hl+SXM6/0Fe9O2iCvkb56jdXgLEc0av1dla7rP5jXRf3A+L6hohCjl3EZEENLoTgL
	n74TzL9s7sRwsdfK6tJkqVefUNalxI6f44nF/NEAO5sJaiNEa3dcFyBdp8Se6+lVLnZH1sRMI4sjd
	kmdUI40mDoOKhz/XcogT+adMEYz6LpKjgj4ImvUvLV+e4IB6oS1rvsNM6b5ciWggApJVsxoe8QQb4
	cv8JHIZtWuk4ARmyMxe2YA9fkQ3ZQWNWv3ofF9ySRN3Eo0ZOmW1XzmEqMFZLOrvdwajZWzme4b+Bx
	HtAO7ryjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQXxs-0008M7-JW; Thu, 08 Oct 2020 15:36:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQXxj-0008IN-4U
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2020 15:36:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D340B29D7CC;
 Thu,  8 Oct 2020 16:36:08 +0100 (BST)
Date: Thu, 8 Oct 2020 17:36:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manuel Dipolt <mdipolt@robart.cc>
Subject: Re: [PATCH v5] mtd: sunxi-nand: enable mdma support for allwinner a23
Message-ID: <20201008173606.1b0cda95@collabora.com>
In-Reply-To: <610636841.983122.1602169127227.JavaMail.zimbra@robart.cc>
References: <610636841.983122.1602169127227.JavaMail.zimbra@robart.cc>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_113611_340022_061FE8C3 
X-CRM114-Status: GOOD (  25.81  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>, maxime <maxime@cerno.tech>,
 miquel raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Manuel,

The subject prefix should be "mtd: rawnand: sunxi:" not "mtd:
sunxi-nand:"

On Thu, 8 Oct 2020 16:58:47 +0200 (CEST)
Manuel Dipolt <mdipolt@robart.cc> wrote:

> This patch enables nand mdma mode for the Allwinner socs A23/A33/H3

		     ^NAND MDMA (Master DMA)

And you need a period at the of your sentence.

> 
> Signed-off-by: Manuel Dipolt <manuel.dipolt@robart.cc>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 156 +++++++++++++++++++-----------
>  1 file changed, 101 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 2a7ca3072f35..8403785e85e1 100644
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
> @@ -207,13 +208,13 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>   * NAND Controller capabilities structure: stores NAND controller capabilities
>   * for distinction between compatible strings.
>   *
> - * @extra_mbus_conf:	Contrary to A10, A10s and A13, accessing internal RAM
> + * @has_mdma:		Use mbus dma mode, otherwise general dma
>   *			through MBUS on A23/A33 needs extra configuration.
>   * @reg_io_data:	I/O data register
>   * @dma_maxburst:	DMA maxburst
>   */
>  struct sunxi_nfc_caps {
> -	bool extra_mbus_conf;
> +	bool has_mdma;
>  	unsigned int reg_io_data;
>  	unsigned int dma_maxburst;
>  };
> @@ -346,7 +347,7 @@ static int sunxi_nfc_rst(struct sunxi_nfc *nfc)
>  static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
>  				    int chunksize, int nchunks,
>  				    enum dma_data_direction ddir,
> -				    struct scatterlist *sg)
> +				    struct scatterlist *sg, dma_addr_t *mem_addr)

You don't need to pass the mem_addr, it will be extracted from the sg
list.

>  {
>  	struct dma_async_tx_descriptor *dmad;
>  	enum dma_transfer_direction tdir;
> @@ -358,29 +359,46 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
>  	else
>  		tdir = DMA_MEM_TO_DEV;
>  
> -	sg_init_one(sg, buf, nchunks * chunksize);
> -	ret = dma_map_sg(nfc->dev, sg, 1, ddir);
> -	if (!ret)
> -		return -ENOMEM;
> +	if (nfc->caps->has_mdma) {
> +		*mem_addr = dma_map_single(nfc->dev, (void *)buf, nchunks * chunksize, tdir);
> +		ret = dma_mapping_error(nfc->dev, *mem_addr);

You can use sg_init_one() here as well.

> +		if (ret) {
> +			dev_err(nfc->dev, "DMA mapping error\n");
> +			return ret;
> +		}
> +	} else {
> +		sg_init_one(sg, buf, nchunks * chunksize);
> +		ret = dma_map_sg(nfc->dev, sg, 1, ddir);
> +		if (!ret)
> +			return -ENOMEM;
>  
> -	dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
> -	if (!dmad) {
> -		ret = -EINVAL;
> -		goto err_unmap_buf;
> +		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
> +		if (!dmad) {
> +			ret = -EINVAL;
> +			goto err_unmap_buf;
> +		}
>  	}
>  
>  	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
>  	       nfc->regs + NFC_REG_CTL);
>  	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
>  	writel(chunksize, nfc->regs + NFC_REG_CNT);
> -	if (nfc->caps->extra_mbus_conf)
> +
> +	if (nfc->caps->has_mdma) {
> +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
> +		       nfc->regs + NFC_REG_CTL);
>  		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
> +		writel(*mem_addr, nfc->regs + NFC_REG_MDMA_ADDR);

			^ sg_dma_address(sg)

> +	} else {
> +		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_DMA_TYPE_NORMAL,
> +		       nfc->regs + NFC_REG_CTL);
>  
> -	dmat = dmaengine_submit(dmad);
> +		dmat = dmaengine_submit(dmad);
>  
> -	ret = dma_submit_error(dmat);
> -	if (ret)
> -		goto err_clr_dma_flag;
> +		ret = dma_submit_error(dmat);
> +		if (ret)
> +			goto err_clr_dma_flag;
> +	}
>  
>  	return 0;
>  
> @@ -395,11 +413,24 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
>  
>  static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
>  				     enum dma_data_direction ddir,
> -				     struct scatterlist *sg)
> +				     struct scatterlist *sg, dma_addr_t mem_addr, size_t size)
>  {
> -	dma_unmap_sg(nfc->dev, sg, 1, ddir);
> -	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> -	       nfc->regs + NFC_REG_CTL);
> +	enum dma_transfer_direction tdir;
> +
> +	if (ddir == DMA_FROM_DEVICE)
> +		tdir = DMA_DEV_TO_MEM;
> +	else
> +		tdir = DMA_MEM_TO_DEV;
> +
> +	if (nfc->caps->has_mdma) {
> +		dma_unmap_single(nfc->dev, mem_addr, size, tdir);
> +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> +		       nfc->regs + NFC_REG_CTL);
> +	} else {
> +		dma_unmap_sg(nfc->dev, sg, 1, ddir);
> +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> +		       nfc->regs + NFC_REG_CTL);
> +	}
>  }

As I said in my previous review, if you get rid of the mem_addr
argument, you shouldn't need any changes to this function. Have you
tried using sg_dma_address()?

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
