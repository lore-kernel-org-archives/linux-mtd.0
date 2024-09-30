Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16853CF649D
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93vyh7+aTEBw78blsS+5shlNmflqB+moKGzagF/9AqU=; b=OHLYpdWSoi/8bpC+XfBBHSW1we
	0DPLDSLF8kIEdlP31kqzAS8f5rsn0daXPw/SX/z+RIP1eMAplEJ4qfQ7wxLASfusU31NE2TXvpgQ8
	Gn47R6A8M+S7gn92JjKVUnMAEf+Q99XQqIN2OqE1JMt0NLsnDuhB6/DuwOyb9Fr5TkQl+4SFtgC8/
	rr/Q2yMOyzH1x/bhUWCxFiKu4DsOSgXv2cEmA9DL5OVDjo/mhDJUYeN94dE7qg0YLM/x59xTZfHer
	pJ4yvdDB5gyHFl3KhQWSWoV2WoHcmed+zRFidDKOl878nQe0HFVbQgl3rLdDLJQ3jPI8sO3uEN81R
	h6NYRLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCiz-0000000GWmP-3GyF;
	Mon, 30 Sep 2024 09:29:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCbI-0000000GUSv-1vli
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 09:21:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1svCb0-0004O1-M0; Mon, 30 Sep 2024 11:21:34 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1svCau-002bBg-7Q; Mon, 30 Sep 2024 11:21:28 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CDE5A346819;
	Mon, 30 Sep 2024 09:21:27 +0000 (UTC)
Date: Mon, 30 Sep 2024 11:21:27 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: support vcc-supply regulator
Message-ID: <20240930-wonderful-wealthy-aardwolf-b455d6-mkl@pengutronix.de>
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
 <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_022152_508290_1E1278C0 
X-CRM114-Status: GOOD (  19.65  )
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
Content-Type: multipart/mixed; boundary="===============5801502757027200119=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5801502757027200119==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwv5x2hdeuwf3seu"
Content-Disposition: inline


--mwv5x2hdeuwf3seu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 30.09.2024 17:22:25, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> SPI NOR flashes needs power supply to work properly. The power supply
> maybe software controllable per board design. So add the support
> for an vcc-supply regulator.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9d6e85bf227b..5249c8b13916 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -17,6 +17,7 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
>  #include <linux/of_platform.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> @@ -3462,6 +3463,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *=
name,
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
> =20
> +	ret =3D devm_regulator_get_enable(dev, "vcc");
> +	if (ret)
> +		return ret;
> +

What happens if the SPI-NOR doesn't have a "vcc" regulator?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--mwv5x2hdeuwf3seu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmb6bZQACgkQKDiiPnot
vG8uiQf8DcseKRoAJiTxjtqWo2GwihpClJ843qTNRLCvPcW/ntH1rv1wiF0NXA4v
jtGOLCiSHCVHx5gV68zWvJTmT9ZeQ3O4z24KHsr7IF5Cbf9TOwq1YZCHXqFn4bOy
71CJ1ApXb776przvR2Foy9H33h8I5r+LUUIppdWo0IebOHVf4Ry+pDmEzffqS0Iu
HyCMaAo8x+q+t95WPWooRjlUmShpCQapdzRmNYtw5uxYtPSQ7r0HycSeIMZ6bsip
hHhkKwNeOSDZmeJwdPBXf2dwD4WcF6aIMe3O1MVZcHUIVNW/0V5FHjaAKCW/S26t
VrBSNtv3Sl8BilQiuIoQhYHm4PjLrw==
=LL2n
-----END PGP SIGNATURE-----

--mwv5x2hdeuwf3seu--


--===============5801502757027200119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5801502757027200119==--

