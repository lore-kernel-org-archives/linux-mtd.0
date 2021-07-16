Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0832C07E95
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 16:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A156561260
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 16:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A156561260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gc+lzAlD/cVGd6TcpIvTHPcCsQbO13/zLLTjohJaeX0=; b=dyZVQ9zxfKrUvr95mUATyaKWHw
	t55DXyxjnM8QpJYRFTj5sblNYeBEXj4+G//aPQVJz6HO1PaEh/Q3xnBjMWm3WBi9fU1tPvfjTKn8u
	Mi+qum2iSwd/wAjJQkwcR/nBaijOttXzCGDMx3EIFVKIInvTGPipdn5SMWqA8d41f223bZDGutpWH
	sLTwz4kOj0o9APYUPQvtSIj6/KXANee6s/Y6su4MoDKQJS6o5pVAp4OjLEUKxdRNkOafYRwOzgktB
	hLUMK/ovlnmlHs0hJANhjKE5slQe0inDS0T6NWXeQpEsbeNdOK/VGOEMT5PJV8/NpZWh3t22ML3h5
	2bbJ4IxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4QRV-004p1e-E5; Fri, 16 Jul 2021 16:12:01 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4QRR-004p0T-QZ
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 16:12:00 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CC42322249;
 Fri, 16 Jul 2021 18:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1626451912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCuQ7q74xvLtD3gu9M4P4n85O/cT1uchJ8pN9GWOwrk=;
 b=QPx0qWUDdIsDHnrZl+togSAsojpNGipsq96Foi3VpQAJP9uxxdjvYutGHAk/LgP8lTDBxY
 sFBQp7pTcTKRUNHzLT7YwV7WPh+GqmSx+etjgVIGPJ/XsF8viTdBESmuGHiq6Uwsuetrm3
 4EZJ4vRMQisgEdO7llf0idSA41zyJVc=
MIME-Version: 1.0
Date: Fri, 16 Jul 2021 18:11:51 +0200
From: Michael Walle <michael@walle.cc>
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: esmt: Use correct name of f25l32qa
In-Reply-To: <20210620085639.143694-1-mans0n@gorani.run>
References: <20210620085639.143694-1-mans0n@gorani.run>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dad2160dba9070f1516519bdd00207ac@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_091158_269344_B35DC2C6 
X-CRM114-Status: GOOD (  16.93  )
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

Am 2021-06-20 10:56, schrieb Sungbo Eo:
> The flash ID of F25L32QA is 0x8c4016, whereas that of F25L32QA(2S) is
> 0x8c4116. F25L32QA(2S) is the newer version of F25L32QA and its BPn 
> bits
> are non-volatile, unlike its older version.
> 
> References: 
> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32QA.pdf
> References:
> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32QA_1(2S).pdf

"Datasheet:" please

> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
> At first I was going to send a new support patch of F25L16PA(2S),
> but before that, I wanted to make sure if "(2s)" suffix is okay or 
> unnecessary.
> ---
>  drivers/mtd/spi-nor/esmt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
> index cfc9218c1053..51b3ff764ef6 100644
> --- a/drivers/mtd/spi-nor/esmt.c
> +++ b/drivers/mtd/spi-nor/esmt.c
> @@ -12,8 +12,8 @@ static const struct flash_info esmt_parts[] = {
>  	/* ESMT */
>  	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
>  			   SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
> -	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
> -			   SECT_4K | SPI_NOR_HAS_LOCK) },
> +	{ "f25l32qa(2s)", INFO(0x8c4116, 0, 64 * 1024, 64,
> +			       SECT_4K | SPI_NOR_HAS_LOCK) },
>  	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128,
>  			   SECT_4K | SPI_NOR_HAS_LOCK) },
>  };

Tudor has decide on that name - or the use of parentheses. I don't have 
a
strong opinion on it.

FWIW,
Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
