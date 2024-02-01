Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F68C4828D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wusqGk7FNQfdxTV6yhx49pgOOReArmTeDmyc7zWYv6M=; b=EkP7ZhpLzVJ89pMNNC9aXxJrZR
	3iAvZlpHHqHRwbqvcHaBHBhjshOA05MlL4oSf+L9OUBYEwMjBFm8PknLKtF9T0jjUknPJfYS/0Eu3
	/AqPyXh5PPRM8db3dlZixGBqswdZg6h92GBNGADIjW9+vcRDIvWIe4amDnYGVIlnehHp2Cz/b+ifN
	+F08aiEi5cYuVgkUxA2SG00y1E/vHsndENdQLU9GDlwhJpE2kBFUEmdIpLe9oJAdMgtlLe2IVqkCM
	dJ5UEDdeQNIspGrcRa/Wcf+z7hi+Kb46IAJk2OBdlGA34YQ9PdkeFk3gq+EHGGNQ+jeXBH+Ph48ld
	ALlNO/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZAD-00000008TnE-1dHJ;
	Thu, 01 Feb 2024 15:39:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZAA-00000008Tlq-1iMG
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 15:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCD1761F8B;
	Thu,  1 Feb 2024 15:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FA0C43390;
	Thu,  1 Feb 2024 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706801977;
	bh=XoLv9C+DJd3qb4dNm0ZUOh/6NcnIi4gjK0PvdVFdsis=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SdFw1h6LTHMX6kYgfafJTUxqISulNOh2JrJ9xFJHfibFXwGSqFZW9DAvfQpcfdBd5
	 u1m7GV+bHOhc0mLTKN7TNI1Yh3ehoLacnpYWnlDDZqYEzqxhUtvZ4vYiPJDmFwSYt5
	 oMJv+Pyss09TrKB/b5qW6E2CQbIK0GOAC5qQybxDsPcKEkz3qL1hr/RlCKRgLo6wOc
	 jbZ7J9bui2I44uJBeoS1SGy00dTsX2yfTHQSwkuyF00FTV8Bn9jtyQdXC2tk0RUFGG
	 nijpfFVtIA2QGSNxG7lP841wqKifw11WtVnGJPw+iIDZzJ15WNoje0QVXJsetvUanZ
	 Ed+sfWR5zB/rQ==
MIME-Version: 1.0
Date: Thu, 01 Feb 2024 16:39:32 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v8 5/9] spi: mxic: Add support for swapping byte
In-Reply-To: <20240201094353.33281-6-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
 <20240201094353.33281-6-jaimeliao.tw@gmail.com>
Message-ID: <8e834cd19cf896d792a0338a3fb5465c@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_073938_613671_E16FDA6E 
X-CRM114-Status: GOOD (  21.96  )
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

> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
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
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/spi/spi-mxic.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 60c9f3048ac9..8ac302e48c9f 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -294,7 +294,8 @@ static void mxic_spi_hw_init(struct mxic_spi *mxic)
>  	       mxic->regs + HC_CFG);
>  }
> 
> -static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
> +static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags,
> +				bool swap16)
>  {
>  	int nio = 1;
> 
> @@ -305,6 +306,11 @@ static u32 mxic_spi_prep_hc_cfg(struct spi_device 
> *spi, u32 flags)
>  	else if (spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
>  		nio = 2;
> 
> +	if (!swap16)
> +		flags |= HC_CFG_DATA_PASS;
> +	else
> +		flags &= ~HC_CFG_DATA_PASS;

Again, not my driver and I don't care too much, but you are changing
the behavior of this driver. If I had to guess, with this patch applied,
you'd read data (in octal mode) with the bytes swapped compared to 
kernel
without this patch.
And compared to the former version, you just made it harder to read
by using negated logic.

-michael

> +
>  	return flags | HC_CFG_NIO(nio) |
>  	       HC_CFG_TYPE(spi_get_chipselect(spi, 0), HC_CFG_TYPE_SPI_NOR) |
>  	       HC_CFG_SLV_ACT(spi_get_chipselect(spi, 0)) | 
> HC_CFG_IDLE_SIO_LVL(1);
> @@ -397,7 +403,8 @@ static ssize_t mxic_spi_mem_dirmap_read(struct 
> spi_mem_dirmap_desc *desc,
>  	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
>  		return -EINVAL;
> 
> -	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
> +	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, 
> desc->info.op_tmpl.data.swap16),
> +	       mxic->regs + HC_CFG);
> 
>  	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
>  	       mxic->regs + LRD_CFG);
> @@ -441,7 +448,8 @@ static ssize_t mxic_spi_mem_dirmap_write(struct 
> spi_mem_dirmap_desc *desc,
>  	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
>  		return -EINVAL;
> 
> -	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
> +	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, 
> desc->info.op_tmpl.data.swap16),
> +	       mxic->regs + HC_CFG);
> 
>  	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
>  	       mxic->regs + LWR_CFG);
> @@ -518,7 +526,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem 
> *mem,
>  	if (ret)
>  		return ret;
> 
> -	writel(mxic_spi_prep_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN),
> +	writel(mxic_spi_prep_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN, 
> op->data.swap16),
>  	       mxic->regs + HC_CFG);
> 
>  	writel(HC_EN_BIT, mxic->regs + HC_EN);
> @@ -572,6 +580,7 @@ static const struct spi_controller_mem_ops 
> mxic_spi_mem_ops = {
> 
>  static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
>  	.dtr = true,
> +	.swap16 = true,
>  	.ecc = true,
>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
