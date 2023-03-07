Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF50C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 20:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eP/4gZf5nmKAgZJ9heuXm4e4hz4/kyKVl7qMlkcla8=; b=QvKbnHvur2+HLzN6d2KlMlf5Ki
	jfytsXx3EW09ulOYoVIM5TLbh++imm/2rGnSjAlmBZpL2UyVKA7BNamIrYfGhiKN3RXIXRwmo55HX
	TXOuHhehlNJ7IzJ+ci6ekvAWimWyR6f7x4zavE3H2NAMJIMOHoMtQs5cmvv73PlzkF9mMqA/f60m5
	C0wzNFQkZDmEuo/GD5/lJy7MOqq2TpJtY3nzQygNpeWgEJW2PttBl8TBRYePIVGdtyI16JOyn0zZh
	ck/1cFJOyMkmV8PtTmSa2bwaKud8kpiGxb9KLEhgb0rm7kuL+fHzMZ1//UPW7Co6GFaMUR+q4deBn
	G7P8qBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZe1g-002OdX-BP; Tue, 07 Mar 2023 20:35:12 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZe1c-002OcT-93
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 20:35:11 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1DA20124;
	Tue,  7 Mar 2023 21:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678221306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxNSkRGtGi7iDCIIxChRFUtyM5F/ChR0Uslv2lD683A=;
	b=x3wLEFgMuOssiWP4t7tAB6oPKghboFI6Nj0H8gg9vZE62GKMpxZFMj158vzQg/cfX8M3E7
	OxvPq+2fAUuKmQDECpXDJ+wZ8E6U/+Y6Y9ihNvavJlBB+cz2KM0EypaZJUzINr0xYDiTuP
	Kon1yh1EV2Qjz3GXq1b9znnvz2To8AuPzv+sR/A/onXjDxTUanoDupxUSMA2McDbp9cP3a
	R6Ey0iUpkzEfMRRvxcGKVDNSl2UizPVW6qfKa0yyGYOKkzUiv1Qbf8loeLyI+oGg1FqwGg
	BXaW/n45bqhKLfG+C5Busx4fHJr08A1OAhBIt4ByS2+Lu/NJTCFf4j+R7P1gZA==
MIME-Version: 1.0
Date: Tue, 07 Mar 2023 21:35:05 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: Avoid printing error messages on probe deferrals
In-Reply-To: <20230307192506.439532-1-miquel.raynal@bootlin.com>
References: <20230307192506.439532-1-miquel.raynal@bootlin.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5ff078a1f994c87621cc9ea9335ff6b6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_123508_494965_252D6375 
X-CRM114-Status: GOOD (  16.99  )
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

Am 2023-03-07 20:25, schrieb Miquel Raynal:
> There is no reason to complain about probe errors in case of deferrals.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Changes in v2:
> * Use of dev_err_probe().
> 
>  drivers/mtd/mtdcore.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 0feacb9fbdac..e4e102585021 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -536,12 +536,11 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>  	mtd->nvmem = nvmem_register(&config);
>  	if (IS_ERR(mtd->nvmem)) {
>  		/* Just ignore if there is no NVMEM support in the kernel */
> -		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP) {
> +		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP)
>  			mtd->nvmem = NULL;
> -		} else {
> -			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
> -			return PTR_ERR(mtd->nvmem);
> -		}
> +		else
> +			return dev_err_probe(&mtd->dev,	PTR_ERR(mtd->nvmem),

There is a '\t' after the ",".

With that fixed,
Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
