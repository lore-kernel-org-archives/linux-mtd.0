Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C0CC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOXjgY7WmSe2yETWK6UDLrIRYHA55+xxYimcpo27UZo=; b=PE0fkm8Gn/Aij/R6CBORxZ7qvR
	oCPpu3x/zCw9d4nbfwHMJWollyR9g4gUcgqRWLf/UsjiXAdA9sOhMBbJBiyw9vUYvJsHJXLrmh3GX
	LURNhqErYKD6LBa1HnSXkd4fTDvmozIxkY5PmL8JKNvSVOZeTYznGZlLHR8muE6HxBCCQBMZPu/fJ
	WpnZjEDbA4RNt22EkzJi90FsFt/L1PRZTYBAvH9g2TC/HLPgY7vDEfd2Vq9ZEDwh0+NM1xQsZ9+bm
	XgUMuWZncYcZdz8qNC5ZfVUgGVkgeywr8M/B3a3bt3ybI6vLSygF4A9a5aWttE1oCg3oDfoWfOsRZ
	Wkaxw5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKHT-000000003jN-1pe4;
	Thu, 15 Oct 2026 12:09:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKHS-000000003jH-3mhD
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 12:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DA33601EF;
	Thu, 15 Oct 2026 12:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91C11F000C4;
	Thu, 15 Oct 2026 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066193;
	bh=5TFfhtEZymDVC1w0b609A5ABsMnSltfDfvXOrQD/KY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IaX3kgJHKwrzWGgsgjJnuaLDvKBB+qN3POm3oEIbf4CfYR+vIEqVpODRMwoq/AGmy
	 TdzQzIK0kCReQ7fZO85a/WPAPqfWpf5DdB9iQMijSUAMT0TWaT/TmzbMSbh8Gutk8Y
	 esIi/DK15Mc0mZBSX6PO8EYq4MoWfLL5mDoKWgf/KmGbf/Fr+Lv2xn3yK3Ykdq3qtb
	 xfQZATmrH2RxaQuDE56xel/CiLeLePygAMdIA8+jZo+2rMquKtAL20Y1tkxEXd1Nrg
	 feW9oYuq37pvJXtf0BjWp1ZuSs/0PHlaqvda5USlv2zf9v0LYfxqiMtsY0FKGwqFLb
	 BA5iDMruvYI3w==
Date: Thu, 15 Oct 2026 13:09:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v3 6/7] spi: cadence-xspi: Add support for panic writes
Message-ID: <f6008943-c4cb-43ae-a791-31965f374ffd@sirena.org.uk>
References: <20261014154301.157755-1-paul.cercueil@bootlin.com>
 <20261014154301.157755-7-paul.cercueil@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20261014154301.157755-7-paul.cercueil@bootlin.com>
X-Cookie: Tax and title extra.
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
Content-Type: multipart/mixed; boundary="===============7721698933733685512=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7721698933733685512==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R7ilFvSy7hHntzSv"
Content-Disposition: inline


--R7ilFvSy7hHntzSv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 05:43:00PM +0200, Paul Cercueil wrote:
> From: Tanmay Jagdale <tanmay@marvell.com>
>=20
> Advertise support for panic writes. When a memory op is received with
> the 'panic' flag set, the driver will then work without relying on
> interrupts and without sleeping.

We check device properties in cdns_xspi_supports_op() if the kernel is
built with ACPI support, that ends up using of_find_property() which
takes the devtree lock which means there's a possibility that we might
deadlock (eg, if we took a NMI or the CPU fell over at the wrong
moment).  This is probably thin enough it's not worth stopping the
entire series over, it could be fixed incrementally by storing the
values during probe.

--R7ilFvSy7hHntzSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQwosACgkQJNaLcl1U
h9Cd3gf/VAYkmxCeAkm7N9qwAd30xqwGrjFYs/2mOwDPMyBcp9h/7uWn9nSot0C9
nMEPLDBJFOTtNJux/OtYP34Q0eGPYsHDNDd1IiQGe9eYYTeCvZGdhe6cDReFoTJy
qostydL1ZPFj8fyX/L7dkxpHwj4q/Wh6Hwf+xrF6L+DdGUHWwdRPb+7Yyw4vXQhY
wvYJpajlSSFVFJyLiCupa+a291bog0XIcWho6w7N3lJxwXt6arY8bbk13VeW9G3O
vtu2lWsnPJPkzn7LcpGcQrS8Z8/oNEHws/il+zsBy62NaeIBd5pewH+HF6pVzkIP
eRvH91UYtNEsMucoAyXMEauskiLWGg==
=siEH
-----END PGP SIGNATURE-----

--R7ilFvSy7hHntzSv--


--===============7721698933733685512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7721698933733685512==--

