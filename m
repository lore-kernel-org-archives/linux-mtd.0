Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD1BC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlUaeZV5aHqMBlkXwe/KxJeZc9dPD4cyv+X/YPkPHow=; b=cR/CTOysfoVDXB
	WT+SjWhI92cPibz9lbWzo95zwRvdv0xGt5a8BkzXy8grxX9stvHGz9Q0Po9gvYK1LUbPw1V3HOlwI
	gZd5qsFoGvxFUxWIzBAoyIiVImDIE0JTMTzwwIoiZ+3OlNb7kAeRryumtrchbnbiBPbhE+KsJ+olI
	RRxCxj3YpmFR+fsJN7bq9coyz18v9SWLZyY1G2dd4/lb8yb1SNgB0Z5nMylHV8PogqnxVnbbV8lJu
	QCvHLkBgfOWIK6HtvFCilxqoScutSXOn3PBHMQBST/W7QHsQmbASXcnj59mo8gmpAuYJXhP2vIWZi
	ZKIisuDQ9f2Cj+fbGVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Ln-00000008IDV-2ev2;
	Mon, 04 Mar 2024 09:11:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Lk-00000008IBm-2VXV
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 09:11:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-412e6bdd454so1688155e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2024 01:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709543464; x=1710148264; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MAS4NfgNmP0HvgF3U0o9wHMePf9MEveoKdtR6KEo+dA=;
        b=TK2JbRUYW2SdO6NowafW1yy97QomiOnTi4bDJ6RuJqm4sQPIxRjahnKPTsDeLHpIE7
         RQZgcvx7za0rsCF1UKfaIp/G8ArmsDuJwtbBl/BRGTfgMoA5awvlRSOhC7PcwUsHaHpr
         YDI0sYxooJ46hHzOHgc1EsepieryY2kXnTCEVvAEgl2jsRKoXr3ElnXDSBnSkFmdMZn2
         /HweI/LSvpst5plSjp4Etg36w1cDLMwa/5KlMdAFxbteLrtD0xREyiw0wOXDHCKHiLgH
         L8vLv+CU4lUkHWpU8Mk1+L5WBQh4AkKjn9N/LK08vxVgnyxbR6S4aKXwceTJynPUtdiE
         x0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709543464; x=1710148264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MAS4NfgNmP0HvgF3U0o9wHMePf9MEveoKdtR6KEo+dA=;
        b=CvphMyHdnWj7tUFQ9d9mHZX3r8n60VgCS9Q+p5H0quC0yd5IsC845ITod33yMZjqzU
         AO3qJfh+fQzOJCWgVHk406buoT6Q7MIHVgZyHRz1GYMZfV6X/CFKFCrh4D42Z4f762Hx
         CsvAC+mYKH3uHv7fYS/1njNZ1Rhbg/DruxKn5hhH5TzYSr7h/lrKbNQHr63nKkU7IZ7B
         8eLGRN7FsMA4ouswobJem4Iikko0vqH6QCKl0aEqzkCuvs6Ze46xY4j6Zr1LDFdZo5Iy
         5gjNEccIFxg8CYj1DjycNgTWxdSFzD/V5zUAhfU4zn3lDOHDI4gtq0YVj3Dwx18/W9Zb
         P2ug==
X-Forwarded-Encrypted: i=1; AJvYcCW5xbVhvfH30/cXapWJr2yHG4OgKZj7o7cbkRRP4tCrFKxubrxjvzdQ3ScBMcm71V45Fg/g8ETCzzjpDcFks8dnrzYmvw/f06RPNoGk2g==
X-Gm-Message-State: AOJu0YwgR8vmoYWpXFXlDLoLP/PhTH8h9BeW8oE1R+iEVwQ5/M6ZkzQS
	3j1/hJWeMC/2menvIKmK3NxGsL7iVCcW4L8mCsw2bQNVKw1YWwlMVRGDrTYBBg4=
X-Google-Smtp-Source: AGHT+IFEmXB1YdPhR2t7PE+oBbpNOs7QcDk2q6Z7v8XjJnD94Ikv7TDFwaNIEDds2pPVHP4cpZUn0g==
X-Received: by 2002:a05:600c:3d91:b0:412:e555:f90e with SMTP id bi17-20020a05600c3d9100b00412e555f90emr938804wmb.35.1709543464434;
        Mon, 04 Mar 2024 01:11:04 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d604b000000b0033d9ee09b7asm11634328wrt.107.2024.03.04.01.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 01:11:04 -0800 (PST)
Message-ID: <9e4461ec-2207-42bb-a3a9-826eac1757da@linaro.org>
Date: Mon, 4 Mar 2024 09:11:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240304090103.818092-1-usama.anjum@collabora.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_011108_692656_C0047D78 
X-CRM114-Status: GOOD (  15.66  )
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

Miquel,

Can you please queue this to mtd/next after you pull in the SPI NOR
changes? Thanks!

ta

On 3/4/24 09:01, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite. Make its type to be
> int.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
> Changes since v1:
> - Make i int instead of u8
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65b32ea59afc6..3e1f1913536bf 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3373,7 +3373,7 @@ static u32
>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>  			     const struct spi_nor_erase_type *erase_type)
>  {
> -	u8 i;
> +	int i;
>  
>  	if (region->overlaid)
>  		return region->size;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
