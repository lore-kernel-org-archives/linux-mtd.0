Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82957C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht8aGjFN0odaWh3CKNP4Vm+aNsT5HBTpHMRERuiJkGk=; b=aUr03sde8BDK+xop8ckVpyPyrv
	PEUgovenxh5TamF8ObAwBYsCv3e1iJSO///Pj55hdCLHdG1UMSe9zh/QYIiTcWw6Jrora4UQhYEEX
	zstxBs5Diby+IDZFrJZXxm/LASIumdJgS00sdcoQl4Mzg2tTgpBynVGrY12QoB8MURrd4mCpbJYsX
	wdGF8jsFU/Ol1ZleQCpp/XQWOphyvRgTqFCH5/hCF24p2IfpUSIQB35sTMV1NnwXIoMBMb384Ogvq
	8KDk8qlouoJVnPqCL5m1a8SQxQRuHRjwy6r5cCy/5ujpRa7d07TjuHGnjpzDVLE2PhRm3bEUPZfVY
	GrfpJ+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngm0r-0037NB-6C; Tue, 19 Apr 2022 11:27:17 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngltb-0033KZ-GU
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 11:19:49 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0B4972223A;
 Tue, 19 Apr 2022 13:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650367182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlmjPkUMYoXM1brnmw5UZyknS4jpSubyz4QQX5Xc3BM=;
 b=H7ALRsy44i6Sq0O2AwH2yQr/24FOFje6dM/9XAvhEvwc7s5bwLty0+RTm+Hfo8GtBuL5YO
 fbDgvfTWsYG7586d3RXnYN6z+7OVZXOGnb5cD/j3nV+Z9CRkF2p5ljUkVxAzV+1rax0WNd
 J92Oz9sBaS9mKRrixDoQUL923IG7Exc=
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 13:19:41 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 6/9] mtd: spi-nor: core: Add helpers to read/write any
 register
In-Reply-To: <20220411091033.98754-7-tudor.ambarus@microchip.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-7-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0e4ec58c21490dcd9cf82ab89bd8c34c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_041947_781429_88B18AE2 
X-CRM114-Status: GOOD (  19.43  )
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

Am 2022-04-11 11:10, schrieb Tudor Ambarus:
> There are manufacturers that use registers indexed by address. Some of
> them support "read/write any register" opcodes. Provide core methods 
> that
> can be used by all manufacturers. SPI NOR controller ops are 
> intentionally
> not supported as we intend to move all the SPI NOR controller drivers
> under the SPI subsystem.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

I still don't like it because the function doesn't do
anything what the function name might suggest. The read
just executes an op, the write executes an op with a
write enable before. All the behavior is determined by the
'op' argument.

Anyway,
Reviewed-by: Michael Walle <michael@walle.cc>

> ---
> v3: no changes
> 
>  drivers/mtd/spi-nor/core.c | 41 ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  4 ++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 6165dc7bfd17..42794328d3b6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -307,6 +307,47 @@ ssize_t spi_nor_write_data(struct spi_nor *nor,
> loff_t to, size_t len,
>  	return nor->controller_ops->write(nor, to, len, buf);
>  }
> 
> +/**
> + * spi_nor_read_reg() - read register to flash memory
> + * @nor:        pointer to 'struct spi_nor'.
> + * @op:		SPI memory operation. op->data.buf must be DMA-able.
> + * @proto:	SPI protocol to use for the register operation.
> + *
> + * Return: zero on success, -errno otherwise
> + */
> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		     enum spi_nor_protocol proto)
> +{
> +	if (!nor->spimem)
> +		return -EOPNOTSUPP;
> +
> +	spi_nor_spimem_setup_op(nor, op, proto);
> +	return spi_nor_spimem_exec_op(nor, op);
> +}
> +
> +/**
> + * spi_nor_write_reg() - write register to flash memory
> + * @nor:        pointer to 'struct spi_nor'
> + * @op:		SPI memory operation. op->data.buf must be DMA-able.
> + * @proto:	SPI protocol to use for the register operation.
> + *
> + * Return: zero on success, -errno otherwise
> + */
> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		      enum spi_nor_protocol proto)
> +{
> +	int ret;
> +
> +	if (!nor->spimem)
> +		return -EOPNOTSUPP;
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +	spi_nor_spimem_setup_op(nor, op, proto);
> +	return spi_nor_spimem_exec_op(nor, op);
> +}
> +
>  /**
>   * spi_nor_write_enable() - Set write enable latch with Write Enable 
> command.
>   * @nor:	pointer to 'struct spi_nor'.
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index f952061d5c24..7c704475946d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -554,6 +554,10 @@ ssize_t spi_nor_read_data(struct spi_nor *nor,
> loff_t from, size_t len,
>  			  u8 *buf);
>  ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  			   const u8 *buf);
> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		     enum spi_nor_protocol proto);
> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		      enum spi_nor_protocol proto);
>  int spi_nor_erase_sector(struct spi_nor *nor, u32 addr);
> 
>  int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t
> len, u8 *buf);

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
