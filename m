Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3364C64EC4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 21:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKUAMAU2uBVaU6+4dI0V5elu9+/Xi13jHrE4BWyW/Po=; b=m7NlWsGlrzj9i3z0Maxi3DmJB4
	x5JJANVAL0W/G1zfnj/LldPK7sBXBqhLEEzGm/5Mp/znJ0/k7gwjkshkfxv0XzSqUmw9Hx6tIEih7
	5NLQmgIMHy9YmS7sE658RBP3GY3sXIHDqrvzF7R/17MO98hZ9EinoHPC4G+Uc2nLNQPy8qGWLQ92R
	u3U5DgFDOkOuq7XSLmNen4QneZifRz6tLNLazRnALHrJpg3wEwDaKA5zq+2QjFKem5qgslXhIAism
	oUoDBspUoBpu6Cn2DqYEiGPDS93D1t9Frl1pz91hqxl4LaBrPdKEWO6QKznf0xqmdaJ22ODekYQP6
	qc1mLYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZINK-00F5YC-4D; Mon, 06 Mar 2023 21:28:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZINE-00F5WR-Ax; Mon, 06 Mar 2023 21:28:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2CF760C7A;
	Mon,  6 Mar 2023 21:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA102C433A1;
	Mon,  6 Mar 2023 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138079;
	bh=OPscq8j4gixbBXyx4rYRiqcOtug0pajWX+t3LwK0uPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsQMxWTNyqmjmOyLA6f4aBxEbqjXLjGnQvTHUoE4f6zTvuB0TEbKKoow7O0Bl6lqg
	 gYnqSQeBrO1rJ29HWmn+yvMly1eyD9pru67Ei5XhYPhftQR6cu4eDx5Y2uE63s5KIt
	 s3zsZ4FOYFUkiy7gTDlGyR2DhiXrF2ddTXSUbWfDk94k+YWjCuHsJXdkT6LOyMmw3/
	 OBMkdU9AXHfmpJlFP0bcKZdHq+IuioXEaW+oivplUHjLiBGkJeMjuBmdvu2rgkgh5Q
	 WG7SALFgV1PPXh9MrSvGscl5OUXQrlqRl1aL8dYkfSYDeEvI72A6J1sMyBNHxpS7Fw
	 LxAw7Z0FF0jTA==
Date: Mon, 6 Mar 2023 21:27:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	jic23@kernel.org, tudor.ambarus@microchip.com, pratyush@kernel.org,
	Sanju.Mehta@amd.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
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
	william.zhang@broadcom.com, kursad.oney@broadcom.com,
	jonas.gorski@gmail.com, anand.gore@broadcom.com, rafal@milecki.pl,
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
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH V5 01/15] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <00684da3-520f-459d-b6bd-55e728e93ebf@sirena.org.uk>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
 <20230306172109.595464-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230306172109.595464-2-amit.kumar-mahapatra@amd.com>
X-Cookie: teamwork, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_132800_518515_DC400698 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1489919985079133880=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1489919985079133880==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RfYQ7lwbbyjtjTUN"
Content-Disposition: inline


--RfYQ7lwbbyjtjTUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 06, 2023 at 10:50:55PM +0530, Amit Kumar Mahapatra wrote:

>  drivers/spi/spi-omap-100k.c       |  2 +-

This is also not against -rc1, this file was removed in bcace9c4c9270292
("spi: remove omap 100K driver").

--RfYQ7lwbbyjtjTUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQGWsMACgkQJNaLcl1U
h9C7Fwf+MqZVyi3PlI6YIKPDaaFyWnmjZtweIjxd+4E2eEmTZq9MbcCHS/W56cUk
TPWusPOjIa33XHC376rZpTYGqNTRjvOo8UwttJFAFQFbtMNui8BfC1bnrROwoyUE
AxcOxhCAi3r1P0nRIkS126TepySOo1qXD1gf6YUQydf6/iDxzq7VddVjfqtt3dPF
6rnt0G5xA5O0Z75Kc76h4ePCX7kXMqJhJSaJf7HFcGwD2P5HIeRcRyucD2q4Ddnr
KzkdziV90/s6X7Q9cfiA620jfm8jVdqqN3yC+JX/L2Iu8kpeefFFgD49yG2aMtxv
zgXP6uMpvQm5g7F9e/wo/JMWhjfh8g==
=uJRe
-----END PGP SIGNATURE-----

--RfYQ7lwbbyjtjTUN--


--===============1489919985079133880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1489919985079133880==--

