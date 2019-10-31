Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3DDCA9EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 11:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 224A12087F
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 11:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gutpHfSA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 224A12087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Fhw3b+MLIIZBbty6oND2Myi5Ey0PUC7Sr03mWX+430=; b=gutpHfSAJ1L5/g
	XrvU5ZQYyaRAwzHx2WMc+lJn9wgb1w5rFrCgSJ7/b1KJQtzvAJpiTNve13mU8K3kF+sh45hWLXVBQ
	Nm0nsfOHLmrWW2DtWSFA0lOFBS/SCpuTVqCh4YrFN/mkrBZfcYdntBcMC2GkRB2M4EFGB6Ahy8PHH
	On716SvPLmf9vO3P8tA7uEKOqZL366p/+OXMS79JJfZM+XTDW1gVtqj2dGyzcpOMB67BUBAavNy45
	D3rH/pVqx9t/Dc9zq97QSHsMH4/eUy1D3Bq3tGVpDA2vLvmk+hs2cQ5llgtDhrjjXMyYC275S3Hth
	Fcl9z7U6dkabWlU+ag7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ8Qb-0005BY-T6; Thu, 31 Oct 2019 11:15:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ8QY-0005Ap-0E
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 11:15:43 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 98A3628F256;
 Thu, 31 Oct 2019 11:15:40 +0000 (GMT)
Date: Thu, 31 Oct 2019 12:15:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 17/32] mtd: spi-nor: Move the WE and wait calls
 inside Write SR methods
Message-ID: <20191031121537.0c8135da@collabora.com>
In-Reply-To: <20191029111615.3706-18-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-18-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_041542_308782_754A89C7 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 29 Oct 2019 11:17:15 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Avoid duplicating code by moving the calls to spi_nor_write_enable() and
> spi_nor_wait_till_ready() inside the Write Status Register methods.
> 
> Move spi_nor_write_sr() to avoid forward declaration of
> spi_nor_wait_till_ready().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 108 +++++++++++++++++-------------------------
>  1 file changed, 44 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index ed7c233a7208..5fb4d953b5c7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -534,35 +534,6 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
>  	return ret;
>  }
>  
> -/*
> - * Write status register 1 byte
> - * Returns negative if error occurred.
> - */
> -static int spi_nor_write_sr(struct spi_nor *nor, u8 val)
> -{
> -	int ret;
> -
> -	nor->bouncebuf[0] = val;
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
> -
> -		ret = spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
> -						     nor->bouncebuf, 1);
> -	}
> -
> -	if (ret)
> -		dev_err(nor->dev, "error %d writing SR\n", ret);
> -
> -	return ret;
> -
> -}
> -
>  static int macronix_set_4byte(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
> @@ -854,6 +825,41 @@ static int spi_nor_wait_till_ready(struct spi_nor *nor)
>  }
>  
>  /*
> + * Write status register 1 byte
> + * Returns negative if error occurred.
> + */
> +static int spi_nor_write_sr(struct spi_nor *nor, u8 val)
> +{
> +	int ret;
> +
> +	nor->bouncebuf[0] = val;
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
> +						     nor->bouncebuf, 1);
> +	}
> +
> +	if (ret) {
> +		dev_err(nor->dev, "error %d writing SR\n", ret);
> +		return ret;
> +	}
> +
> +	return spi_nor_wait_till_ready(nor);
> +}
> +
> +/*
>   * Write status Register and configuration register with 2 bytes
>   * The first byte will be written to the status register, while the
>   * second byte will be written to the configuration register.
> @@ -895,18 +901,10 @@ static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new,
>  {
>  	int ret;
>  
> -	ret = spi_nor_write_enable(nor);
> -	if (ret)
> -		return ret;
> -
>  	ret = spi_nor_write_sr(nor, status_new);
>  	if (ret)
>  		return ret;
>  
> -	ret = spi_nor_wait_till_ready(nor);
> -	if (ret)
> -		return ret;
> -
>  	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
>  	if (ret)
>  		return ret;
> @@ -918,6 +916,10 @@ static int spi_nor_write_sr2(struct spi_nor *nor, u8 *sr2)
>  {
>  	int ret;
>  
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
>  	if (nor->spimem) {
>  		struct spi_mem_op op =
>  			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 1),
> @@ -931,10 +933,12 @@ static int spi_nor_write_sr2(struct spi_nor *nor, u8 *sr2)
>  						     sr2, 1);
>  	}
>  
> -	if (ret)
> +	if (ret) {
>  		dev_err(nor->dev, "error %d writing SR2\n", ret);
> +		return ret;
> +	}
>  
> -	return ret;
> +	return spi_nor_wait_till_ready(nor);
>  }
>  
>  static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
> @@ -1864,18 +1868,10 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  	if (nor->bouncebuf[0] & SR_QUAD_EN_MX)
>  		return 0;
>  
> -	ret = spi_nor_write_enable(nor);
> -	if (ret)
> -		return ret;
> -
>  	ret = spi_nor_write_sr(nor, nor->bouncebuf[0] | SR_QUAD_EN_MX);
>  	if (ret)
>  		return ret;
>  
> -	ret = spi_nor_wait_till_ready(nor);
> -	if (ret)
> -		return ret;
> -
>  	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
>  	if (ret)
>  		return ret;
> @@ -2041,18 +2037,10 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  	/* Update the Quad Enable bit. */
>  	*sr2 |= SR2_QUAD_EN_BIT7;
>  
> -	ret = spi_nor_write_enable(nor);
> -	if (ret)
> -		return ret;
> -
>  	ret = spi_nor_write_sr2(nor, sr2);
>  	if (ret)
>  		return ret;
>  
> -	ret = spi_nor_wait_till_ready(nor);
> -	if (ret)
> -		return ret;
> -
>  	/* Read back and check it. */
>  	ret = spi_nor_read_sr2(nor, sr2);
>  	if (ret)
> @@ -2084,15 +2072,7 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
>  
> -	ret = spi_nor_write_enable(nor);
> -	if (ret)
> -		return ret;
> -
> -	ret = spi_nor_write_sr(nor, nor->bouncebuf[0] & ~mask);
> -	if (ret)
> -		return ret;
> -
> -	return spi_nor_wait_till_ready(nor);
> +	return spi_nor_write_sr(nor, nor->bouncebuf[0] & ~mask);
>  }
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
