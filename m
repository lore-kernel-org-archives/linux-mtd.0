Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADECFC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roW0Ac+mvRUQb/8/CCFNzjHjuhBq4lMIPnsy2nFchsk=; b=Aes6759iZ8wKVuULb94ydGVu4K
	nndcZkixKf14biYSWiI9HaA8vLIJ2iqtDAo4BI21DMnsAwECZ7HloQV0qbOPeuItgy6evhIzYzc8M
	MFwQrYtp8PZvUzM5PUPfc5iitCNOSFk9VQhmw4qDd63xudwtheLRDLM3goSgrgdEB6Z645xJ/u7BJ
	HI5ioaRElQXtS53daV7eLEP/ZXEFdXN7R7AXvVaf6tLPIjYPZqAB/fDWuFrXrH+BhwqfojTdvpaM1
	x5BABNaKxl08/KrAStRd29JdT5H6dz/1YKrhyyiTcMJ/JHY90MQ2CI4WxpCH0K/UaqqPxAiUgVry1
	8s2QmXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPB5v-000nGj-AL; Tue, 01 Mar 2022 22:35:47 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPB5o-000nGM-AO
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 22:35:45 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6391922239;
 Tue,  1 Mar 2022 23:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646174138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adTrpLZVJKnmmjxY3JrXYa+2AmXR5qdUoDqMVNFtUuU=;
 b=Jd/xtd1UuNOXUmRqReeRrjXcjtBpUf0cjIXRcZ9xxbzk7rgcwYDjkIJm+52OqB+ndQnG2U
 FGvFxe+9AKaD9ozFksPkuxt+/0aiw8r37Bzq6fDsGONkDOewzp5pKo5nlKE73IbcGnjAU8
 BkAJfAFzyRgW8q0NKB3P672++Zl2Fm0=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 23:35:38 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is
 set
In-Reply-To: <20220228163334.277730-1-tudor.ambarus@microchip.com>
References: <20220228163334.277730-1-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <b8eb5a09b0a716093299ad4e6a3f727e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_143540_566849_DF9051CE 
X-CRM114-Status: GOOD (  18.73  )
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

Am 2022-02-28 17:33, schrieb Tudor Ambarus:
> Even if SPI_NOR_NO_ERASE was set, one could still send erase opcodes
> to the flash. It is not recommended to send unsupported opcodes to
> flashes. Fix the logic and do not set mtd->_erase when SPI_NOR_NO_ERASE
> is specified. With this users will not be able to issue erase opcodes 
> to
> flashes and instead they will recive an -ENOTSUPP error.

But why is there an erase opcode and erase size set in the
first place? spi_nor_select_erase() should probably return
early if SPI_NOR_NO_ERASE is set. Not setting the erasesize
would also return -ENOTSUPP. I prefer this one for a fixes
patch, though. But spi_nor_select_erase() should also be
fixed.

Reviewed-by: Michael Walle <michael@walle.cc>

> 
> Cc: stable@vger.kernel.org
> Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 86a536c97c18..cd2d094ef837 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2969,10 +2969,11 @@ static void spi_nor_set_mtd_info(struct spi_nor 
> *nor)
>  	mtd->flags = MTD_CAP_NORFLASH;
>  	if (nor->info->flags & SPI_NOR_NO_ERASE)
>  		mtd->flags |= MTD_NO_ERASE;
> +	else
> +		mtd->_erase = spi_nor_erase;
>  	mtd->writesize = nor->params->writesize;
>  	mtd->writebufsize = nor->params->page_size;
>  	mtd->size = nor->params->size;
> -	mtd->_erase = spi_nor_erase;
>  	mtd->_read = spi_nor_read;
>  	/* Might be already set by some SST flashes. */
>  	if (!mtd->_write)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
