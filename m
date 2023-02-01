Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFF0C38142
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFDixMllCoW8PN3Vlny4658S8axjkqx5JHcJKgrzAtA=; b=A0y5YiMaYsvKf/
	ah494UOpX7zNQEufo0ZD5TMw+NwoxuOR1x0mX5Iz8NjLa2HmZBX6GEw9gBb355dGmOH9POFZzGSIp
	huHA8d/LO2Ygu+OZjH9OCJ9lfEQ40y+rcS8VS47g9aHdjhzW/N8SSji5t7dLgCEYzSgELmVXY2wdx
	/aMmBerpDpid0CQyphPZRGpDvN7TlhHkvFSRyDCPc5wDOlTiaW8rOeroRMTM22CEFNkLUgCg0Mkz2
	FsoLFGZgOjnWrghCY6MGpTZqSFCr8hCxO92vcSqakQ7r6FGaqLpNkFl2UduI4U9fApdpxrTCWZS97
	x6vJn1vJu4PRyIeF7qOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9wA-00B6xm-1n; Wed, 01 Feb 2023 10:01:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9w7-00B6xG-BQ
	for linux-mtd@lists.infradead.org; Wed, 01 Feb 2023 10:01:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id a3so10054110wrt.6
        for <linux-mtd@lists.infradead.org>; Wed, 01 Feb 2023 02:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PeirgNv4K+MaTJYJXPOs6pjXe3XDc2jdbu04P3+Uqg=;
        b=FevURJwklWJbZc8yfYCdpW/FY2gyIrS/CcneIgAnH2XmJX0jzpxry9Mbax07VDcsl9
         cvKZ3bPk0w15P9VVjbaB/YqKkIV4019oVy5U61GYhWKZURAT7bxVVxgZbks9ojqUYEnx
         V2GUW+GFDm3PRPG8hjt/AxlQP2stI5KOcTgM4Pjpvl+GMWtV2vQdxFeEsA8wGWm7VORb
         RrcQTe6+e4iipt+s9CeiXNB/Kw0t/0U55pOmH7+zwSkDS/aAqAu3Lb8osCq77rToQ1FI
         PVYsq4DnS8o2HSMiQbSVqcLRssm3k7gJdY0sPiKR6Y7sXJBNg98sD4tFNrISDoB0zv9K
         06SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PeirgNv4K+MaTJYJXPOs6pjXe3XDc2jdbu04P3+Uqg=;
        b=qgBzBToNKn+oVL+R4+X5MlBtVC8d+VlvCXPRX6wggNWYwIvqm0GRiAoOM6VVS5xDyX
         XYKBIV38Va9HyS8/Hl5K3U1nZ9mi6qJPgebpCH/yqtRaTohla0DIVuRpmDwxJ6w9qfPQ
         KlMr1TD9NAaBGnV0B0jad4fJh6kOdWOj6tn63A1VAyW3yf3mP3d/jvtxEw9I5isTmXy2
         mLYdUrNGFe4J6GqZyFPXRj32Q0XyquDudpdsrelN1yg6VYITgQhzRIc7DfNIXQzma7Qs
         Y9FJ50r6V8YCUvNdHnYTa7Q+c6LsRHJEPurw9moEihJgo0HlmF9ZRmdP5PyU44DLdO4o
         2XQA==
X-Gm-Message-State: AO0yUKV0sfwQ4vnJ2D6G5weemwgL1mOqZJqjsH4hpRGuCyTWZVJQ5jNw
	YsrUatwoxWgnG1Xpn4FwS7quhw==
X-Google-Smtp-Source: AK7set9MtwM8BkQIwFg6AWIBrpsKGSS2KBX2SDLUBxmbn7KNUZAZW8QqNNeARq6RmLgi/YqU4o/DYg==
X-Received: by 2002:adf:fa06:0:b0:2bf:d2b8:8c09 with SMTP id m6-20020adffa06000000b002bfd2b88c09mr1849557wrr.61.1675245708414;
        Wed, 01 Feb 2023 02:01:48 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id r28-20020adfa15c000000b002bfd137ecddsm15008446wrr.11.2023.02.01.02.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 02:01:48 -0800 (PST)
Message-ID: <49427044-f8be-34dc-d158-0ce067c1c591@linaro.org>
Date: Wed, 1 Feb 2023 12:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: spi-nor: remove duplicate included header files
Content-Language: en-US
To: ye.xingchen@zte.com.cn
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <202302011730294177177@zte.com.cn>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <202302011730294177177@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_020151_421125_65BC7466 
X-CRM114-Status: GOOD (  13.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 01.02.2023 11:30, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> linux/delay.h is included more than once.

I see it only once included. Would you please double check?

> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>   drivers/mtd/spi-nor/core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e9ea14598ec3..d67c926bca8b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -16,7 +16,6 @@
>   #include <linux/math64.h>
>   #include <linux/sizes.h>
>   #include <linux/slab.h>
> -#include <linux/delay.h>
> 
>   #include <linux/mtd/mtd.h>
>   #include <linux/of_platform.h>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
