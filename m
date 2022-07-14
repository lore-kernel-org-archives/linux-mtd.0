Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3F6C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 22:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=disU3LW7prFrhcvP7Li1G0UwHt3nRc5dQ+fzjepT/+Y=; b=bnlY2yT2jKtqzF
	kTpVvHb4JMiDDO4hwun5CDYCVV0RDe1kQNVQxKT8IhIqcMaqwMdeLCrHfe7VHUdiEmnsUCDgK3ckW
	DMlDK/LrEeitE+VBeKKKVAZ+T2YAeilWoRIXI/ANAI0T3g5eJPJFdJKhJplQa1PCXFGPrls8cFLoC
	ZRaG/FlS+pUsvT1lRZyZuLwcSEVDy2fTnZJNsUED9F/KT7yG7bc2wzel9V7kpJWMaMo+Lb3fh79Um
	wece1KCTWi2hPSoR2GU/nMdPIxaGwjr7HCziErlbM+jJRWkXvSHP22swsfTK87DJU4lRVrt8j2Tls
	Z4hnKAl7iHN9u2oNINUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC70H-001uKZ-VW; Thu, 14 Jul 2022 22:08:14 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC706-001u8Y-Ht; Thu, 14 Jul 2022 22:08:04 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id ABCAD1F944;
	Thu, 14 Jul 2022 22:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1657836466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxL2Skx8UbFEzQGYad/BuKmDMwwk8ncManhq+noClII=;
	b=nxO/VsiByIQUvVw8J3ec8bA9Eu0GqyfKAIeitip/+JUq3wxLXLPc3ZEP0m4Y0l2sN+FfFY
	2mbmtaRnK98LtjaY5ZMVb38Luz5E/d25hhVK0JUJJd1DJQXRo5L8nkqORD4WoZ18GrHsq+
	ZSM//84UURlzTy+CWZ12ZyXCHYIeZEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1657836466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxL2Skx8UbFEzQGYad/BuKmDMwwk8ncManhq+noClII=;
	b=1oHnFx62By/T3EA1ZD0f6lyFebUWlXX0tED1o5Z6GDaSWFHJ9N8iImlQQ6/zhyj++TDBQz
	+2qz/Orr3TcT/+Cg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id D3E4C2C141;
	Thu, 14 Jul 2022 22:07:45 +0000 (UTC)
Date: Fri, 15 Jul 2022 00:07:44 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Walle <michael@walle.cc>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <20220714220744.GF17705@kitsune.suse.cz>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
 <33abf7b84860049c4a22605578303ff2@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33abf7b84860049c4a22605578303ff2@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_150802_762297_10344148 
X-CRM114-Status: GOOD (  43.53  )
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

On Thu, Jul 14, 2022 at 11:51:56PM +0200, Michael Walle wrote:
> Am 2022-07-14 22:55, schrieb Michal Such=E1nek:
> > On Thu, Jul 14, 2022 at 09:41:48PM +0200, Michael Walle wrote:
> > > Hi,
> > > =

> > > Am 2022-07-14 21:19, schrieb Michal Suchanek:
> > > > It is normal that devices are designed with multiple types of stora=
ge,
> > > > and only some types of storage are present.
> > > >
> > > > The kernel can handle this situation gracefully for many types of
> > > > storage devices such as mmc or ata but it reports and error when spi
> > > > flash is not present.
> > > >
> > > > Only print a notice that the storage device is missing when no resp=
onse
> > > > to the identify command is received.
> > > >
> > > > Consider reply buffers with all bits set to the same value no respo=
nse.
> > > =

> > > I'm not sure you can compare SPI with ATA and MMC. I'm just speaking
> > > of
> > > DT now, but there, for ATA and MMC you just describe the controller
> > > and
> > > it will auto-detect the connected storage. Whereas with SPI you
> > > describe
> > =

> > Why does mmc assume storage and SDIO must be descibed? Why the special
> > casing?
> =

> I can't follow you here. My SDIO wireless card just works in an SD
> slot and doesn't have to be described.
> =

> > > both the controller and the flash. So I'd argue that your hardware
> > > description is wrong if it describes a flash which is not present.
> > =

> > At any rate the situation is the same - the storage may be present
> > sometimes. I don't think assuming some kind of device by defualt is a
> > sound practice.
> =

> Where is the assumption when the DT tells you there is a flash
> on a specific chip select but actually there it isn't. Shouldn't
> the DT then be fixed?

The DT says there isn't a flash on a specific chip select when there is.
Shouldn't that be fixed?

> Maybe I don't understand your problem. What are you trying to
> solve? I mean this just demotes an error to an info message.

Many boards provide multiple storage options - you get a PCB designed to
carry different kinds of storage, some may be socketed, some can be
soldered on in some production batches and not others.

The kernel can handle this for many kinds of storage but not SPI flash.

I don't see any reason why SPI flash should be a second class storage.

> > However, when the board is designed for a specific kind of device which
> > is not always present, and the kernel can detect the device, it is
> > perfectly fine to describe it.
> > =

> > The alternative is to not use the device at all, even when present,
> > which is kind of useless.
> =

> Or let the bootloader update your device tree and disable the device
> if it's not there?

But then it must be in the device tree?

And then people will complain that if the bootloader does not have this
feature then the kernel prints an error message?

> Or load an overlay if it is there?

Or maybe the kernel could just detect if the storage is present?

It's not like we don't have an identify command.

Thanks

Michal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
