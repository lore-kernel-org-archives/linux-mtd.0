Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE814C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyxRcCV+I6YXBvaM2P8cch+fcAVi2chTb7XMF+SUnJE=; b=aVEhktwgR82kXDQ22IQ/7me/5m
	Dw22PCKB4gKCnu/Ev8MSbotmZ+ThWMKz9LOuUJGXH6c8ybDfToCljCMmn8Hf7CA3SdQeN0yBjwnRK
	e9uhTMMMsF6OeeaZWMMwBdiGAdhMqxgV+pbkQS3khT5J4nAyEpTnaTuA5p+jAc/AMzCtzj4i2DBb3
	lx0OBgc3iXjvHjUf1Jxn4KuR28yknclozOZfrCX7t7jAKIthptB00j9xSoaHE6X2j6WyfOeIDNZDM
	NwdGEYhJYpGMxrTeu0BFZm439pUGkx/UeLizW08Rw4KBjYE2g2vvcfx+jPdueUoNFZIXaJzMECKgN
	uh/rFpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjSB-00Gr7P-0G;
	Fri, 05 Jan 2024 12:37:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjS7-00Gr6z-1L
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 12:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 615C9CE1E6E;
	Fri,  5 Jan 2024 12:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D693BC433C8;
	Fri,  5 Jan 2024 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704458247;
	bh=9zxDWJx+dy4xbL8oaZIGJXx8TDm4A80doPqJAIjCVcM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JGymIIvWfz3JSFxtfkwoaZDDuA9KCnfUsxCVvCn3j54pYCyVGEIX/CbuGkqwIkV+c
	 iGB/No0kkE7YpGy3tcyuG/GWB75qZvCPISrsI9XlORBDJsOWoiIB6vpVmu7Cf1pvs6
	 VuPxlwSfmy/QCra/LsE7wPAgY8fqkc3qogJ2eN9gZPiim+xCvlUs4UxoJ1MKKAKX3w
	 miiXq0UXkgm7o6xJlwztTissERWt6eUW+chw1pKMIhqNPGsqxmXv2hve/aXrvLTScL
	 vf4uoKkIjR8wy4dMmeNfKsufmd67PnNyotzMDqjzei9Imtv+oQIibgEwePRAcETsKT
	 xaT2q7ube6Qgg==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 13:37:23 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 5/7] spi: mxic: Add support for swapping byte
In-Reply-To: <20231221090702.103027-6-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-6-jaimeliao.tw@gmail.com>
Message-ID: <02ff70794b9c5f361d3728b4ad4d028a@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_043731_820034_4EABDA30 
X-CRM114-Status: GOOD (  22.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> Some SPI-NOR flash swap the bytes on a 16-bit boundary when
> configured in Octal DTR mode. It means data format D0 D1 D2 D3
> would be swapped to D1 D0 D3 D2. So that whether controller
> support swapping bytes should be checked before enable Octal
> DTR mode. Add swap byte support on a 16-bit boundary when
> configured in Octal DTR mode for Macronix xSPI host controller
> dirver.
> 
> According dtr_swab in operation to enable/disable Macronix
> xSPI host controller swap byte feature.
> 
> To make sure swap byte feature is working well, program data in
> 1S-1S-1S mode then read back and compare read data in 8D-8D-8D
> mode.
> 
> This feature have been validated on byte-swap flash and
> non-byte-swap flash.
> 
> Macronix xSPI host controller bit "HC_CFG_DATA_PASS" determine
> the byte swap feature disabled/enabled and swap byte feature is
> working on 8D-8D-8D mode only.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/spi/spi-mxic.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 60c9f3048ac9..8dc83adaaa88 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -294,7 +294,8 @@ static void mxic_spi_hw_init(struct mxic_spi *mxic)
>  	       mxic->regs + HC_CFG);
>  }
> 
> -static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
> +static u32 mxic_spi_prep_hc_cfg(const struct spi_mem_op *op,
> +				struct spi_device *spi, u32 flags)

Not my driver, but because it caught my eye: I wouldn't pass
spi_mem_op. Maybe just "bool swap16"?

>  {
>  	int nio = 1;
> 
> @@ -305,6 +306,13 @@ static u32 mxic_spi_prep_hc_cfg(struct spi_device 
> *spi, u32 flags)
>  	else if (spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
>  		nio = 2;
> 
> +	if (op->data.dtr) {

Checking this seems to be redundant with checking dtr_swab16.

> +		if (op->data.dtr_swab16)
> +			flags &= ~HC_CFG_DATA_PASS;
> +		else
> +			flags |= HC_CFG_DATA_PASS;

Mhh, this is strange. Given that dtr_swap16 is a new flag means
that you are now setting the HC_CFG_DATA_PASS bit by default.
Something to keep in mind if you have any users which already use
8d8d8d mode nowadays.

Also clearing the flag seems superfluous.

-michael

> +	}
> +
>  	return flags | HC_CFG_NIO(nio) |
>  	       HC_CFG_TYPE(spi_get_chipselect(spi, 0), HC_CFG_TYPE_SPI_NOR) |
>  	       HC_CFG_SLV_ACT(spi_get_chipselect(spi, 0)) | 
> HC_CFG_IDLE_SIO_LVL(1);
> @@ -397,7 +405,8 @@ static ssize_t mxic_spi_mem_dirmap_read(struct 
> spi_mem_dirmap_desc *desc,
>  	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
>  		return -EINVAL;
> 
> -	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
> +	writel(mxic_spi_prep_hc_cfg(&desc->info.op_tmpl,
> +				    desc->mem->spi, 0), mxic->regs + HC_CFG);
> 
>  	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
>  	       mxic->regs + LRD_CFG);
> @@ -441,7 +450,8 @@ static ssize_t mxic_spi_mem_dirmap_write(struct 
> spi_mem_dirmap_desc *desc,
>  	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
>  		return -EINVAL;
> 
> -	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
> +	writel(mxic_spi_prep_hc_cfg(&desc->info.op_tmpl,
> +				    desc->mem->spi, 0), mxic->regs + HC_CFG);
> 
>  	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
>  	       mxic->regs + LWR_CFG);
> @@ -518,7 +528,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem 
> *mem,
>  	if (ret)
>  		return ret;
> 
> -	writel(mxic_spi_prep_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN),
> +	writel(mxic_spi_prep_hc_cfg(op, mem->spi, HC_CFG_MAN_CS_EN),
>  	       mxic->regs + HC_CFG);
> 
>  	writel(HC_EN_BIT, mxic->regs + HC_EN);
> @@ -572,6 +582,7 @@ static const struct spi_controller_mem_ops 
> mxic_spi_mem_ops = {
> 
>  static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
>  	.dtr = true,
> +	.dtr_swab16 = true,
>  	.ecc = true,
>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
