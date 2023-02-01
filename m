Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8B1C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMa1twk9s9YNpV3su8p2tHFK/w1/lEu/S+907ZpB1og=; b=WXM9JqK+Eh7F+RfYvG2lNtRTYE
	37Zg2Kd11TARnITJQF/muMKEKk8yFn0QUBUAudyXYnJEVQZVMui4OhPthZ4KMfVIOMrOTOdUhtvwq
	EHNm/eCe1pilHdYbgl5pZldcttaPFsvESDwtKFdHqCfOGBtwGd80rrnKzccYe86Pg9WXsUTq2xVQO
	aMCXDxUUZHo7eBu3RgK/ILx1LpCy0f5d6SXwll88iolg/LBz7fBd5mJVHC2ZSIOsSQ+2vvmnYyAvW
	Jju/q55d3sp+qZrHfeLQLPQZdP7uYrenTWcXbY1HdxOy2wV9PbFQ3SMIrfyZiV30rH5DxR5ZFzWra
	6NpK/HOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNEqF-00CbvX-B8; Wed, 01 Feb 2023 15:16:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNEq9-00CbsF-5w; Wed, 01 Feb 2023 15:16:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58CC5617E3;
	Wed,  1 Feb 2023 15:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DF4C433D2;
	Wed,  1 Feb 2023 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675264559;
	bh=LRcOg2q+eDGVIXXY2nwx4erwH77a/aRq28NUs5IDyCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KU4ZzAZCfEIFr0jm610wDLcfNDu1BT7alWBq4lCdAi8jxLcmCiG+N3M8pD98e92bq
	 jEveutD/LRtarHkLSi1VT+wkWbr0FiUwuP11kxiQ/FQ/0dLJS9f7wk4WIsY81RNwsT
	 zE2rXqGv+swsJ+x2navfQqq5XD8GmEgv0vJSNVcB+mloglAaqXwO0rFQl2XUbT1nWE
	 N9OHyols6boAqmJ12PCA7BF6t1yvrYW7Nw9tEb0eKdvPWGnJ5Rqf1wv3Ng4NK3ygNW
	 owxjCxS1tCFcCwRtOSIJKriVsuXGINVmjP3mb2jgXizk7d2Q0jSrHyCO8vF9Om7Gjt
	 MSXjxi7+9AcEg==
Date: Wed, 1 Feb 2023 15:15:35 +0000
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
	kvalo@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	skomatineni@nvidia.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, j.neuschaefer@gmx.net, vireshk@kernel.org,
	rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, git@amd.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
	radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
	bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
	alim.akhtar@samsung.com, ldewangan@nvidia.com, michal.simek@amd.com,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
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
	linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
Subject: Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <Y9qCF7DS+FQo1RYp@sirena.org.uk>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
X-Cookie: Oh no, not again.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_071601_342503_047F312F 
X-CRM114-Status: GOOD (  13.77  )
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
Content-Type: multipart/mixed; boundary="===============3362417282557215019=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3362417282557215019==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RnOekfr0Q/w96KQx"
Content-Disposition: inline


--RnOekfr0Q/w96KQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 20, 2023 at 12:23:31AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.

This doesn't apply against current code, please check and resend.

--RnOekfr0Q/w96KQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPaghYACgkQJNaLcl1U
h9Cmcgf7BtQa6jVrXNU71IJVO9/XKJzR22YYvwnRLJqC4Pd6uUnIG4DAhyw1qQyf
fucGeAY9Y8jlqFuw1RM+0pFy53EabmhZAQjypGnDXk/YJ0fTV2VJuT7bSfXC+JJe
0Qs8nYPpVfn9TmLvBxiPjnsghneRyWbx+V7MzflSFTsVl/fM5ypTH92qZ3S6rTDh
ExXE6oTe7hNyto8+VoMfi0qvdqTKMyPciO0DnOeUsbPG3FpAiNiHN1lD5yhI6QEM
jA8R67+KRGUoFZsozgB5N3NN8BH9FWq5Hrl/ToTuWP1AT9C8prAEa2uwlU3YVDmA
SztMxe2B+kl+AF4gZ5yyL6EOiMGk6g==
=zhKL
-----END PGP SIGNATURE-----

--RnOekfr0Q/w96KQx--


--===============3362417282557215019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3362417282557215019==--

