Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8542CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kW0OnZtuCLaAgGf2yMvC66CNP0tCIkuPKKRjyY5T4Ys=; b=GL9BH8GAj5Tu/g4DJwBGpC/6P/
	P2NbFgkM0SnVeqoYXz/NyumUCVfFJOf2QNfjbVASuV9f4XytrySuaX8ZUSO0LZlS0P6G+L/iEmUjt
	O1L3xeesIzc8lrI/N9CfTbNqNuDNK0ld5izHUkDpbwivaFSP3UPe7y9VPj/loJ/nVX+KsRQt+guTM
	/7qZGKO+i0pIuYh2ug8XaT4ua1ladlLtyb9n4ne3TPQ7V9HaztDA2LglArnHyX6Em1OL9W7UGX+Ho
	7sKCBJy6AynJsbbJ9fFeeCntpPzGYflyIOxdK57w9CUalYl2Fq7j5xrnGX0F3IBil5OCEJynv2Zfw
	wc2KrhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqris-000KO6-2l;
	Thu, 12 Oct 2023 09:11:14 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrio-000KLw-2K
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 09:11:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 22DBB3D5;
	Thu, 12 Oct 2023 11:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1697101869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lK+j//CfxO3PYmVwwW1MbgLEZ/P1cVy+TAusj8NdskE=;
	b=Ja5gDszj+51Fi2Cfu4nzJrOq5NxF/0nOXMEmSRYTN6swk49ZBbBuqnaCAfx3d4gtwtx8Re
	X2cXexpgbBsEhuhOeMY392bEVBg5wkoVJwILvlWqFTPgegiLmVvi29+B1QEtC550xVWTTz
	ZghI/IhmXzwnFl2tT0plAFkFPlT8JDhAQ0LmC6S3MUgSVuhR2Rt8QQo+Xp+ukEYk32Tq8h
	fYyAmhLv8GcyUwZG9RPTJNdE08TvjhdJG7bK+QyXu3l7oXISj1PTiB4hJlOjDorS9FnoIN
	BEl/xE5O6aj8WDl+Qw3GGGc35tpb/mkV7JnKtTyFnfW7KwACYc+ljIXEy+NcLQ==
MIME-Version: 1.0
Date: Thu, 12 Oct 2023 11:11:09 +0200
From: Michael Walle <michael@walle.cc>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH] mtd: spi-nor: Ensure operation completion before shutdown
In-Reply-To: <20231012055148.2445303-1-quic_mdalam@quicinc.com>
References: <20231012055148.2445303-1-quic_mdalam@quicinc.com>
Message-ID: <bb12db1205a5d1bfbee341d23defe0be@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_021110_912012_0B202700 
X-CRM114-Status: GOOD (  11.60  )
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

Hi,

Am 2023-10-12 07:51, schrieb Md Sadre Alam:
> Ensure that there are no pending spi operation inprogress
> when system halts.

What operation might be in progress here? Did you encounter some 
problems?
Please explain it in more detail in the commit message.

Fixes tag?

-michael

> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1c443fe568cf..adc4d2c68695 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3690,6 +3690,9 @@ static void spi_nor_shutdown(struct spi_mem 
> *spimem)
>  {
>  	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
> 
> +	/* Ensure no pending spi operation in progress */
> +	spi_nor_wait_till_ready(nor);
> +
>  	spi_nor_restore(nor);
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
