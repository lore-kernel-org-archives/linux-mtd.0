Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490F4C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 01:27:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6B560232
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 01:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6B560232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Od/Otfz5AuYyNY7oxe/YiBpz1UhE6e33JRVnFnAdSI=; b=tFicBpeV/CBqfrfvUh9Ds8qeh
	O5y6UyQIZaGcWuZud0m+7Qqvu6h8MkjCOhl2kp5A86YhujB7DbYtakkC4uJ7/J5bhT0YMACTaeFt9
	oxkc9oRE1AXb+7U0fcoFDeMK4Uh/2QqRrpjuJnVxEwUglwH1uL2dWYiSqcIWgMYugCtlEojojEOIZ
	FVNEUJ99ljY4hhvlo2A+1huwZJy3HkAXwt7iUik2mqeNEBTpg69yNRcDh2atyjK9ldk88gHBGNG/X
	HaoWrDTUzMSvJyfvU6HPbGYpvb0mPgLYIQ6cavQuL6NFXALrFS44GMc+IogrMPGtHyb0w+6alSJmg
	VDcD3G2+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEMTj-0000fN-2C; Tue, 23 Feb 2021 01:27:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEMTe-0000e1-PC; Tue, 23 Feb 2021 01:27:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E53D64E57;
 Tue, 23 Feb 2021 01:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614043620;
 bh=+jNCruc+MkACHldsssuUZj1pB5jnc3ckCdEhn63aZ3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SCEbCJ1nJRIcMhV6qGtieEkrJRXyo6qpWJEqetyNU8mP5Jc4ErI09EYGq4fhMtmKH
 e0FxPfE6asbauVfZ9+1UM1DWzJ74gTNHU31AKh8c4Sl8Z6gir2HzfOcNgBiWamoP/L
 M/do1p+yoilcZtwY0asU0u0fQLhjtkfqiRTLNgqlL0NIh9LEjmnBgJzXvJeKAiokoo
 EytYoy8OLcp5Ty/ZSlwErxv9blNXfbMGUH4OIt1Ryf8tMpleWWj/q/jmF5SL87Ahhw
 vj4Y/oFpwohenyZuh7yjzld56y4gVcf30KNB8twNaB1gg57HoLfTY7ARQCgwXgPr5X
 pQcFTm5SrcyDQ==
Received: by earth.universe (Postfix, from userid 1000)
 id 691493C0C96; Tue, 23 Feb 2021 02:26:57 +0100 (CET)
Date: Tue, 23 Feb 2021 02:26:57 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net> <YDQhgkftoW4J9AtY@piout.net>
MIME-Version: 1.0
In-Reply-To: <YDQhgkftoW4J9AtY@piout.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_202703_001172_5B07ABF9 
X-CRM114-Status: GOOD (  29.69  )
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
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7207338284541670887=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7207338284541670887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vkwv4tifbmgtzlgu"
Content-Disposition: inline


--vkwv4tifbmgtzlgu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 22, 2021 at 10:26:26PM +0100, Alexandre Belloni wrote:
> On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> > On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > the clock is disabled and all i.MX6 functionality depending on
> > > the 32 KHz clock has undefined behaviour. On systems using hardware
> > > watchdog it seems to likely trigger a lot earlier than configured.
> > >=20
> > > The proper solution would be to describe this dependency in DT,
> > > but that will result in a deadlock. The kernel will see, that
> > > i.MX6 system clock needs the RTC clock and do probe deferral.
> > > But the i.MX6 I2C module never becomes usable without the i.MX6
> > > CKIL clock and thus the RTC's clock will not be probed. So from
> > > the kernel's perspective this is a chicken-and-egg problem.
> > >=20
> >=20
> > Reading the previous paragraph, I was going to suggest describing the
> > dependency and wondering whether this would cause a circular dependency.
> > I guess this will keep being an issue for clocks on an I2C or SPI bus...

Yes, it is a circular dependency on this particular system on
module. It only works because the RTC enables the clock by
default. The i.MX6 CKIL is expected to be always enabled.

> > > Technically everything is fine by not touching anything, since
> > > the RTC clock correctly enables the clock on reset (i.e. on
> > > battery backup power loss) and also the bootloader enables it
> > > in case a kernel without this support has been booted.
> > >=20
> > > The 'protected-clocks' property is already in use for some clocks
> > > that may not be touched because of firmware limitations and is
> > > described in Documentation/devicetree/bindings/clock/clock-bindings.t=
xt.
> > >=20
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>=20
> Or maybe you expected me to apply the patch, how are the following
> patches dependent on this one?

The last patch, which introduces a new board has a runtime
dependency on this patch. Without this feature the board
goes into a reboot loop because its bootloader enables the
i.MX6 watchdog and without the CKIL its timing is messed up.

But it's a pure runtime dependency for a new board, so it should
be fine to merge this via your tree. It basically means the board
is only working once your tree and arm tree have been merged,
which seems ok from my POV.

-- Sebastian

--vkwv4tifbmgtzlgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmA0WdQACgkQ2O7X88g7
+prAbBAAkf1j4TWyAUwNGCEKZRb6+YySPrlQpkb3EBCE0zV+l99HVYKLfAz5CwCH
mqVf4GgzAE64+byU2NfmMcXiLikzUlcVR0gN572ED/a5ZEyRkqm7euVnV7jzL6eG
olAlqpcEy7d6y5R0pHDytFbPAN7C5LN8aTl6zcuroH9QcuFcezQpEd+01PkQMSNJ
8gT6dXPdeKoy8AqTcwVBel4CS3oQc/mSQ3fuMBa6+UTz90lznin2vyl4arHMd+tv
LLQvlrn6T2X+rgQ3UNyfEsuSo4WFIdreoWIobQgUmZIhXjno04PTNghc3mhHpHUE
oL6DMhyB474mdGS3cFIgDnTwFQFKaLOKQiJDcgTBDU497SsTZxOf/DDvU6MEtkzT
VeCOmfm9xjYxNa0yALMic/nSibePV/bdXiak/njl3KOd5ElQ9RcvlsKMAlK8k1YM
kKr47aye0+n4hivy1vZR2Kh+wx3BrsGnsYF9gJVUqCkuwA1X58PU6Iq9QVxxMDe2
SQ62Jz5Y/kg+c+eFas4AeT1NRFZhEvcfni8pHdF2TketdpM4VLQCAdYqkHhpz4Wx
qmv9E/FU7qly5kOTjcIKhwk7MS4deNZaQoQt/MUs1LN0PBv162jneWsqjmRgLyMH
cxEOJN/MZVgB5gKG+U5wmHksMAjIfLi3OOC668MhSh2loA48XvE=
=Hawo
-----END PGP SIGNATURE-----

--vkwv4tifbmgtzlgu--


--===============7207338284541670887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7207338284541670887==--

