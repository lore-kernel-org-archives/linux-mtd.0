Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116BCC47DA2
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jan 2024 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndK3/ZrzHa798ooZk/mwhBzTKsznJ7uVDBptHBkGirQ=; b=G9Jj19S2jEPXPPyrjvsUIWSwY3
	i//He7q0Ic5THKoNuETFySuD8TjcvwK8qXTK3JUqTO9xUf44P2bpVjGMP96FUu1shV6C/XmVVkvud
	gl5CL3+I2OQfiEWsqhDHdq3Bu+bwGplYTXPTk5qqpzc59XgYzOk78eDSiShEY4DcAWhCRqNFbmQ6S
	d96ALQsA1UybwvXMcm74Ennp70O7mH9qxrDlA8S5p/o526RCJALnNSTdn2RWuV6ESkwPfOKGJDSJT
	EcIavOY92pQ1SvB4x6lT0Q4o3ysy8jHC8MpraIqb73RQPgFjhTK1JX7N+GfVbm3Xw5mr9C4/R5zJz
	H7N9LLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlF3-00COwC-0J;
	Tue, 16 Jan 2024 15:20:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlF0-00COvN-1D
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jan 2024 15:20:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPlD8-0000tu-OV; Tue, 16 Jan 2024 16:18:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPlD0-000Gxt-VX; Tue, 16 Jan 2024 16:18:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPlD0-0011AW-2X;
	Tue, 16 Jan 2024 16:18:34 +0100
Date: Tue, 16 Jan 2024 16:18:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Ronald Wahl <ronald.wahl@raritan.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	libertas-dev@lists.infradead.org, Javier Martinez Canillas <javierm@redhat.com>, 
	Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	kernel@pengutronix.de, linux-media@vger.kernel.org, linux-wpan@vger.kernel.org, 
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-doc@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>, 
	Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	James Clark <james.clark@arm.com>, Guenter Roeck <groeck@chromium.org>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, chrome-platform@lists.linux.dev, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Viresh Kumar <vireshk@kernel.org>, Helge Deller <deller@gmx.de>, Wu Hao <hao.wu@intel.com>, 
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>, 
	linux-arm-kernel@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	"David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-integrity@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>, 
	linux-fpga@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-input@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Yingliang <yangyingliang@huawei.com>, Moritz Fischer <mdf@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Rayyan Ansari <rayyan@ansari.sh>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-mmc@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, Xu Yilun <yilun.xu@intel.com>, 
	Alexander Aring <alex.aring@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Sergey Kozlov <serjk@netup.ru>, 
	Richard Weinberger <richard@nod.at>, Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, linux-mediatek@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/33] spi: get rid of some legacy macros
Message-ID: <l4azekfj7hduzi4wcyphispst46fi3m5ams65nzer2ai6upoxw@3p2uki626ytt>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
 <3404c9af-6c11-45d7-9ba4-a120e21e407e@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <3404c9af-6c11-45d7-9ba4-a120e21e407e@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_072038_414139_BAA5146B 
X-CRM114-Status: GOOD (  24.48  )
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
Content-Type: multipart/mixed; boundary="===============2603573537122665901=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2603573537122665901==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojpgqs276usvjple"
Content-Disposition: inline


--ojpgqs276usvjple
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mark,

On Tue, Jan 16, 2024 at 02:40:39PM +0000, Mark Brown wrote:
> On Mon, Jan 15, 2024 at 09:12:46PM +0100, Uwe Kleine-K=F6nig wrote:
>=20
> > In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> > some functions were renamed. Further some compat defines were introduced
> > to map the old names to the new ones.
>=20
> > Patch #18 and #19 touch the same driver, otherwise the patches #1 - #31
> > are pairwise independent and could be applied by their respective
> > maintainers. The alternative is to let all patches go via the spi tree.
> > Mark, what's your preference here?
>=20
> I don't have a strong preference here, I'm happy to take all the patches
> if the maintainers for the other subsystem are OK with that - ideally
> I'd apply things at -rc1 but the timeline is a bit tight there.  I think
> my plan here unless anyone objects (or I notice something myself) will
> be to queue things at -rc3, please shout if that doesn't seem
> reasonable.

=46rom my side there is no rush, we lived with these defines since
4.13-rc1. Applying them during the next merge window is fine for me.

Anyhow, I intend to resend the series for the feedback I received after
-rc1. Up to you when you want to apply it. Watching out for offending
patches using lore shouldn't be a big thing and I can do that.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ojpgqs276usvjple
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWmnkkACgkQj4D7WH0S
/k7Jlgf/bxg8PBfYKKX7PvDPgT3ZVpLLtWReyLQDBjEkSddRCSKzwPE5dQsE6TGF
pkpgz7Za7CnFfHKtW25alERgnrqA9inDitGvBoBIVgSHPf6GJsGOPVLhziEMU9t1
tBlCUkInYGMvS/Gn5tOoSjNLmapgV8tiNzeos6MHWZzdKpWIzj6SBNH72Bof8kUq
R287GggNJ2PLZa24vL2Pct4BZIfpbD+n1o6O62edEmpGe17xuDkSNfjirG7MojjX
vAtAlEpsLidT0eabHr4XkgyBSQZLwlh1OdReMiXhtK5GM3Oh9R4Y2XVhUq83hKSl
5zzsBEXwEe1w3pKgGJnCD1jxAAcJ9A==
=Sz6E
-----END PGP SIGNATURE-----

--ojpgqs276usvjple--


--===============2603573537122665901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2603573537122665901==--

