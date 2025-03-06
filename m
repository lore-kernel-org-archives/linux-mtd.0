Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB2C282EC
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 12:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cp+4ZNDcwfHQ/PKicVQ8fX2NXN1GASyGSNoUdMhmCKs=; b=ZX3GmWhN9lFHG/
	6tGI59iKXWQgxSbum9MNYWcptl8H/+y6qhnfLa4aU39pB+JnXb/Z+EhKBm61f/8GrXt4BeSvz7gwt
	C/XGuEM1mo7AFJO0Fx52kqmsLy6S9ccYGqraJp/U31+FHjWIgaHq3EieicwgeuKEBbk/IZXjSTJQM
	SZWn06cCJSKPwiMdHx7Kkv4QhHLwTyfqxX1NCTjPvMEyIR0zjj/RV/Gm1PMUZSPP/1I1blTdN8tyQ
	XTMARvCSR3VI/+/c/UBfuwO8tNejJYjXuntrPJmar+98dagP9BXZWRAGbmYtBGJIVfd1adxAQ7PK+
	tyiSV4X1CKz7bF7IOeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9xF-0000000ArfQ-2t7u;
	Thu, 06 Mar 2025 12:03:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8s4-0000000Ahrk-4C2c
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 10:54:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e4b410e48bso750669a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 02:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258471; x=1741863271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJfPLpV9y0KbC1HY+nR0M22ExksSwUxOSL+iSfAiP70=;
        b=pqLtxyQbUl+RpgCCnU+S3LXwmByr+WTZDUo0oOZ5gfGT4AUIy7pgL9Sj20M/VPQJ1I
         T8kb5GtPiB9YAeVVPQZnAM7DIit+ADxbNwwYT1Wz/p4cGNrPgXbNF6fSQzBnV4CLbDNw
         VaKPk8pErh1nEeCfVrjByQAEQx7hHlbGXdlsr7L0JxvZ6ceKHkX5Gt2I9UNpmwzWPutF
         00d1vWJSuYdX/cPVfthHe+QF3y7/nK7yYyKeZOPCzWMCgGFr0Q95sS4A7mD6Jf9XwKnV
         qjd+8Uo+s2JXaxjjCkOjGCyjRoTXqNGWSBP8cSJIC3GCiZFJdW9k0ebYehPQNvOvovs6
         xVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258471; x=1741863271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJfPLpV9y0KbC1HY+nR0M22ExksSwUxOSL+iSfAiP70=;
        b=FQgHDxkkShEfadUrJvcEpyIHhDV3ClTEzmP3sKsEKMbfMJr+VP9vxfOz1hx7hOUPYw
         1AeFp0e9vrAPIsvYhOt+nDr5iVrKI8lBIOyvn4MdICfOZ1U9j14A7HS1Nn+7iayNzaqh
         e7Nt9PX1oWzkgpCSWvZPEv0M0HfsIaTYdE+2MwUqEyB2ADjKLz4ImJBZLY+PGIBvi4Pm
         bLeGglqZpcyYhDk/RMgbihmrr+G3h6ZNO5avitrhTMbjv+tvqnCTGR1vmFi/F8A8efkg
         iPZMVuGHTMdZ4b0ausPqldjw/K+XfIkdS8LwrQHrwM7QZoKyD20FMtMVjQ5cBamdBGga
         mNWw==
X-Forwarded-Encrypted: i=1; AJvYcCWuDcwqq71xfARlz9KvrZjD+abMDDMMficAA7b2jcBcjyGGG5PHSa3oVeDRXrBknYkWUFDWPdGqEBI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbwiCwD59whunRtcfuK+Ifm8R1pucBattjfm9pdODn+vtaW1rS
	BcEDJWPn1KPqfyCCptfWBN6KwgKGqExMGs0Xo3Te45z+iK6CeDEC1OeHnUgsl+0=
X-Gm-Gg: ASbGncvqsakQGB4b6BaFOgdBKWpyR8+X/r/B6jttx0Exw4W/o9l7tCEaUJxhB5wmbol
	/qbendCXCZDGDGMCXY68whXtZYPoM/qhfKG7VdftOAxAi5urSDqEuNbFf+mA+G5C4z7o6hH6FQj
	2ByyQnuigZCOOKgUQY/4UvLsOp/PWLAT30vFGW0AJKNJLG7HvT9x7Li2Kzkx54nd5XyQsxPf+7j
	OMfSeENwYgXmIMNqJylV1eyTQmTvVLbyLWyGvFii6mZGWa6Tq2gA54hIwLpCh6elJMZmodHt3qO
	qjzouRUqp8UzhQ8ayKd1ia1SZl7CWwhOMKMcE+eTqm1bC7Vt9O+NPA==
X-Google-Smtp-Source: AGHT+IHyU6pdy2FcV6/EpwAHBLe7AqJhVWDoBCMIWGHTtmA0aIeEhDiORu28xaXZicdEA565Usqvtw==
X-Received: by 2002:a05:6402:1ece:b0:5e4:d75a:573e with SMTP id 4fb4d7f45d1cf-5e59f4f8e28mr6786281a12.32.1741258471243;
        Thu, 06 Mar 2025 02:54:31 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768f213sm755869a12.74.2025.03.06.02.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 02:54:30 -0800 (PST)
Message-ID: <9ae9eaf4-bd5d-4902-9ca8-d83b9f326245@linaro.org>
Date: Thu, 6 Mar 2025 10:54:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>,
 LENAIN Simon <simon.lenain@thalesgroup.com>,
 RENAULT Xavier <xavier.renault@thalesgroup.com>
References: <87dbbbdfb2d54da781e4f8c5fa75851c@thalesgroup.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87dbbbdfb2d54da781e4f8c5fa75851c@thalesgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_025433_040330_1EB5CC1A 
X-CRM114-Status: GOOD (  12.93  )
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



On 2/28/25 2:01 PM, LECOINTRE Philippe wrote:
> Infineon CY15V104QSN is 4Mbit serial SPI F-RAM device.

Please consider moving this flash to the at25 EEPROM driver:
https://lore.kernel.org/linux-mtd/20240604074231.1874972-1-mwalle@kernel.org/

Cheers,
ta
> 
> Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
> Acked-by: Simon Lenain <simon.lenain@thalesgroup.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index bf08dbf5e742..32f8892d7afe 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -922,6 +922,12 @@ static const struct flash_info spansion_nor_parts[] = {
>  		.size = SZ_512K,
>  		.sector_size = SZ_512K,
>  		.flags = SPI_NOR_NO_ERASE,
> +	}, {
> +		.id = SNOR_ID(0x50, 0x51, 0x80, 0x06, 0x00, 0x00),
> +		.name = "cy15v104qsn",
> +		.size = SZ_512K,
> +		.sector_size = SZ_512K,
> +		.flags = SPI_NOR_NO_ERASE,
>  	}, {
>  		.id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
>  		.name = "s25hl512t",


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
