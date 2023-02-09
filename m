Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D4DC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Feb 2023 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdBAFjxNaKzcQ0sQYmV67Nr+rGpJL/6YSq9Bab0CXpw=; b=1ZcFYDUBYHXheDE6aWfZwZX48h
	FYtmQGF7DX237qf5EweEqcLlUFGirJP9D26UNdA/6eRVbLh+s8+pt4rNnNNUQ1N4WCHyVtZfNYkfA
	WxJoka+Fc7qVUwgQb4E6+uu27d1VOTywPIWsgRUN/V2D//hSYyZ+CiFOsjSV0R6ih8J3/qtm+5j3K
	oJZo/eqQucHtJGQ9Ug2nqAPV3jg1SgbJCTnxOOgcMaZJx++K2hcFASx6haayMfmPPvFFpluWJmfiq
	NT0gwtgWgwK1gI6HSnMIuf4Uptw2zHkqUkP8X16wBT1Ar9Wnwd4NoNvZcwteizB1+0rd1XrJKsZky
	rJjex+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7ww-001z37-S1; Thu, 09 Feb 2023 14:30:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7ws-001z1T-7L; Thu, 09 Feb 2023 14:30:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7820061AB9;
	Thu,  9 Feb 2023 14:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C41C433EF;
	Thu,  9 Feb 2023 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675953052;
	bh=n5q92jtNB++4BoYIauYygzacB4DdXZvQYlYHsoaQZHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4cNRE4MQxZhPNyBF/08CXXf/FWNQlzUwcRLG/0S65J/4ZChTqeAH+gdyIm7+puo/
	 e1NMfqyqjToGWx/m2stUfU7oe9VJ+8njI+o0jyklZ6aQ10e0wIfN7idp96BYLv9Fv3
	 QhfxNouUc0qZTgyD3UIjJF1eoI/sa7sYlEflw9jIrrOTdIfoFZo0OmH5vYc0Tjwjlg
	 7k/6gJhmjkwo6pEOCZrEJ5FmUMlxfm8y1s7LLhR+jeJXraVBKucJ1jUqjs66gKI0qH
	 XjavWBRymrRU2MvlL95tjkP7Fwb0aTwHP4DAbOFosKC6AT8CudX5DVtLZ+LDNj9wE2
	 dDufUua3aqd7w==
Date: Thu, 9 Feb 2023 14:30:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	jic23@kernel.org, tudor.ambarus@microchip.com, pratyush@kernel.org,
	sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
	kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
	sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
	han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, narmstrong@baylibre.com,
	khilman@baylibre.com, matthias.bgg@gmail.com, haibo.chen@nxp.com,
	linus.walleij@linaro.org, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org,
	bjorn.andersson@linaro.org, heiko@sntech.de,
	krzysztof.kozlowski@linaro.org, andi@etezian.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	masahisa.kojima@linaro.org, jaswinder.singh@linaro.org,
	rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, alex.aring@gmail.com, stefan@datenfreihafen.org,
	kvalo@kernel.org, git@amd.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
	radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
	bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
	alim.akhtar@samsung.com, ldewangan@nvidia.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	michal.simek@amd.com, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-mtd@lists.infradead.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
	michael@walle.cc, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, amitrkcian2002@gmail.com,
	Dhruva Gole <d-gole@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	William Zhang <william.zhang@broadcom.com>
Subject: Re: [PATCH v3 01/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <Y+UDhWK6u9NkMTxv@sirena.org.uk>
References: <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
 <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
X-Cookie: Androphobia:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_063054_362427_0DA3B0CE 
X-CRM114-Status: GOOD (  12.61  )
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
Content-Type: multipart/mixed; boundary="===============2697478161071156068=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2697478161071156068==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iWU3nY956KPhZko1"
Content-Disposition: inline


--iWU3nY956KPhZko1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 08:52:46PM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpi=
od
> members of struct spi_device to be an array. But changing the type of the=
se
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the

This break an arm multi_v7_defconfig build:

/build/stage/linux/drivers/spi/spi-pl022.c: In function =E2=80=98pl022_tran=
sfer_one_message=E2=80=99:
/build/stage/linux/drivers/spi/spi-pl022.c:1592:31: error: =E2=80=98struct =
spi_message=E2=80=99 has no member named =E2=80=98spi_get_csgpiod=E2=80=99
 1592 |         pl022->cur_gpiod =3D msg->spi_get_csgpiod(spi, 0);
      |                               ^~
/build/stage/linux/drivers/spi/spi-pl022.c:1592:49: error: =E2=80=98spi=E2=
=80=99 undeclared (first use in this function)
 1592 |         pl022->cur_gpiod =3D msg->spi_get_csgpiod(spi, 0);
      |                                                 ^~~
/build/stage/linux/drivers/spi/spi-pl022.c:1592:49: note: each undeclared i=
dentifier is reported only once for each function it appears in

--iWU3nY956KPhZko1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPlA4QACgkQJNaLcl1U
h9Ai+wf+IWbvrI/uIEjinXzailRkkSP40/uzdnv8AAKF5zA3laimeZYZPCoKfD4X
GzBSQEjiZOJmPZ0wBaHHFFaxHSBlL6rtUoA6r+EEktjzWc6vOsmoUVRt74R+ZMHw
1FyvWR07nFAstJD2rPfPhIZ5bt4yiRX/CmA2SxN1qW74IwjKYAy6jLvbpSAZ4byY
KRnij11f/xqUuiao0L/PTya+dYLUOBEQvXm5JBAIqhZaQVH4G7Ppov0MR15cEMug
OG9oMzu197RFh7WgO6lj8rI9Cssl4vvj6+3owDZ/nK+LFq62Z6AvBGbaP7SoHOOI
Xcz8JdTcCAH0XAgza9flmPUQME9cmQ==
=4wBC
-----END PGP SIGNATURE-----

--iWU3nY956KPhZko1--


--===============2697478161071156068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2697478161071156068==--

