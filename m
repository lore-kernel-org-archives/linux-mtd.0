Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC978C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3CC610A0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C3CC610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5g1LO45gKfQe4AVa0Z5COFUy4n7gi9CYMOwequ+wQFQ=; b=EykPWpuOhThWw1ksWWJVOjiH3Y
	8JeK8ayQG3Aw8Q00j9LyxK3O9dTc/ed5afiepWOa3dARYUVzPjM3DirLe/Ojkwk+kF1VkTDHdlIiS
	BwJGbz5G4su1pk1yf8EmkrdAeQeT+gH0/6VZMFk3vpIv03rGg2xBl9qp3C8JdMLcRSlto4UREHpZh
	XrPfKE3TOgyQHgFJPTnHuwsPPbScEuOLFyeQcDsYYHIDKGlqkRhtTrzpaH0NM3ui83lAtFxBakgQx
	L3VaqyhnVH68JQ6jvuK+IXMCN+yEZDGpxQRulwVgdCXStaP4YSN17LqM3dm2pIDvjEaLULb6tG1iR
	f08c+LJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkODF-001Tic-FY; Tue, 09 Nov 2021 10:18:45 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkOCt-001Ta5-Ay; Tue, 09 Nov 2021 10:18:24 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6FC5322234;
 Tue,  9 Nov 2021 11:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636453101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cMZ6+bxV6vJBWdAlAAA1UIEA7bTUwsxU719Z53mR+s=;
 b=QkIg1wgpHKyuwzBpFWIxyk/xafNVyfX42D2BCqA+maYJr9r06sBpezQXqiEd7cwPgvp9Eq
 GPdNJXccX1LXHALqa3yGt7U3P1scdJTbzKo6c6YVKNdVvPK3KMp9gFhrBcZ8YqdJYJVOUe
 bVhio9nL5YqDYb8tOwT2sdR+73fPVpg=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 11:18:20 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 12/25] mtd: spi-nor: core: Call
 spi_nor_post_sfdp_fixups() only when SFDP is defined
In-Reply-To: <20211029172633.886453-13-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-13-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <98fa357a140e7b6236838820fe5619d8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_021823_578518_8A2D1C9F 
X-CRM114-Status: GOOD (  24.69  )
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
> spi_nor_post_sfdp_fixups() was called even when there were no SFDP
> tables defined. late_init() should be instead used for flashes that
> do not define SFDP tables.
> 
> Use spi_nor_post_sfdp_fixups() just to fix SFDP data. post_sfdp()
> hook is as of now used just by s28hs512t, mt35xu512aba, and both
> support SFDP, there's no functional change with this patch.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 56 ++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4679298c5301..82cc56c9d09e 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2508,6 +2508,25 @@ static void
> spi_nor_manufacturer_init_params(struct spi_nor *nor)
>  		nor->info->fixups->default_init(nor);
>  }
> 
> +/**
> + * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and 
> settings
> + * after SFDP has been parsed. Called only for flashes that define 
> JESD216 SFDP
> + * tables.
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * Used to tweak various flash parameters when information provided by 
> the SFDP
> + * tables are wrong.
> + */
> +static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	if (nor->manufacturer && nor->manufacturer->fixups &&
> +	    nor->manufacturer->fixups->post_sfdp)
> +		nor->manufacturer->fixups->post_sfdp(nor);
> +
> +	if (nor->info->fixups && nor->info->fixups->post_sfdp)
> +		nor->info->fixups->post_sfdp(nor);
> +}
> +
>  /**
>   * spi_nor_sfdp_init_params() - Initialize the flash's parameters and 
> settings
>   * based on JESD216 SFDP standard.
> @@ -2522,7 +2541,9 @@ static void spi_nor_sfdp_init_params(struct 
> spi_nor *nor)
> 
>  	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
> 
> -	if (spi_nor_parse_sfdp(nor)) {
> +	if (!spi_nor_parse_sfdp(nor)) {
> +		spi_nor_post_sfdp_fixups(nor);

I find this function particulary confusing. Why is it
copying the params around? I know the function doc
says rollback, but can't we make this better?

Either make spi_nor_parse_sfdp() commit the nor->params update
atomically, or pass a second parameter sfdp_params, which are
copied to nor->params here if spi_nor_parse_sfdp() was successful.

Also the control flow could be better.

ret = spi_nor_parse_sfdp(nor, &sfdp_params);
if (!ret) {
     /* clever comment, why is addr_width = 0 here */
     nor->addr_width = 0;
     nor->flags &= ~SNOR_F_4B_OPCODES;
     return 0;
}

memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
spi_nor_post_sfdp_fixups(nor);

Having an even closer look, addr_width is set to 0 because
spi_nor_parse_sfdp() is also changing that. nor->flags
is also changed and not only the SNOR_F_4B_OPCODES bit. But
only that one is cleared?!

I think this deserves another cleanup series. Having the
rollback here makes no sense. You'd have to keep both in
sync.

IMHO best would be a second parameter and make sure all
code in sfdp.c don't change anything else. Which would
probably mean that addr_width and flags will move to
nor->params.

Anyway, for now:
Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
