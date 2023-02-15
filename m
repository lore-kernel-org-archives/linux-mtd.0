Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE91C636D4
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Feb 2023 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKaF/gPhpLyaMcdjO5s6BsDod9DMoe+xiqHjCA3Hmmg=; b=MyBbEGUNHUMfBfcK7TnjxXABJY
	wYytMBRBv1S48pJpWH5g28d/8ZluNgM/LM7PHpc5Hph/vmozOFGJK810Ug0SnIf1fQdS7Efl09fnm
	37Bu+CRCOZXyYkzZFZ1xbTOg6snzGfF8XtB9xYFqHookuMF3crOAM2q+qWie6p7RGHAXdHgQxmdzs
	8NpqUPXub3lsuY50KRVH0n/Q1GVSMm9GjjZjehtqDqGAIeE7PTUJ7kwIpwULNLMIbblh/vfCB1vqP
	7M9MdTR+h1Tvdpp5+awDLqvNTsRHRyuzQHVOY9qD+3QOB3/PbCxdC6nkMOMjf9mugL5oi94czZTTT
	o65zhliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSId6-006BS7-9u; Wed, 15 Feb 2023 14:19:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSId0-006BPg-MP; Wed, 15 Feb 2023 14:19:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E942561C32;
	Wed, 15 Feb 2023 14:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56C4C4339B;
	Wed, 15 Feb 2023 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676470760;
	bh=gQEel9EdWJL6nindAVV89iHXQOyC9ETUfqvkvbtD2gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PEGQwrEr7+4WeFzY/RpUMkgnLnkz3fghVF7WJBwbfnBSFv/l/K9ykEmLj7kWn6gss
	 boN+28fkVXq2qh9YXa3j66y4Hj/kpEL9EYG3AiTTfxOrke1JcvDKQydudVbzQ17IGH
	 ZL4MG5W5BmvBAd6rx1y4zhrf/hs2iovXQ0Y1T2Z28UEqyKBjNDQkO60YWp04Z15os0
	 LITBxJhiNSW/UvxDu/uH5bdF9unqvUhGcL4wXv6m2shBXdbZI7J9XcZ3STxeTl72a0
	 U4bJYIhivyPi3krbtjRY1d/s/g+7MAdiLn1pDItsS9gGz71pmYvlLxV6SmGbJp+ikl
	 VT4QJaIeWDiZw==
Date: Wed, 15 Feb 2023 14:19:16 +0000
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
	kvalo@kernel.org, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, tanureal@opensource.cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
	oss@buserror.net, windhl@126.com, yangyingliang@huawei.com,
	git@amd.com, linux-spi@vger.kernel.org,
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
	linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
	amitrkcian2002@gmail.com, Dhruva Gole <d-gole@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	William Zhang <william.zhang@broadcom.com>
Subject: Re: [PATCH v4 01/15] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <Y+zp5F2l8pffEEvN@sirena.org.uk>
References: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
 <20230210193647.4159467-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230210193647.4159467-2-amit.kumar-mahapatra@amd.com>
X-Cookie: Serving suggestion.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_061922_847208_C54D5064 
X-CRM114-Status: GOOD (  13.23  )
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
Content-Type: multipart/mixed; boundary="===============4534505666791656254=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4534505666791656254==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mHMK7QDQWaz9I52Q"
Content-Disposition: inline


--mHMK7QDQWaz9I52Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 11, 2023 at 01:06:32AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and

This again doesn't apply against my current code - I think the
best thing to do here is going to be to rebase against -rc1 when
it comes out and resend then, that will also make the issues
integrating with other trees easier as then I can make a clean
branch against -rc1 that other trees will be able to merge as
needed.

--mHMK7QDQWaz9I52Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPs6eMACgkQJNaLcl1U
h9DMTQf7BClrpZ6y6mPa14iVbIWKtokY4RW9qSMUPLjIFwC9eRXAa0tO9cEn7yie
Dhg3Nh0HQil5b3ETrpYSZcezEkC0LjXhOcrQL2AaNPnYqp8rwD3n4tFQXOY7hA9R
fhdZQcSulOPdvy2GDwF7fvgenpxkVDIZM0OyEYKr5amWKxjhGICMWTBjvHmWJWo5
Kh34j6KD6URlG9Rlf2b8CSTbJrwj5bREjrjMOvUNQWTt775APe+cKcZF6Jp3IhOC
q8wYya1VrWoegeXxgG6IJW/I5BYCmloUtbj8BTpW9CIHMuOTdeqMduuExe3cWHOx
xEsHIS5meBbApEDmthwKyZw5q9xE6w==
=3UQL
-----END PGP SIGNATURE-----

--mHMK7QDQWaz9I52Q--


--===============4534505666791656254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4534505666791656254==--

