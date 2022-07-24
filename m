Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3F8C43334
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Pfk+FnB2WlV0m61STCzv5NTbAaNC4aUddh/oA9q/e8=; b=JwLSynEK7DxIbk
	anhaNbsGbm1vXO5TH7DaFGlpgmlCy/1yf8MoDbs0M/cF7ViMFmDYiGdNG6v9Bm4WuyBlzzp/DEc40
	ZSIOjop6iV/yzJmKnKcHNGGcQsMY+o6WgJmWYP19A/JP8tJR7HKR1Ass3UDgrgfVK6hTfQhb9eWs+
	QDORbtVf0AvrNArxnLe46qJUQpMIWN/sS4xpXK+U+Vx/O2gDGoBKYa5DHAcANUFOfpmTaCf/X/Jub
	yKwYk/ccUc6ix06RLFwuHLsb83BpsfPtFXXF7IzMEa4X7/8ZSks5qCxuctciT63HEF6cu74VNemCB
	VL9JyiDFiw/jN+5HUZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFgLh-008Vrm-DT; Sun, 24 Jul 2022 18:29:05 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFgLW-008ViT-74; Sun, 24 Jul 2022 18:28:55 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 67E4E374FA;
	Sun, 24 Jul 2022 18:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658687329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXU3mfPGPs/j/ew1KRBJ1KboWBt6ZAfsknPUbfGyXTo=;
	b=p9uITAdf/l42HNco51Oc9uxKbXrOd4wkuzyNgELwOMJeAex6ZNoeaLLdDrS7EXM0K9z+wN
	8Q1o/CE3xdfknINAthlWWm7TeyTLp4y+yGPSs7eNpSEJYD3QqmKGWQ0bi8dTeH3kGb4ISs
	YkTNGfrwr8A5geQ68/fdTwM4kqjhMpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658687329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXU3mfPGPs/j/ew1KRBJ1KboWBt6ZAfsknPUbfGyXTo=;
	b=CXBmskjvWsPSdQvzBdcdh17pBv4/cFdsRrRP6P+RXqT8oQ/LXCHZJtZu1Dh3sKModVXLa/
	EFHMTminnj865FCQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id A72A02C177;
	Sun, 24 Jul 2022 18:28:48 +0000 (UTC)
Date: Sun, 24 Jul 2022 20:28:47 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Michael Walle <michael@walle.cc>,
	linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
Message-ID: <20220724182847.GJ17705@kitsune.suse.cz>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
 <33abf7b84860049c4a22605578303ff2@walle.cc>
 <20220714220744.GF17705@kitsune.suse.cz>
 <20220715132006.077c90f8@donnerap.cambridge.arm.com>
 <2d4f200c-1ce3-19c6-179f-8d8e0545adfe@sholland.org>
 <20220716115849.75a27753@slackpad.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716115849.75a27753@slackpad.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_112854_433916_4216954E 
X-CRM114-Status: GOOD (  45.62  )
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

On Sat, Jul 16, 2022 at 11:58:49AM +0100, Andre Przywara wrote:
> On Fri, 15 Jul 2022 21:28:57 -0500
> Samuel Holland <samuel@sholland.org> wrote:
> 
> Hi,
> 
> > On 7/15/22 7:20 AM, Andre Przywara wrote:
> > >>>> However, when the board is designed for a specific kind of device which
> > >>>> is not always present, and the kernel can detect the device, it is
> > >>>> perfectly fine to describe it.
> > >>>>
> > >>>> The alternative is to not use the device at all, even when present,
> > >>>> which is kind of useless.    
> > >>>
> > >>> Or let the bootloader update your device tree and disable the device
> > >>> if it's not there?    
> > > 
> > > Yes, this is what I was suggesting already: U-Boot can do the job, because
> > > a U-Boot build is device specific, and we can take certain risks that the
> > > generic and single-image kernel wants to avoid.
> > > In this case we know that there is a SPI flash footprint, and it does no
> > > harm in trying to check on CS0. So I was thinking about introducing a
> > > U-Boot Kconfig variable to probe for and potentially disable the SPI flash
> > > DT node. We would set this variable in defconfigs of boards with optional
> > > SPI flash.  
> > 
> > To support the "does no harm" assertion: the Allwinner Boot ROM will probe for
> > NOR flash (and possibly SPI NAND) on SPI0 + CS0 if no bootable MMC device is
> > found. So the board designer must already assume that JEDEC Read ID commands
> > will be sent over that bus.
> > 
> > >> But then it must be in the device tree?  
> > > 
> > > However this indeed means that the SPI flash DT node must be in and enabled
> > > in the DT, because we (try hard to) only use original Linux DT files, and
> > > DTs must have been reviewed through the kernel ML first. The U-Boot driver
> > > relies on the DT as well, so the official kernel DT copy would need to come
> > > with that node enabled. Ideally U-Boot would disable it, if needed, and
> > > the kernel error message would never appear.  
> > 
> > I don't think this works for newer SoCs where the Boot ROM supports both NOR and
> > SPI NAND. If the board is sold with the flash chip unpopulated, the user could
> > install either kind of chip. So we cannot statically assume which binding will
> > be used. We would need to add a node with the right compatible string after
> > probing for both in the bootloader.
> 
> If a *user* decides to *change* the board, it's up to the user
> to make sure the DT matches. Overlays are the typical answer, or people
> change the DT before they build U-Boot. If someone decides to hack
> their board, they have to take care of the respective DT description
> hack as well.
> 
> This case here is about the *vendor* shipping different versions of the
> board, which I think is a different case. Technically we now would need
> two DTs: one with, one without the SPI flash node, and let the user
> decide which one to include in U-Boot at build time, depending on which
> version they have.

Technically we don't. The DT is supposed to describe hardware properties
that cannot be probed. Probing presence of the SPI NOR is perfectly
possible so it suffices to record that the SPI CS is reserved for a SPI
NOR, and as much as we don't describe the size we don't need to describe
or assume the presence either.

> What I was suggesting is a U-Boot config switch, which would only be
> enabled on those boards where we have this situation (OPi Zero):
> That avoids dangerous situations (because we know it's safe *on this
> particular board*), and avoids the hassle of shipping two firmware
> versions.

Also if we really want to make u-boot probe the device (such as in cases
when there is choice of mutiple devices) DT also supports "reserved"
state which may be useful for makring the devices to probe when the DT
is loaded together with u-boot before passing it to Linux.

Thanks

Michal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
