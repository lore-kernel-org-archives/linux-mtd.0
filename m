Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE66CCFA13
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Drn05BQwIITxdw7SaM6GPsaZ8xzm+6+zuerlYUmcRDs=; b=C+weYMGp9RQhVh
	TTlB2ItrFQPjnvhO1HRCqxEcbjDUhOcIhNM+vn7AVzIae2OZMXq9ENynunrwOo4JO3oswr58Oiuyk
	WIY1LEQ+hs/TO+k/hjcx9qMArrR+Vdn4G+dLyG59x5wlRUMAzqkM/HWIXw8SgngFXXPJILH1Emm+u
	xNQQDJKXj3J1aZPlO49xr5lMxBa+Q76eElQa8lfANMa0U0MRpI+ZpnClp4GkRhnHfQ/7Gm+nsp/58
	uqAP8R+Hz5jWDmFQnyw7CNVzlh3LjPRrKvZVD0ZiguCF+S8kN40yxWYw7fiLrdLezLE3kEZGEyfHP
	dT92egjF2rtpuis5facg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlRR-000000080g3-2AwH;
	Thu, 26 Sep 2024 10:09:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stlQG-000000080aS-1sok
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 10:08:34 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5c5c3a1f474so780781a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727345309; x=1727950109; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPI1wSnI2Xvwc1fBKmkQJN8RFgbR0lhO6jzNyKbT6Jk=;
        b=CN9PnnVnmApZfaJay1QVIpVpdUuGsDuf7rqMTnszJrnVcTsEp94NjS2GBq8FEYvpKt
         P2U6D5stLr73HfnLY8sy8unNp2eiuFwfkXx7/tvNQFX9uNbKmxodcaJSs8NVovBJwXt5
         VpkiCaa8xeF6xYj+w878PgNlxKX+hw6xh/AoWzSw8CjYXGOXBQuR9Y0q8KFd0zMm+mv3
         977sWDdnSftVuFodwkrFXlB/GR+EI5Oo8G8bfvQuvzz6409DHlsfXQQSXjvSN4GwdYJf
         GT2AFn1rtI2HT+vtbMWPZsvscjEBh8Y4nkTabFxjfwZiSZFFL/3urPk1RIRTQ/cecn+Z
         5pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727345309; x=1727950109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPI1wSnI2Xvwc1fBKmkQJN8RFgbR0lhO6jzNyKbT6Jk=;
        b=TmdwuIojfNYE3VMC5p4vTnGYOSibslmsv1ToEDN3CZovW+sO8YP/8Cxy0hQj5uPUvc
         NCVe2Fy1nE7RSiq5zcBZhO6X6SODRbZmlmHcsrjzIsb2zfY7Mh64I/cKIWM91m6P6lHH
         S/qis7CWPcZxQsZE9SIzq7o/dbYCPTHOXiFX5KKwmw/vpHkcRAqzm5Lz/uSePSEylGnQ
         Yv+Vn+V6Eul1eb9FGp1Le/QsM7CrOHskom07coIZ091EDZObQTYSecN06cYozIUW7beT
         Y15uY89zB+E07m/p6am6LQzBWiHMXbHMMUrJoYVh5DAAwOtlecD+XmzzRrrNutGhqrCD
         UDAQ==
X-Gm-Message-State: AOJu0YwKP8KQiNjxX3wKOYiBv4kz0B0LbabkPu5FXFLfOBRHWpCXO1Gf
	acWhGt9begaGobHSOOmnpesTaAeaSteJnfSs5jwQ+uvrjLHlrjfuKei7w10k/Ng=
X-Google-Smtp-Source: AGHT+IEpzY+Q0d5RmuZcmwykEo9QrY6zdyd7ykAY1XjzcXyllboJtQ0PWSli0HLW0FqQOORYQgzsZw==
X-Received: by 2002:a05:6402:50d2:b0:5c8:7a46:2c9 with SMTP id 4fb4d7f45d1cf-5c87a460575mr631170a12.20.1727345308828;
        Thu, 26 Sep 2024 03:08:28 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf49d8a0sm2947655a12.46.2024.09.26.03.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:08:28 -0700 (PDT)
Message-ID: <e079751d-e775-4dec-9959-c9c3fdcc8ecf@linaro.org>
Date: Thu, 26 Sep 2024 11:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mtd: spi-nor: macronix: workaround for device id
 re-use
To: Esben Haabendal <esben@geanix.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_030832_497754_F4571C81 
X-CRM114-Status: GOOD (  18.43  )
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

Hiya, Esben,

On 7/11/24 2:00 PM, Esben Haabendal wrote:
> Following up to various discussions, this series have now been
> modified so that it gets rid of the old deprecated approach
> for detecting when to do optional SFDP parsing.
> 
> Before these changes, spi-nor flashes were handled in 4 different
> ways:
> 

I'm adding a bit of extra context on each point you made. All your
points contain static init, you missed spi_nor_init_default_params()

There's a 0/ case where we have indeed just SFDP initialized flashes,
and that is the generic flash driver.

0/ SFDP only, generic flash driver

> (1) SFDP only [size==0]

1/ static + SFDP

spi_nor_init_default_params(nor);
spi_nor_parse_sfdp();

> 
> (2a) static config only [size!=0 && no_sfdp_flags & SPI_NOR_SKIP_SFDP]

2a/ is
spi_nor_init_default_params(nor);
spi_nor_no_sfdp_init_params(nor);

> 
> (2b) static config only
>        [size!=0 &&
>         !(no_sfdp_flags & (SPI_NOR_SKIP_SFDP | 
>            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>            SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ))]

2b/ is
spi_nor_init_default_params(nor);
spi_nor_init_params_deprecated(nor); //where parse SFDP is not called
	spi_nor_no_sfdp_init_params(nor);
	spi_nor_manufacturer_init_params(nor);>
> (3) SFDP with fallback to static config
>        [size!=0 &&
>         !(no_sfdp_flags & SPI_NOR_SKIP_SFDP) &&
>         (no_sfdp_flags & SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>            SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ))]
> 

3/ is 2b/ with parse SFDP called and rollback mechanism
spi_nor_init_default_params(nor);
spi_nor_init_params_deprecated(nor);
	spi_nor_no_sfdp_init_params(nor);
	spi_nor_manufacturer_init_params(nor);
	spi_nor_sfdp_init_params_deprecated(nor);

All cases from above are followed by a call to spi_nor_late_init_params().

> Cases (2a) and (2b) have been handled slightly different, with
> manufacturer and flash_info ->default_init() hooks being called in
> case (2b) but not in case (2a).

default_init() was a mistake and we shall remove it and replace it with
late_init(). The challenge is to do that without affecting backwards
compatibility. But let's move this aside for the moment
> 
> With this series, that is changed to this simpler approach instead:
> 
> (1) SFDP only [size==0]
> 
> (2) static config only
>       [size!=0 && !(no_sfdp_flags & SPI_NOR_TRY_SFDP)]
> 
> (3) SFDP with fallback to static config
>       [size!=0 && (no_sfdp_flags & SPI_NOR_TRY_SFDP)]
> 
> Existing struct flash_info entries are modified, so that all those
> that was case (2a) or (2b) are now case (2), and those that were (1)
> and (3) are still (1) and (3).

We indeed want 2a/ and 2b/ to be squashed, ideally by removing the
default_init() hook.

And if we really want SFDP-only init, we shall not call
spi_nor_init_default_params() in this case.

Your patches do not apply on latest SPI NOR, I tried locally. Can you
point me to a branch of yours where I can see them? No need to resend.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
