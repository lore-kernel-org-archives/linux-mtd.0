Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440B3C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 09:27:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE676610A3
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 09:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE676610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Content-ID:MIME-Version:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgAhObAlo7b0N1cCmofBTunjszn9L+2CZRBhQwsHDbI=; b=FUpbN+Lzq3KnCu
	vOSi9VlWTBaxV9+J3OUa2l/ZTecerLPWu7j3AYEXOTXbW2AzBBZVEeTYCeC8QXGOlAH2tiMrmNZyE
	V8IHyQsdKd56Wghosse2pk8ilZeDss5kWmtjxnRnG/Tmax0a21pgsJHHl4oI5MTCcjmBgNiVFnsUs
	Yhg8KJd1PnosbbWk9ljR1k/Lq/OD0GpSfVYnPewpKEKXGaCAxDjkBurKyxMTthdnzZIgwxJTtQK3c
	3m3MEZeh4u+VnmPNiZuYXHHSCBSI2w+TbYZogUNG+qZ5Fzi9PJ1JPvzUaIux9IcwPBAV5LT1ffJuZ
	QuJKPCEzFWWl+asNzgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk0vZ-00FrLJ-1C; Mon, 08 Nov 2021 09:26:57 +0000
Received: from mx2.tq-group.com ([93.104.207.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk0vW-00FrK6-Ea
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 09:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1636363614; x=1667899614;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-id: content-transfer-encoding;
 bh=YsIfsjOydbJ7yEJPmixPtzgjosr/9p2WG1NwLYBVfNI=;
 b=GdsE/Hgg4c2suUKMhJgxRJHO9gLiT6w2enke6H3vHAUbCRNWFMe92aX8
 qZ55NCpU/DDkhnzUS1ZvgSbJMCSqKZszJ3eJxmTZ/unY9ZXg2anlzZ+d8
 wKUtr1855hHHwa1xai9vGwhKyE/cKofe3EUzzLh6P8HNF/m1t16eeDSsR
 n5P2DC4DLczu7SBpFRNB2IxypNPU+OxUv7tsRQReQszr4Mf21nlG4fSZr
 fuPIUB1vA0FFD7Q7ZqsEmybKgprLBJkTS/hhq/N8iu2fMDC1Ui0/UQfUi
 ZdFtr1kTuC+pRNzpAfMnB5Z90vK4/l8Jas0wcujmkaKJzAAHZSxnfHVhD A==;
X-IronPort-AV: E=Sophos;i="5.87,218,1631570400"; 
   d="scan'208";a="1159645"
Received: from unknown (HELO tq-pgp-pr2.tq-net.de) ([192.168.6.18])
 by mx2-pgp.tq-group.com with ESMTP; 08 Nov 2021 10:26:49 +0100
Received: from mx2.tq-group.com ([192.168.6.8])
 by tq-pgp-pr2.tq-net.de (PGP Universal service);
 Mon, 08 Nov 2021 10:26:49 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr2.tq-net.de on Mon, 08 Nov 2021 10:26:49 +0100
X-IronPort-AV: E=Sophos;i="5.87,218,1631570400"; 
   d="scan'208";a="1159644"
Received: from vmail01.tq-net.de ([10.150.72.11])
 by mx2.tq-group.com with ESMTP; 08 Nov 2021 10:26:49 +0100
Received: from vmail01.tq-net.de (10.150.72.11) by vmail01.tq-net.de
 (10.150.72.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 8 Nov
 2021 10:26:49 +0100
Received: from vmail01.tq-net.de ([10.150.72.11]) by vmail01.tq-net.de
 ([10.150.72.11]) with mapi id 15.01.2308.015; Mon, 8 Nov 2021 10:26:49 +0100
From: "Stein, Alexander" <Alexander.Stein@tq-group.com>
To: "p.yadav@ti.com" <p.yadav@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "michael@walle.cc" <michael@walle.cc>, "tudor.ambarus@microchip.com"
 <tudor.ambarus@microchip.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: (EXT) [PATCH 1/2] mtd: spi-nor: Fix shift-out-of-bounds
Thread-Topic: (EXT) [PATCH 1/2] mtd: spi-nor: Fix shift-out-of-bounds
Thread-Index: AQHX0uPOpq2SCHKAhUucvM9nE2hnpqv5TviA
Date: Mon, 8 Nov 2021 09:26:49 +0000
Message-ID: <5f104ec3b6ad492212105ad59ba135ff8ed2cd0d.camel@tq-group.com>
References: <20211106075616.95401-1-tudor.ambarus@microchip.com>
 <20211106075616.95401-2-tudor.ambarus@microchip.com>
In-Reply-To: <20211106075616.95401-2-tudor.ambarus@microchip.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.72.21]
MIME-Version: 1.0
Content-Language: en-US
Content-ID: <578596A275E6EF4698090A05E2C24D9E@tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_012654_871289_F99BECCA 
X-CRM114-Status: GOOD (  18.16  )
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



Am Samstag, dem 06.11.2021 um 09:56 +0200 schrieb Tudor Ambarus:
> When paring SFDP we may choose to mask out an erase type, passing
> an erase size of zero to spi_nor_set_erase_type().
> Fix shift-out-of-bounds and just clear the erase params when
> passing zero for erase size.
> While here avoid a superfluous dereference and use 'size' directly.
> 
> UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
> shift exponent 4294967295 is too large for 32-bit type 'int'
> 
> Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP
> SPI NOR flash memories")
> Reported-by: Alexander Stein <
> Alexander.Stein@tq-group.com
> >
> Signed-off-by: Tudor Ambarus <
> tudor.ambarus@microchip.com
> >
> ---
>  drivers/mtd/spi-nor/core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3d97c189c332..a1b5d5432f41 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2230,8 +2230,13 @@ void spi_nor_set_erase_type(struct
> spi_nor_erase_type *erase, u32 size,
>  	erase->size = size;
>  	erase->opcode = opcode;
>  	/* JEDEC JESD216B Standard imposes erase sizes to be power of
> 2. */
> -	erase->size_shift = ffs(erase->size) - 1;
> -	erase->size_mask = (1 << erase->size_shift) - 1;
> +	if (size) {
> +		erase->size_shift = ffs(size) - 1;
> +		erase->size_mask = (1 << erase->size_shift) - 1;
> +	} else {
> +		erase->size_shift = 0;
> +		erase->size_mask = 0;
> +	}
>  }
>  
>  /**

Tested-By: Alexander Stein <Alexander.Stein@tq-group.com>

It fixes the UBSAN error and my spi-nor flash can still be detected.

Best regards,
Alexander

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
