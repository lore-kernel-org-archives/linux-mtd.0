Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21274D13594
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCI9AhfFWSycdni6YYpP5pM8XtLpb5DcViXFoyzg2ns=; b=matd7Ul5YoWxVu
	aeuVgFqVbK7/dt3oGs1pztxGQdDk4Ts+lK2645bajWiiEazEBfqyvF89ATyZ+F2yR4jRj23tJJWb/
	98ruMku1HdNcJO7p8o8wwxkGr/Fte3XvV6PxoFEiy2ekbCL1mD/2xd+sO1dkQIWuW7manGsIU5aqe
	1jfEPaVKGuuAndMCsyqy65ww5brkfbI5+w0XvPIJ9yDL9OoLJYLN/QjW7XodrG2CocOSLmX5cUYhE
	jupIlZSHYtOd2kydKAQui0U3TZcjRvXVFMcp8kK9vxjLN8EDPFqN+efWlCOmba98bn+1wCQ5nag2x
	mhbqbnF96E2tfT+fcvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gYJ-0000000DUJ7-1yDO;
	Tue, 29 Oct 2024 07:22:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gSa-0000000DT4F-2zXw
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 07:16:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d533b5412so3617066f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730186171; x=1730790971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcDAqbWqsvymz4STwgK63u6lc06fHWC6bKwW46nTONk=;
        b=HsS9lF1wtfKHYz+FIPGyQtyaU7s46CxlM9BulthWR3h3cv3J2DQO2x5K99gc96NcKw
         EU5vu8eDxVFkqjEdymZekEa/L9Wh1isFXrPLA6XkfYMHNyC5qE1ZHIQXZaNqZD5LOoiF
         7trSQZ30tpxT92dPh4/skfG/UC39o7Pr0Q7VbQOypEhah9KZpXlzs7xp2TN2OpuWfrxW
         Zg2HswGTF33o/uDJf6EcGi0O6H7v4DAPpzPB5NiOxkafB1amNRzCp52OA8daJYMCHvKP
         F9GHdUwsFiEjlII9QlNlkRNaeX3VsruvxDVhqq7K9X/C4nzZmz8+XsjWVxH9GGv61QgS
         CMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730186171; x=1730790971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcDAqbWqsvymz4STwgK63u6lc06fHWC6bKwW46nTONk=;
        b=N2UFCCwss0wJ5qC74nypsVsS4n0w1X5Ju9/RZMbY4wS4PZvXwlzfmOlpsSp55m1i1/
         xRfIYVfele1jRDn/soKcaS5ldlel1dwD+Djc4P+tBiKDKVXZKs/jsDjMBVRHBuX1tpU9
         oh6a+tkqwApnhO9MUp3RFUs+RQvWMcok5fyhN7VcmLQrJ2vrPkp+sOYJVNjshqkTLbfp
         qhx679VF6xdIkg/MdCYQp+UKc/msoatb1a1pTwVHuDRbB3ZJAqWLsS0xDFWBUtCecaki
         +RsBBk59NJ422yKyrtpWYfmwZQZW7x46a9HvUo8Ws9cIRMWirpTea3Er92jkhJ4+O+bK
         TYUA==
X-Gm-Message-State: AOJu0YzorMN2ylP8DWu6s/PMncxPMlNirUchxVrSJmSubnADvIsbzu5n
	aWRucnvpqx+4CLDwLA2qBUQG2KsnNv0nBzT969g3rsMeUBOgNXMtgQ8O3ckgcfM=
X-Google-Smtp-Source: AGHT+IGyPTVVmj2DPxCz2CTebpQz3Rt+6BKUInDdlX4vKTXedS2U3OsrdThrefTQ1j8XH9/JSVrTRg==
X-Received: by 2002:a5d:5711:0:b0:37d:47b0:6adc with SMTP id ffacd0b85a97d-380610f8251mr7858179f8f.4.1730186170958;
        Tue, 29 Oct 2024 00:16:10 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c69esm11636277f8f.13.2024.10.29.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 00:16:10 -0700 (PDT)
Message-ID: <239d2425-52f6-4deb-964e-e22d1a1f6637@linaro.org>
Date: Tue, 29 Oct 2024 07:16:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: atmel: add at25sf321b entry
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241018-spi-nor-v1-1-d725bfb701ec@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241018-spi-nor-v1-1-d725bfb701ec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_001612_827492_510A5B7D 
X-CRM114-Status: GOOD (  17.03  )
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



On 10/18/24 10:51 AM, Marcus Folkesson wrote:
> Add entry for the at25sf321b 32Mbit SPI flash which is able to provide
> SFDP information.

then we could initialize the flash based on SFDP. If you don't need
locking then probably you won't need a flash entry at all. See
https://docs.kernel.org/driver-api/mtd/spi-nor.html

> 
> Link:
> https://www.renesas.com/en/document/dst/at25sf321b-datasheet?r=1608806
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/mtd/spi-nor/atmel.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 45d1153a04a07b7c61f46b117311b24ab695038f..e635559711a4b402d23d49da93efc15e6be571dd 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -238,6 +238,12 @@ static const struct flash_info atmel_nor_parts[] = {
>  		.flags = SPI_NOR_HAS_LOCK,
>  		.no_sfdp_flags = SECT_4K,
>  		.fixups = &at25fs_nor_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x87, 0x01),
> +		.name = "at25sf321b",
> +		.size = SZ_4M,
> +		.flags = SPI_NOR_HAS_LOCK,
> +		.no_sfdp_flags = SECT_4K,
>  	},
>  };
>  
> 
> ---
> base-commit: 200289db261f0c8131a5756133e9d30966289c3b
> change-id: 20241018-spi-nor-dc29698dea0f
> 
> Best regards,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
