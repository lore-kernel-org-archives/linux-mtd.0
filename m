Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6001C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:47:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D07C20A8B
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/eJ0m1f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="br8jZAC5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D07C20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zBdRqAX8RCoipkGodKPaq8nNO2eYrapDBg8Ez/qshfo=; b=G/eJ0m1fpiVVUD2wmCurb1Lk6
	Ti0UN9d4jB74x31izLJNf2npNXHyCdC28/wDbrRts2xkTRJbDDmoa3eW4zhFGyPKOGXIGgBtIWp/d
	IyC9nbjXpkj2RZQRqn5eX5vIhnPkgN+lNR0ITK6zWHks4J1TPCVH+Dvi5qT6AQRjUGWMtWXRR7l7r
	3CHxB9F0qzj6u82NORFCJOw2sRMx1r3tLzQ7g5Zyplf7SWNl1eA6OyVciAhYb3OGpBM9TDahHzjhm
	Mm4sDnz3xoU++U+YCj+uajMR2ScjwtZ8HTnrXuVm9uJWqu3C4m5JyyXCewjnT8U+vVyzHXMMg7K+0
	+ENPzt1Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdEnv-0006zG-5I; Thu, 12 Nov 2020 15:46:31 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdEnr-0006wv-TV
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 15:46:29 +0000
Received: by mail-il1-x141.google.com with SMTP id q1so5643820ilt.6
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2020 07:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbBMIBt9sbY15L3rVTIesjSgzRJgQSWEsSg7nW8xxNU=;
 b=br8jZAC5NF3NhlltWjsxhVx5tNYAcrAOAWSCiJ0MFiY0sdIZgXpPKrVWrbDGLH6keW
 dLZN26/U6irDM1gpiamZGYlPz2MRsbuo0YzVM0Ba0UutMXE/CXpTmp55QT07JWxgWtN3
 nVq5oIu/rEDx3U9udwUlM+uj51+ll4MXNbemuFx0tbdv9b1+9a+SrLZ49vMfDyayA0g1
 ychESt5+uHSRj9kYT/KEAf7jHIol4pyGcfEqLQJuP+e6osINY6BKtKq8jggRQ7TCa53+
 MutXhSJJX4Xt8KtY/bC6uTLSENoNnuG8edHpOeAtWxpjnKqJphvyQGzEmyJnjk7wo9Nn
 wRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbBMIBt9sbY15L3rVTIesjSgzRJgQSWEsSg7nW8xxNU=;
 b=KLjR/fILjYiJrY+efKVK9rfDUsBwrC72M0VNpSRCmS5AqkE8FUX2nJ1Wt1LWxUpqjF
 +enHXk5dZLMIlRaDUhSR+xTZoMZKLEesJWlDQSTJhCpSdmvwWWAMPhwjbE9bZl8zIDgh
 ZQAJo6kStfiyR4wYI6LI6pJuIq9tUD8a0Q6eMo9YnysOROT+lyXqLTeRfzVb4PD9nsT/
 FNr5Mdfbjio3dP0dVQW12+jimAiO6NngAVYF9bbs/L2My6DTYicWaxMutwKiwxJ7A9AS
 nNHr+B12VXvrpBflbq5btj1xeM7Qqu43lyDQ6xrNxV8tuYtsKUj6cVZm6/CnpWDt2dpb
 Zj3Q==
X-Gm-Message-State: AOAM532i/5y+f7MkEAWnOs1HHuwceSfeK5TkNppY0/3I5gEabAaw4kr0
 qB0EYC5A/83yRmEH1dXq8l6ztKtPE1WYD0RKG3A=
X-Google-Smtp-Source: ABdhPJzLsAmh7B3AUAYxQXWIfVsLw152OgwoE1qgVkib6BkMuLWGNsAm5+1rGfOvyjjIwkFsJzDwLduOnhthTOBcm2I=
X-Received: by 2002:a92:c6c6:: with SMTP id v6mr73479ilm.119.1605195984197;
 Thu, 12 Nov 2020 07:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20201106213655.1838861-1-lee.jones@linaro.org>
 <20201106213655.1838861-14-lee.jones@linaro.org>
In-Reply-To: <20201106213655.1838861-14-lee.jones@linaro.org>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Thu, 12 Nov 2020 10:46:13 -0500
Message-ID: <CAC=U0a24oQasGEPGHeJfG7J4U-F-a8Q54oEPKGQfhrsd0iPhfw@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] mtd: nand: raw: brcmnand: brcmnand: Demote
 non-conformant kernel-doc headers
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_104628_070238_4A7E8A5C 
X-CRM114-Status: GOOD (  17.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 6, 2020 at 4:37 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'host' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'addr' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'buf' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'len' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'cmd' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'host' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'desc' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'addr' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'buf' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'len' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'dma_cmd' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'begin' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'end' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'next_desc' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1977: warning: Function parameter or member 'host' not described in 'brcmnand_dma_run'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1977: warning: Function parameter or member 'desc' not described in 'brcmnand_dma_run'
>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: bcm-kernel-feedback-list@broadcom.com
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 2da39ab892869..659eaa6f0980c 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -1846,7 +1846,7 @@ static void brcmnand_write_buf(struct nand_chip *chip, const uint8_t *buf,
>         }
>  }
>
> -/**
> +/*
>   *  Kick EDU engine
>   */
>  static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
> @@ -1937,7 +1937,7 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
>         return ret;
>  }
>
> -/**
> +/*
>   * Construct a FLASH_DMA descriptor as part of a linked list. You must know the
>   * following ahead of time:
>   *  - Is this descriptor the beginning or end of a linked list?
> @@ -1970,7 +1970,7 @@ static int brcmnand_fill_dma_desc(struct brcmnand_host *host,
>         return 0;
>  }
>
> -/**
> +/*
>   * Kick the FLASH_DMA engine, with a given DMA descriptor
>   */
>  static void brcmnand_dma_run(struct brcmnand_host *host, dma_addr_t desc)
> --
> 2.25.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
