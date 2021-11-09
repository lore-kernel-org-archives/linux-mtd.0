Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFA2C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 09:49:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7C1611F0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 09:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A7C1611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sx9032qasrVcStnoGg+t2xCqMPK+KHLz3VZtoElE5W0=; b=kOp+9CNJ2D9MyixZHaqtGB0N7j
	hKyguZNBgiAXqOg17IYAyVs65ktAxvyC5Sca0iuCvf0Jb/wBJcctZIO2jxvf6bqcgN+wSueggYQVs
	vdGpxqb7abs67CQ4ARuEqm0ihuCcI8rBTBSfzn2VK4J1Choubln3+vNoZum/WbFHoR0t0niQKu3Ow
	I1FTSAxSq5xF4e5jE5LB/pFu+qMgwwqHArXFF7b+QSgixtozvaT0Qc5rDhxL2nPkdHhYnYCizKRyY
	gwJK6KDzKVEGSL9fWwUw6gaSoeauIgyzp8YOKyF2a7XmsOzSTwllUek8U9/CVLN1jw7hjFd4v6nYO
	URGtuNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNkf-001JhJ-Uc; Tue, 09 Nov 2021 09:49:14 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNiz-001J6V-Vx; Tue, 09 Nov 2021 09:47:31 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3854822234;
 Tue,  9 Nov 2021 10:47:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636451248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDQwk+fXgskaUIZBmKkOfduFxYmvRSo/6UNzz7YRbdY=;
 b=dmCccncJKfy69vKWSeYuCqehbqakO6eBodPNEgJffdWSqIr8OK962pg6qoeMnUlKaHBE44
 CLbJrVwUoc0EfUnbUcNnVfejYYA7XMaV8dg+CQAA3xHo+eK9Am6NkNLS3veRCpAntc4qhL
 GinvesQUh9ivYnjlrT3xYSglhAwww7c=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 10:47:28 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 10/25] mtd: spi-nor: sst: Use manufacturer late_init()
 to set _write()
In-Reply-To: <20211029172633.886453-11-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-11-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6bd3505f4c87d6b1ceeaaf51e3dfcac8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014730_252569_89180524 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-10-29 19:26, schrieb Tudor Ambarus:
> Setting the correct nor->mtd._write in a fixup hook was misleading,
> since this is not a fixup, just a specific setting for SST, that 
> differs
> from the SPI NOR core default init.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

Just a comment below.

> ---
>  drivers/mtd/spi-nor/sst.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 660aabde477a..3593aae0920f 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -177,14 +177,14 @@ static int sst_write(struct mtd_info *mtd,
> loff_t to, size_t len,
>  	return ret;
>  }
> 
> -static void sst_post_sfdp_fixups(struct spi_nor *nor)
> +static void sst_late_init(struct spi_nor *nor)
>  {
>  	if (nor->info->flags & SST_WRITE)

SST_WRITE is only used during to set this. Shouldn't this be
a fixup per flash so we don't need that flag.

>  		nor->mtd._write = sst_write;
>  }
> 
>  static const struct spi_nor_fixups sst_fixups = {
> -	.post_sfdp = sst_post_sfdp_fixups,
> +	.late_init = sst_late_init,
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_sst = {

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
