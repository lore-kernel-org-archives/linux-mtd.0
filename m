Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396E1C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exw0yGsyXQUzKVY3hXripSC42UwJKivup5NNnSKCw2k=; b=13NT/hN198AFJ2K7IFg6o3PV2H
	yxonU4JZiF2OBBtu562lNsukWyelLh9lnDv2UW1sTwD1wcTvouckAUiwhd77qKZu6F+1UbeJsYwag
	P1d/MHEhVyuzSekn5wXNdu9Q/V60V/d98Wtkx1c/vkmJpD9jDvol8QF0337LT4tNypyrxVVwZXPdV
	Lj7LB26/MWK/5LZ/bdFx3GN8gfIUz1uajY1IJUDnDmBHzDy6KojnSH3jGNAASwOnmU/Sn+W/WFYA9
	c9xPvdag5vzGtj7S73cBb4TBwe0IDLqFOUPNZKJjLLsCoNa4Qr++ngWwYprdPfg/ND19C456SIwq5
	auzsf5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDL8b-00BT9p-E3; Mon, 18 Jul 2022 07:25:53 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDL8Y-00BT7N-BG
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 07:25:51 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 022592222E;
	Mon, 18 Jul 2022 09:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658129146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=113CvxFlsdPK4nY41NWM/Ojlt38/75HJl40UvHiLM+s=;
	b=Bab/YYVzYZwDy0vUix9/dGR0zso4fACBtbBIzS0r6CHlUEAZWneNNWQk1/ljr+DSJ+aUA/
	HA5+Cyh+Bv1uqMjfXTyG6qqOLMfYyaDw7Jqd4xN2WQZ433RtFtcTaKZE82A5EG5ddk76e4
	goGFEa4UaM/XGxHe2kHib3nav6yGoyY=
MIME-Version: 1.0
Date: Mon, 18 Jul 2022 09:25:45 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, quic_c_sbhanu@quicinc.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: winbond: use SNOR_ID3() for w25q512nwm
In-Reply-To: <735a88af-c4f1-a6b3-3f85-ea532b3f39c7@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-3-michael@walle.cc>
 <735a88af-c4f1-a6b3-3f85-ea532b3f39c7@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <305d3c9cf8a2362ad23a87f6ea92c6b4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_002550_569218_FE32623F 
X-CRM114-Status: UNSURE (   4.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-07-12 10:40, schrieb Tudor.Ambarus@microchip.com:
> Shaik, can we have your Tested-by tag on this?

Sigh. His email address bounces with "The email address you
entered couldn't be found." So don't expect a Tested-by: here.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
