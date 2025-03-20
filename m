Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB68C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDHcLTxfLcCvzPq4CZ5hmwiPiYFCcdzn4igkM6tDnz4=; b=42Lq9QLVERHzU8
	QSNd6zEaI0L/4Jb3EocbarM/xr8o3yGehRSIYrETabBCvdAxx+EeYh1rzTioIgY2dC/JiHwb20ho3
	uI0M3cXCIospdmqY/8NhO+DWDt+eqDvsfKVOUKGQQfp7OMzgxchvFcxTMokR6jVI3/5EKxmlA1dT1
	IXS16HjtlBzHlwPuUSKv3XeQiPPON/D2MCTzyKjuTcXPgA7anfqGqmdKAx8X7JQNX7ZsM0ZVB15m2
	NJu3Czt6okJFwg8nYwCsFNQXROyWKaQ7CwnRh5AEHoZPxje/qhou1uOh/hD882IrLH0ESyXIvSvpo
	eRz9c72Y+6tyWfFqd/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEyk-0000000C6zv-42pa;
	Thu, 20 Mar 2025 12:26:30 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEvp-0000000C6Rb-2Ehv
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 12:23:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac297cbe017so334365666b.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742473408; x=1743078208; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4L0wtp4vAfj99xNR7JACQ5fBXNp5AHv/RHN+M6rMMI=;
        b=R8UixQaQT4s2cmLYd4WRL+NGd2sOlWxz4RgMl2lpBvVO/tAPYZT8EN0z6+rmhDxZyF
         NII33PLsFI3Ixc1MSDEjBNEVQuonNe16y3Gn6B0ao1ijXHwS2H7Fm6hJD3K+Xi/zmKd7
         K+xKlqSh7tAGBQB2aGKd7nuy+jgvjvJ77+1LJIueB7FlJoten9qucQOrOVkYKUCzmkMW
         XKaLyuI7csUyNkcHJCn78upCzandEG5Kcfg/3LRV4GMS7CNd0paJudfBifcUNjGLoInV
         5cLxHxauc4Pj/4W69t43xNvav2p7ZVfCqE4bkrKs5hR8Hl5qGAQQlXh3AsAy51cyDDwG
         Rm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473408; x=1743078208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4L0wtp4vAfj99xNR7JACQ5fBXNp5AHv/RHN+M6rMMI=;
        b=kUyZr1M/EviSduo7gQPt3+sQvpG858SX/GwqqMb4zj9MugXlZ0rELeXqMRzbIIoMkQ
         GLxoqVKTDiV8LQAeUrSSanwlRRnX6OAOJWqqgUQFkPiTWtvXKLGFNSp3kg/a9lYR4hEE
         j409fHD/WkFJBDdHXMUS3pMLBd7MV4Zb9sqdu+bY7k/hvJmXDA7t/+Y9qUXVVYaFe1Fz
         NmYvtHH5+li3+RAbESD1QJmpa6t1DPfiVOx60JUJ6wRxCGCwVHMixD3bv4F9czyQe+Am
         FsO83jsoAdE/YRJlx8mkmZxiO1VCkS97RtM9xpjBFOdRE6UjmFC446H042HitrKr7Bl0
         zQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCWHlR60c3p4NeoOK2eSV8GuofgRHyrjEQam1ZfX0qvxVhgUoG0oAO1F2AP5i8sS5SYmPXGMIH7Ahi4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3atKcX7OluyK5gL98zDB4UIpnJm1WUcxSrbj0Ql9wuMsbmrtJ
	Ba4+G6BHE+jIPGNMf+yvfuIyf1rH4FuSh1ZOjV87JCME/rqTRj/S8efQ/Tumqsc=
X-Gm-Gg: ASbGnct6nd14PWXbbk3dJN2O5+DeISuzbxTaJCwUQSdyHa47JWTpy8aVe+bqDiO3lqm
	VxCmEIRumdKFwH/zuErQe0TBgAMpImi/nOyuZHUb04VQ2ITROdhVF2YdH7mXnOyAr2OrPnxMk0M
	YXU64EvT4rMRSgaCeQIVebuy1NyqZ/RGu6sy9/+iIDKERV8jhCTrC8irSr3QwVBo8avKjzFSI5D
	HLdcqrILZ09wgnk2XniEdHrOVR7++pu9wWqbDE7YtS6IsZjh77n6I1ESZc4iTWP9J4uoB/IYK5/
	Wx6u0Q4va+Mjl0ELoORleTWbETRIovnOCRNd1oHqRoT/66vB2zMAUg==
X-Google-Smtp-Source: AGHT+IFy4ujO0Rlctp5VuJNnxmLa2FTdTGd/kenok8V6y6/ECSHPNsDf3e3bTkQH3sfVrQUIU8/JFg==
X-Received: by 2002:a17:907:94c6:b0:ac3:8537:9042 with SMTP id a640c23a62f3a-ac3cdc8e455mr321840566b.30.1742473407716;
        Thu, 20 Mar 2025 05:23:27 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3da7e00dcsm96386066b.56.2025.03.20.05.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:23:27 -0700 (PDT)
Message-ID: <5db8f280-8f1a-43e0-a2d3-baf694eb81d2@linaro.org>
Date: Thu, 20 Mar 2025 12:23:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] mtd: spinand: Use more specific naming for the
 erase op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-5-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-5-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_052329_585870_8910915F 
X-CRM114-Status: GOOD (  17.15  )
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



On 3/7/25 3:08 PM, Miquel Raynal wrote:
> SPI operations have been initially described through macros implicitly
> implying the use of a single SPI SDR bus. Macros for supporting dual and
> quad I/O transfers have been added on top, generally inspired by vendor
> naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really means by describing the expected bus
> topology in the erase macro name.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/spi/core.c | 2 +-
>  include/linux/mtd/spinand.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index b6c0993206ebab1dcee715ea6de33efe7d5af3a2..1959e8d9c64be004c71a0d6ac6454fde08e708fa 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -529,7 +529,7 @@ static int spinand_erase_op(struct spinand_device *spinand,
>  {
>  	struct nand_device *nand = spinand_to_nand(spinand);
>  	unsigned int row = nanddev_pos_to_row(nand, pos);
> -	struct spi_mem_op op = SPINAND_BLK_ERASE_OP(row);
> +	struct spi_mem_op op = SPINAND_BLK_ERASE_1S_1S_0_OP(row);
>  
>  	return spi_mem_exec_op(spinand->spimem, &op);
>  }
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index d041b1cc18de6add45800eaa7605bda1c64ca257..545531afe2dac593d112065483afd180226cc533 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -50,7 +50,7 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_DATA_IN(1, valptr, 1))
>  
> -#define SPINAND_BLK_ERASE_OP(addr)					\
> +#define SPINAND_BLK_ERASE_1S_1S_0_OP(addr)				\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0xd8, 1),				\
>  		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>  		   SPI_MEM_OP_NO_DUMMY,					\
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
