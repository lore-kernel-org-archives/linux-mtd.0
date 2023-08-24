Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5334C27C40
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtfa9ZGWqfEGogT1tjarwR8uxpNzmAV8kpXmcyKOgvQ=; b=3iltxzAa2MwkwV
	dlBE5cUOlcuzLwNbTooQ/Ojh0lDsthcdEwrq9e832aFTH0uf/BpaH6vJ8d6kQ/9s9gD8yS91pLHcB
	T0YfLtmGgET9fWXTGEeo3Q3E7umzDomAPdglKwq0pFVfj1zUkg7JjdDNAwo1DkOMTQxo9VtShx5ZW
	I9A7UNEKlFwb1K6/Ek9qH1tQtMDA0pnxdAkZmDOiWwbVYO03wVGafC9/72gBeqsfmljlk3OOubIM5
	t2lkiyusiujNDgduBcuNWKM0C4PS3Fn6Qt++RBX7lV1U2sQTkqEHr1E/Il+xD7mWd20kbV1r51WSe
	FOcIdN3Kcc1O2KY8BIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5pO-002aTI-37;
	Thu, 24 Aug 2023 08:36:30 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5pM-002aSE-2G
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 08:36:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bf3f59905so845075566b.3
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 01:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692866186; x=1693470986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sWopwPv8ous9ki9Iav1zXX25cx/NnM092QNuDsTCdtc=;
        b=zN9OqJoiScNS/SIxQD/qp958oo9i0Nu+Ikxx5e84AtGXc/xJzcSLNTW7d4EGg2V36Q
         i0nR/za34WgDGrAX0wO5LKXimIadfV/TdyxTAFg6LZB/SWGpcxGccsPmf+tbeUGbQzP5
         nSrcyVXMNjdPrTgA6r4eocDlSkd5BYn8Sjar5mbhx0VdCkNWhb0Taw7453hhdrOSr3Se
         XHa6CQrw7qhqwmcG+Rz7LOy/o5YNJc/Q7pGjyLgJtGXiQkQywPthBYC9/9YQpIvcPGhd
         M6CHRikJOr4Z0wz35Yckkq+pKMtFUq7Vk484HV+aDirhCR+LaRCqAuzJHiJzjsyQ86VX
         inJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866186; x=1693470986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWopwPv8ous9ki9Iav1zXX25cx/NnM092QNuDsTCdtc=;
        b=NBwYBDZ/nYTmvIAhhzC0/ywcxyAk6ESZ3dhzszDVW50co42Px+Efie5Zj/BpIb86s0
         zhKgSK3n/bwIFXvXHUeEy/FNhpxm17YlHKZy+2MD6qYLShoOUgmMXlPmpWsDVoz0HYBm
         myWT/nnnVrWoCTsmpREn4FZOFkCOWbKgphqbN4J8rEg1O7JTP+HQlJfA9dgfyVSRIIel
         Y9864ppiLwJSNNX75BIJXEnVdq3DThCaogFp7ZXRDGOFID41R8szqSRR+gofA/eKl/Vu
         8J/OXwrGCsLgAMDIE1hkvKv/zETftBu6XvPDViQlPuPTh6SEAjaZ3o6cLHtjiDuFIq/v
         gEFg==
X-Gm-Message-State: AOJu0YzHz+LQ4H+0VQ+LwDtm5TtQXciEX68eG3wVrSx2PX98bsuo1wrV
	azRkYh/TNWp9nkVOJefeskBMAA==
X-Google-Smtp-Source: AGHT+IHLbz9eBqluFsAUpDNy5UWDgtlm/GcG0LRUnCkx35YQQ6S2YlTWQbYe0B/t5xl9+VtDkroHrw==
X-Received: by 2002:a17:906:5c3:b0:9a1:b52a:beee with SMTP id t3-20020a17090605c300b009a1b52abeeemr5219374ejt.64.1692866186194;
        Thu, 24 Aug 2023 01:36:26 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id z1-20020a170906240100b0097073f1ed84sm10730467eja.4.2023.08.24.01.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:36:25 -0700 (PDT)
Message-ID: <f8fe1378-686f-5889-8f0f-e1cda237ee3f@linaro.org>
Date: Thu, 24 Aug 2023 09:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 06/41] mtd: spi-nor: default page_size to 256 bytes
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-6-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-6-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_013628_766486_AF9BF4D7 
X-CRM114-Status: GOOD (  17.87  )
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
> The INFO() macro always set the page_size to 256 bytes. Make that an
> optional parameter. This default is a sane one for all older flashes,
> newer ones will set the page size by its SFDP tables anyway.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c | 7 +------
>  drivers/mtd/spi-nor/core.h | 8 ++++++--
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f4cc2eafcc5e..d27ad1295ee0 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2018,11 +2018,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>  static const struct flash_info spi_nor_generic_flash = {
>  	.name = "spi-nor-generic",
>  	.n_banks = 1,
> -	/*
> -	 * JESD216 rev A doesn't specify the page size, therefore we need a
> -	 * sane default.
> -	 */
> -	.page_size = 256,
>  	.parse_sfdp = true,
>  };
>  
> @@ -3001,7 +2996,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  	params->writesize = 1;
>  	params->size = info->size;
>  	params->bank_size = params->size;
> -	params->page_size = info->page_size;
> +	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;

how about to get rid of info->page_size entirely and directly use the
default?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
