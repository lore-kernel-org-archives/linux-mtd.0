Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF71C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 09:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D383361038
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 09:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D383361038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fYZYwqGfIfnV9yWarTxGyyiwc/HQiVJQB5ATfk+yds=; b=xxwA6jzenWJ//K5FRLEKFdXx/6
	AtXeGmTlvIxNo+NUPHo+yBNUpXLfAuPrE/Y9xPPzM90I2Z2Gn32Q6C6BHqShEHe3et9pYKGDmJdKB
	vYqUTPS4gx6Hc9Y2A5bVXJh0q/3ktujgpNiaROJxVpMH+DcyDRdumpay1sBw3Kob1LKoRS4uQaIEE
	GtwW0TO/WagHVW+nACjGZfT0etOurPcHoYUJGqywf4eW5pqi0HVyYOh4DoYimYbfICh3mBo2IIyRT
	7dgPcL4h1boY8XtQNBMi6M1Nir5MKkPM3z4cx4veQ9Ib04DUt5pyRxK5FxcwbSdmnken+0AK6KRUb
	OEr8jM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNro-001MYl-OG; Tue, 09 Nov 2021 09:56:37 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNkO-001Jat-H0; Tue, 09 Nov 2021 09:48:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id F1A5D22234;
 Tue,  9 Nov 2021 10:48:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636451332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVHl6aixncIu39tWWgWe4qKP9pKJ/WLbQ/mOyR2g+8k=;
 b=bbirbxpRfs/TjpjIACvWEWR3PJLwSOGq6iOyUYnErM1JNqny6EC7s8LoU5AiEtOuxRbxyl
 shdHzFk7FhK8ih4sXP0NbblKT6QAurAyXqzL8l/nIkO14K5AkGCu4rnbVUS813/kZBI3FR
 uk4bh4YTiEkwIlOW1lc/Sess4pIoW6s=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 10:48:51 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 11/25] mtd: spi-nor: spansion: Use manufacturer
 late_init()
In-Reply-To: <20211029172633.886453-12-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-12-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <284af57361d5fe73ac12fb4fd159d6a7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014856_833470_15139119 
X-CRM114-Status: UNSURE (   9.55  )
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
> spansion_post_sfdp_fixups() was called regardless if the flash defined
> SFDP tables or not. A better place for this kind of parameters init is
> in manufacturer's late_init() hook. post_sfdp() should be called only
> when SFDP is defined. No functional change in this patch.
> 
> Instead of doing the 4b opcodes settings at manufacturer level, thus
> also for every flash that will be introduced, this should be done
> just where it is needed, per flash. I'll let this for other patch.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
