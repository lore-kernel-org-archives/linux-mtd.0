Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6109DD339A2
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 07:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWrUwImj1Y38q5i2ZjBgAcjNHAxvsCBwcoL3NbW4Gw4=; b=ISPnkjlN+11unU
	Y+dMT/Ox5IxBK6UGEOlTFY5eDA38i4EUPO4TWMdutqWxoRhZsWdXE/8yhiU1GpDQUggMG6M0x7bz7
	KNxpOfMc/rU4bNUJro9OjfHiMefavA0lut+r68TfOy8K75yqbC1odWmCsD2lHmsi3UrxwC2wN1iVE
	jAo+q3tyg/T+dUYC4pdgScJcuqWCCfJfMUfijjRHj17huqM6a8AcI9hzrDhJZjzJwT7bxI/G/aois
	Fc6/Aeh0HLemOckmh1kVA6sAw8HnG6R0XhLVpuv8dId0oxObJlo+jTNTuLsYY5Upw1gyxU6v+RoFq
	KRjdoZoAT4JRVyffRb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gjm-0000000DW7q-1uPx;
	Tue, 29 Oct 2024 07:33:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5giv-0000000DVsz-2Yas
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 07:33:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so3604031f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 00:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730187183; x=1730791983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=or0vKRrASb5HvCrI2JbfkMljC9btgFadJzS9plKVN/E=;
        b=dPM6hMJKGTePbMCYgK68+2xFKnu5UAYlWYsM0JiTu2lSpQeNJVeauVFNvZKjj5dL+j
         TaO0d3Crgp05ft0Ny4XquL0Js9Y1SQJqyWtA56i9TBGxcfHAw6fUnLAVJ7YuRq5zEykx
         cMpsxVszUHJ+h7VzPyC8Hi3c396AnGwVFCDdSKCfQhUG+EPEPEZeuT+/2ShlyWpFS10z
         GESKA4wXpard3SF6QtLxsiq+g5h6RJeL5tjhpQGjAmxlC9+QcCyga1p1x6jJyTLtYShM
         cLxyZllclDCjLfuLAaQ3Nxm+x6eMxiNnuk/JMVJ2f/OJ9BTaeRAO/nXJLyePRmUfWljU
         WpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730187183; x=1730791983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=or0vKRrASb5HvCrI2JbfkMljC9btgFadJzS9plKVN/E=;
        b=Mwghj+ICCcYSkUdsQI8Lpo6ObprR8+wa3Fbuu4LF+3aEiS0ilkTv4tVyP8KS/gflZF
         grJuOvwqroMUUclHrCkkUzqpM9gsRlJ8V5ucUGAW3AfbBJ7guLuMbZIoS8IrMI3kIYEr
         jsoy5bA2Of4fTjMSPoGYb3qoljU66zK1AJP9FHAvoMSFIsK+mti4Bu1fH7PiApmqy7U2
         OWEo5o37g3wbxZ8Ew88szDjmH7MHx29L4B6xpTl7I41mslVUXq0eGtuMhE/OGdR0YVKd
         YXtq/rnBMXfTayKY7a6vdaTETtHud14njokurJuDG3F6WURJHNemlq6lYPqrUYfRsLLX
         +f4A==
X-Forwarded-Encrypted: i=1; AJvYcCVqhn1jHNh16KyKWhSnbTrYkMUMeIZl+vLnuahq9f3pw0M6pEOQVCqBtaGoGbL52+5rUJSqpiNo6Tg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKGoHZ7JF2o8ZdKo2RZRMRB+k5lJTYZ4mN8CuwYC0bkWgDoAoQ
	oVJL+EzVJQ43jm3PtRftPaqM3omK5Vkd1eyV763W9PGv8v8E5NPCaw2IFsNm07E=
X-Google-Smtp-Source: AGHT+IFK3d9LU0pbDWJ6yIXSAn0RE4ez5L+HbHspFy6HdA/OMdwAxqljsgdqjbowDbh55t60Gd/E3Q==
X-Received: by 2002:a5d:488f:0:b0:37c:d179:2f73 with SMTP id ffacd0b85a97d-3806111f422mr7802502f8f.13.1730187183188;
        Tue, 29 Oct 2024 00:33:03 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b4a3cesm11579197f8f.63.2024.10.29.00.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 00:33:02 -0700 (PDT)
Message-ID: <f4a5e5a4-9a0d-4b3c-8fe3-80e684fff758@linaro.org>
Date: Tue, 29 Oct 2024 07:33:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: macronix: enable dual and quad read for
 MX25U25635F
To: Parth Pancholi <parth105105@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241024114021.17567-1-parth105105@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241024114021.17567-1-parth105105@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_003305_695901_FBF5A7B5 
X-CRM114-Status: GOOD (  23.18  )
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



On 10/24/24 12:40 PM, Parth Pancholi wrote:
> From: Parth Pancholi <parth.pancholi@toradex.com>
> 
> The MX25U25635F supports dual and quad read operations. Set the
> corresponding flags to enable these features in accordance with
> the hardware capabilities. This change also enables dual and quad
> read operations on the MX25U25645G, which shares the same ID and
> has a superset of the functionality provided by the MX25U25635F.
> 
> Link: https://www.macronix.com/Lists/Datasheet/Attachments/8663/MX25U25635F,%201.8V,%20256Mb,%20v1.5.pdf

Looks like the flash defines SFDP tables "Table 13. Parameter Table (0):
JEDEC Flash Parameter Tables".

We have some minimum testing requirements, please see them on
https://docs.kernel.org/driver-api/mtd/spi-nor.html

> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index ea6be95e75a5..be55558c8ad0 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -129,7 +129,7 @@ static const struct flash_info macronix_nor_parts[] = {
>  		.id = SNOR_ID(0xc2, 0x25, 0x39),
>  		.name = "mx25u25635f",
>  		.size = SZ_32M,

if we want to switch to SFDP initialized params then we can remove the size

> -		.no_sfdp_flags = SECT_4K,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

and this line as well.

>  		.fixup_flags = SPI_NOR_4B_OPCODES,

If the flash defines the 4bait table (I don't see it in datasheet
though), then this line as well. We may remove the entire entry and rely
solely on the generic flash driver.

>  	}, {
>  		.id = SNOR_ID(0xc2, 0x25, 0x3a),

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
