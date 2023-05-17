Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0B6C77B75
	for <linux-mtd@archiver.kernel.org>; Wed, 17 May 2023 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zl6pCEe83kYE3mICO4YXqpT0t8VfbdvG/T9YF/ynHlA=; b=5AjUP9xTKD2HAd
	n7EmW5OV/IvLA+Lnduh/vNzjd3F/qmCJ4+6B+a6H3iHUHpQoSA9Aj7MRDirubBA0RUxZLwxLEVSzs
	UXoB4bzb/YXR6OrEvC4aAVcwiM4rvf6Fzlghqwfwng2UbnlYaEOTrAPcoREXdRcVMQJ0rDutvsy1C
	GVgGd1GPKTLeggm3Hl/joU6MTVb3A2ai452Ir6Iig9l7c9ddnuWJ0U2PS4Ezr3aQZQVHvhps9MXci
	4+jcjfBE6QuiXC8rSGQfe47MDyK00RtEuYB16PeCFtUEgSQHKw5e+ki3xOjuElv+qO3hinbBl4W32
	nhssnZTd5dXDJVi0Wh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzBIl-008c5P-1Z;
	Wed, 17 May 2023 07:10:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzBIh-008c3J-0V
	for linux-mtd@lists.infradead.org;
	Wed, 17 May 2023 07:10:22 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so51529035e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 17 May 2023 00:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684307414; x=1686899414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueeC/Yu2Zi0jRM1bpkf54Qq6Ele7pKUjyyeMBr16uY0=;
        b=Xoimmx/5igzRrPKdcjFbG5nWxkgAVzkNaz6QTFt0cZAUt9c8lQEtzJv/rSDHDzbxUN
         xUj9IE853EOEMQKJ7MoXZdj3Xx2zXyBxemGwFT+kxEs8Zw3UGKgA/t3zM2txZJYmtKlL
         Nf0QoCtgdufUffepTHDZjsYYku5hdtTRaGgs8pN8i96QYm7krJuVR19TN5SP9ihNVPMR
         egWpT5pFKXnTwHs5ysp6xF/uz+dAWsXu+3Q062lcQD6z/zrlUr1YhBDKpN7uSgblN2Ek
         CqThu3fd3GRa1UycSbGUxQ5ByakNlfMJ/qqtfqeTiqefluNEhvd+m3qZ+XTNuO3OUfu9
         Zb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684307414; x=1686899414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueeC/Yu2Zi0jRM1bpkf54Qq6Ele7pKUjyyeMBr16uY0=;
        b=bOxntfgt9gxgo3zetCmqkMw0wpF7ClAshr6CmedC/dzew0H1GqDPksgrTRAKFhOrVz
         B45Tf6cKsKD0Qb6TSJc2Bwoe6ydd07IzeWIPWfB9X0BBsQLgiSZWpG7nHU6c0gpoGfGu
         90SHbbeGYx5+SUmoNqRpjxsTpiS6RrFTkKKiftxq8ev263BhHbTM4O/gnqo4CMzFePB/
         DCzcA09yUnpwOF3ZOlpBrWAstHPM9hDdBSc9JmBCAVWoH4vhmqVEHMhI27gVtM4Q4lwK
         HLdRB0VJMSxQL4ZAvFyWbO6n1Wu2xiBL1zvKTZB7BFms0i6WQ7GHj52KUka5Z4ZffqgS
         e1AA==
X-Gm-Message-State: AC+VfDwvHfXwFRGfwSu6yhyYJaGGzwi4hj4ZVefjPwwbA7XrCHS/EFnl
	xib/CTUwEHz+juQvg8wfEyu7xw==
X-Google-Smtp-Source: ACHHUZ7SD9B9xVL5JTU0mtLaL5rHFQfVN4qrtoQEWR/uTrGS/x08ocFSrQ6EhZP523zPhc6/XhXdww==
X-Received: by 2002:adf:f304:0:b0:2f7:cfe2:6507 with SMTP id i4-20020adff304000000b002f7cfe26507mr787955wro.20.1684307414206;
        Wed, 17 May 2023 00:10:14 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id f17-20020a7bc8d1000000b003f4290720cbsm1252171wml.29.2023.05.17.00.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 00:10:13 -0700 (PDT)
Message-ID: <3ab922a4-255a-5aef-86ba-d906819f0f3a@linaro.org>
Date: Wed, 17 May 2023 08:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] MTD SPI-NOR: BUG FIX of divide by zero in new n_banks
 value
Content-Language: en-US
To: Todd Brandt <todd.e.brandt@intel.com>, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org
Cc: todd.e.brandt@linux.intel.com, pratyush@kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <20230516225108.29194-1-todd.e.brandt@intel.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230516225108.29194-1-todd.e.brandt@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_001019_197290_C5DDA627 
X-CRM114-Status: GOOD (  21.20  )
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

Hi, Todd,

On 5/16/23 23:51, Todd Brandt wrote:
> While testing 6.4-rc1 on our Lenovo Thinkpad X1 I discovered
> that freeze, suspend, and shutdown, all hang the system. I bisected
> it to an addition made to the MTD spi-nor code.
> 
> The new "n_banks" value is being divided into without a proper check..
> Thus on certain systems this causes a divide by zero hang.
> 
> Reported-and-tested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
> Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
> Signed-off-by: Todd Brandt <todd.e.brandt@intel.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0bb0ad14a2fc..084117959be4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2921,7 +2921,10 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>  		spi_nor_init_default_locking_ops(nor);
>  
> -	nor->params->bank_size = div64_u64(nor->params->size, nor->info->n_banks);
> +	if (nor->info->n_banks > 0)
> +		nor->params->bank_size = div64_u64(nor->params->size, nor->info->n_banks);
> +	else
> +		nor->params->bank_size = 0;
>  }
>  
>  /**

Indeed, thanks for the report and patch. You probably use the
spi-nor-generic driver, don't you?

Can you try the following change instead?

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
                      index 0bb0ad14a2fc..37f750bd7bfb 100644
--- a/drivers/mtd/spi-nor/core.cdrivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.cdrivers/mtd/spi-nor/core.c
@@ -2018,6 +2018,7 @@ static const struct spi_nor_manufacturer
*manufacturers[] = {

 static const struct flash_info spi_nor_generic_flash = {
        .name = "spi-nor-generic",
+       .n_banks = 1,
        /*
         * JESD216 rev A doesn't specify the page size, therefore we need a
         * sane default.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
