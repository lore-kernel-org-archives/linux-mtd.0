Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27D4CD98ED
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2026 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOiz9T/RgU6a/mpQ9dKa4Q3u5cMkUKTwRuYn+RsTn4Q=; b=MhSiG48Johk+E17zZAyjCKYQ+H
	inaFLqPe4oXk1frYu5+FTFHJdJ5My7jb/5XCQSCH00yj7oG5b1F9QaTNfpqCX1k1LyAZCW7ocCg+6
	I8H0nnZT0PKaxAHHRnQT9oFEhB9Keu1Y+xBHPTDZQYtj0qrOrPyM+XEZypoGUbWcrnH2eVUa/w794
	ua8UKZqEUmfDRMIXXeU9QghQqz8k55w9lhx44mO1ykGOcU05h76bSZsdiMyNKgHlLj8U8bgH1DQX6
	jW0avgumbTIT7+E7mcO9Ox2XM+VGm3LJh5eBzum5On8vqFyceu6HWG9fUS3FgDDCJ8D8aYLg58FqO
	7bBt4h+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFjA-00000001aeb-47oe;
	Thu, 18 Jun 2026 16:36:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFj8-00000001aeE-0mWR
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jun 2026 16:36:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E6CB60018;
	Thu, 18 Jun 2026 16:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1031E1F000E9;
	Thu, 18 Jun 2026 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781800585;
	bh=pNo4inQ1HPMdHcCit/SJJC2T4x0ZyR3LSIF0xWW0QGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KYMKz2wDPf552LK5H8v9S2MzILXeSAYoIlf5k6L6DyANrMx7fgaGr/zmjThn0S8MI
	 bpcTX1EvuLY1dLDM2kd119113yoyN1y4hcaNm7vRJUR+f12gTCQJPMoMWkLPUe9blW
	 k0UAoal/iDAG4OHlkL9fJDXwTErGbsehnMyXjVSHpIEAUsuZqj+yb+V8F8VH8emfbT
	 77tx1867YYMlwYH9D+AlyA+xEsKyd02HM7wu7oIFDEXHnwTPjYtI/yxH+tfEOVV1L2
	 I+JqJThHUUQ5D5ZOQCAp1WG0uwwib6rDEABRVppB4UHXXms/eTGaBrTLcZxSCoJ0ZO
	 SN4AX3zuQtftA==
Date: Thu, 18 Jun 2026 17:36:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org,
	takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com,
	a-dutta@ti.com
Subject: Re: [PATCH v4 01/16] spi: dt-bindings: add
 spi-max-post-config-frequency property
Message-ID: <20260618-riveter-hazard-5b0dfeda7e04@spud>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-2-s-k6@ti.com>
MIME-Version: 1.0
In-Reply-To: <20260618073725.84733-2-s-k6@ti.com>
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
Content-Type: multipart/mixed; boundary="===============2091375503289979806=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2091375503289979806==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GBf06EHIMH3rRyMj"
Content-Disposition: inline


--GBf06EHIMH3rRyMj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 01:07:10PM +0530, Santhosh Kumar K wrote:
> Add spi-max-post-config-frequency, a generic uint32 property for SPI
> peripherals that support two distinct clock rates: a conservative rate
> always reachable without controller configuration, and a higher rate
> reachable only after controller-side configuration such as PHY tuning.
>=20
> When both properties are present, spi-max-frequency gives the
> conservative pre-configuration rate and spi-max-post-config-frequency
> gives the higher post-configuration target.
>=20
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--GBf06EHIMH3rRyMj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajQegAAKCRB4tDGHoIJi
0rHJAQDTSDQAP+yn2wdIJbpW0y4J4gyuHtgDq+SJTys3pJjtbQD/VQBXyA9ykY4u
smszRjjr7E8Jlx4qYtMrAp7eAZmCrAc=
=ryPZ
-----END PGP SIGNATURE-----

--GBf06EHIMH3rRyMj--


--===============2091375503289979806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2091375503289979806==--

