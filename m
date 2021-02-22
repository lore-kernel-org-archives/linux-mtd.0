Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C113AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 21:27:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6667C64E02
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 21:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6667C64E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6uL5u+3mlWMQgVArZRtkmJzI2cJSnJMnKa767YMwwBs=; b=iQNpV7LkeyohLKFKBblxhfJ+J
	rkeuVbr7LcBuQ4WQDUULIKdZWJCeWGeMK33nPNlInz7K8UXmgRX2FkRZDkpseEf5bIYIhFECuh0aU
	VuiR/D7e2Ye+vqqywx4rhf+5yX39AaiErRf6HxZn12cG98bvM7OpKyj39oHVuS4IlDubBCKfrCiED
	R5+wpoxYHiiXzp5mV8iat0TjAqiZsfKubFOyCdArG3bR6S9/Q9bGm/jlf5o7XnGs/R5NcxCY5gh4C
	QXNA+97ARo1gKTZPsz3i4VWOdSkxJwriwYmf0rKKJRY++tra9e8afLULFrwcvSlrMaWwP86c7dAa2
	PCRRQbZgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEIj0-0002WF-2w; Mon, 22 Feb 2021 21:26:38 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEIiv-0002UQ-1b; Mon, 22 Feb 2021 21:26:34 +0000
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2892AC0002;
 Mon, 22 Feb 2021 21:26:26 +0000 (UTC)
Date: Mon, 22 Feb 2021 22:26:26 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <YDQhgkftoW4J9AtY@piout.net>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDQgLTPE0E+/1Cwv@piout.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_162633_204307_7B9DA420 
X-CRM114-Status: GOOD (  23.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > the clock is disabled and all i.MX6 functionality depending on
> > the 32 KHz clock has undefined behaviour. On systems using hardware
> > watchdog it seems to likely trigger a lot earlier than configured.
> > 
> > The proper solution would be to describe this dependency in DT,
> > but that will result in a deadlock. The kernel will see, that
> > i.MX6 system clock needs the RTC clock and do probe deferral.
> > But the i.MX6 I2C module never becomes usable without the i.MX6
> > CKIL clock and thus the RTC's clock will not be probed. So from
> > the kernel's perspective this is a chicken-and-egg problem.
> > 
> 
> Reading the previous paragraph, I was going to suggest describing the
> dependency and wondering whether this would cause a circular dependency.
> I guess this will keep being an issue for clocks on an I2C or SPI bus...
> 
> > Technically everything is fine by not touching anything, since
> > the RTC clock correctly enables the clock on reset (i.e. on
> > battery backup power loss) and also the bootloader enables it
> > in case a kernel without this support has been booted.
> > 
> > The 'protected-clocks' property is already in use for some clocks
> > that may not be touched because of firmware limitations and is
> > described in Documentation/devicetree/bindings/clock/clock-bindings.txt.
> > 
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Or maybe you expected me to apply the patch, how are the following
patches dependent on this one?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
