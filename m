Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD77EC7EE22
	for <linux-mtd@archiver.kernel.org>; Tue,  9 May 2023 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTctZIaRXCImLSffTY54X3uEQUFVMHYRYfj/xhxXIdc=; b=XJ7lQoJROG2J2D
	BihVlsS3MWLH0LSA7tfd0HIXXKIHLHAiEYERBWT5rA81s4QLvN4xc1U5obr79u85qMFu8iyM5SBjg
	xYv22NjvjDX7vHN8UwZMy+t/dmporDB3zyz0Ss+VQHUdlEOft1eKIWTaBdGT11cBzOwJpeXwykpSG
	Hyrlmcp88WJr+LgWjVpYraR9AzfVE6nwHmtO5vmuPN8v44v+gXyN1NB6Lde4FY4ZlHKkQcko0Wg6S
	Jv3DzK2wopAetPXpSqDBFqHsxNtZf0WAjPTKFBkKBnknH6xE0DdORVLqmVJVMeHiA/uBAFGMuEhBV
	5C2zp1fBwfCPW56Hcxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwT2R-0047Xd-1L;
	Tue, 09 May 2023 19:30:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwT2N-0047Vg-0c
	for linux-mtd@lists.infradead.org;
	Tue, 09 May 2023 19:30:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f19a80a330so42199385e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 May 2023 12:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683660606; x=1686252606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KD8foC69hYMuBlOy5cIRDovU5YqqAriedzy7jkhIVWc=;
        b=hjWv4CdizCb5J1oWEPMb12XkrjAsfQJBpfSuY/yw18u5IvhHwU+r5+CS87XB6EhFan
         Hp3okvkgOTZIsWb8B3BYO/x/sDcVlXubXhnq7IDT9vinkWUOSzjpRfUKsP+9G5XOw+k4
         nWLZaW9fVOppOU5x/O4DICinwl5wep+EcNSpu3+Oh9cH0EkfC/XErl9JOT6Z/LjBV3uk
         4d7QjiX+xMAzIWb9uH3AU9hDSrovA0wSEECUM0S/2nuVnl+30se+yD1AXzm2Pkbk6wbD
         UNRbAEvRDkEbnQBVZcEDuKHPRnpnoHS27LLR4DjEw2J6L35WlKSyIDjGtPxcny7V1fA/
         b9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683660606; x=1686252606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KD8foC69hYMuBlOy5cIRDovU5YqqAriedzy7jkhIVWc=;
        b=D9jeUnvlTaTzwYhBAVRQI0HoFYmG3YEhbavGd1Mbe6/YYJ1mLGAh8LWNO+Xa1svARA
         yOigPQ9j/IUC6FBWKH1D7ltEs/ptA2tgTp33Q7IIqM6G7TJwXPC/Izxi9TgAtcOPPgky
         kFARThraWIQRE4Fq9MEdHpUTkiIshmkZWigfQWy3x7OOamYzbAdycLbInQdEUgshIm8J
         WyxD84h2NplQiLufA1rEPmnaZcEgyJup18XqawJJ/1ElWD9OO5jI1gppQy/SDjj/GXjj
         xWPGWw6ra6NLyUZCFMbEh6mh0lzFepGjY0xzTeAG1mUixGEd13uWmp0j6xp1JW8Bxf2s
         uFLg==
X-Gm-Message-State: AC+VfDwZefp5hDz6iVIsQiiEAwfR+Cs6yN/sOAtyrG68oopickZRVZo+
	IrBaca4uA1yunBd2aBsiUIqrEGq6WOC8NSdz/VCzFQ==
X-Google-Smtp-Source: ACHHUZ5eHOkeZGugmMpFbGtkyT8Fb0sgGowYT4KC7/jTTUMf3nNxozaQjiyoHYcHI62l+bVbKcqf3A==
X-Received: by 2002:a05:600c:3655:b0:3f4:2cc7:aac5 with SMTP id y21-20020a05600c365500b003f42cc7aac5mr1773933wmq.9.1683660606538;
        Tue, 09 May 2023 12:30:06 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id h8-20020a1ccc08000000b003f17eaae2c9sm20814149wmb.1.2023.05.09.12.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 12:30:05 -0700 (PDT)
Message-ID: <29a5762d-ecf8-948c-2892-58ff3349ada3@linaro.org>
Date: Tue, 9 May 2023 20:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: make sure local struct does
 not contain garbage
Content-Language: en-US
To: miquel.raynal@bootlin.com
Cc: pratyush@kernel.org, michael@walle.cc, richard@nod.at, vigneshr@ti.com,
 Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, geert@linux-m68k.org
References: <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
 <20230509192506.947094-1-tudor.ambarus@linaro.org>
 <20230509192506.947094-2-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230509192506.947094-2-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_123015_234467_0CC3D228 
X-CRM114-Status: GOOD (  18.25  )
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



On 5/9/23 20:25, Tudor Ambarus wrote:
> Following error was seen with um-x86_64-gcc12/um-allyesconfig:
> + /kisskb/src/drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]:  => 495:27, 364:27
> 
> Set the spi_mem_op fields at the time of declaration so that all
> uninitialized members be initialized to default value.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 6afcc84080c41 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/spansion.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index d44ffaac1dba..257d05ed4146 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -492,7 +492,10 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
>  			  const struct sfdp_parameter_header *bfpt_header,
>  			  const struct sfdp_bfpt *bfpt)
>  {
> -	struct spi_mem_op op;
> +	struct spi_mem_op op =
> +		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
> +					  SPINOR_REG_CYPRESS_ARCFN, 1,
> +					  nor->bouncebuf);
>  	int ret;
>  

oops, this is wrong as addr_mode_nbytes is updated just below in
cypress_nor_set_addr_mode_nbytes(), so the fix is to init op with {} at
declaration, as in the previous patch.

>  	ret = cypress_nor_set_addr_mode_nbytes(nor);
> @@ -500,10 +503,6 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
>  		return ret;
>  
>  	/* Read Architecture Configuration Register (ARCFN) */
> -	op = (struct spi_mem_op)
> -		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
> -					  SPINOR_REG_CYPRESS_ARCFN, 1,
> -					  nor->bouncebuf);
>  	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>  	if (ret)
>  		return ret;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
