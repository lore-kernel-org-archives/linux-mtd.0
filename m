Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F77CA9EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 10:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E9020862
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 10:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IEZb1sH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E9020862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BpkCkJKXCMXuI4kF4/WyXchbaQTF3W+jBczWqhjJ8s=; b=IEZb1sH5QpCr/u
	dhamDEF1esjDNCaI6tmA1VfestMwmHLr/e9XntuqPFblFrX8MaBpgfuhgDFtvhg7BAaerhlZh0a0L
	F2QXjBgCCyu6Y6V+swJlP0CbRHuzWgDMH6vpXlUu7RKkGRhu2mF0hQdYXWrZ2On2b9xPyNIpq3reS
	V7L23JYG6W8hJgxno7EMSDvBfVsdsdGVnHCwGxMBZ8qH+X2pvlKmO3u8+HJhTTxjBSKqNkzCR9hbj
	Ob/kanAM+K1Uhju87233o5vRY6Nl9/Pr+pu9WoBKj+AGX3uD6Zfd825sE1wprL6HbxE3jnHRMSYzr
	h4D0Jptl5AWHQv6KqncA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ85Y-0008Uk-8I; Thu, 31 Oct 2019 10:54:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ85U-0008Tl-W1
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 10:53:58 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CE01028A0E8;
 Thu, 31 Oct 2019 10:53:54 +0000 (GMT)
Date: Thu, 31 Oct 2019 11:53:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 09/32] mtd: spi-nor: Pointer parameter for FSR in
 spi_nor_read_fsr()
Message-ID: <20191031115352.4f111555@collabora.com>
In-Reply-To: <20191029111615.3706-10-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-10-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_035357_295112_3ABBB0BF 
X-CRM114-Status: GOOD (  21.86  )
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

On Tue, 29 Oct 2019 11:17:02 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Let the callers pass the pointer to the DMA-able buffer where
> the value of the Flag Status Register will be written. This way we
> avoid the casts between int and u8, which can be confusing.
> 
> Caller stops compare the return value of spi_nor_read_fsr() with negative,
> spi_nor_read_fsr() returns 0 on success and -errno otherwise.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 38 ++++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index dc44d1206f77..0d38aede4de7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -456,12 +456,15 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  	return ret;
>  }
>  
> -/*
> - * Read the flag status register, returning its value in the location
> - * Return the status register value.
> - * Returns negative if error occurred.
> +/**
> + * spi_nor_read_fsr() - Read the Flag Status Register.
> + * @nor:	pointer to 'struct spi_nor'
> + * @fsr:	pointer to a DMA-able buffer where the value of the
> + *              Flag Status Register will be written.
> + *
> + * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_read_fsr(struct spi_nor *nor)
> +static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>  {
>  	int ret;
>  
> @@ -470,20 +473,18 @@ static int spi_nor_read_fsr(struct spi_nor *nor)
>  			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 1),
>  				   SPI_MEM_OP_NO_ADDR,
>  				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> +				   SPI_MEM_OP_DATA_IN(1, fsr, 1));
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
>  		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDFSR,
> -						    nor->bouncebuf, 1);
> +						    fsr, 1);
>  	}
>  
> -	if (ret) {
> +	if (ret)
>  		dev_err(nor->dev, "error %d reading FSR\n", ret);
> -		return ret;
> -	}
>  
> -	return nor->bouncebuf[0];
> +	return ret;
>  }
>  
>  /*
> @@ -705,17 +706,18 @@ static int spi_nor_clear_fsr(struct spi_nor *nor)
>  
>  static int spi_nor_fsr_ready(struct spi_nor *nor)
>  {
> -	int fsr = spi_nor_read_fsr(nor);
> -	if (fsr < 0)
> -		return fsr;
> +	int ret = spi_nor_read_fsr(nor, &nor->bouncebuf[0]);

Didn't comment on the previous patch, but why not simply pass
nor->bouncebuf here?

Anyway, that's just a detail.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +
> +	if (ret)
> +		return ret;
>  
> -	if (fsr & (FSR_E_ERR | FSR_P_ERR)) {
> -		if (fsr & FSR_E_ERR)
> +	if (nor->bouncebuf[0] & (FSR_E_ERR | FSR_P_ERR)) {
> +		if (nor->bouncebuf[0] & FSR_E_ERR)
>  			dev_err(nor->dev, "Erase operation failed.\n");
>  		else
>  			dev_err(nor->dev, "Program operation failed.\n");
>  
> -		if (fsr & FSR_PT_ERR)
> +		if (nor->bouncebuf[0] & FSR_PT_ERR)
>  			dev_err(nor->dev,
>  			"Attempted to modify a protected sector.\n");
>  
> @@ -723,7 +725,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
>  		return -EIO;
>  	}
>  
> -	return fsr & FSR_READY;
> +	return nor->bouncebuf[0] & FSR_READY;
>  }
>  
>  static int spi_nor_ready(struct spi_nor *nor)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
