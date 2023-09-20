Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD88CE79CE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6duPIw8aFO4Dc7FWMgexvqvIeibOGmVr4f2tL2mVOSg=; b=FPp6qGvL0Xt/an
	lbOB4ocLJryZQ3/dXVolJIPhInmOy6NjrbnMmLgU78BpjvbAo+5rkSMLQuaHdZ7fGuHbpIOPSWIFa
	cpa29HJ6sKmhc8ummxVEtuWHFiFyR/WXoVjvol2yvUFq6gUnj+I3iDcuH3reafrTX/ZO9Ni6usGRp
	wVMoY37+fLHwpJHS2Ry8qKJ3stJ7AjDEZSUgPg15lMP1Rzh0b+WFo0K1i3fpe0VeJv+1/RW0ieBRr
	o7qMaAA9PoSKpKuo1T404O51SmK1Zn6eQfmNKzVJyJYsxYOdNOl5eso8gWopBLJaHWqLGzrSpTqex
	2r8wL8zCqBBka+Z6FhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwKJ-0031NH-2L;
	Wed, 20 Sep 2023 12:29:07 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwKF-0031MU-1I
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 12:29:05 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so8364252a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2023 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695212940; x=1695817740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URkafsn9iULVEUwXKiZ0p+gI4oop9guKvUDIiMfDYwk=;
        b=k21xPv4K8Jz08cuSzZXkYiHe7Tb00Q7HDdoXRIAcHQS3u35Ong/82/atDknmlTLQgQ
         sHIDIkMNvYP5dgTcQMCNCRCfvmYk5qdh0VWniu/ZUUvsdGEqFE5pawHEfRxYe3mQ2Jlb
         QnmJHehvArj+ne8S7aPSJ2jWCj18pxx/x3Cd6wXJ0ouIzd3S7lgJ7qnCjV4XY7IUz+/l
         YlFyLPtkbQ90SOai5tEjrAnW2KegePJFXYmgZ76VMps5byw0ZCBPhMbJqmaPyezFoqkQ
         UffEL7cUayk9azTjkiGB0nvxZXKypGrtdbokLkmcAZcLVABis6kTjIR+R7EnCvB2JA7t
         HNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695212940; x=1695817740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URkafsn9iULVEUwXKiZ0p+gI4oop9guKvUDIiMfDYwk=;
        b=LcRgR9aoD7e54bjnDKfn1tgZvHKN/V0IKAu4FWm5/0dO5vcL+DAQrrvZHknyrfb777
         2xJVC87hi0YkO8rujEk0XYx0ovL5ctTWda9LUN/t4BrxZdaE//JuD8UcGGWIQ11xV2Jm
         4V/R8uB1B4qdqAePA+OkAf/26pVGqiYJGtZByPTMw6pn+HQaKLqGDaBOrw1GB7wzQl9t
         d839t6vDXtGGLASEgr7oIuM1M4Hkz7HAEob09XhxGAdZ6yv48q2v9zPUHz/VaKE9W+AZ
         2dRz+0whUF/dtCXSLiFlOzMYfUo5fCwIzTKraqZv7ind/U6PoqKJhZAevBEkon2baMJL
         AU0w==
X-Gm-Message-State: AOJu0Yx3HFH8bLwvKrxBA/gRm/G3pMf+2YBRx6KwOadj0q1Xl7TLx9+Z
	jwV9VGApgJ5Nnt49zQuKPNDG0Q==
X-Google-Smtp-Source: AGHT+IE0HEEu6oLMgcXBr1xA1mQ45Cah0xd1Y48DJf6qoZsopZBhv330g0Fk1FgvYB0yzCWN8EIwig==
X-Received: by 2002:aa7:d143:0:b0:531:11fa:eacf with SMTP id r3-20020aa7d143000000b0053111faeacfmr1856071edo.2.1695212939996;
        Wed, 20 Sep 2023 05:28:59 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id es19-20020a056402381300b0051e1660a34esm7706912edb.51.2023.09.20.05.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:28:59 -0700 (PDT)
Message-ID: <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
Date: Wed, 20 Sep 2023 15:28:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230908064304.27757-2-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_052903_473406_78FACE81 
X-CRM114-Status: GOOD (  37.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Jaime,

Thanks for the patch! I think we are getting closer to have this
integrated, but I have some concerns that hopefully with your help we'll
address and move forward.

On 08.09.2023 09:42, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Add manufacturer read id function because of some flash
> may change data format when read id in octal dtr mode.

I'm not convinced such a method is really needed, would you please
elaborate the explanation why it's needed?

I'm looking at the mx66lm1g45g datasheet. From what I see in "Figure 13.
Read Identification (RDID) Sequence (DTR-OPI Mode)" looks like even if
the flash is operated in 8d-8d-8d mode, what the flash actually uses is
a 8d-8d-8s mode for the read id. Each ID byte is sent twice on both
rising and falling edge of the clock, thus behaving like a 8d-8d-8s
protocol.

I see this flash supports 1-1-1, 8-8-8, and 8d-8d-8d, there are no mixed
modes supported, thus a 8d-8d-8s mode seems just like a hardware bug to
me. So my proposal is to leave the core away and to handle the read id
hack just in the macronix driver.

> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c     | 30 ++++++++++++++++++++++++++++--
>  drivers/mtd/spi-nor/core.h     |  6 ++++++
>  drivers/mtd/spi-nor/macronix.c | 18 ++++++++++++++++++
>  3 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..7ee624b16e17 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -408,7 +408,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
>  }
>  
>  /**
> - * spi_nor_read_id() - Read the JEDEC ID.
> + * spi_nor_default_read_id() - Read the JEDEC ID.
>   * @nor:	pointer to 'struct spi_nor'.
>   * @naddr:	number of address bytes to send. Can be zero if the operation
>   *		does not need to send an address.
> @@ -420,7 +420,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
> +int spi_nor_default_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
>  		    enum spi_nor_protocol proto)
>  {
>  	int ret;
> @@ -438,6 +438,32 @@ int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
>  	return ret;
>  }
>  
> +/**
> + * spi_nor_read_id() - Read ID by manufacturer read id function.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @naddr:	number of address bytes to send. Can be zero if the operation
> + *		does not need to send an address.
> + * @ndummy:	number of dummy bytes to send after an opcode or address. Can
> + *		be zero if the operation does not require dummy bytes.
> + * @id:		pointer to a DMA-able buffer where the value of the JEDEC ID
> + *		will be written.
> + * @proto:	the SPI protocol for register operation.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
> +		    enum spi_nor_protocol proto)
> +{
> +	int ret;
> +
> +	if (nor->manufacturer && nor->manufacturer->fixups && nor->manufacturer->fixups->read_id)
> +		ret = nor->manufacturer->fixups->read_id(nor, naddr, ndummy, id, proto);
> +	else
> +		ret = spi_nor_default_read_id(nor, naddr, ndummy, id, proto);
> +
> +	return ret;
> +}
> +
>  /**
>   * spi_nor_read_sr() - Read the Status Register.
>   * @nor:	pointer to 'struct spi_nor'.
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 9217379b9cfe..92cbc2d3f7fe 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -424,6 +424,8 @@ struct spi_nor_flash_parameter {
>   * @late_init: used to initialize flash parameters that are not declared in the
>   *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>   *             Will replace the default_init() hook.
> + * @read_id:   used to read id which may change format after enter into
> +	       octal dtr mode.
>   *
>   * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
>   * table is broken or not available.
> @@ -435,6 +437,8 @@ struct spi_nor_fixups {
>  			 const struct sfdp_bfpt *bfpt);
>  	int (*post_sfdp)(struct spi_nor *nor);
>  	int (*late_init)(struct spi_nor *nor);
> +	int (*read_id)(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
> +		       enum spi_nor_protocol reg_proto);
>  };
>  
>  /**
> @@ -667,6 +671,8 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
>  int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
> +int spi_nor_default_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
> +			    enum spi_nor_protocol reg_proto);
>  int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
>  		    enum spi_nor_protocol reg_proto);
>  int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index eb149e517c1f..8ab47691dfbb 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -118,9 +118,27 @@ static int macronix_nor_late_init(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static int macronix_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
> +				enum spi_nor_protocol proto)
> +{
> +	int i, ret;
> +
> +	ret = spi_nor_default_read_id(nor, naddr, ndummy, id, proto);
> +	/* Retrieve odd array and re-sort id because of read id format will be A-A-B-B-C-C
> +	 * after enter into octal dtr mode for Macronix flashes.
> +	 */
> +	if (proto == SNOR_PROTO_8_8_8_DTR) {
> +		for (i = 0; i < nor->info->id_len; i++)
> +			id[i] = id[i*2];

why do you overwrite the id? How about just checking that
id[i] == id[i + 1]? why do you care if you print an a-a-b-b-c-c id?
> +	}
> +
> +	return ret;
> +}
> +
>  static const struct spi_nor_fixups macronix_nor_fixups = {
>  	.default_init = macronix_nor_default_init,
>  	.late_init = macronix_nor_late_init,
> +	.read_id = macronix_nor_read_id,
>  };
>  
>  const struct spi_nor_manufacturer spi_nor_macronix = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
