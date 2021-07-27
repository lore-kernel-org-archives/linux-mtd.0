Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9343C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:45:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE11611C7
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EE11611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QaLplAAu/Jyh6RXqDXAPK1NNoYFAVyhNjG9LaoHCLJM=; b=vu1CTrOu9uZlKEQSoGU6p/JwUF
	J5s+62JlFNrgqcJ+1Hogef3REnJtvPAQZDNPZjowo/Gf+KXMHxgJXpX9k4We9Y+UXZNaEE2C2B0oH
	2Gjp8swLO5xIl9OJjb/5QNXkH6RW4RKVhLaj1v2UOIkx8Oro5tLolgUvlxo57NUHuMUCwFinRf9Gv
	FPasX029eFAcKg2s6obqsMU2h8QRyTCzE2w9nBiLTVURIk6lxMVG8XNENNOfdJqDpB3qhjUrAfUS1
	FO5BYQDC9PdI2s6G4t5NTPNTla4XXhalo3y96blHwd5uh1lC6Y1NkOxsxfIDJebRyyVxLmuqLRtRm
	RcOv0QHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Hlk-00DtsA-CN; Tue, 27 Jul 2021 07:44:52 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8HCv-00DkfB-46
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 07:08:54 +0000
Received: by mail-ed1-x52f.google.com with SMTP id f13so11279249edq.13
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jul 2021 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P6g9MWpojdufxc3Gy+T2RIbe7fBcgyn2Q6i9unbJ+pA=;
 b=DilC3qSvyV9dNzbpUBHD4EcpnYD0jKpItd6ArkmpKAen3ePzrTQ964YQZdiZSWvhRX
 x2BHl1RWY+Dmy7OS3RD7MgAj9frUyniUXx4S2woiRw/iPNoxoSsGPrysP0cko8pc+1RC
 w8D0iS3Nv/0S1enTbXTFfz/N7gOFxQcqz1W94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P6g9MWpojdufxc3Gy+T2RIbe7fBcgyn2Q6i9unbJ+pA=;
 b=jvhlQdwvt8EWe8cWFPBM3ERl9ZaP6Lw+GUmePJlDNKn2+KuUhq0IwH28nVG1mGQw6u
 0xnGkwUISmJOpR+MCpaQoc4CNDChcbvl8ezFkoVCKSd2qOeUZAaeZxW9QuxtD1AeLXQt
 eih5F58WuZ3q9kLzIA2kwH6MLgEpL6TcdMxvc8ImFhTePI60QRhtWZlgt5SN5iArAprY
 cZxIC1twzeRfVewuxPvElKBM3xbnkl3h4y/ZC+NwD30zIVJmxW978AuvD2mA/GZi5JsW
 DsGxzT7lgrbYco4o/yeVNvlBF5CpRNaCAQrJEMTD3eM8KM4CP4P0HJLgHhuRXfM9iAgp
 nx4w==
X-Gm-Message-State: AOAM531AtLaZ4pTc+NKrwHu2iH4AyDBdFZ9vlZEaZzn7Nn3oKEtD8dik
 s2YGC/zCTrxC8qCRkmwKC63s0g==
X-Google-Smtp-Source: ABdhPJxdgVBfg5zCNJOsH4thEjRW/W8Jc7IrXKKUyB8JRwfx3AAIvIk1ohL8Lgwvkxn9AtbtcVWDVQ==
X-Received: by 2002:a50:ae02:: with SMTP id c2mr20891200edd.307.1627369729926; 
 Tue, 27 Jul 2021 00:08:49 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.69.72])
 by smtp.gmail.com with ESMTPSA id n13sm863011eda.36.2021.07.27.00.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 00:08:49 -0700 (PDT)
Subject: Re: [PATCH v2 20/35] mtd: spi-nor: core: Use container_of to get the
 pointer to struct spi_nor
To: Tudor Ambarus <tudor.ambarus@microchip.com>, michael@walle.cc,
 vigneshr@ti.com, p.yadav@ti.com
Cc: figgyc@figgyc.uk, mail@david-bauer.net, esben@geanix.com,
 knaerzche@gmail.com, code@reto-schneider.ch, zhengxunli@mxic.com.tw,
 jaimeliao@mxic.com.tw, heiko.thiery@gmail.com, macromorgan@hotmail.com,
 sr@denx.de, miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nicolas.ferre@microchip.com
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-21-tudor.ambarus@microchip.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <21e6d006-228e-7834-7a4e-afbfc65fec72@rasmusvillemoes.dk>
Date: Tue, 27 Jul 2021 09:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727045222.905056-21-tudor.ambarus@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_000853_402829_BCA09F5E 
X-CRM114-Status: GOOD (  16.52  )
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

On 27/07/2021 06.52, Tudor Ambarus wrote:
> Get the pointer to the containing struct spi_nor by using container_of.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 1 -
>  drivers/mtd/spi-nor/core.h | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9885d434ea83..5c8cffb5e6f2 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3175,7 +3175,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  
>  	if (!mtd->name)
>  		mtd->name = dev_name(dev);
> -	mtd->priv = nor;
>  	mtd->type = MTD_NORFLASH;
>  	mtd->writesize = nor->params->writesize;
>  	mtd->flags = MTD_CAP_NORFLASH;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 987797a789c8..8fddc685d2d3 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -557,7 +557,7 @@ void spi_nor_otp_init(struct spi_nor *nor);
>  
>  static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>  {

Somewhat unrelated, but while you're here, why not get rid of that
__maybe_unused and make this an ordinary "static inline"?

Rasmus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
