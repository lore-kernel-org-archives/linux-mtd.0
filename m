Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2326C5B552
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kN9zpLnHzlYjgOUyoF6TOSqKaCyMSJrrdt9fwTGmXJA=; b=WS1hYNAec2G3AC
	hB4o602EjQI64vbOP8BzbxUt6LRLRA0JPAZY31rja7WypOoM5xQHA76PI5nIqITcbJ+5vhe/5pQbz
	mI5CqLGfbj4I8uW/eeoN5r9RleWH1VpJUQL5lwWjnkNQ7E/9OsZzZPPvj1rj3v34BRFT2zpLyBeae
	8cxhHP5yA/TQenpY5RRdVXm/QoSh51ct5DwWHncp+dj1m0kgkn2Fv6KagXAKXnWEg2yu3YBKmJfmY
	HDEPU3/slm88Uv8gE86SDNSeLu8imDFwzTjg0yZzmS+vG1uNxI3uPZEcDHGgd7bHEMq6kAXOM+2Fi
	54nw5kFruzJ9Y6KB3lqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeqo-00000004aQK-2U5H;
	Mon, 09 Jun 2025 15:55:54 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeI7-00000004VBT-1NjY
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 15:20:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad1b94382b8so765289866b.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 08:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749482401; x=1750087201; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2qNkqjs5faJcUFm8pGeif6YGvdG+sGovbdY0gyxhico=;
        b=vufb0yhYZOygawNg0l9jgHKTNP9L/EyisbqvD/eQhiN0LVA++fZendZyKoOd7gYbON
         s77QexQPUFLB1kWCJGKxLVqPRXSykdSn6ZbnUcyQ743Vc0400/ztA4CbSh1NtTWXEYmb
         UqCIHmV168zYQc3koA5lhPl15KPMZaaEJyAD8aIw8vgDKxno3nNndHbPocfgIfKUDT0f
         NWLHgIOdHXA4+Ja9YOnZChN4m+w4wrl/WjTEcD8duLzRYcWC3yZgFJ+shRjhOdfN8/Y7
         mekJ7LRvurygqu0lwxX5TBKgdSg7Vd9viuXR7ynk3klefj/Ay31B14KGoPSpqzZRI8Rd
         kCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749482401; x=1750087201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qNkqjs5faJcUFm8pGeif6YGvdG+sGovbdY0gyxhico=;
        b=dncKkX7RpqwhT90lnH7q3T5eJ+81oLxc2XAM9YTKGGJL3XEskyGy2oktcFQd/b96ss
         16ZzpX3rsjBVwq402rV07Xi57ac3x5MZLb5oMXs9mI72AHHEe/gDQXj/y37xs8TRYaVE
         mJqvj3LEZ+mtYGDY284Zh9gbV7Ddd5XxBXUMUq+UPH3pNq/aqqK/nktY+dZZeB0+F1AL
         xKpszGH8QwNKKG9DqQkTAekTO1s9ECMzgD/phq1RBNPAaq13qC8P0B01VJM7AdRO8Wun
         DMiqi+S8U0IDK9oqfSXDl8pnGajVuy1Nnn3am1MqJFsy7Tyv2xvmlOUWKVlUn4nmhp2R
         Lbmw==
X-Forwarded-Encrypted: i=1; AJvYcCUYq7XfBoikZcTuqkoD3Jv7l3BzEBMrp+11q3CPh9O8AlMzIFqYWi7PQ+KjLfMUB4lG8QcO/Hm5dyg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Dj2egSIYJH94N0HP3kzfMhdyDKP9m8Uqc6cVfLxaCBGCRHCG
	Ww5FLymn4AjUyRLZajF4M+6eFOIng/N/eTAzwSTFPoA4K029kAWYs6wW4P5+zPiPLzg=
X-Gm-Gg: ASbGncs9lcZJNtJ26lXb7t5MLkJAlfThOl1ZVzgtgfu3bNU+HQz/REKG97oI4/moF6z
	/JDD7c7Wy/6QAyfB9IfFVm9c9mK/ZBuPqFdI8ihLaIagpT4Km/yA5Tr01uwgmHIE/YqwfCe2tdd
	vpYtiOGaaFrlUaJTc5aH5+ZDL6YQ2qE9DO/ak8px+LETsPPvtAdNMmFZ/ASdhzMumkF0eNMvi8W
	/FPhI8odNBCYSqxjN3+LmvDK0gAGLf4HybMIMGQFQodcCR1F/3cEnbIvzmA3Z4zEyPuAFGZ2RxC
	DezU1Lnxa1vUNN0CQ3uIreR6ddGyGp40nghOEJBnKyIYoeDXSozP07AKtzf8VU2ZIztugwz2
X-Google-Smtp-Source: AGHT+IGS35VY5M1rPqiakAUMKDG0yD+vQnLoFHHRWN8o0KTWvAxQb80W+Qc8/4Dpw8gMqpj42SqYIA==
X-Received: by 2002:a17:907:94cc:b0:add:fa4e:8a61 with SMTP id a640c23a62f3a-ade1a9e805emr1313889966b.38.1749482401299;
        Mon, 09 Jun 2025 08:20:01 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7541f2sm563591166b.7.2025.06.09.08.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:20:00 -0700 (PDT)
Message-ID: <0b0cc45f-e6c0-4020-9324-758cb815400b@linaro.org>
Date: Mon, 9 Jun 2025 16:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Fixup params->set_4byte_addr_mode
 for SEMPER
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20250605085535.17963-1-Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250605085535.17963-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_082003_380933_90032F69 
X-CRM114-Status: GOOD (  20.66  )
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

Hi, Takahiro,

On 6/5/25 9:55 AM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon SEMPER flash family does not support E9h opcode as Exit 4-byte
> mode (EX4B). Therefore, params->set_4byte_addr_mode is not determined by
> BFPT parse. Fixup it up by introducing vendor specific EX4B opcode (B8h)
> and function.
> 
> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index bf08dbf5e742..9162b9297ce8 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -17,6 +17,7 @@
>  
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
> +#define SPINOR_OP_CYPRESS_EX4B	0xB8	/* Exit 4-byte address mode */
>  #define SPINOR_OP_CYPRESS_DIE_ERASE		0x61	/* Chip (die) erase */
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> @@ -58,6 +59,13 @@
>  		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
>  		   SPI_MEM_OP_DATA_IN(1, buf, 0))
>  
> +#define CYPRESS_NOR_EN4B_EX4B_OP(enable)				\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B :		\
> +					   SPINOR_OP_CYPRESS_EX4B, 0),	\

I wonder if it would make sense to have per vendor opcodes. Updating the
set_4byte_addr_mode() method wouldn't be needed in this case, you would
just need to use some nor->vendor->ops->ex4b opcode, right?

> +		   SPI_MEM_OP_NO_ADDR,					\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_NO_DATA)
> +
>  #define SPANSION_OP(opcode)						\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
>  		   SPI_MEM_OP_NO_ADDR,					\
> @@ -356,6 +364,20 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static int cypress_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
> +{
> +	int ret;
> +	struct spi_mem_op op = CYPRESS_NOR_EN4B_EX4B_OP(enable);
> +
> +	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
> +
> +	return ret;
> +}
> +
>  /**
>   * cypress_nor_determine_addr_mode_by_sr1() - Determine current address mode
>   *                                            (3 or 4-byte) by querying status
> @@ -424,6 +446,13 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)

>  	u8 addr_mode;
>  	int ret;
>  
> +	/*
> +	 * 4-byte address mode method is not determined by BFPT parse as SEMPER
> +	 * does not support EX4B(E9h). Assign device-specific method before
> +	 * spi_nor_set_4byte_addr_mode() is called.
> +	 */
> +	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;

not here please, but in the post_bfpt fixup hook.
addr_mode_nbytes is described in BFPT_DWORD[1], while
set_4byte_addr_mode in BFPT_DWORD[16], 2 different things.

Cheers,
ta

> +
>  	/*
>  	 * Read SR1 by RDSR1 and RDAR(3- AND 4-byte addr). Use write enable
>  	 * that sets bit-1 in SR1.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
