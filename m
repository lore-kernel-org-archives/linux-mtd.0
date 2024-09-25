Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A9BC369A9
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 07:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCZTi38uUnzeXJKiTaDfH5k8clVBW7pX2zT5O3Os+34=; b=CxMsXzmOxsc7cY7WhCFsoDI8eV
	oY+TruOd+1XTsEVVHbqRZ4eyUlBxXB2URr9MeP7hIhgzzchYSnuO70W214XuXycg9Xka+RIkAMCOJ
	o5Y4CvLFnA9wLZDVOuiA72QyBcBAkHFlUff53k04z/VlpONcuu5wvX67l02VwGhlDWZ7Zg8zeI04p
	wKq+ewzHsbITE7hEqoTg0KsuiD6QbNMwYVUlv+2FQbp2qhUhn7Wl097NDsDT45JFXWL9iPUqc0mHW
	Y8WxbN404KUKLJXsRXMwZBiMtmb7RQO+7NvYbDVhy40QwurMF+N90wbpPbM22T9s6QOK6BzReYtx7
	FadXGQ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMt9-00000004PjX-2VE9;
	Wed, 25 Sep 2024 07:56:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMnX-00000004OeS-1JGH;
	Wed, 25 Sep 2024 07:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 575145C577E;
	Wed, 25 Sep 2024 07:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7345AC4CEC3;
	Wed, 25 Sep 2024 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727250654;
	bh=nxxHaanGdEKogTdB9FIAntly8bVc3L9IFt63TQjpzQo=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=uqjWPFOEDimRXD2VswrjL3FReC/PLCDYqsdOf0tEbMzGoSb49T3BxZ+aNfyVuIPNr
	 zwj7VzlVOxkZMshIyFkAJW0ZAbTSKbOog8d65DRt1qMVB+lnB1BSigKvB+Do2oyOK+
	 6Bv0dIg53Rf9A6zBWcvT16pSF/BFeWG8SBKlBRpvwlkLyPVVf9xisgpFuZntalK67I
	 J7zxXk38/tEW7UVpu1ltIpuwGTralqeAxijfF74HEHIGLhOUNr22bTPc3spWFsSbt2
	 TjOwMb9Hq92yJ5SPtI6E5kqEy3uEpr6QGqqlI7fFrIjVYbRf5jjMDKIj32dzfnBLzk
	 jl5junbyVtJBQ==
Date: Wed, 25 Sep 2024 09:50:49 +0200
Message-Id: <D4F79677N5I8.2AWKV1VNY66I9@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, "Peng Fan" <peng.fan@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: jedec,spi-nor: add optional
 vcc-supply
X-Mailer: aerc 0.16.0
References: <20240920-spi-v1-0-97f220c2e10c@nxp.com>
 <20240920-spi-v1-1-97f220c2e10c@nxp.com>
In-Reply-To: <20240920-spi-v1-1-97f220c2e10c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_005055_436929_F0C1217C 
X-CRM114-Status: UNSURE (   6.36  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0291262049935804677=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0291262049935804677==
Content-Type: multipart/signed;
 boundary=5f64a94d3cc6264df8dcbd44d202fcc8e6751e4c0113c74b5379b5495cbb;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--5f64a94d3cc6264df8dcbd44d202fcc8e6751e4c0113c74b5379b5495cbb
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

since you respin anyway.

On Fri Sep 20, 2024 at 10:54 AM CEST, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce optional vcc-supply property, spi nor flash needs power supply

SPI NOR flashes

> to work properly. The power supply maybe software controlable per board
> design.

-michael

--5f64a94d3cc6264df8dcbd44d202fcc8e6751e4c0113c74b5379b5495cbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZvPA2hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gBdgF/Ze5wcLf/bJ9ZbddGfrY4S4tcaieVwkWq
eCjlDbkGpkZS6NGXbNfClc/9ulCS7yRmAX9v2Q9vYw6VgR+Voh8/neZZl6UDfe7w
KLbD3jiQOWpYIo1LcAZ91jDRTIxkSVNNVGw=
=8Uvm
-----END PGP SIGNATURE-----

--5f64a94d3cc6264df8dcbd44d202fcc8e6751e4c0113c74b5379b5495cbb--


--===============0291262049935804677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0291262049935804677==--

