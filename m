Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1351FC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 12:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB05B61029
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 12:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB05B61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4bdWhTAvOJHU9lYlC1S7rOClc1N6X2ga53viMq9yu8=; b=K1q6g7+XHxvwJInA0SgSDBR33x
	2Vrevq64o/80Nb59p97BU8zCGmiMSXf7YM1NgVX5lneEEm/1Ma7Os2uM9Rnmac3pzBXLkQQbCa6Ci
	jlT4dL3Y3sVZeoOGpyGFBGTveKXEd1ATkaUPq0tPhOme9h5Orym1zKNFLfqeuf6gQIebeAw8nVg9Q
	g3e//zUJtBy64TF/nUYk9imyMXgx0vUP1s5yXyqXJNe96RCRfzMq7uOvl1TZNvtJimms9UKEI6l4y
	3tt4NNWt6d/CCXey2ZOdd3KgDyliDfqpCt1Peo3QAt5ENVwjAfVdvFby57fyanZf8rXqUBLJ4ykLp
	gtHaSPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFy7c-002RCw-5M; Tue, 17 Aug 2021 12:23:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFy7Y-002RB8-I2
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 12:23:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1CB760FA0;
 Tue, 17 Aug 2021 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629202987;
 bh=c/PlC/W6yjxlV+Z7ZbF/hxgaIiNXDZlZo9QTekHzzto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmskkW06SeXdvESPFwWJP4iQi/AfZfa0vEFy+cuAqLmy+f4I2uJuGlWiIG3+qOPHv
 xnda4sK3SpsR15EDLFwOPVpUWOowLkNLIk9ImApHVFPfJnKz/lhdsh+HFZYj/NbRHm
 eXuH3smkHCoqx0QNay+eOr+RUqsGi1/LD/ASV8gvs921fqWRRcXPMo3BLK5Ue/LMAY
 E7aHmfxbASTmbJ0PGpnfzkpkFQY6yMi66OmBVe1qXWlxHCeHepAgYCfKYqlUOjbUyt
 lxKqpcb5n/55Qq2tzaqx1B4Vg1bUnEx45zv+Fl9rzaJm69xqekfjJ82brq5dSoJIe+
 WqipDMJt6MCZg==
Date: Tue, 17 Aug 2021 13:22:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 22/34] spi: tegra20-slink: Add OPP support
Message-ID: <20210817122244.GA4290@sirena.org.uk>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-23-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210817012754.8710-23-digetx@gmail.com>
X-Cookie: Custer committed Siouxicide.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_052308_692594_3F4D2AFD 
X-CRM114-Status: GOOD (  13.44  )
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
Content-Type: multipart/mixed; boundary="===============3357496320076675067=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3357496320076675067==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 17, 2021 at 04:27:42AM +0300, Dmitry Osipenko wrote:
> The SPI on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now SPI driver must use OPP
> API for driving the controller's clock rate because OPP API takes care
> of reconfiguring the domain's performance state in accordance to the
> rate. Add OPP support to the driver.

Acked-by: Mark Brown <broonie@kernel.org>

Is there a concrete dependency here or can I merge this separately?

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEbqhMACgkQJNaLcl1U
h9Buggf/d4C5+YzSeq0C2NHs0zamK8fHfoeCb5Qf7DbvwC4xNpUEoKAl6kFe6XlO
ngiyDsMKDiDDirVRL6usRQkhxcB9hYlR9qZPZwTumcSB8omPU2d8ibg0bZlq6+EW
bQf4R3TRA5YOFtGXxUejMSdK0+MO4I0QbuU6o4zLT3dzFtq+nK1Oct7FNyhjNrK/
ELy4bDfbSewMfEPDjMsi05Qg7I6ftQiO3ZAqdTAj+0bLpHvsChKGv474uEXEw6vv
FICFNW+bUCUC/oS3NykjRlVmWPr6eACJDT33krIuaX8/G0mN5kVjAfVPnOK1OzG+
Y+z6bEN/Dr6UAjhZRQbizQRM04sR+w==
=JJo7
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


--===============3357496320076675067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3357496320076675067==--

