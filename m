Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E6CE77188
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2025 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+ZiyZ0Tmbf6ZSaVeOaT8vRBCJwqZOqtX3jLiM88tYI=; b=Gp2BPab3/D95Ac41UJJyvD9Cno
	HLjtkRdS1Bxa+vQtCNBOK5Kx490vy9tkLc9lnsuRz8V3iYkF+1sET9y4uBZ6XFWuIRn4DA3KL9K8G
	e1dNTy0SEziWQgLSu5+v246yAiOvCpejAMYz2x2/h+mC67z4Mqae7SblQG3WNVLFmRkAB10p73t/s
	ZBRtxlZJiCeS90jCLXCnlIzU02PoTOOXBdGMoKdJ5ecpR6wo+CFwQj2OhWW4TT6ZSdblU9O7mUZBX
	bn2N3W95Fmp6wNhyTZROTa0NO9ttzi322IgSc45stHjFICSMSKo2fuFz0U2XJftPrSTOVZj1RwQTo
	VAqXcc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmyk-00000001MlC-3k0s;
	Mon, 06 Jan 2025 13:17:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmqB-00000001KpG-1Loi;
	Mon, 06 Jan 2025 13:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DBCAA41779;
	Mon,  6 Jan 2025 13:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997E8C4CED2;
	Mon,  6 Jan 2025 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736168897;
	bh=Odx9Mi78CnBl/areN0tvg+kryNXSjlbRYjIftgM5H8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUDeXyN1Jlhl/AxkbRlfAf2u8WA31or+eOCr5Y7MMHiOuy80W6WA+gJjc14yb/dAR
	 jI8DFjz03bz/c3f6SivfQuByjI3oOnbsG8TTlZc0nyos/TjyLu57qMMbs35e/mdor2
	 EU2DaplKu0ygrgNvJw4wXAfqU8teWx7y6WapfRtfU8vSQ9duGGrjTTZPc/6b1v5/+B
	 mQjBpjmqRR99R1DWkCZhtnyDrJfO9TMRHSCDdUy/ANsEZym7aOAlBbDIMZxWcsMl44
	 oDjFCT6tfN169qJdVEJu0ezMiXe0E/Wdgh01/WAieVnqtUh2OilVLu7egU3i1RnXN9
	 4/nBKZmMrd5TQ==
Date: Mon, 6 Jan 2025 13:08:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH 0/6] Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Message-ID: <eec9caa0-0029-4774-842e-af1d1290ad97@sirena.org.uk>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_050819_425878_1B0999DA 
X-CRM114-Status: GOOD (  12.47  )
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
Content-Type: multipart/mixed; boundary="===============3670400596906529280=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3670400596906529280==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="emAp2yveWLVSOdEe"
Content-Disposition: inline


--emAp2yveWLVSOdEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2024 at 12:32:39AM +0100, Raphael Gallais-Pou wrote:
> Prevent the use of macros, and rely instead on kernel configuration for
> power management.
>=20
> This series makes the same change over six different drivers:
> usb-st-dwc3, sdhci-st, st-spi-fsm, ahci_st, sti-dwmac, spi-st.

Is there any actual interaction between these changes?  In general you
shouldn't combine patches for multiple subsystems into a single series
unless there's some dependency or other interaction since it just
complicates management of the patches.

--emAp2yveWLVSOdEe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd71bkACgkQJNaLcl1U
h9AGHwf/V/ekmXWwVL15xDEBbZZ+uqPpz0aLMa1v6gvSRA3S9ugHT9vW0elxEGf0
2+0EU7GuIo88DOYxKpOYDd1XHk6xkBI7Whic7ijl1+LK8Kq6Rec0zpzlsv7Rcja1
TmoHi68uCDrHguH5BH94YBKZVfT2U0gSc20ljleO66MKEJQEYob46c3649Gbpxwl
UPiwHVuWa6eMXfzJsS+vZgMEE58Q57GLiVmbZcN0u0FC1QM83kVDExYTCXuTtwx0
g5fiTrBVg4O93cd003jWflIlqao9U/nMREgX5M9/CytGX32MeXIPLlt73A15itVF
DQJXk1CapG8Sm0o+2Y/tH5c6IVJqFA==
=p10y
-----END PGP SIGNATURE-----

--emAp2yveWLVSOdEe--


--===============3670400596906529280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3670400596906529280==--

