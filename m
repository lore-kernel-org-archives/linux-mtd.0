Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0CCC48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 18:28:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A953205F4
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 18:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RdAoGm6k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hR15WHn5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A953205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hr8EvT3WZFAPM0R5IQ9q9qAntMNkr1XByWgva7Z5+5s=; b=RdAoGm6kw46mQxkS5p3FVjshX
	Iuibbs2T6Qg5bGvpLgUK9k4wklo1OeEulp2Qi7cGFo3ubBlbM/N03BM2rhSqO984vStPmrMbsSI68
	WR3175Yxf23B04jdFp6jKvOMzWNtF2i4/hKM7siIgWnkfd26gJenFvRAZtXVBG8vAdnON1K92dwut
	vyKmDMrXFhARqUidCQwQUccN7k+pxk19OIUCu14WGfqAD6GFUoEz1SF2y3xaUSEgyuDFPy1JhHlKF
	MZjCaL25Ccjtd6IuH124sKFe3PXuIw2m5auIbzFKUtHy+WH9t+CqMqb7Cr96cPYAyyG8s8MVMpZyt
	9iqkvO+tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgZ8Q-00010U-P8; Thu, 27 Jun 2019 18:28:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgZ88-0000ke-JU; Thu, 27 Jun 2019 18:28:22 +0000
Received: from earth.universe (unknown [185.62.205.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D92F205F4;
 Thu, 27 Jun 2019 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561660100;
 bh=taqyQ1APEgX+EVCAzATmMcA2vqF2xWfz1x10hWSRsgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hR15WHn5VGnYjJBJF3P3KfFz2mIU6gWMdyBW1J9JfNrAe3Wkox4nvnMreFyFc8Oga
 gHHKlRxzScRITQpZl1lYB4jheGTy3CTkrWujVUNozMy3/DQtRu1+16z5GQ7OQZL9gE
 dfQ26EIv4VN+fxjVF3qFiQDlpLL05BiHlURmYc7g=
Received: by earth.universe (Postfix, from userid 1000)
 id 66ADF3C08D5; Thu, 27 Jun 2019 20:28:17 +0200 (CEST)
Date: Thu, 27 Jun 2019 20:28:17 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 00/34] treewide: simplify getting the adapter of an I2C
 client
Message-ID: <20190627182817.5vrfmuzn7kanvtwu@earth.universe>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_112820_681334_578FF114 
X-CRM114-Status: GOOD (  16.09  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devel@driverdev.osuosl.org, linux-rtc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============4879671364160115443=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4879671364160115443==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dtrjmbi6re7vojrt"
Content-Disposition: inline


--dtrjmbi6re7vojrt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 08, 2019 at 12:55:39PM +0200, Wolfram Sang wrote:
> While preparing a refactoring series, I noticed that some drivers use a
> complicated way of determining the adapter of a client. The easy way is
> to use the intended pointer: client->adapter
>=20
> These drivers do:
> 	to_i2c_adapter(client->dev.parent);
>=20
> The I2C core populates the parent pointer as:
> 	client->dev.parent =3D &client->adapter->dev;
>=20
> Now take into consideration that
> 	to_i2c_adapter(&adapter->dev);
>=20
> is a complicated way of saying 'adapter', then we can even formally
> prove that the complicated expression can be simplified by using
> client->adapter.
>=20
> The conversion was done using a coccinelle script with some manual
> indentation fixes applied on top.
>=20
> To avoid a brown paper bag mistake, I double checked this on a Renesas
> Salvator-XS board (R-Car M3N) and verified both expression result in the
> same pointer. Other than that, the series is only build tested.
>=20
> A branch can be found here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/no_to_ada=
pter
>=20
> Please apply the patches to the individual subsystem trees. There are no
> dependencies.
>=20
> Thanks and kind regards,
>=20
>    Wolfram

Thanks, I queued the patches prefixed with "power: supply: [...]".

-- Sebastian

> Wolfram Sang (34):
>   clk: clk-cdce706: simplify getting the adapter of a client
>   gpu: drm: bridge: sii9234: simplify getting the adapter of a client
>   iio: light: bh1780: simplify getting the adapter of a client
>   leds: leds-pca955x: simplify getting the adapter of a client
>   leds: leds-tca6507: simplify getting the adapter of a client
>   media: i2c: ak881x: simplify getting the adapter of a client
>   media: i2c: mt9m001: simplify getting the adapter of a client
>   media: i2c: mt9m111: simplify getting the adapter of a client
>   media: i2c: mt9p031: simplify getting the adapter of a client
>   media: i2c: ov2640: simplify getting the adapter of a client
>   media: i2c: tw9910: simplify getting the adapter of a client
>   misc: fsa9480: simplify getting the adapter of a client
>   misc: isl29003: simplify getting the adapter of a client
>   misc: tsl2550: simplify getting the adapter of a client
>   mtd: maps: pismo: simplify getting the adapter of a client
>   power: supply: bq24190_charger: simplify getting the adapter of a client
>   power: supply: bq24257_charger: simplify getting the adapter of a client
>   power: supply: bq25890_charger: simplify getting the adapter of a client
>   power: supply: max14656_charger_detector: simplify getting the adapter
>     of a client
>   power: supply: max17040_battery: simplify getting the adapter of a clie=
nt
>   power: supply: max17042_battery: simplify getting the adapter of a clie=
nt
>   power: supply: rt5033_battery: simplify getting the adapter of a client
>   power: supply: rt9455_charger: simplify getting the adapter of a client
>   power: supply: sbs-manager: simplify getting the adapter of a client
>   regulator: max8952: simplify getting the adapter of a client
>   rtc: fm3130: simplify getting the adapter of a client
>   rtc: m41t80: simplify getting the adapter of a client
>   rtc: rv8803: simplify getting the adapter of a client
>   rtc: rx8010: simplify getting the adapter of a client
>   rtc: rx8025: simplify getting the adapter of a client
>   staging: media: soc_camera: imx074: simplify getting the adapter of a c=
lient
>   staging: media: soc_camera: mt9t031: simplify getting the adapter of a =
client
>   staging: media: soc_camera: soc_mt9v022: simplify getting the adapter
>     of a client
>   usb: typec: tcpm: fusb302: simplify getting the adapter of a client
>=20
>  drivers/clk/clk-cdce706.c                        | 2 +-
>  drivers/gpu/drm/bridge/sii9234.c                 | 4 ++--
>  drivers/iio/light/bh1780.c                       | 2 +-
>  drivers/leds/leds-pca955x.c                      | 2 +-
>  drivers/leds/leds-tca6507.c                      | 2 +-
>  drivers/media/i2c/ak881x.c                       | 2 +-
>  drivers/media/i2c/mt9m001.c                      | 2 +-
>  drivers/media/i2c/mt9m111.c                      | 2 +-
>  drivers/media/i2c/mt9p031.c                      | 2 +-
>  drivers/media/i2c/ov2640.c                       | 2 +-
>  drivers/media/i2c/tw9910.c                       | 3 +--
>  drivers/misc/fsa9480.c                           | 2 +-
>  drivers/misc/isl29003.c                          | 2 +-
>  drivers/misc/tsl2550.c                           | 2 +-
>  drivers/mtd/maps/pismo.c                         | 2 +-
>  drivers/power/supply/bq24190_charger.c           | 2 +-
>  drivers/power/supply/bq24257_charger.c           | 2 +-
>  drivers/power/supply/bq25890_charger.c           | 2 +-
>  drivers/power/supply/max14656_charger_detector.c | 2 +-
>  drivers/power/supply/max17040_battery.c          | 2 +-
>  drivers/power/supply/max17042_battery.c          | 2 +-
>  drivers/power/supply/rt5033_battery.c            | 2 +-
>  drivers/power/supply/rt9455_charger.c            | 2 +-
>  drivers/power/supply/sbs-manager.c               | 2 +-
>  drivers/regulator/max8952.c                      | 2 +-
>  drivers/rtc/rtc-fm3130.c                         | 8 +++-----
>  drivers/rtc/rtc-m41t80.c                         | 2 +-
>  drivers/rtc/rtc-rv8803.c                         | 2 +-
>  drivers/rtc/rtc-rx8010.c                         | 2 +-
>  drivers/rtc/rtc-rx8025.c                         | 2 +-
>  drivers/staging/media/soc_camera/imx074.c        | 2 +-
>  drivers/staging/media/soc_camera/mt9t031.c       | 2 +-
>  drivers/staging/media/soc_camera/soc_mt9v022.c   | 2 +-
>  drivers/usb/typec/tcpm/fusb302.c                 | 3 +--
>  34 files changed, 37 insertions(+), 41 deletions(-)
>=20
> --=20
> 2.19.1
>=20

--dtrjmbi6re7vojrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0VCsEACgkQ2O7X88g7
+poEpxAAm77/GZ4czva5lDqclyAk1YfbiV55qi+jow32xQwZ17FXo8Ch9G11Qrwl
famQPiB/pD3r3m2TfihhFAcFjOGiwl9GxQJ+4at64Atab2w5BWh9zwDQWdtT80jF
3ytFncogbL36MVBgIv5YQUZQiqIiZlUei6lTOnnyfv3PLtvNVbIodxSVYp5qJWMy
M+qrdy6tAVsuK6yqAwPRhfjBzlmlLZVudUZqbAWKMbK1YBt0rkkSNw9xpF1pLrv6
zLbGdmBngoivDyNJldn+5bhMiwsDyxf/8E7eblcAMkO/D1oPrb51zV92FFX7qyzT
eI5KRHwY88XkUuIK25aDnO1bR3eDn3RDcxtW8MMMeRihWX3gNSL+hKZ24XGxOgz5
L3tL9nm6X6sHg867+V5voAxNACnbgFT/Mrzhal4HGbN8adctDoaSEuiMPAQlAkEG
PbW3c2B0n+Bav3XksRT4h19t7drSk4a3aR04I/GHc3l9jDQicnDr4DwiVaPpd1UF
gpPhBXgO4NSZr5yUEzoVOSOsW6WS2k5SFV+sQjU1C5R+oXBH59J9oIMlOOaNKo0w
rTXxOtxQ38vqyMiQZBLwoTh1remxiOBp+5lwmYWGWYpBDVcr9HB+kzNJPFxDVk5A
YgiEzXje0LsgjUBgpmiq5YPAmsNIntDezydWTc20Otk1+Vgotgo=
=CJhg
-----END PGP SIGNATURE-----

--dtrjmbi6re7vojrt--


--===============4879671364160115443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4879671364160115443==--

