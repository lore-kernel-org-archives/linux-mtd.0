Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8337FC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 06:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/HkNatThv1aao0p8uTPeTrt78mdX9smZ4IMwXgtdF0=; b=aFrasX4XbQ60A0
	t9aeVGgskVHgvqC2UqXPv9C519bImoLZczdVmxVm1yuMqojk37QQWP59LKzANKFmQdRxWYIfEaXeK
	4w0k93MALpkqNhmwV67NbahXxwJMdXFM+vtZ7JakvRTkukII8kWv65ajx2GaTTdm/bAHWakUUYM/9
	84IRV3VAeQGb56FSc7/QZeIank3/PILrb94h0iUj6PB+DlKs6AIr0sFIRjBCEeMrxlHpyxS5MI/yW
	F4d0yeqUVoBCWd38/ihWInRdhjhOMGVk094+y+ZS5SqF/x9u/AUjPJGLPVt19jGk4hne0f+FcQR4r
	AHWjK9DURnuX/y6XlLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQTf-00000004pYr-3aWM;
	Tue, 18 Mar 2025 06:31:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQTd-00000004pXL-00aj
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 06:31:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf680d351so15919075e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742279459; x=1742884259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXsRVC7+O52roT2qjifznXtTujlYjDhziLvEJ4ugGCE=;
        b=s/vQKUfB5YY45QizxNAvsiqx0TRENq0ZiioFyK6aC0Pl7t21AljqtUpfxMu3TXMuE0
         klZiDOj1ra8PAb6OfgZS3lsNrdqRW2c1f643R55rj4m8p68N8SchW1IPr4yxHvKRGFVP
         W98EgV6NjM1FMkNf2hIamSLhCUoAduIkC2uE6sE20PRAi6GiXqbDup95jwxm2qqICGsQ
         4+iJ8IhB9R/KBmcJ+wIct5VX/W7Nyea4jJedT6papRRWlSJky7qvrZNi4tGxm8q2ZtCz
         88Q0k1jKRDz1lWmv+2Jj9e4jDa1Fr6Am7BgWDpaWlyKKQ2P1hFhB60fdeFC2VTA/ILib
         IokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742279459; x=1742884259;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXsRVC7+O52roT2qjifznXtTujlYjDhziLvEJ4ugGCE=;
        b=s3Uy1BMtAlTwnRTqFVqQbcqQrNRgXd6/X7mF+I606oSYNMASjxjvo7uhlql1mnYzhI
         GzON/NlK7XhuetdIkrRJefyPuep1s5GHt1Oo7UqUoLGkiz82ON/bIQ/ngRquvZZjqVoJ
         c01bWP3YnjBR9MHf8I6NQTdNanWtoz6vmyQ5S7t8KM/zO8fnnKzditL/XMVIQ1q8pJ62
         76JfdbqxNrTYJveonmRaH86wZ824EidPB3dBheDRfwk4SVc9Hw9fRTQr+2tJylLJhK2I
         0UQGFavj8XCQJdPAb8jAeNcW0Frm6K7vK65Ft22IWajRy8oO20PoXE7PBgWP7TbDg34R
         JUPA==
X-Forwarded-Encrypted: i=1; AJvYcCUqUtma87C1WIpiIdejqHgbs8mTbeTCvIQ/OPXD3rfnarmMA2G/tfJUPa/tHvi+K/DmyMM+8uIXjVo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg9ZLibVAw+KgH1XHceI2keaZfdSvXioQwghBd9rzysqpyYSOz
	WAvMBHbxXSxrjVGVfHtNuMMvbbmWvBxIwTJjjlPgHXcME7mvf2tA0lj0mJUvv5s=
X-Gm-Gg: ASbGnct6eBvtP0XFSWpif9Fpkp7lzxAjTjuS3LHBvFzYqOvmRsRA4oNzonpDl6Ieswc
	77bcF1WLRDTj9Z26pu4brVWY9Ke4uvoeY+iR2WK/fBTHHnO9XQrLBTIMSZGo4J5EWY7xJ9gQXia
	/WyRUQDVT23GLWWoxZUh7vg/lYo2E0CPqLDcU/fbckKvS83/tCLRT/l2BW6+kUPJbw/3Hs7UZLT
	gXjna3qUBUzGoPNwUN36BzVs7gQRtSWOdklU38KFMK3WZalIM34YefT61b1hw7TKgLh8RydP3th
	E7rC7XWBpnTzNRNl7Xit1ioVJYTHAzr9xxKdcyJ2tGi4ZepMz02Nhg==
X-Google-Smtp-Source: AGHT+IEvxvjjCIFKWh3dRxXm3eYkJA+qlr6RAryA7+n3CuEq0jX4K981fmJidDv6Ey2as6qSMTEnOQ==
X-Received: by 2002:a05:6000:2ce:b0:391:bc8:564a with SMTP id ffacd0b85a97d-3996bb7747dmr1627926f8f.22.1742279459362;
        Mon, 17 Mar 2025 23:30:59 -0700 (PDT)
Received: from [192.168.0.62] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6b2bsm16752377f8f.26.2025.03.17.23.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 23:30:58 -0700 (PDT)
Message-ID: <b3065eda-e224-48e5-a5fe-2d5c8f4e5b6c@linaro.org>
Date: Tue, 18 Mar 2025 08:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: macronix: add MX77U25650F, MX77U25655F and
 MX77U51250F
To: Jakub Czapiga <czapiga@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250317182058.2060277-1-czapiga@google.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20250317182058.2060277-1-czapiga@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_233101_051425_15461F98 
X-CRM114-Status: GOOD (  17.48  )
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



On 17.03.2025 20:20, Jakub Czapiga wrote:
> MX77U25650F and MX77U25655F are 256Mbit chips with SFDP and block
> protection support. MX77U51250F is 512Mbit chip with SFDP and block
> protection support.
> All chips also support top-bottom lock configuration, however this bit
> is SR2(3) and is also OTP (defaults to top). Due to lack of API to
> support TB in SR2(3) and due to it being OTP these chips will only
> support top blocks protection.
> 
> Signed-off-by: Jakub Czapiga <czapiga@google.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 99936fd25d43..c65e7cdab5cf 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -193,7 +193,22 @@ static const struct flash_info macronix_nor_parts[] = {
>  		.name = "mx25l3255e",
>  		.size = SZ_4M,
>  		.no_sfdp_flags = SECT_4K,
> -	},
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x75, 0x39),
> +		.name = "mx77u25650f",
> +		.size = SZ_32M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x76, 0x39),
> +		.name = "mx77u25655f",
> +		.size = SZ_32M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x75, 0x3a),
> +		.name = "mx77u51250f",
> +		.size = SZ_64M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,

drop name and size, add name as a comment and do the tests for the next
version.
> +	}
>  	/*
>  	 * This spares us of adding new flash entries for flashes that can be
>  	 * initialized solely based on the SFDP data, but still need the

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
