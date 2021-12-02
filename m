Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975CCC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4o4iuMJ+qOOtzvHP4jIfsdS08yqnP7ZRxVu0+tONtrQ=; b=2b+HB3YDvIDOGH
	L5itwzA4dETOS90gpl7NoYm4oDcU3DmU6rEFBLR6lWugi5stN3tlI30xshzjaj8tdeWzlhN5xQ32x
	OaPF61xPzgw41EY4Mql3Z5yBY2go8tf4B7JWerAbCk6PbHcoRrwvDV7xxYKYaw5xFDwXPHKOsOLw4
	TTIQeOVk3mSmM6t14U5uyNeavXRLwCNcRUWKu8jcfqGWDm80iE/aYrhm3sJZeAb6RX8V7r2MFy3W7
	tVJympVnmss/FGb7y8RP0lkwe2ra+l2NPULQ7HqqqLg5tigOsgmde0MTVGrbNr3lO3U3+XzzLf7Zv
	fSF0+NhhoNT/k4mnog2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msiH1-00BX4i-Or; Thu, 02 Dec 2021 09:21:03 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msiGx-00BX38-S2
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 09:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1638436859; x=1669972859;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Hf1Sz4lNz/yJTkW9Vuqpwjleh8HbZdbQpO5u4O3YGU=;
 b=e89Rl4ni0FO6ayBtF/QY0tRlBChiSZBzqbcwu7tQt8TChcDxG15Ettp7
 PQefm617JTy5cf6ZmeAj86kZTvSsfyPxGJ0m5TJN0h78oeCWCUY/0i5/4
 +Qrp98v79uPodmR0A6ZDKxYOCfFUnh+NdIFEfv/Eq0VIiKpu+ECbjP1qS
 jj3RNrt2TNbYBEcRJy9MELJbdTM/ViGSfJNXpXMa5kupp9wZhf/F9RXpv
 CVA341IBklTVO1JoLPVu4Esd6GQvrl2+h4VuymusS8RZf6QM3L52Ogc6X
 kYT4Q1d7JjD6ZIV+YcVNlraDvGbpzFJ7y2wO5sUYODdmYOrkoHOTHv6pB g==;
X-IronPort-AV: E=Sophos;i="5.87,281,1631570400"; d="scan'208";a="20805231"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 02 Dec 2021 10:20:54 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 02 Dec 2021 10:20:54 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 02 Dec 2021 10:20:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1638436854; x=1669972854;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Hf1Sz4lNz/yJTkW9Vuqpwjleh8HbZdbQpO5u4O3YGU=;
 b=Y1z0vd0IeB/Se3Pisi3qXyF3tTzpacxGq/m0b1WGStRhEmeZMufV6nRi
 AqYmtQAwxQhckKgG2V6h4AlMZVOdEZQBEtjfP+1sCBvBAaKlo5LqqzfJJ
 Uhj0Egu5NowxnQ03PsiTE+zUJAKstIrh8bjzzYFg/XKxnBzMxZDaTua2m
 5HSWVHEUFc8XbaWBdUW2i3piukeAdJPGy3zyGTSA/R3XIBhRuQeUBlcN7
 1IRZmGzZ9BkS+CVDLTz9/KuEIWi7CdWmZRMis7+IJAqlucKoRwW1Uhxas
 g0WkkMNryC2jSoRV8dWNwm5ZeCSlit07PTueAb1WniFL0FEtIK4UiYNbo A==;
X-IronPort-AV: E=Sophos;i="5.87,281,1631570400"; d="scan'208";a="20805230"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 02 Dec 2021 10:20:54 +0100
Received: from schifferm-ubuntu (unknown [192.168.66.22])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 70D1D280065;
 Thu,  2 Dec 2021 10:20:54 +0100 (CET)
X-CheckPoint: {61A88FF6-3-3C7FD1AA-EED18422}
X-MAIL-CPID: 45077FE7A9563F0EC435383A3A30E219_4
X-Control-Analysis: str=0001.0A782F29.61A88FF6.00C9, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <7f627adcaf0c8a8d0ffc8696658d3e400a750e62.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: micron-st: make
 mt25ql02g/mt25qu02g match more specific, add 4B opcodes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 02 Dec 2021 10:20:54 +0100
In-Reply-To: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
References: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_012100_319515_55B5145F 
X-CRM114-Status: GOOD (  22.40  )
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

On Thu, 2021-10-07 at 14:08 +0200, Matthias Schiffer wrote:
> Change the mt25ql02g/mt25qu02g entries to include SPI_NOR_4B_OPCODES.
> In
> addition, the SPI_NOR_DUAL_READ flag is added to mt25ql02g; this
> seems
> to have been an accidental omission, as mt25ql02g and mt25qu02g
> should
> support the same features.
> 
> In addition, the entries are made more specific by matching on the
> mt25q
> extended ID, like it is already done for the smaller n25q
> derivatives.
> It is unclear whether n25q derivatives with 2Gbit exist that do not
> support 4B opcodes (like it is the case for sizes up to 512MBit), so
> we
> do not have a match for such variants anymore (as we wouldn't even
> know
> how to name such hypothetical models).
> 
> The changes were tested with a mt25qu01g, which should support the
> same
> features as the mt25ql02g/mt25qu02g.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---

ping


> 
> v2:
> - add extended ID match
> - add back NO_CHIP_ERASE
> 
>  drivers/mtd/spi-nor/micron-st.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-
> nor/micron-st.c
> index c224e59820a1..a000a0790ecd 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -180,12 +180,14 @@ static const struct flash_info st_parts[] = {
>  	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048,
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      NO_CHIP_ERASE) },
> -	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
> -			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> -			      NO_CHIP_ERASE) },
> -	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
> -			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> +	{ "mt25ql02g",   INFO6(0x20ba22, 0x104400, 64 * 1024, 4096,
> +			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> +			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
> +			       NO_CHIP_ERASE) },
> +	{ "mt25qu02g",   INFO6(0x20bb22, 0x104400, 64 * 1024, 4096,
> +			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> +			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
> +			       NO_CHIP_ERASE) },
>  
>  	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
>  	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
