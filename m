Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41915C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0djmDntHuG0QMawmfr7O0k5i/qTzGqTlXpF/m30Pjw=; b=xef1hrv6Rs0P2k
	1uQsWGyNI8piXyOkKUMKFadB5EFy6HCjSimbvbfwU8KTq22rT5qmwIyVSoo15BBuK3VuvEjvrR/9H
	gPJFIZGo66hFz/dWbMuNHYDy4GRgv7ErKdaSxbe7hsNGoI+OchYN4ebYZZpFcVV472o2d3HhTjFJr
	9FZ6UXapcVacfoJVtz3clRaDH+z8K8GvqAXbeY1WIOcC574j44hj/V9m+0DWTSlRd58UUelTkBXIa
	nyBmb82Q1BGJU2GFRsMSsixi1JDtpFykz+tofplPKrt5tsUHfJlFWTNLbaI/xaSdVHuiOFRzkmNf3
	UcTBE4OCuTK0gqVbVajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUOG0-00ByRF-Ii; Wed, 16 Mar 2022 07:39:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUOFx-00ByPF-Vu
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 07:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1647416382; x=1678952382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HmhzW1Qp4+U0VPSr1IDp2ch0J2gmIREwX+GllKQnkvs=;
 b=e3Avq0xYDMGQD0XK+2McM/oWMIQ5eOIyo677QgGEpWFb8sqR9BoRC8W4
 9fwdVoMfvMU3VnP5gy+DZMoW5CcV6hD+cT6L7sOsgiKLMxTEmns5BasTi
 eq1IFgAkwpv9Mef4+HKoFwVvdtyi7bRtRkIxvwo0bxtQzcr44WV5XUu0C
 OfNLIlbloTNgt3BjtSJd1m+DaPMiQAShLrmXkR6fQGjhQ0bGqtwJhmn8H
 oucbFD9J2RgGHwPO22//g5VGkHHxZSy3L8NWYd3lvTiPl0XMp+WHJjMUv
 y2bFVJM6pbnn4sBo5tF2f7IQ4bC7q6wG147B38rCP+Al6XYQbL1u0G5g/ Q==;
X-IronPort-AV: E=Sophos;i="5.90,186,1643670000"; d="scan'208";a="22692323"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2022 08:39:36 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 16 Mar 2022 08:39:36 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 16 Mar 2022 08:39:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1647416376; x=1678952376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HmhzW1Qp4+U0VPSr1IDp2ch0J2gmIREwX+GllKQnkvs=;
 b=dfpML5EA0TZp7DHALlrFIRQxsLOHs23j4cCeiV3g8EE+PPI/S/Mp3mwx
 2Kq3zz9gQ322dSEojJCcnFm+QX9ttd+Xdy8rjPDE6mwBs0arukF/DSr2i
 hMSQE2agPKTaYpGzmMDpwDHliRP6BWq86A0Bh2L+rLfTTN/5tSzUV3QjL
 f7joTc6ON+wD/Xr7j8aEEkkc4yQQ6/Fd6njFF87fqYeX0pH3Oj1CsdlnM
 JVYImrvn72FGZ062wUz6naBl/+txKcadojcSH7inVSOu0Ys39h/A4kenr
 AjFgxa4aBL+0thn7N56oK6w9rwNVejCiI7bJEsI5X8Xsjt4ctxiNv6Reb A==;
X-IronPort-AV: E=Sophos;i="5.90,186,1643670000"; d="scan'208";a="22692322"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Mar 2022 08:39:36 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2F44F280065;
 Wed, 16 Mar 2022 08:39:36 +0100 (CET)
From: Alexander Stein <Alexander.Stein@tq-group.com>
To: linux-mtd@lists.infradead.org
Cc: michael@walle.cc, p.yadav@ti.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix shift-out-of-bounds
Date: Wed, 16 Mar 2022 08:39:33 +0100
Message-ID: <5550605.DvuYhMxLoT@steina-w>
Organization: TQ Systems GmbH
In-Reply-To: <20211106075616.95401-2-tudor.ambarus@microchip.com>
References: <20211106075616.95401-1-tudor.ambarus@microchip.com>
 <20211106075616.95401-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_003942_448630_47737D25 
X-CRM114-Status: GOOD (  19.18  )
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

Hello,

Am Samstag, 6. November 2021, 08:56:15 CET schrieb Tudor Ambarus:
> When paring SFDP we may choose to mask out an erase type, passing
> an erase size of zero to spi_nor_set_erase_type().
> Fix shift-out-of-bounds and just clear the erase params when
> passing zero for erase size.
> While here avoid a superfluous dereference and use 'size' directly.
> 
> UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
> shift exponent 4294967295 is too large for 32-bit type 'int'
> 
> Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR
> flash memories") Reported-by: Alexander Stein
> <Alexander.Stein@tq-group.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3d97c189c332..a1b5d5432f41 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2230,8 +2230,13 @@ void spi_nor_set_erase_type(struct spi_nor_erase_type
> *erase, u32 size, erase->size = size;
>  	erase->opcode = opcode;
>  	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
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

What is the status of this patch? It is not applied up until now, no? Has it 
been superseeded?

Regards,
Alexander




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
