Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A39C432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:19:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9333A61371
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9333A61371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NllDIwOCEbnXEEYal7nH2PxEopGsBzZlVYT2FP6bBzs=; b=VlaTzEbmyUlga6MYS69b8Jqnmv
	TSqnOUjl33ipwX5AENROvAhrcFsYhNowGD32lgy/6mWzoPNE8vk3MXMIP1gMiL2xCBNwaZmtqOU9k
	AVA16WGC+30xItiGkyu5jNa18X32SXtttcW192+P/hqxW4GtknWqkifdsVgne109MInk1Cv0urk9q
	m3xXMNppCze6TSYWkn8Gzr84xcbJU2FNTjLwgffanAmAjd09mulX/sT4MU6mZB3GvBzgU82dM06D1
	r/JHrx2jq6mLmDHB/tYG5pTia5/Ja4Tv59YrEPSwhHzUIjrOYbpfhxrsWWklIcqVn/8dF/8xkiQWp
	+u1Oe6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIIGl-000pIR-JM; Mon, 23 Aug 2021 22:18:15 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIIGW-000pGG-3b; Mon, 23 Aug 2021 22:18:04 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4489722205;
 Tue, 24 Aug 2021 00:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629757075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9UuraMGZPMBnRg6/tDykRL2jnRMhkz1pL6v31Jz/cg=;
 b=GaInlvz2V+Ll5jp8vwosdK8PrNA5hGSxONGygj5P1RbO78YgVXvxXyumAN01mnXGrqEUtT
 WufN7h7KePmwYuQwx+FX5cJNvvVhLfVo1/ZsCQUcf56YK4yMKy63NscUT9jebcBUr27J/r
 IXS+u2xPAebk/bkHqI7dGicpB2rO7yc=
MIME-Version: 1.0
Date: Tue, 24 Aug 2021 00:17:50 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 01/35] mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
In-Reply-To: <20210727045222.905056-2-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-2-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dea2bcb1c6ad0e1018d29f16d0997c92@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_151800_359458_C636E4C0 
X-CRM114-Status: GOOD (  15.41  )
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

Am 2021-07-27 06:51, schrieb Tudor Ambarus:
> SPI NOR flashes that statically declare one of the
> SPI_NOR_{DUAL, QUAD, OCTAL, OCTAL_DTR}_READ flags and do not support
> the RDSFDP command are gratuiously receiving the RDSFDP command
> in the attempt of parsing the SFDP tables. It is not desirable to issue
> commands that are not supported, so introduce a flag to help on this
> situation.
> 
> New flash additions that support the SFDP standard should be declared
> using SPI_NOR_PARSE_SFDP. Support that can be discovered when parsing
> SFDP should not be duplicated by explicit flags at flash declaration.
> All the flash parameters will be discovered when parsing SFDP.
> Sometimes manufacturers wrongly define some fields in the SFDP tables.
> If that's the case, SFDP data can be amended with the fixups() hooks.
> It is not common, but if the SFDP tables are entirely wrong, and it
> does not worth the hassle to tweak the SFDP parameters by using the
> fixups hooks, or if the flash does not define the SFDP tables at all,
> then statically init the flash with the SPI_NOR_SKIP_SFDP flag and
> specify the rest of flash capabilities with the flash info flags.
> 
> With time, we want to convert all flashes to SPI_NOR_PARSE_SFDP and
> stop triggering the SFDP parsing with the
> SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. Getting rid of the
> SPI_NOR_{OCTAL, OCTAL_DTR}_READ trigger is easily achievable, the rest
> are a long term goal.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
