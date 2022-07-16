Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F1CC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Jul 2022 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEPkbeMXWciJd7ojvApjaWO07SQGSLF069tRckVxxfU=; b=H/nGQj4h4XvPjA
	DN8QEeSoK6C+0+uu9+6Yhb2Co/4OL+jT7a8eWMHjL24EIEa5dO4GM2E3QQqYlcc9CqcxkEWMsLoQb
	4XTXrNhTeILm/UK9RJttGmARRo+BuYz7ANzF1OcGjgLacwrlXW3Xl4K27cdsozGp9LcdS5jLuczaw
	8Ey18mWvuZSFLZbGHaBdXjyPZiSxmldIWvsgv8uzABrwQQ9ZscHtpfvD1HFQKqJFnsJlBX7DL9r4U
	nuiZewlMzhZURiaAL8O+c447SQsyIWA46i+rfqhWK7h33QtZJKKhll74zn7VRBvIxqDvEzEMBd9Dk
	NVXTcWh3qIQ8EXjaN2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcdN-00EaN0-Ai; Sat, 16 Jul 2022 07:54:41 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcdB-00EaFw-6B; Sat, 16 Jul 2022 07:54:31 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 8904620148;
	Sat, 16 Jul 2022 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1657958063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQG8TN5Wd8wwAccJuw773yOr2fBJcDXZsth1XBKzVio=;
	b=Dxa0a9ruC3xMKXwO7GlTu8oNl+62k6O5gMAmEZ3pQfg3JiAiT+7rc82lJClLiP+cdYd6Ic
	xrDEOq36tl6iWNYewIJuqF0GGCL+IxNZYP5lpdLJHq8jT/pYh1DMceWDsti56mn5ESSr1W
	/52LN6JNjMvpbnx6UOPSzYVP+BZMGOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1657958063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQG8TN5Wd8wwAccJuw773yOr2fBJcDXZsth1XBKzVio=;
	b=TD+leGBl/B0pIZUbnehE13/h70JwXUV8QaJ39c5x/F3nsez31+WhoR2/wy/EDi1egTLNXc
	VkWMY7yX9uC3BDCA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 4A09A2C141;
	Sat, 16 Jul 2022 07:54:22 +0000 (UTC)
Date: Sat, 16 Jul 2022 09:54:21 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Walle <michael@walle.cc>, linux-sunxi@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
Message-ID: <20220716075421.GJ17705@kitsune.suse.cz>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
 <33abf7b84860049c4a22605578303ff2@walle.cc>
 <20220714220744.GF17705@kitsune.suse.cz>
 <20220715132006.077c90f8@donnerap.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220715132006.077c90f8@donnerap.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_005429_423648_204F5F08 
X-CRM114-Status: GOOD (  62.55  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 15, 2022 at 01:20:06PM +0100, Andre Przywara wrote:
> On Fri, 15 Jul 2022 00:07:44 +0200
> Michal Such=E1nek <msuchanek@suse.de> wrote:
> =

> Hi,
> =

> > On Thu, Jul 14, 2022 at 11:51:56PM +0200, Michael Walle wrote:
> > > Am 2022-07-14 22:55, schrieb Michal Such=EF=BF=BDnek:  =

> > > > On Thu, Jul 14, 2022 at 09:41:48PM +0200, Michael Walle wrote:  =

> > > > > Hi,
> > > > > =

> > > > > Am 2022-07-14 21:19, schrieb Michal Suchanek:  =

> > > > > > It is normal that devices are designed with multiple types of s=
torage,
> > > > > > and only some types of storage are present.
> > > > > >
> > > > > > The kernel can handle this situation gracefully for many types =
of
> > > > > > storage devices such as mmc or ata but it reports and error whe=
n spi
> > > > > > flash is not present.
> > > > > >
> > > > > > Only print a notice that the storage device is missing when no =
response
> > > > > > to the identify command is received.
> > > > > >
> > > > > > Consider reply buffers with all bits set to the same value no r=
esponse.  =

> > > > > =

> > > > > I'm not sure you can compare SPI with ATA and MMC. I'm just speak=
ing
> > > > > of
> > > > > DT now, but there, for ATA and MMC you just describe the controll=
er
> > > > > and
> > > > > it will auto-detect the connected storage. Whereas with SPI you
> > > > > describe  =

> > > > =

> > > > Why does mmc assume storage and SDIO must be descibed? Why the spec=
ial
> > > > casing?  =

> > > =

> > > I can't follow you here. My SDIO wireless card just works in an SD
> > > slot and doesn't have to be described.
> =

> I think the difference is that MMC (so also SDIO) is a discoverable bus,
> whereas SPI is not.
> It's conceptually dangerous to blindly probe for SPI chips, and the kernel
> tries to stay out of guessing games, in general, and leaves that up to
> firmware.

There is no guessing game involved. The SPI NOR is fully described in
the device tree. The only missing bit of information is if it is mounted
on this particular board. That can be brobed safely and reliably.

> > > > > both the controller and the flash. So I'd argue that your hardware
> > > > > description is wrong if it describes a flash which is not present=
.  =

> > > > =

> > > > At any rate the situation is the same - the storage may be present
> > > > sometimes. I don't think assuming some kind of device by defualt is=
 a
> > > > sound practice.  =

> > > =

> > > Where is the assumption when the DT tells you there is a flash
> > > on a specific chip select but actually there it isn't. Shouldn't
> > > the DT then be fixed?  =

> > =

> > The DT says there isn't a flash on a specific chip select when there is.
> > Shouldn't that be fixed?
> > =

> > > Maybe I don't understand your problem. What are you trying to
> > > solve? I mean this just demotes an error to an info message.
> =

> The particular problem at hand is that on those cheap development boards
> SPI flash is somewhat optional. The PCB often has the footprint for it, b=
ut
> sometimes it is not populated, because the vendor wants to save pennies.
> =

> In this case (OrangePi Zero) there was no SPI chip soldered on the first
> batches, but later boards are shipped with a flash chip. The footprint is
> on every version, and I for instance soldered a chip on an early board.
> =

> > Many boards provide multiple storage options - you get a PCB designed to
> > carry different kinds of storage, some may be socketed, some can be
> > soldered on in some production batches and not others.
> > =

> > The kernel can handle this for many kinds of storage but not SPI flash.
> > =

> > I don't see any reason why SPI flash should be a second class storage.
> =

> See above, SPI is not discoverable, you need to know about the slave
> devices.

Which we do, from the device tree. Except the device is disabled in the
device tree so the kernel does not probe it.

> =

> > > > However, when the board is designed for a specific kind of device w=
hich
> > > > is not always present, and the kernel can detect the device, it is
> > > > perfectly fine to describe it.
> > > > =

> > > > The alternative is to not use the device at all, even when present,
> > > > which is kind of useless.  =

> > > =

> > > Or let the bootloader update your device tree and disable the device
> > > if it's not there?  =

> =

> Yes, this is what I was suggesting already: U-Boot can do the job, because
> a U-Boot build is device specific, and we can take certain risks that the
> generic and single-image kernel wants to avoid.

For some cases this may be warranted.

However, in this case no additional device-specific knowledge beyond
what is alrready specified in the device tree is needed.

A generic kernel can probe the device just fine.

> In this case we know that there is a SPI flash footprint, and it does no
> harm in trying to check on CS0. So I was thinking about introducing a
> U-Boot Kconfig variable to probe for and potentially disable the SPI flash
> DT node. We would set this variable in defconfigs of boards with optional
> SPI flash.
> =

> > But then it must be in the device tree?
> =

> However this indeed means that the SPI flash DT node must be in and enabl=
ed
> in the DT, because we (try hard to) only use original Linux DT files, and
> DTs must have been reviewed through the kernel ML first. The U-Boot driver
> relies on the DT as well, so the official kernel DT copy would need to co=
me
> with that node enabled. Ideally U-Boot would disable it, if needed, and
> the kernel error message would never appear.

Yes, that's a good point - even if it's decided that the kernel will not
handle this, the device tree still needs to contain the node enabled for
the bootloader to handle the device, anyway.

Thanks

Michal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
