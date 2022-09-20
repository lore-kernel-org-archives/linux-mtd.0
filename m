Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AA8C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OmjqLZiCBAxvcTqxoGlFdDC+BetXy/MARYJLBZz3Gs=; b=TVwPG44rbAWNV+EgyP9falK9W0
	vreRtKKYAlLGLwghjdhjeKW5ZHwjX9yuqB8Ekxeu0DrSC7fu5QI+DMs4FzAhfaFSKcegQJu1uWVSP
	c2REXgd8tONMczxpTcmZJhrcRjir6t4m7+QOUJScEfnlQS43myfldZDXLQ4VfZfMo5jI7VzsHE9Yu
	udqs1uqoS8PBQAI+S5bPMV/El+2JD4fHYtIFUxthsjpesXMDyBy/Lp6KyZgzE0byETVz2pbm1pDT2
	UReSeH+UPEajt1ehUWMRs8q0tN9AnyiY77YU4WYNfRUX++QMxtr31dVdtuv8oN05BpQFobS5LQZoi
	p5d584nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWeT-000x49-4U; Tue, 20 Sep 2022 06:22:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWeL-000x18-8n
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 06:22:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaWds-0002p0-9V; Tue, 20 Sep 2022 08:22:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaWdm-001o8d-IJ; Tue, 20 Sep 2022 08:21:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaWdk-0028nS-97; Tue, 20 Sep 2022 08:21:52 +0200
Date: Tue, 20 Sep 2022 08:21:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: kever.yang@rock-chips.com, sjg@chromium.org, philipp.tomsich@vrull.eu,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de, ulf.hansson@linaro.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
	thierry.reding@gmail.com, gregkh@linuxfoundation.org,
	broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
	zhangqing@rock-chips.com, jamie@jamieiles.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v1 03/11] dt-bindings: pwm: rockchip: add
 rockchip,rk3128-pwm
Message-ID: <20220920062149.o6gdhsh7bk5rl4ah@pengutronix.de>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_232229_318403_A929556C 
X-CRM114-Status: GOOD (  10.39  )
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
Content-Type: multipart/mixed; boundary="===============5273051038175887646=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5273051038175887646==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kd7xret2mae2a4ju"
Content-Disposition: inline


--kd7xret2mae2a4ju
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Sep 10, 2022 at 12:02:22AM +0200, Johan Jonker wrote:
> Add rockchip,rk3128-pwm compatible string.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Is the expectation that this goes in via PWM, or together with the other
patches via the rockchip maintainers?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kd7xret2mae2a4ju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMpW/oACgkQwfwUeK3K
7Ak6lQf+JJwJnr0ZyiY3Or6brzs797WF7GXUAFlXmkUFkhGzHm5kW2EBe5r0eYXK
6JDJ9MIUXRJvfRMXB0q1REypyJTbfcS78DyhtcyYM89rpXqxBp76jgDUf9Rs2H+z
fwUffgfMkkQk6ojMNmH6zeOALRizKrYFAmvWQAWndiOJLNeOAtcDF5PnfM+i2xer
mPTOt7VjkfcG8CKYIp12F7V/aizP9olhrAvGVZKk+bkLNUfSGmkqQcYCaHr7xDaj
aXtjRhrJzjBtQrq55OSMM5moBXnlWsTQGRxSeNpQO3wHAIbLadUooB4E717L9fut
q4vUk4zN179x3cEVOMDAV6ZtGl0BIQ==
=pI/x
-----END PGP SIGNATURE-----

--kd7xret2mae2a4ju--


--===============5273051038175887646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5273051038175887646==--

