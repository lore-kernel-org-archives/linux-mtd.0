Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B2DCA0EF8
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Aug 2025 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Subject:Message-Id:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KivDieIWCGMGM8yeeJ6WkkapgtNBzETjuixFlNJfb4=; b=vcQ3cku6IamVZHOMQNOzh8dFXL
	ydG7wJ6qJxWs+6KfbK4MVkYe7ZhtqBEWn3R4ml+8/Ix//xgZUeyHfQ1oq3blSMK60e83h+aNObFyX
	VDQ/srbpAlVVxM87SFgXrDjx3qU4BU1TMDLw/Jbj+XPjp5cbWuWPDHxj3kGfIqF8aXfIm0foyKdNm
	U5NeYa/dpW12lsp5UG9wlCbtnQj8ZVsfV0gGS71jpkKjRfK/90g00czCE6u4vK93iNsblslmk/FI6
	dr4cyXrp3RtDC8qJDlKvBjYULZRtCLCXwuFZlXnhX5LUM/TGGwPnJeINj5YU3pQBg2lq9NkBYtRgF
	+KTWQSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1li-0000000GQAf-27WI;
	Thu, 21 Aug 2025 09:39:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoz2k-0000000FzOw-3H3a
	for linux-mtd@lists.infradead.org;
	Thu, 21 Aug 2025 06:45:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCC7A601E9;
	Thu, 21 Aug 2025 06:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AF1C4CEED;
	Thu, 21 Aug 2025 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755758701;
	bh=limPWQWRS82UE9S5O0lLb4msGufN3y2kIqx6S5HAEJI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=lOs7W9fMzeq5uO555itwKY1W9TAJ6BjkCZwElhJmcO13hAHQPGaouIkIrnyKHFqrJ
	 l8C3PJfb9HS0ENGch9FIozeWQMITmjq2R4tBBr3hOsYwsK2Z0H+eHeSInsjiB0EYED
	 N5V+9Nv1evyBMKoqW/InMxHTSDRRja3qbSSTNP8gYfqP8Qauc2aEiE4pKvaOqWsIyk
	 hniJdJkyRqrsAVYmFqheqUNpWr0y51PGRJizdq56UUMT+dONGAw+yj3CakduZ9iMvn
	 8l8xSDIAT4/hd21bB7i+J4meKPdmidxv16LRXPrRZjRqvWGOrrSoZIm0TV22FahCy5
	 lIRGmyXjtrF6w==
Date: Thu, 21 Aug 2025 08:44:57 +0200
Message-Id: <DC7WIIFZQ448.3RW1U45I41129@kernel.org>
Subject: Re: [PATCH v3 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
From: "Michael Walle" <mwalle@kernel.org>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@altera.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>, "Gerlach, Matthew"
 <matthew.gerlach@altera.com>
X-Mailer: aerc 0.16.0
References: <cover.1753839339.git.khairul.anuar.romli@altera.com>
 <566fc1168db723672ab0bc6482ec7b72b4b8fe2b.1753839339.git.khairul.anuar.romli@altera.com> <DBP7P3RWX17B.14Q27IBS3T3FL@kernel.org> <MN2PR03MB49271E2D022D305BC149BA4FC624A@MN2PR03MB4927.namprd03.prod.outlook.com> <DBP84FIUUQO7.369TFNTJFELMW@kernel.org> <MN2PR03MB4927D29E06586CCE7D0547FEC632A@MN2PR03MB4927.namprd03.prod.outlook.com>
In-Reply-To: <
 <MN2PR03MB4927D29E06586CCE7D0547FEC632A@MN2PR03MB4927.namprd03.prod.outlook.com>
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6625039058691679501=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6625039058691679501==
Content-Type: multipart/signed;
 boundary=030571e0ecaeb27a9a0dae0023b5712f16fb971faa06dab3bc8b8719f87f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--030571e0ecaeb27a9a0dae0023b5712f16fb971faa06dab3bc8b8719f87f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Aug 21, 2025 at 2:32 AM CEST, Khairul Anuar Romli wrote:
> Sorry for taking very long time to reply. Could you advise me what
> kind of analysis do you want me to provide?

Please don't top-post, see [1]. An explanation what is going wrong
and why (and no, a backtrace is not an explanation). Why is
dev->driver->owner NULL? Shouldn't it be guarded by a lock or
something? And esp. why is owner NULL in put_device().

-michael

>
> > -----Original Message-----
> > From: Michael Walle <mwalle@kernel.org>
> > Sent: Wednesday, 30 July, 2025 3:50 PM
> > To: Romli, Khairul Anuar <khairul.anuar.romli@altera.com>; Tudor Ambaru=
s
> > <tudor.ambarus@linaro.org>; Pratyush Yadav <pratyush@kernel.org>; Mique=
l
> > Raynal <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>=
;
> > Vignesh Raghavendra <vigneshr@ti.com>; open list:SPI NOR SUBSYSTEM
> > <linux-mtd@lists.infradead.org>; open list <linux-kernel@vger.kernel.or=
g>;
> > Gerlach, Matthew <matthew.gerlach@altera.com>
> > Subject: Re: [PATCH v3 1/1] mtd: spi-nor: core: Prevent oops during dri=
ver
> > removal with active read or write operations
> >=20
> > Hi,
> >=20
> > > > On Wed Jul 30, 2025 at 3:39 AM CEST, Khairul Anuar Romli wrote:
> > > > > From: kromli <khairul.anuar.romli@altera.com>
> > > > >
> > > > > Ensure that the pointer passed to module_put() in
> > > > > spi_nor_put_device() is not NULL before use. This change adds a
> > > > > guard clause to return early, preventing the kernel crash below
> > > > > when the cadence-qspi driver is removed during a dd operation:
> > > >
> > > > As already asked in v2. This needs a (more detailed) description
> > > > what is going on and what is going wrong.
> > > >
> > > > -michael
> > >
> > > Hi,
> > >
> > > We just run the following test we observe the crash.
> > >
> > > time dd if=3D/dev/mtd1 of=3Dout.img bs=3D1MB count=3D1000 & echo spi0=
.0 >
> > > /sys/bus/spi/drivers/spi-nor/unbind
> > > echo spi0.0 > /sys/bus/spi/drivers/spi-nor/bind
> > >
> > > From the observation, the dd is not entirely terminated when the unbi=
nd
> > took place.
> > > Maybe there is other changes require to ensure the dd operation gets
> > > terminated when driver unbind/remove.
> >=20
> > I'd expect an analysis what's going wrong in the kernel to judge the co=
rrectness
> > of the patch.
> >=20
> > Thanks,
> > -michael

[1] https://subspace.kernel.org/etiquette.html

--030571e0ecaeb27a9a0dae0023b5712f16fb971faa06dab3bc8b8719f87f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKbAaRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i0AAF/TEoMr4W7YmQFJcoQEnP9+hkbiBM7Kuxq
1sC33x9rbxIUAhJKM2ekjOz/a8Zy27IhAYD6QoVjyIYBKQGMvI1YkekQaZnXJHXw
CphM5+Of64+HjUY2giF6c7dHSGOi74d4KKE=
=0u7V
-----END PGP SIGNATURE-----

--030571e0ecaeb27a9a0dae0023b5712f16fb971faa06dab3bc8b8719f87f--


--===============6625039058691679501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6625039058691679501==--

