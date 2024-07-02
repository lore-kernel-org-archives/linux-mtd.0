Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2871EC3064D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yj38W7rgBUpBJnFpqzn/ciyAq7LV/Qj4X8aPDD8a41Y=; b=LPG3T6n498G/HR7IK5UYL58u4n
	32+/ihLTRUtwLsJWNXNhzSav4GGC0UYQA0Wz3UsksNE2pHVy8H9YWoP+JoAfqmkrH3U1XVH8RAXGM
	aBKdAjdL/H6GFBYbKLL9ZAVorJTcS84Hnp1GF7fjbN7uEbN1ZZO0WjkBfPojqcA8kCm8LErc71NBw
	caqK3qa59PY3/R99BpfMiv7h6FCiGZfmBV8l9qkCeK0OXtbtJmVy35dJggfPIuNf3RFBhUUM0v5yY
	9INk1yP4vhTlEHuar/TTxYuY4cbkuJg/mC5a72RLONATq/039vRL9N/zCQyfRS/9vtuJlo4uLYNb9
	tivRt1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeaZ-0000000732u-0HhP;
	Tue, 02 Jul 2024 14:34:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeaU-0000000732C-0k3T;
	Tue, 02 Jul 2024 14:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 05E8ACE02C5;
	Tue,  2 Jul 2024 14:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0D1C116B1;
	Tue,  2 Jul 2024 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719930867;
	bh=98l+a3pWB42qJAPZ0GCAZ++B7ulUfPolVvoVx0ArV80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0rEUcXOsmoKrUeeA1jklOR1g18AnF0Flxfk/JNfZrjZqFZs0wqyXic4zXwXwSGdj
	 aLsOouz97xRzytjtZK2aq10SqTea7EC19f/UFenwnER62QLyQ6Lcj6yWGfHLN2AbNG
	 Hg+15ZtFlABzxtZ2uNC3Gni4U+sPwMMrT0t0Xb9CTTA8wHTk8+nS5pPm9BMfqNnK8S
	 BpoxZ8ZYdvrIHqwSMXp+L00o9v1Lps4Wu1Nqgg5yFxjX09CTCMdCgxemgE797kH2/b
	 eLr0VOBUH/xaIpNk0zQetIDIfIJly0q2Dvnl0sHjtWFEjUn2t5bms0jug9msMi6A7N
	 lZZiwIZkpMCRw==
Date: Tue, 2 Jul 2024 16:34:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240702-mighty-brilliant-eel-b0d9fa@houat>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
MIME-Version: 1.0
In-Reply-To: <mafs0ed8byj5z.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_073430_744114_CA28CA56 
X-CRM114-Status: GOOD (  25.49  )
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
Content-Type: multipart/mixed; boundary="===============3774589841207027798=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3774589841207027798==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gypj655hqo5gwvn3"
Content-Disposition: inline


--gypj655hqo5gwvn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 04:15:20PM GMT, Pratyush Yadav wrote:
> On Tue, Jul 02 2024, Maxime Ripard wrote:
>=20
> > On Tue, Jul 02, 2024 at 03:41:52PM GMT, Pratyush Yadav wrote:
> >> On Mon, Jul 01 2024, Tudor Ambarus wrote:
> >>=20
> >> > On 7/1/24 2:53 PM, Marco Felsch wrote:
> >> >> EEPROMs can become quite large nowadays (>=3D64K). Exposing such de=
vices
> >> >> as single device isn't always sufficient. There may be partitions w=
hich
> >> >> require different access permissions. Also write access always need=
 to
> >> >> to verify the offset.
> >> >>=20
> >> >> Port the current misc/eeprom/at24.c driver to the MTD framework sin=
ce
> >> >> EEPROMs are memory-technology devices and the framework already sup=
ports
> >> >
> >> > I was under the impression that MTD devices are tightly coupled by e=
rase
> >> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after =
all?
> >>=20
> >> I was curious as well so I did some digging.
> >>=20
> [...]
> >>=20
> >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting addi=
ng
> >> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPR=
OM
> >> drivers under a single interface. I am not sure what came of it though,
> >> since I can't find any patches that followed up with the proposal.
> >
> > That discussion led to drivers/nvmem after I started to work on
> > some early prototype, and Srinivas took over that work.
>=20
> So would you say it is better for EEPROM drivers to use nvmem instead of
> moving under MTD?

I thought so at the time, but that was more than 10y ago, and I have
followed neither nvmem nor MTD since so I don't really have an opinion
there.

It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
and MTD can be used as an nvmem provider too, so it's not clear to me
why we would want to create yet another variant.

But again, you shouldn't really ask me in the first place :)

I'm sure Miquel, Srinivas, and surely others, are much more relevant to
answer that question.

Maxime

--gypj655hqo5gwvn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoQP7wAKCRDj7w1vZxhR
xelSAQDyHdp3qs5OhZUbyv1sIG+7PHV3rzbQJu5zbjdgtcsnUwD/Vd5FuxDSVZrq
YEHzmHdDyuPknfgYexiAvC7jtdFIlwk=
=B/wG
-----END PGP SIGNATURE-----

--gypj655hqo5gwvn3--


--===============3774589841207027798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3774589841207027798==--

