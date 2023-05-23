Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B9DC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIu/ZILbFFaslbS/bqiVWzHaJ9q/dZifK37ZbnvxAdk=; b=UZ3MXy4j23mZqv
	zPMz+6Oi2cDiR8L5JTBa6K2CK9ut5yayxf/8VIhxaF2tPzAyfXur2OneIoIbQuArWij3D38JlDxN8
	Q7Xp5xW0YCVHSyrwTZx0scMrLkYLw24GGY9KiyQGR/Ury4p2enoY91+LC1A6xLoTnMbUH6d4ZAk/1
	2RyvTBOfv7T2J7IvhQVFWRynpXcNu0sat1pPZ1IpPrKRQXKH3HicDkGvQh6vFwzbj7FELltmIATzb
	eqFXjJj7j13AdR5dmINozHRPsIb8gM2+E8YqmDxl4fI9OHQSex7mRznHk8Cui+dTb5N62FlSLX941
	3rDY0nRj/ad28snQJExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1NxN-009YLq-1E;
	Tue, 23 May 2023 09:05:25 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1NxK-009YKN-2i
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 09:05:24 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-510b6a249a8so1152092a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684832660; x=1687424660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvbvAsOf0KamUPo7lrnQICdsynR4pPCyF/ObxKsuxMw=;
        b=f6ppUk4RNygsvh38ymp1n05sZJjWf4cChUvhaRCZA1cXTf7KK1X30/KH9JpJFATRJw
         8gN7j2I5XsjXqbE4BzdMPhaUdEEVozGNN2bg3voSAzvA21vZ8WJ8Pyo9qbOdzY3ye6GO
         n/DsoMtygwhlC5THgnHSbMJ+7wMtnLOMyjrEEVkq0KHiK+P9E4F2a2VpVSsXBTsQHMko
         ZS0xcWxvwFFujucostvzeO+l58o7uvJzNfkxUPFryGkSKxndE23HOYtgjrP7BUdQY4ii
         KMoNfxSvRL0fooQO9M7pO7e5KxUFGl7Q6Zk9apwd/JE45cOiHBwTTkacfYdp1h/1WGjA
         wCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684832660; x=1687424660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvbvAsOf0KamUPo7lrnQICdsynR4pPCyF/ObxKsuxMw=;
        b=YyaA4YQu4aBvITM0FqzmwZf3K4GUE+dVVQD1uqVdUnYeLMfisLi9h7mgf+mJBz2THd
         5Q4gTPbGvvYhnt6tVHBaBuX6GsolgxHlCr/+YILTJcgYgg2Mx9vGQ7j4H2ueA4/f81Ir
         ozYZuatIEEe0rki76GccDWcBwUnZTz0k27fLr1nYuW3DQhPGGdM+oMPy9CIKwMbtsENb
         YBxBDStSOXYZWLBxWBqTxmb07Se0bYzwqIL/9kCjTPqIr6PEglwPYdda0EstxLyLFCEp
         1JrY6mLX18DMcfja23ZtCHaERz0Mc5r9RJ7JQ+WQaUVtofsfh0oe3zjw283sysGl9GwH
         CMxQ==
X-Gm-Message-State: AC+VfDwFtZXloD8f5p48cSKcHEe9ItDsVfeHrrb/T0i1pkB9lLT9brZM
	ZptDsn0xgD7yNOlSa/mIXRrt9Q==
X-Google-Smtp-Source: ACHHUZ6es9G4jmvbQs8VIYohIt/rDO6JV5GadVdLP2BBYvaJHQ5Qu+1IidhH5K9M2sou9gDsXF2pOA==
X-Received: by 2002:a17:906:d550:b0:966:4bb3:df63 with SMTP id cr16-20020a170906d55000b009664bb3df63mr14656490ejc.63.1684832659915;
        Tue, 23 May 2023 02:04:19 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id x1-20020aa7dac1000000b0050bc5727507sm3854527eds.73.2023.05.23.02.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 02:04:18 -0700 (PDT)
Message-ID: <517f556d-8a6b-a6bb-cdaa-e021a189c30e@linaro.org>
Date: Tue, 23 May 2023 10:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] mtd: spi-nor: Initialize n_banks for
 spi_nor_generic_flash
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <20230523073936.35203-1-mika.westerberg@linux.intel.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230523073936.35203-1-mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_020522_881234_952A949D 
X-CRM114-Status: GOOD (  17.42  )
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

Thanks, Mika,

Miquel already queued a similar fix:
https://lore.kernel.org/linux-mtd/20230522155835.46756-1-miquel.raynal@bootlin.com/T/#m2d00f6d6bfb6298a6e8d81a4795d69db1e3c9505
cheers,
ta
On 5/23/23 08:39, Mika Westerberg wrote:
> If the flash chip in question is using spi_nor_generic_flash for
> flash_info this results a division by zero during spi_nor_scan() because
> its n_banks is 0.
> 
> Fix this by initializing n_banks for spi_nor_generic_flash to 1.
> 
> Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0bb0ad14a2fc..94fc4f6d0844 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2024,6 +2024,7 @@ static const struct flash_info spi_nor_generic_flash = {
>  	 */
>  	.page_size = 256,
>  	.parse_sfdp = true,
> +	.n_banks = 1,
>  };
>  
>  static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
