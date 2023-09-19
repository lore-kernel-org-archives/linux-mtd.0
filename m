Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D2BCD54AB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Svx/wfj86TXKzQBar0fYtH13nJlAMNKjy7IWyjsrrE=; b=OAo5FIJBEbh2ji
	DlgQrCP+L22JkXgqLUHnKW/5V1j5YROGyCp3RqavXlD4w4VUblKq6ctYNLgFZ99UTNtajnvlpJMva
	UJMM+NrEjJbGlVYfsntvXyfg88J86IUNLyDEHPC+JvZd6kzE2tUP8PuYQk3x0KCZkvC65HH6Y10AF
	LBz1ozMBJmXeF2m3QhqK9oI1CDMnstcjk5Qgiy0YcAHi4Ly1yb5SpbsykspP1a/Wh/2zgkTTL3IP6
	0xZDqbvGu7aCZ95OEKVoHUIEo/7p2u4jsX+CQGKD50V5XkM8+iPCOyGm/KldvfEnNE45qCvbJFgjJ
	NsIvM6KpexHC6E/2pPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWyU-00HRqn-2Q;
	Tue, 19 Sep 2023 09:24:54 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWyP-00HRp5-35
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 09:24:53 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9ad8bba8125so718549966b.3
        for <linux-mtd@lists.infradead.org>; Tue, 19 Sep 2023 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695115486; x=1695720286; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7d8Xb7RH+w6lTYh+PSIBWRE9fbeStGy72q3FCoG4Xc8=;
        b=qzwb6zwZLIrsn91wqGDHDzcXCTWCIjYaqQQE0VilEBZ9Cx7J3Vl3100UaAG7WFcFL0
         jWBTLWwnCxTxzDS/EIT47d8KgaKHUO+VD13eCT3skTrMzcGbascGsrK7MEGqMxdgLWMf
         NLGfof2B+HtBNf2xMQ35rifFo3NyCSKjHEvEzFV3WdKnYiJW9q5mBPUvZOZms6dvk8ii
         SD0AxRDwo6p/T0QwJq27TglpYhUhsTIpz4A0gIoRkYF0tNC0ro63OkfNeZJqWhABw98c
         GS/pMwN/8mXqUYDpAws/enNkQS5hcNmqA8KMux6pNcOREsnmsD/6RDbtXhOAI+/RBxnI
         DGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115486; x=1695720286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7d8Xb7RH+w6lTYh+PSIBWRE9fbeStGy72q3FCoG4Xc8=;
        b=f4OisUx62SO4PT2MWcjx1w9QPdHfFbL1QRnET7YAX73jmpCr7DEzusK5xOE8gp6A0b
         NzHvG6tkJmtvlU2xIHqmooZofdgOsOGktlPyk2qbbHt6pxJ30K1pcvfd1eEQ9DEfG3nn
         lu5EvNtCIHjgIpKxzVAQSH6DI0Cot330xymBgdamopVnb8l88vmFTb+vHO8QwT0tB5HH
         J1GmpnQUdX6iUnOrtPCGthvLAcrS6laqfioIAnZLEeNFFqtGQcurNgsSVkYqNdEyWTHQ
         oJfhQSlKlz4OqIBtElU3T9uRrawYmdQBx78PW+UzPHVAqdmeGZh39UKIi3H6fM86J7CW
         cvRQ==
X-Gm-Message-State: AOJu0YxtPD3l3XiRZG3It4qqA3twdPCFLSlv2fxYagq6tDX2sRZYirEv
	zv8MrbQqLpmfLEJnhR8XuxF/uA==
X-Google-Smtp-Source: AGHT+IEEJ8M4Fz+7fZ7oKh7ralJ6TcdfTuoJoPInhorn/OrVtstyhXo33f1GoCzhsCBgdVnWV0aUCQ==
X-Received: by 2002:a17:907:2cef:b0:9a6:7fee:8258 with SMTP id hz15-20020a1709072cef00b009a67fee8258mr10674208ejc.19.1695115486169;
        Tue, 19 Sep 2023 02:24:46 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709064e0900b0099bd8c1f67esm7535962eju.109.2023.09.19.02.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:24:45 -0700 (PDT)
Message-ID: <647d3775-a71d-a880-6d4d-3eb5a89ec9d6@linaro.org>
Date: Tue, 19 Sep 2023 12:24:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 20/41] mtd: spi-nor: everspin: convert flash_info to
 new format
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <20230807-mtd-flash-info-db-rework-v3-20-e60548861b10@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-20-e60548861b10@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_022449_996408_6FD8AA71 
X-CRM114-Status: GOOD (  17.64  )
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



On 08.09.2023 13:16, Michael Walle wrote:
> The INFOx() macros are going away. Convert the flash_info database to
> the new format.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/everspin.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
> index d02c32f2f7ad..46776bc10b27 100644
> --- a/drivers/mtd/spi-nor/everspin.c
> +++ b/drivers/mtd/spi-nor/everspin.c
> @@ -9,10 +9,35 @@
>  #include "core.h"
>  
>  static const struct flash_info everspin_nor_parts[] = {
> -	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2) },
> -	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2) },
> -	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3) },
> -	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3) },
> +	{
> +		.name = "mr25h128",
> +		.size = SZ_16K,
> +		.sector_size = SZ_16K,
> +		.page_size = 256,

page size defaults to 256, isn't it? Can we get rid of the page_size
assignments?

> +		.addr_nbytes = 2,
> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +	}, {
> +		.name = "mr25h256",
> +		.size = SZ_32K,
> +		.sector_size = SZ_32K,
> +		.page_size = 256,
> +		.addr_nbytes = 2,
> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +	}, {
> +		.name = "mr25h10",
> +		.size = SZ_128K,
> +		.sector_size = SZ_128K,
> +		.page_size = 256,
> +		.addr_nbytes = 3,
> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +	}, {
> +		.name = "mr25h40",
> +		.size = SZ_512K,
> +		.sector_size = SZ_512K,
> +		.page_size = 256,
> +		.addr_nbytes = 3,
> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +	}
>  };
>  
>  const struct spi_nor_manufacturer spi_nor_everspin = {
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
