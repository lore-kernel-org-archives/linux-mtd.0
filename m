Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7901CCCF9E0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mTI30Kf8bkQk0f1oEpvDxyZIhp1ynwB6DpHFzil4Wo=; b=Cvy2yhm6jaPuq7fFJXq6W6Q1vT
	HtKVj22BSROIaDfu95ftZ/R5zmkjsxJu4O6HGWy3E4e+fRiZN7u8mFkzMSVt0zjpcOE0g2SFwcxpA
	8AfSMSWFgUDmtkcYW9JPQAv9VYUbelJJJpE2NZS5j8M1TKVGf+ZN9pv2z73pDKHEhFSiTh5X4UwLb
	NpNhyoA/iGBM1MBTCAEp1IaQ0N/kFJwBQIjEL6FopSZNgK2H+jUpEFwmF2nnlQo/lF63oR+YCyHF1
	tgRW1FDkFII1xjpRWfkb0ZUTN6k5SczQEVAsVpo7lP6x14hpRW3ExnniqFm8e67S3w3Q8RPsw9kc+
	glWfu8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCRAZ-0000000Aeem-0ave;
	Fri, 24 Oct 2025 23:26:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCRAW-0000000AeeE-41Xo;
	Fri, 24 Oct 2025 23:26:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761348284; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nUSq+eGpPsWaOR2huttk+9os9TV0P/OuWHFU6NnStHxF37O90E8m9egYW7m1k9Jw1NDIuz920n2tYs6WsuQCY/FCbIy00JDocA5vgUkzeHx04qDvThfwm7StoW5jgEQv+/v+lzoSjZEOm6vdG7tZnK+ELXs4V+k/MdWn1mB2XKw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761348284; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TolhaGIsyaj1gVoV8dHb9QimZIX1Tzw1zXYiEcETqjM=; 
	b=A0dwAGofwe57t5FVZfHNsR7hNx84shoXZdrMW+KqP5m6oqZVC/8lLB1VIQXdxKVfuw165b/NdIOMZprW781T0fm1CLLhZzq9+XgJc70yZ+Id+45Bb1dioiPOt9j1MeAJe4g90yq6L9nEWurG4zqI4WaQtSbzMASjQyorgDXu2bw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761348284;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=TolhaGIsyaj1gVoV8dHb9QimZIX1Tzw1zXYiEcETqjM=;
	b=ht97i7wAjMxWf17LAhpwrdlIDowY69CmFDI+cWK1dCeICyT7kM2V2Nfzc0bUF3IT
	cx7FDF0TNsOaG1Zy3zhRAk9YI53YYXgS12j/In+L0DpM82WJJfQx9v3atR58D4QsPB+
	X9mS+B6EX81ORNLumUxqPRhox7C2rKGQrWzj3yhc=
Received: by mx.zohomail.com with SMTPS id 1761348279897500.52128589096606;
	Fri, 24 Oct 2025 16:24:39 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 476FE181935; Sat, 25 Oct 2025 01:24:06 +0200 (CEST)
Date: Sat, 25 Oct 2025 01:24:06 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Georgi Djakov <djakov@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <god73pukywwznfyym7tym6m5k6fn3u7hwzj5gwhrxytt7oinfv@pokb4aos7pp6>
References: <20251023143957.2899600-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/261.330.82
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_162601_037896_27C7A043 
X-CRM114-Status: GOOD (  11.83  )
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
Content-Type: multipart/mixed; boundary="===============2784216910907742458=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2784216910907742458==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uianbie6i5kbvu2"
Content-Disposition: inline


--4uianbie6i5kbvu2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
MIME-Version: 1.0

Hi,

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/power/supply/mt6360_charger.yaml     | 1 -
>  .../bindings/power/supply/stericsson,ab8500-charger.yaml     | 1 -

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--4uianbie6i5kbvu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmj8CpEACgkQ2O7X88g7
+pqEIQ//WxlORWTU9xe37JxSV9323KQXYJPU3wtmtK4U8OlNGoVKu9XeR3w5pitG
uy2cIzo80EdVMKsq5GKcONqwht31w9+RJaWZmytnll9Wbe3eiW3Lu6Ymx2zopgcW
OoRuaiPPQUqGdgt7+VKgNt+4kH1sX/ur8z/Zd1rUrK9Xkks09pdqcZ/wpjm6KlQw
e7x03OaDQ5h17Cg56SgH7NwoYjoUXDuSEKoZDx4wv5DQWh171Ez0/tWvYwYxM7+a
Pxqt+zTDC1hdh6j1CaiOuwNb7pbdfcOWS7WZC8BPHNYW3eqFk5OQg+tZwEgoK9zV
GLO0FrPPimJLgL2mfnq5FP0SzYU7FNgJD6gD/qKPzjsQlFLnwn69QCH/nTA9J/ZT
ajcxgv6FLs3R3CGRptDBEUPOXez3dJeMeaN7hNeoswZNAe9uw1irXmedEzxLDO7S
8WDVz6MvUAXOdXEcI+pUvuYfGWPwuJHspOgPuOwzO2sqg212V3sScOGcATq2BTDD
mpc8LtRdKoZ3vUS9cVLRxtqLo8YB5roCBg0HEOexrwJayA074TSteqXhF2LH7LOW
IcSZ37y+8QgWjTO2aXsiLJjoK2PsOLnvKzBRD5aeLhMd4H1Lw1xCxi75ut/fJPUY
MLaS7WMtq7TVMRxBrjz8kaiR4opj84mVIXbVgoiISYooEKbbdic=
=pPcb
-----END PGP SIGNATURE-----

--4uianbie6i5kbvu2--


--===============2784216910907742458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2784216910907742458==--

