Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27255C6FA8F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OziBWQ1L81L2d0x3BiPs6Ba9ezPOrUoV+1sJfE9UIgg=; b=feF5d1h2EhoQuh
	Jr0Rr/JrhICfTkKt8ZyeA01oLX7AWz+KuRUQGwiqXL38qKxsuKZeLnsIgZbJEkzYkN3f42zrBP+lN
	b0R21n+Gavriqja6ntJ4j7379/upqHusykfz14q/w8Y81ukCXbLDNY40u+MIx1WlZsZYKuU5ZebY9
	aBSQNUomkkohJa/lB5IcPvgk6g7cSeTCP0y/Nqgx8H1a/DHCsHQA+kydapIiqzfpN7ljNg56nhpNN
	tdjaeCQMRssxxmPf5QLz6mXnp/nzehq1qSEHf8WD+NI9krKpfw5UlGyugvPbSk+XTn12X1kkurkhR
	vCV9g1ElI/V4XFixskWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5T5-002X0K-0n;
	Thu, 24 Aug 2023 08:13:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5T2-002Wzj-1X
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 08:13:25 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so1329908a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692864802; x=1693469602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytqMFkt9NRr1tsUoax6hHlKtE1GfD7MK/gjyrbIcJVE=;
        b=sf77aHCAGTaPW0IaTYPyHVeZd4EL8VB42KIHkcFS69/Kfb6d+MWeZW88F/RLGwrRlq
         hvMcf70iseNcblbZmI7Gbymh3mF+M4jP3CLyHS8KwC1teD+hTMd2xB5cJ1ScaO46RrJZ
         vTKSkEz7fL8ds7HpjJzMZyezGMEdfCrfL5oGF0QoRhwu/zMTIpm8Sgjw5XrEZs0AZMOg
         Tw4jnqgA0XGZTYyMpZUTTnwMn7+hEJkoAqIqUxzjOKU8AX63gSmFFt/GC+gL1+pTX43i
         KxDLCbTUrogIXWjtj7pOKi9X/ac/WJgM8166GUFO7cT/reFDADoW3EiFuQHVrsht/ICI
         HF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864802; x=1693469602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytqMFkt9NRr1tsUoax6hHlKtE1GfD7MK/gjyrbIcJVE=;
        b=iTgnEW8k4OxjsHW5k+lEI6B8C87IzVBNUfFpzUQtH5eDQ5OIY1juunf2lZG3WjC2lr
         tRrPijPFziS+MM2rwBLw76jPEKKYeGpXyAvWOCLpFGNVVPwBEoAYTPCADNlF39cyKqWL
         m40zWEhm+kZvsQ94KgVfw8h2ezgWFL8jGzpYaB9klEf4cVjWVdCLRyUbKj/1OROU/zbc
         PWTBy4cMo/FYqdXgvn0j0yY9fFB0WC1Ol1Rw54O9ezvRQ9kmcXAd3OwNqxJ0BGEChnf1
         CGUrkYjgC63rFwQ5MnDCXYbNWsDYMciPcEsqOkK3nljjwjIfCtDJQLXb40Zw1WcxHv//
         RLcA==
X-Gm-Message-State: AOJu0YyrzCQR8IOB0uPQz8KmQdNn5/IDKPtXfGfYoAlwPVZfDQAHnI8f
	vn5y8Hu9aITafO4L31FOKrY0GbqGmyS1nP0hyWQ=
X-Google-Smtp-Source: AGHT+IGCr0LTxF8ISQ7E+f9ARENyZUwcLzcXKR4z//qwVyMLM32fyosL+zMFmFdLl4JsmjcuIPABuw==
X-Received: by 2002:a05:6402:3447:b0:51d:95ac:22ed with SMTP id l7-20020a056402344700b0051d95ac22edmr18083410edc.1.1692864802621;
        Thu, 24 Aug 2023 01:13:22 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id i15-20020a50fc0f000000b0051e1660a34esm10134956edr.51.2023.08.24.01.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:13:22 -0700 (PDT)
Message-ID: <01d9e2a0-3db7-3269-84ba-962fad666ee7@linaro.org>
Date: Thu, 24 Aug 2023 09:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 04/41] mtd: spi-nor: xilinx: remove addr_nbytes from
 S3AN_INFO()
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-4-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-4-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_011324_538695_1C2818E7 
X-CRM114-Status: GOOD (  18.15  )
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



On 8/22/23 08:09, Michael Walle wrote:
> The default value of addr_nbytes is already 3. Drop it.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I noticed that we need this fix in the core. I'll have to think whether
we need to introduce nor->addr_mode_nbytes as well. I let this for after
I finish reviewing your series.

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..85e2a992a9b0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3221,6 +3221,7 @@ static int spi_nor_init(struct spi_nor *nor)
                err = spi_nor_set_4byte_addr_mode(nor, true);
                if (err)
                        return err;
+               nor->addr_nbytes = nor->params->addr_nbytes;
        }

> ---
>  drivers/mtd/spi-nor/xilinx.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index de5189c38432..34267591282c 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -27,7 +27,6 @@
>  		.n_sectors = (_n_sectors),				\
>  		.page_size = (_page_size),				\
>  		.n_banks = 1,						\
> -		.addr_nbytes = 3,					\
>  		.flags = SPI_NOR_NO_FR
>  
>  /* Xilinx S3AN share MFR with Atmel SPI NOR */
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
