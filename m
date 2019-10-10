Return-Path: <SRS0=RcjP=YD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78378C4360C
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 07:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2EC2190F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 07:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ep8mtqsI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B2EC2190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSOVLhno1ktN1Mz80IXtkcjUn2GY9nsBViOtvuQ4wVM=; b=ep8mtqsIhLEh3q
	gjhAXtmW4yJK/sTxnT2X3Hfxd/hTuuxPUNFAcw6LuDAmihDpC5R6lfyZ5A/Gq0PPgWN5GeilGDZLx
	eYbMffg+q7GtCSakfQaOSpKV5elLyIL4mBg2kEBZwM4DCsHuXrORKHPYFHn0YDjaRb1P2VNg5qNZj
	VRNvjUB7p+2xoU3f1awB2tMZPAi9LBcX+PJre01VLgrHhkkygLd9WVxQig709KCvpa0vYpTzhTn3T
	pYUsAX/Soya2g+SZoR4Tmmpfg2BisTJdWUUQRW6WdV5O7jva8BvYd5c4lZPo9bQljpgvjaJoelgez
	cya6o81tNp0Mdk3/lF9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iISej-0002Ul-OV; Thu, 10 Oct 2019 07:14:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iISe9-00023U-DG; Thu, 10 Oct 2019 07:14:03 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 979B1290767;
 Thu, 10 Oct 2019 08:13:59 +0100 (BST)
Date: Thu, 10 Oct 2019 09:13:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 05/22] mtd: spi-nor: Rework read_sr()
Message-ID: <20191010091356.5d9a4e44@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190924074533.6618-6-tudor.ambarus@microchip.com>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
 <20190924074533.6618-6-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_001401_706349_131E57EF 
X-CRM114-Status: GOOD (  20.46  )
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
Cc: linux-arm-kernel@lists.infradead.org, vigneshr@ti.com,
 geert+renesas@glider.be, andrew@aj.id.au, richard@nod.at,
 linux-kernel@vger.kernel.org, vz@mleia.com, marek.vasut@gmail.com,
 jonas@norrbonn.se, linux-mtd@lists.infradead.org, joel@jms.id.au,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 24 Sep 2019 07:46:08 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> static int read_sr(struct spi_nor *nor)
> becomes
> static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> 
> The new function returns 0 on success and -errno otherwise.
> We let the callers pass the pointer to the buffer where the
> value of the Status Register will be written. This way we avoid
> the casts between int and u8, which can be confusing.
> 
> Prepend spi_nor_ to the function name, all functions should begin
> with that.
> 
> S/pr_err/dev_err and drop duplicated dev_err in callers, in case the
> function returns error.

Too many things done in a single patch, can you split that please?

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 131 +++++++++++++++++++++---------------------
>  1 file changed, 65 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 7d0c1b598250..a23783641146 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -388,12 +388,14 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  	return nor->controller_ops->write(nor, to, len, buf);
>  }
>  
> -/*
> - * Read the status register, returning its value in the location
> - * Return the status register value.
> - * Returns negative if error occurred.
> +/**
> + * spi_nor_read_sr() - Read the Status Register.
> + * @nor:        pointer to 'struct spi_nor'
> + * @sr:		buffer where the value of the Status Register will be written.

You should definitely mention that this sr pointer has to be DMA-safe.

> + *
> + * Return: 0 on success, -errno otherwise.
>   */
> -static int read_sr(struct spi_nor *nor)
> +static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  {
>  	int ret;
>  
> @@ -402,20 +404,17 @@ static int read_sr(struct spi_nor *nor)
>  			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 1),
>  				   SPI_MEM_OP_NO_ADDR,
>  				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> +				   SPI_MEM_OP_DATA_IN(1, sr, 1));
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> -		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
> -						    nor->bouncebuf, 1);
> +		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR, sr, 1);
>  	}
>  
> -	if (ret < 0) {
> -		pr_err("error %d reading SR\n", (int) ret);
> -		return ret;
> -	}
> +	if (ret)
> +		dev_err(nor->dev, "error %d reading SR\n", ret);
>  
> -	return nor->bouncebuf[0];
> +	return ret;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
