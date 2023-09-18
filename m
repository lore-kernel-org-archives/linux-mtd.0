Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523FCC46CA1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Sep 2023 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFX2B+e4FCvrFUruH7+A+apTkK0CgDHip6IsiD+m4ys=; b=qsQiMzinszjBxr
	xQrboZOPyso2fkkpveiXdL3Sag1aJqhCv4Jz78fgVhlnfQwYgnMlr1qXHM2VJXN21ziOG68dLHj4/
	WgeaGclGYQPVtmdPrBLrq2wBqA37Cq9//M5OEAW8MGQMSJUSnd7NMGh58N3/uhwcVRttJVMc4nLx+
	5IR1X3dIQQg3C60Eyi4Dz3H8OEvtWJcgbelmnRNkFWNOjSiOpIEIRbJZ/IALN2kVGfp4u+Zy7IyhI
	Tir5a6hOwvsMDAt0G9QgSGd1hr+HYrefchtRl4JLhiRrBG0e0JmX8D/TtAzTiB2OCWCX2h7t1m+kb
	wSTcCDo9SKjPo+Vcmx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6h8-00ERJt-36;
	Mon, 18 Sep 2023 05:21:14 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6h4-00ERJ0-2t
	for linux-mtd@lists.infradead.org;
	Mon, 18 Sep 2023 05:21:12 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c012573498so4272921fa.2
        for <linux-mtd@lists.infradead.org>; Sun, 17 Sep 2023 22:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695014467; x=1695619267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUqOvKW20gasQsATUUwUlctmLMbjgvZAK+yffD5Uyfg=;
        b=hFEdQrXz5VHomQXiNDYU8aK70pdXGiPp81pLhfz9weVhjZwerDFb8IG4qJgfXyWyKH
         YzWPQCO8giMU9U/zusl6ivncwaDVu2obQCK47JG0a51BJa+Zkaci7Rc6LDC60qoDd4lS
         PNxhnCr3O0bla5gikQfZvjHGSFRaE3vn9CAR9wdgE9sfycADa9wavtQRwNRALCyoiYVK
         6dytltupVAFV+TceAauEoDAFU7e8kqwajoRWB4hh5z+PRCkjYKKlmtAXa/YAPJQmNLKb
         lj1XGxIRnT1JnWddx00NGpNih+hjEBIwnBZ7+azxqIrsqVqtBU0GTJ0OoN/oS7/qyoiE
         Vc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695014467; x=1695619267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUqOvKW20gasQsATUUwUlctmLMbjgvZAK+yffD5Uyfg=;
        b=WZnZdKmn1IyO1LzjsqBs4BVEE+f2NVyCIXuSu3asiHNB6OWJ87GwLo0x1KnqbuuMPz
         zaj7XQFTnPITNXwcRZSkhTJdzVc4v9yKCYamZdUi4rkm7QdPF4r/ojsshy3y0V9jX8Jh
         1fbv6MKCmh7ywRy/YxbfmRMSl29JlG8gf+WJL/KqueWGs43bAtcO0nDuOUo/KxPIf5pk
         O3h2qL5LQ2xu7AQ/YkrFtLFMhNeOIze+cx2/jWHrZBfV+/ECaMopmOLDdN4+H5+d1FFE
         cGVuaE5UFRoD1ie7tlVYmSa0AFms3HtxkVohC/fJ2l88lnY6zSKmIvRkS/ZKvGYsSUYj
         qbvQ==
X-Gm-Message-State: AOJu0YwRKj21Pj0aWHKqXgIhQigmfxCCqzJEyXmX95zHoJ79+IYbwxAd
	b7HPRH+x1peTrgoBQ7ZRaRexaQ==
X-Google-Smtp-Source: AGHT+IGxZSTVlGdgiAqlRYsJc9cSkiCTCX8EBP3s1HUqt8CLrGGNYHaHF7CoPnJ2bp65LJ0taBT0pw==
X-Received: by 2002:a05:651c:97:b0:2b6:d6e1:a191 with SMTP id 23-20020a05651c009700b002b6d6e1a191mr6585652ljq.23.1695014467372;
        Sun, 17 Sep 2023 22:21:07 -0700 (PDT)
Received: from [172.20.10.8] ([213.233.104.217])
        by smtp.gmail.com with ESMTPSA id u23-20020aa7d997000000b0052a3edff5c3sm5483584eds.87.2023.09.17.22.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 22:21:07 -0700 (PDT)
Message-ID: <92da7e0d-0096-7407-1fc5-fc026c5e446d@linaro.org>
Date: Mon, 18 Sep 2023 08:21:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] mtd: rawnand: atmel: Annotate struct atmel_nand with
 __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201219.never.352-kees@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230915201219.never.352-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_222110_986794_20EFBBFB 
X-CRM114-Status: GOOD (  17.01  )
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



On 15.09.2023 23:12, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct atmel_nand.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 3f494f7c7ecb..4cb478bbee4a 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -165,7 +165,7 @@ struct atmel_nand {
>  	struct atmel_pmecc_user *pmecc;
>  	struct gpio_desc *cdgpio;
>  	int numcs;
> -	struct atmel_nand_cs cs[];
> +	struct atmel_nand_cs cs[] __counted_by(numcs);
>  };
>  
>  static inline struct atmel_nand *to_atmel_nand(struct nand_chip *chip)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
