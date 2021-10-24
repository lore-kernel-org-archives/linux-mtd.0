Return-Path: <SRS0=paK1=PM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E44C433FE
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Oct 2021 17:44:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7322A60F57
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Oct 2021 17:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7322A60F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOFjtqzbGNAjCuHKMM6o3liZEbsPIXujYklNtmhrDYM=; b=F7lsYDHqejZb8NdwDVp5CDNb8f
	/iy/uwtA0x0lwWyB8tzwwVbiHP+5susGQLAVioD3GHfbKYrhOh9e9RFvIRsYLszYj4MNVq0XGHTcS
	GzqzVHAN4JVlXJNy49haF5UVTz9D3rbvG11auOWFFS6zWVombVvy00yA7U89l5CAjj2bRVbeP4Hds
	7ELXauE8znFiOC/RQ8rSGqhs9B+fUTshxUsJAfPpsE5OLIsZ5u7aETFpzlzbO0WNluQeW471Jaml7
	Gp917aCwm9QGfQ1eEMgjxzOVo83TRSQDDkx1RGZqtL0SYPYdFoLen8DtTGHCyP+/IX7ipRVGZhpDM
	GfCkBbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mehXc-00EPPM-I3; Sun, 24 Oct 2021 17:44:16 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mehXQ-00EPNK-5G; Sun, 24 Oct 2021 17:44:05 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 153C722246;
 Sun, 24 Oct 2021 19:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1635097442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KRs7zK66Km1WsoHe6USUbkiXu0foyrXtOG4UeLJQkk=;
 b=FRyrXITkOvDQ7AXZ3V+1114xRv1Xau78mGh8VXAbufUAyNsaXlcZKtX5wOnHP1qL2i70LX
 BUYuWuXnDKD8qabKv6GiDnpVbSpcFk9tGA+VqOPlOwskOFQMQ7XYsFSxAwHwZyFZSBZ3lQ
 Oy+Sv9NbHmRR2w45VCHHYwZwL0FRz6w=
MIME-Version: 1.0
Date: Sun, 24 Oct 2021 19:44:00 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 05/35] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
In-Reply-To: <20210727045222.905056-6-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-6-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9070118a2a8557a853f4c5e6a3dd4d58@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_104404_387505_8B40C80D 
X-CRM114-Status: GOOD (  14.84  )
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
> Some manufacturers completely ignore the manufacturer's identification 
> code
> standard (JEP106) and do not define the manufacturer ID continuation
> scheme. This will result in manufacturer ID collisions.
> 
> An an example, JEP106BA requires Boya that it's manufacturer ID to be
> preceded by 8 continuation codes. Boya's identification code must be:
> 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x68. But Boya ignores 
> the
> continuation scheme and its ID collides with the manufacturer defined 
> in
> bank one: Convex Computer.
> 
> Introduce the manuf-id-collisions driver in order to address ID 
> collisions
> between manufacturers. flash_info entries will be added in a first 
> come,
> first served manner. Differentiation between flashes will be done at
> runtime if possible. Where runtime differentiation is not possible, new
> compatibles will be introduced, but this will be done as a last resort.
> Every new flash addition that define the SFDP tables, should dump its 
> SFDP
> tables in the patch's comment section below the --- line, so that we 
> can
> reference it in case of collisions.

Btw. how will this work in practice? Let's say we have a flash of a
"bad" manufacturer B which is using the manufacturer id of another
"good" manufacturer G. Now flashes of B are added to the kernel.

Some kernel versions later G releases a flash of which uses the exact
same id. How can we now add support for this flash now? If we can
differentiate at runtime, fine. But what if not? Will then
the legitimate owner of the ID will need a new compatible string?

That's the only way I see how this can work.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
