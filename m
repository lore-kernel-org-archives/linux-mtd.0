Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D75AC282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 10:57:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AA8320857
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 10:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DAlyDVyX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTggjWwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AA8320857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvlA1zkouDrqBDk+kJfO0MDVKyuGtt72aVLeNPs1KI4=; b=DAlyDVyX3yd7jm
	eQaDV+cOffKNrKxNFWPCLdsks4o7XkNsZbboxi0dMEKXh1SrTrSzb3cCs4yW1bnPfOQFmDrQ+anKq
	dhJ2c6G2bwONfqBypKcG63tmwHEOH3xXs0mW0WwlDlJflgO4g/Awh8z9uxhlXfywvgDMVZjap0n28
	z20jaqItf2meE1IcXsScN3Dp3cCW4sGZNs6eA4koTY4V5NyqFX9lcheVI2naSbtEUjWw1QoP8Kga0
	i6oij0ONvr7gHYVPrSVJ37Q5booyPzTfWgJ2kMgChw6JKaZUPGE0Q2j8d9IN/eOK57jp1YsLGWAiK
	6mfZGFGDXIoKhrGjVNuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gonYC-0006pC-Ub; Wed, 30 Jan 2019 10:57:00 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gonYA-0006oq-6A
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 10:56:59 +0000
Received: by mail-wm1-x341.google.com with SMTP id d15so21142745wmb.3
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2019 02:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wlHQ755xhPWS8Rb2FngFIQQnFcRhqupdMocQ44zMXDY=;
 b=VTggjWwVUCS5BrXSjr6k5oN1XjT9JUacrko6hpDmzOEH0D8ySPDATFu1S42JmaHA/m
 DL4YwbLLWTDhCzW5b/revQZ04uRdQHbVbrNKI4rSGYulNIt5PXVXINBBZWf8SzdXeY5b
 J4n8zn4g96SlC13e7aBHwRkRmTEs0pos5E+SwvaACr9ltr72Q+XWAYwFDzVO7zTHAfxE
 emO2Km+N/XzoQ8uB+iA4OeNDQqhK/XfJTVG+jNFCxFrOg3/vAPtyaYvrQjCD/fQJadEi
 wkE6d1WTLHJqQ3GNQfTn7/UTKHArqs30/TrVbfKUQ0YD+j27fGTgkGR00UR+Yy0sTzar
 RSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wlHQ755xhPWS8Rb2FngFIQQnFcRhqupdMocQ44zMXDY=;
 b=qwgvPIEfNgxOIw6vaRbXPzx5k0sNDjVwuvUAS54tzLlWFZSmShSCm9NlOLVLFhiHnC
 jZGVXYz2TqAsugWBA1740fdgZZ3AYA+qQa42cgXRk6Z+QEpPmiGc8C6BH02TKERIqYdc
 g6dH410ry9B9m48qyxQU63KeA6eCRoQWoJtE2u3YPnyr8K0Zea0MUxzk1UVdFnopzpVs
 pD2MjcwwmSkS7Q183f8ciFcAKSckYsiZEIeQPRtORDcspkXbMamCrAh90jXmHBFg8hrm
 NW77SI6Z2Rvw8D7pmgluRGamIkj4fYg+lb0KXszozyy785fHWz0ednadHGChNx+aD48c
 cyEg==
X-Gm-Message-State: AJcUukdvcqqip4CZrvXk9YzcUgtJSNrRUEWDpWUnof6URVpI+q/lys/l
 ol2Y6WL6I9sA+QAqiG+Xw46dKSgi
X-Google-Smtp-Source: ALg8bN6sTxRGir8vTBeEGZ17c1G3OLrVN6KEs7TvKUWeuNCUc0455TuXTbeEsRlCNYkmNRVZ6ySy8w==
X-Received: by 2002:a1c:9855:: with SMTP id a82mr23581909wme.20.1548845816550; 
 Wed, 30 Jan 2019 02:56:56 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
 [86.49.110.70])
 by smtp.gmail.com with ESMTPSA id v6sm1933901wrd.88.2019.01.30.02.56.55
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Jan 2019 02:56:55 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
To: "A. Celenk" <ahmet.celenk@procenne.com>, linux-mtd@lists.infradead.org
References: <1548843970-8473-1-git-send-email-ahmet.celenk@procenne.com>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <6107ae35-c363-7489-5280-388612a23514@gmail.com>
Date: Wed, 30 Jan 2019 11:54:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548843970-8473-1-git-send-email-ahmet.celenk@procenne.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_025658_248954_19BC8050 
X-CRM114-Status: GOOD (  16.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/30/19 11:26 AM, A. Celenk wrote:
> Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
> the s25fl128s qspi memory, the single "s25fl128s" device entry must be
> split into two to match the correct JEDEC ID's for each version. Solves
> paging related issues of S25FL128SAGBHI210 chips.
> 
> Signed-off-by: A. Celenk <ahmet.celenk@procenne.com>
> 

Drop this newline.

Subject should now contain [PATCH V2] ...

> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> ---

There should be a changelog describing what changed, like this:

V2: - Foo changed
    - Bar was added

Otherwise looks OK to me.

>  drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 13a5055..1ee2d56 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1898,7 +1898,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> -	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
> 


-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
