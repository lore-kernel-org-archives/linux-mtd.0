Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19DBC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppTf2hxVEtRJCkNYiui10/CBDU9yWjwWqOY3ulubMoQ=; b=s5cvJDZtcEzylnSmP01Mj5XhPd
	9gmZDIbwmzXCuo48EX0f8hRd5CS69bFg9+CQRQG9o5O/oSXiM9qmvEUiRNWs3oFYhldXRKo+AlfEN
	3Rz/moF0D/p4UanUXeEgpWazdquY/TZedkuKAXUxw9jf4LHMVu2ArIdKsiweNCtQQ8HTd2xbwr+hN
	AjUlLpFXrZ3crfZMTQYExidwBlEzakcEuvClTL2GruyNjy3lRrSQiCSlfsxPvSZCIiG6cGxj8yKs0
	zrmUKn0OK/iFskej2XW2GHgLjTD7n6jbQR2T1dsCe9h5d5gShNIov07OP3EkaCNsIh/h1h8H97G2H
	7z3a4nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlx6J-007BTe-VM; Tue, 03 May 2022 18:18:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlx6G-007BR6-El
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 18:18:17 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1nlx5e-0000ix-89; Tue, 03 May 2022 20:17:38 +0200
Received: from pengutronix.de (unknown [86.103.140.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 0B74E75107;
 Tue,  3 May 2022 18:17:23 +0000 (UTC)
Date: Tue, 3 May 2022 20:17:23 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Abel Vesa <abel.vesa@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Anson Huang <Anson.Huang@nxp.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Han Xu <han.xu@nxp.com>, Dario Binacchi <dariobin@libero.it>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop redundant 'maxItems/minItems' in
 if/then schemas
Message-ID: <20220503181723.wczerdgfrfoxj5xf@pengutronix.de>
References: <20220503162738.3827041-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220503162738.3827041-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_111816_520516_5CECC719 
X-CRM114-Status: GOOD (  18.86  )
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
Content-Type: multipart/mixed; boundary="===============3167305991636326181=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3167305991636326181==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vn735wunl5rhhwdp"
Content-Disposition: inline


--vn735wunl5rhhwdp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03.05.2022 11:27:38, Rob Herring wrote:
> Another round of removing redundant minItems/maxItems when 'items' list is
> specified. This time it is in if/then schemas as the meta-schema was
> failing to check this case.
>=20
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with t=
he
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooli=
ng
> will fixup the final schema adding any unspecified minItems/maxItems.

>  .../bindings/net/can/bosch,c_can.yaml         |  3 ---

For net/can:

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--vn735wunl5rhhwdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmJxcbAACgkQrX5LkNig
010+7wf+Mqx1TWITM4zoyD5krckfHGf4qplQOx8GgcvjVUhJVQ0mDXx9PgM7D2fF
HjL7mYlg2zj+lrwhgLeH/YNvoCAKzXmbKRVFjs2HfzIEe3xaC1xFXt+vXRU4v1mE
DXW0vVKC/oYmGqIWCSda8MeqjOhR+hFoQLC1RefyFIHijbaa/4+8W9Qe+oayuzIo
aDASB5q9KGJUVxeh15402et6p4EqI6rJ8LiKW79xwtgfqRlqBGDQ1LBuBYf0LKFE
Whl4mJRw2P0razAapZrvNWK6osSzN2ERLC7qQ9dnUOJvHYffN5IFcO8X3GbdpEkX
SPDiKbA08vY8R9xmqlH4PzUcrR46zg==
=MWdl
-----END PGP SIGNATURE-----

--vn735wunl5rhhwdp--


--===============3167305991636326181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3167305991636326181==--

