Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E48BC54EAA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtEIjatSEkjOTYc/gYTC6vc6sv73WVG4ADMiTltdfn8=; b=npsF6k7bztiHQc3imKzW0eJDH8
	eG471K20CoK5W5ybYpwYidwc5AGf34+VhfoaekuWEf10x+DMeLH13L/wKrsI/qx3NGjMrOx8687te
	4YhyD/iNaYhNdimZ+vqOGlUDFQKyffuU27jr52qRcKAWpScE7noR9/v98qImrr64dm8cQwMi1fa3k
	KJsY0wqjcGe9uhxS/FxSDRGZndfU59X5KS3svLTu/eECeHN7nJME9CE0twC/tXWb84zRaFAeztohh
	DLXbAPCx7QdwWFmhHISJZ3k9WL36+Zi9o0FO6NY4cu5E001/kieUTWysfK12Hk/wpWYwEERN2e97I
	6o95tz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQWb-002tly-1q; Mon, 30 Jan 2023 09:32:29 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQU3-002sGb-TW
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 09:29:55 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 248DB3BE;
	Mon, 30 Jan 2023 10:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675070985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2NVG7YDMSDNU+ofFZZvrPtVz7CsCGJovYbM5A6XIjY=;
	b=lKzfmsOZUqeuSgxgQ3ouQtAUobADm1fDWqv0fouLGPYVMbPOA1PI/Tp0ESutJGup+zum2c
	mVR5mmJpr7xfvKsec3YtbQduy7XID+2O7tP81leC+FRxaJqR7WIqTCQm1f29Y/O5mfO24F
	IJOv1+BE8aXptK9x7TkCqaXPks4UuO3vVY9DMVjdilqI5EldUWDCpKsV4hikD6eyMiZpSq
	5jtdUcaVQ07Ag5UQ0dO72xBrvb8H2LopO+iF/ODIwsOc89WH6z7ngK+sNfpo9Q+sVb2QmQ
	LIV0ObchNJhNvsLBujUGnTxLra2bMjAsHAUYMyoATMSp8l/37OEnTuYB6zkFCg==
MIME-Version: 1.0
Date: Mon, 30 Jan 2023 10:29:44 +0100
From: Michael Walle <michael@walle.cc>
To: Heyi Guo <guoheyi@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] drivers/spi-nor: add support for Winbond w25q01jv
In-Reply-To: <20230128033957.125853-1-guoheyi@linux.alibaba.com>
References: <20230128033957.125853-1-guoheyi@linux.alibaba.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c7c3c4cf5dd477953e366053859df08f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_012952_176985_EA6526D3 
X-CRM114-Status: GOOD (  17.24  )
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

> Winbond W25Q01JV is a 128MB SPI-NOR flash chip.
> 
> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> 
> --
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c
> index ca39acf4112c8..0cd49f534bf8d 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -142,6 +142,9 @@ static const struct flash_info winbond_nor_parts[] 
> = {
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "w25q01jv", INFO(0xef4021, 0, 64 * 1024, 2048)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ) },

I'd guess this flash has SFDP support, correct? In this case,
could you please try the latest next (or -rc) kernel without
this change? In the meantime we have a generic spi-nor driver [1]
so you don't need a new entry in most cases.

Apart from that, it would be nice if you could dump the
SFDP tables, see [2].

-michael

[1] 
https://elixir.bootlin.com/linux/v6.2-rc5/source/drivers/mtd/spi-nor/core.c#L1638
[2] https://lore.kernel.org/r/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
