Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC904D2E9D3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWenb3QKfXEGZSpv2c1iPUt1C2syExQy4jjzj5MG6Z4=; b=Bia9WSQU1xaaW5
	B8FD1vero82j7Q3mWqx1m6/DoOGhMp3qmFmDfN8JzZaLqPy9ZIis6B37JXsbKDQkWkTjCSmeRSYZn
	4gUeXwTTce8IN8eJrwpM9JB+whXB66c/AkCgbpBR+yKUfXHtPQJJf0JpHkXLJKNuDQMKmuqonWY+j
	doWmrTuCTTr+w4Sn8EnA7DmAurB4Pd3ukc7aaiJMZo+4mbwt7/q7QVDJ75UgEuZvAqvmJZxTn0jZO
	KXGgbtOfBuX6SXvMEWNTyxAMOEENFbFyEHcBaNByuKhMegjHCaxTyYMcsHsWMqmirtPZhOHjPfN9q
	U+3DKy/xBA7b4BIcd8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARUz-0000000HFrK-0c1k;
	Mon, 11 Nov 2024 10:18:21 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARUv-0000000HFql-3kck
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 10:18:19 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53b34ed38easo4290633e87.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 02:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731320296; x=1731925096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhyKJC+ZlhIvd2RI2qZdoBI7BLL1Xj6/nlNpmII5adA=;
        b=sG/JeFnt8gz8JGCHQI1fChCgizGyPPLIfo7zkhy5qh+vNOMzvZJEV/4ZV1/uOX9SPD
         tIOgcWkIsRky10TdHrJfCopVfRzKlEl6XqLPe1KEMBXX3tARoUOfRlVINsaaOTjfROSZ
         bGh0oxl6MrGEGHuIPZPyq8navtn3kP0Sn2qoZczqr1COIe9nsvLxVI6+qeUlE0Yb+tGA
         GcdDuiOc7b+J1Ncqmp8+dBSjhEO7zizn9EJekldC5G5N0GwCzpDJcWLGXchg/SBNj0Re
         MwWkZywc3eUrhjw3DbRsZptuAdniNVwPhKjPQh+vpmIUkjMIuYEh/Xg+XTaQO7rP/Ejy
         HYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731320296; x=1731925096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhyKJC+ZlhIvd2RI2qZdoBI7BLL1Xj6/nlNpmII5adA=;
        b=sHiaeYHhDsm9uJekyCslmFQVx9rVWDS/kXwudgWUezhjoETwl6XqHp9e5yGiKDyv1y
         20dOscYchfKuJWgAZ43aR99sypWOVrONCj2Uxg7j/qn7Ju8QK+l9assTmKkYkCP1RmpY
         pE3MSKnUfIEWobz783SEx9iLRqGejjXClv7SgUZy1AwCqWPDQmzFggbepT+ZtuSAFqr4
         gFSjOLdS+KtSw4Z6wBPGIUKNx5LsDIsjaiwQCGUnxNWFJ+abIAQxJRz9W0h49SbDfifi
         Ugeg9V4HVRyqB6wrJW3ep7App7xQVdg1SWwChAW51oOCfOUc7MNycR8bcC9WXz1gddJE
         O9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVSkKsuZ9jS6t3ZU/PibexFhP0hGsIV9WLA2agENfk1FIEnnNvqBRhpXIQfHfyKxYe+8IR0Fibb6ho=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp+RKTnP9ZJiOsHG8wH3WiKuub8kbek3i5yyNa/4c7dbY7rPPc
	f+K8K5NHhBm7vBVqcBdp2pB1ilfI5zzrM/20023f6Awp6bFnRY5RAZikMthH/2g=
X-Google-Smtp-Source: AGHT+IEfUlCd+ogGcecrle4DmhwPBvBsn78CHE0X/HnxFrBFSrVBduh4K745TFt0HlnQBVGN0Q4Geg==
X-Received: by 2002:a05:6512:3408:b0:539:8980:2009 with SMTP id 2adb3069b0e04-53d862e4d8dmr5193051e87.36.1731320295752;
        Mon, 11 Nov 2024 02:18:15 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b2c32sm204503145e9.10.2024.11.11.02.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 02:18:14 -0800 (PST)
Message-ID: <437e9c87-fbae-4402-858c-ce6de0a992c7@linaro.org>
Date: Mon, 11 Nov 2024 10:18:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: replace dummy buswidth from addr to
 data
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20241107093016.151448-1-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241107093016.151448-1-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_021817_983998_A823A442 
X-CRM114-Status: GOOD (  20.88  )
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



On 11/7/24 9:30 AM, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> The default dummy cycle for Macronix SPI NOR flash in Octal Output
> Read Mode(1-1-8) is 20.
> 
> Currently, the dummy buswidth is set according to the address bus width.
> In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
> dummy cycles to bytes, this results in 20 x 1 / 8 = 2 bytes, causing the
> host to read data 4 cycles too early.
> 
> Since the protocol data buswidth is always greater than or equal to the
> address buswidth. Setting the dummy buswidth to match the data buswidth
> increases the likelihood that the dummy cycle-to-byte conversion will be
> divisible, preventing the host from reading data prematurely.

This is still very wrong and the `fix` is working just by chance.
Consider what happens when one requires 10 dummy cycles. BTW, does this
fix a real problem, or it's just a theoretical fix?

I don't like that we're chasing our tails here. The fix is to pass
directly cycles instead of bytes and update MTD and SPI to use cycles. I
had an attempt to fix this in the past, but I can't allocate time to
respin. Are you interested in taking over and fixing MTD and SPI?

> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f9c189ed7353..c7aceaa8a43f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>  		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>  
>  	if (op->dummy.nbytes)
> -		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> +		op->dummy.buswidth = spi_nor_get_protocol_data_nbits(proto);
>  
>  	if (op->data.nbytes)
>  		op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
