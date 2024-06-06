Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5EFC27C54
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqfGcf1K3S7jtJqWOOSnfolRgxOJj5hKT1bFbTOA+rI=; b=KXhg6YAt9Q2+zA
	P5Kdc2653r7fEJz7D9aBkvarjd2P/vukfTvqZ1syrtpad2jRzfLIwPhO5h/vGY9GWj11AUs60dM+S
	NEv1/nbPiMWcE7k+4z9X0Jer7m6ajMDBlVwPHrolLESpBpP3oDF1HVf3QEcc2iNwzLnsMblpYXPy8
	vmoOLgtL3IsYXrIElOxAG7o2xS7UNOzveYZKyt3CsSt+9i1s1cT/VKnCL9MDTeJRc1XWyu43qpGXT
	UCz/T4PxHQzc0Eopl0CcwPALTNXLQgnp/JDIzeaWbvNUE6L85bfGn7EP+V3MAg6sx6e1nbBV6Gd3f
	CY+UBeSC17eXPO+uc9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDF6-00000009u1Z-16EO;
	Thu, 06 Jun 2024 13:33:24 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDF3-00000009tzL-0GdK
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 13:33:22 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a68c2915d99so108423266b.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717680798; x=1718285598; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9vfJnrIrJKrBEEsqJQfUNJPUu7ekbSS5ajlvoZ3oR8=;
        b=VawUdwYshlr2iZEkbBWybzY/Y4A8iQxgzYXUdSB2+WSKJhoGLiJa2reGoKy8LRk89T
         y7p47WA9kHsnAauV4MbESyxCrd+eLGjZ2pIfuAdsh2bnxvp7LmxeeVKrNWkkb+KNhRch
         wKMMIE19Z2UBpIatlTaNfBrSLKiD35Bq+in8v44W/ioI+LBefer9zYJ5JAUgtF7HKn3Q
         mnD5pxjTtKssbG/1MIhKQnVQ/QM/ZZBU5SMX+eG3q6T3qYQlIWao8nmHCllOYKRtzwhL
         YcKI2j8d7sb2f3GkhnZw48pHrj38/7Efpa1p7dSP3uouQ2Ovi+mldt9qwBdMgpxN0NAA
         yHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717680798; x=1718285598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9vfJnrIrJKrBEEsqJQfUNJPUu7ekbSS5ajlvoZ3oR8=;
        b=u4wL72Z66dmwZB96w0a1+glD57TnazdtP5unDwyq5Kc2vn05UTSXx/6opX/6rE8HkW
         CFe4XYLvynZwUCUBlNyts8qUlLSQ2L18AcbW7p3x1cN1832Z2M/z/99RBbhGhwRAoJzw
         37EoOzggBTiqMvVR6tOrEIKaKXYc6+VRw0WR/x73J6z2uDymMvhLINh7/54NpIEo6911
         FmCnfel5/RoUhJkntl+HLuk7v5GrMSKg29yAY40/it2a2dCA+4iZvDmnWG30kDjRf5rR
         bZaGyp0gWb2sOB243/H27apP9pxehm90cqHmAtbJ4qp/nIHGuYj7mFi/cUm4F1nDy0Uc
         NSAw==
X-Gm-Message-State: AOJu0YypOkgWUKggGwWJUEfe+cqtrOZE5u5aBeMYYfXNmCRc6erio7Ya
	or5nskyfdcq+5rDcaCsc6zoAJh3ux0G1TanwA6VB1c82I+WX8O3Xr4d121Jwsyo=
X-Google-Smtp-Source: AGHT+IFoJD9GtL3GCiogv6CbJkDLnJ9CENNShalKA9gLKUp/ppTsRqeS2+q+/IrI887XwCzUUFS55Q==
X-Received: by 2002:a17:906:258f:b0:a61:4224:c998 with SMTP id a640c23a62f3a-a699fcf6586mr351582866b.54.1717680798512;
        Thu, 06 Jun 2024 06:33:18 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e19dsm96579566b.164.2024.06.06.06.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 06:33:17 -0700 (PDT)
Message-ID: <cdd6bc25-6282-4e43-9909-16ab918ed983@linaro.org>
Date: Thu, 6 Jun 2024 14:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: macronix: enable quad/dual speed for
 mx25l3205d chips
To: Esben Haabendal <esben@geanix.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
 <20240603-macronix-mx25l3205d-fixups-v2-2-ff98da26835c@geanix.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240603-macronix-mx25l3205d-fixups-v2-2-ff98da26835c@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_063321_142287_3660C17D 
X-CRM114-Status: GOOD (  28.46  )
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



On 6/3/24 14:09, Esben Haabendal wrote:
> Macronix engineers apparantly do not understand the purpose of having
> an ID actually identify the chip and its capabilities. Sigh.
> 
> The original Macronix SPI NOR flash that identifies itself as 0xC22016
> with RDID was MX25L3205D. This chip does not support SFDP, but does
> support the 2READ command (1-2-2).
> 
> When Macronix announced EoL for MX25L3205D, the recommended
> replacement part was MX25L3206E, which conveniently also identifies
> itself as 0xC22016. It does not support 2READ, but supports DREAD
> (1-1-2) instead, and supports SFDP for discovering this.
> 
> When Macronix announced EoL for MX25L3206E, the recommended
> replacement part was MX25L3233F, which also identifies itself as
> 0xC22016. It supports DREAD, 2READ, and the quad modes QREAD (1-1-4)
> and 4READ (1-4-4). This also support SFDP.
> 
> So far, all of these chips have been handled the same way by the Linux
> driver. The SFDP information have not been read, and no dual and quad
> read modes have been enabled.
> 
> The trouble begins when we want to enable the faster read modes. The
> RDID command only return the same 3 bytes for all 3 chips, so that
> doesn't really help.
> 
> Instead, we can use the SPI_NOR_TRY_SFDP flag, which forces the spi-nor
> system to try using SFDP, but fallback to the parameters specified in
> struct flash_info.
> 
> This way, boards using MX25L3205D will continue as before this change.
> That is without taking advantage of the 1-2-2 that it supports.
> 
> For MX25L3206E and MX25L3233F, the SFDP parameters are used, and they will
> therefore be using the optimal dual or quad mode supported by the flash
> and the SPI controller it is attached to.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index ea6be95e75a5..090f28e05a5d 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -61,7 +61,7 @@ static const struct flash_info macronix_nor_parts[] = {
>  		.id = SNOR_ID(0xc2, 0x20, 0x16),
>  		.name = "mx25l3205d",
>  		.size = SZ_4M,
> -		.no_sfdp_flags = SECT_4K,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_TRY_SFDP,
>  	}, {

let's remove support for MX25L3205D. You'll then be able to drop the
flash entry altogether and instead rely on SFDP to discover the flash's
capabilities.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
