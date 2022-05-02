Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Vqx1yBfZa0i7ma7fusTlSUjkSljqRGRWfsryw9IVpY=; b=jAiQY1yDVfFgCw
	H2OU0pbp8F9T3t3XwPP8TAO8cjRMz3QTAm/Rsc/n8IayPEOHanVh5zF/Mvjpq1p8j1x2q+GZcVo3D
	uKG3V/zlC/PJJ34xEL/v8EPwY7Vi+ss3RQrTp0dJJfjgdgWZSZz5aD3RK3koCwD6XT2TcviIcVsq9
	0WHrLKDIuJKRS0ctfCZ8B1UvSR0CQjakCRqJrkN/v+7hiy0myaw/2WJWUiQk9mCYzI12gZ7exBBGE
	9wtrFenBZ6pvKHAZmWpmFYuOGVO/ZcvTEVQ78JnhK34PVddlNBVxqGpqQdps7uxP2EoAz+utQhf7q
	o3UQbHjt1RZ2udWWrFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlUFT-000yUA-Kt; Mon, 02 May 2022 11:29:51 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlUFQ-000yTH-BZ
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 11:29:50 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 470E2221D4;
 Mon,  2 May 2022 13:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651490982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8yhrYbcbZ6HGnNY9n6KEKX4eSeghVm/di1XSPlgOWU=;
 b=SmJGLQCgJllCHPoxw/H1RRNsmDFU6CpPrNY2P68tFOJLsR3qRw3GzFqDS2ynZaCLfuR/9J
 06DobBX2c/ktYf+BJ91mt4Gl8zMomf51Crg8tvdasIurlUcg35qp6jCLYVFn2M8SJZatt1
 vkAUEDBmGmgaNiuTThc9qmXXmlgdFCc=
From: Michael Walle <michael@walle.cc>
To: biju.das.jz@bp.renesas.com
Cc: Chris.Paterson2@renesas.com, biju.das@bp.renesas.com,
 geert+renesas@glider.be, linux-mtd@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, p.yadav@ti.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richard@nod.at,
 tudor.ambarus@microchip.com, vigneshr@ti.com
Subject: Re: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Date: Mon,  2 May 2022 13:29:34 +0200
Message-Id: <20220502112934.2433516-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
References: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_042948_610157_164AA640 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

>  drivers/mtd/spi-nor/Makefile  |  1 +
>  drivers/mtd/spi-nor/core.c    |  1 +
>  drivers/mtd/spi-nor/core.h    |  1 +
>  drivers/mtd/spi-nor/renesas.c | 57 +++++++++++++++++++++++++++++++++++

Please put the flash in atmel.c. There are all the Atmel/Adesto/now Renesas
flashes.

> +static const struct flash_info renesas_nor_parts[] = {
> +	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +};

I suppose this flash supports SFDP. Therefore,
	{ "at25ql128a", PARSE_SFDP },
should be enough.

I see that the 0x1f42xx IDs are also used for the at25sl series.
Could you shed some light to what the differences are? Are they
compatible, do we have to distiguish between them?

Last, for a new flash submission we require a SFDP dump. See [1].

[1] https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

> +static void renesas_nor_default_init(struct spi_nor *nor)
> +{
> +	nor->flags |= SNOR_F_HAS_LOCK;

Did you test locking?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
