Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4F0C5CFC1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUiClj2/rmFxQX+TCXERL/bOBRkzzK+81L1kg3XO4bc=; b=up0Dvx/5CalDEdii3toL4Ov3gI
	OtcdQNv//51JnzSrb5TFIHlhu3upTsLSFtBzd2DYocG6J7Aqm0GwU6r6DjoKg4FuISW9OliiloVVg
	S2OW3y4GsedcHhHc9+oQDmjN5HyUDlNjq26Z8DNqccAA3gf7P4wKJfaQxVm+gbh+l9jMton3SE3LG
	RoLo5NLpsX5RNLuXdGL6Mfk/RE9EDAEEZdolzdJR9jbDA+EH4/oL287hBgKEc1HhLnsK+4B/6PgXd
	j9T18l1FxH8DrURjfaPXxluOOysls7nCQG/qwyDcPlGCXGzeFb+/WZeYI9/hrMz83IZXKOdsSu+6Z
	DxKgpZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoUq-00000002QuT-0FgR;
	Fri, 14 Aug 2026 09:46:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoUo-00000002QtQ-2Au2;
	Fri, 14 Aug 2026 09:46:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 33E734357A;
	Fri, 14 Aug 2026 09:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 890321F000E9;
	Fri, 14 Aug 2026 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700798;
	bh=KPg8nILUcOooqlBYT8gSbRBkSFUAig//QvA2dFcQs9E=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=OoyYCZhovfVfwLEBh1P8QJ08ZdIQuVp9B3+bg6n3fdLTVpjkNeTux1fr+SAZeozkw
	 NKtluWWONlhHdev/1bXs5NWxVfgT2CiygN+2nKcZ5nPfRL798Jpq40gZMRD52aW0TQ
	 jrwacuYdHsqsgC4qZfGULVdCMFmDiEfzEDA9s3SJ4ZDu2dM1Uqjw6l1LEeJ0BW7m2V
	 xCbe2Y+oesaf8qAlujQWEHI9Ji0oTG/GdTIXixzLXnWkD2Ddmwqw1ULWY6RdtO7/mI
	 Gch1NGITt0oNSPk+gLlNCUgjbrhVkZ5auJ2ld+lJLOjPvoHPA1ZXIOEVScQSnJbK75
	 MomlPbZ2Xqqog==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:46:34 +0200
Message-Id: <DKOKKLO117YI.2IPV0PKS6CVRE@kernel.org>
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 09/23] mtd: spi-nor: winbond: Add support for
 W25Q32RV-Q/N
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-9-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-9-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============3952936708290032201=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3952936708290032201==
Content-Type: multipart/signed;
 boundary=f335931778a6064751da4e78495df9e32cacdc8b42157fcea702eb3bb32b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f335931778a6064751da4e78495df9e32cacdc8b42157fcea702eb3bb32b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>


--f335931778a6064751da4e78495df9e32cacdc8b42157fcea702eb3bb32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7j+hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jYbQF/TlNR5jmMAcwBFgrD65LTnNg2qfV4cgd7
sSkbOdDlnSLIK+BeoaAbR86FYl5gcLpCAX4k6yZ9bp5elJBfReMrm1P9Xdh0CEiJ
05jGwFtBCW/DsXwizrF5Jswovtk114ijAUw=
=TL/8
-----END PGP SIGNATURE-----

--f335931778a6064751da4e78495df9e32cacdc8b42157fcea702eb3bb32b--


--===============3952936708290032201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3952936708290032201==--

