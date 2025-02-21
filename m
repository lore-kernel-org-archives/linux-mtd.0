Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E7C021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGPQR7cc94B8ndb0NyQ6kkiK4zsI+NGaXub46kB5kuU=; b=zzZwOrEv/mpfmu6j2nHGRIWGZM
	us0A/0kjw2iUjLVdTSQZMCgTCppFdAbRTOKRxd8+8ZRJ9PXWzDbcCKe54mDhqU4BOKQTlVdgZK+I9
	UVcH6Nm7hPiIetgT4lbep1SwzBi7EGIeEwzm+E21zWxyuHNad4BnYlPJYyYK4aPRRPltBCZsVShT5
	LP6NgfUGtd4cXFt7SKwIDN8UO2E6ES93TSJ+rtOVAbK5Oh8hdkQ/kroNsxdPpguyeDxtQZQq7wt+W
	ae9bNo6kz2TRzIm03BawyN1DuEDWkxPcXqX2/qXD36AHBAeY+WNdGE/ccuR3P4v+hLRMRHSRV2/sX
	UH3c4OGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXE4-00000006RLs-2Zk5;
	Fri, 21 Feb 2025 17:54:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXE2-00000006RLT-1PFy
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 17:54:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 350F75C6C79;
	Fri, 21 Feb 2025 17:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1C9C4CEE7;
	Fri, 21 Feb 2025 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740160449;
	bh=iTjPEItd97Y8rmwDpLAK0xUiIP9tO+c3V61O1uEFrUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYtA0MrlTajR2Ta6Jh6TzgAQrqZzSvcyNbCmlHvL9MOm7OeSjiXKQOMrpmoLpMWbq
	 ELruEw3iUfn1VCpYY7Edcu6dHsS0dqeLpPK2dcPxQ/8OCKGTRD3jK0QgbB5W5sX7oV
	 ZLjnO3QQyv4xwuXg3NtF98z/XtnEm1T2VRS2gQe3reiqSW00KmGdZHgDV11KWfpXJ3
	 hYhkY5hPjlcOZz+8ug8Y1bwYzk1rkgl/aPGBPEjeCdMnu2OAqSLRncGlQnExaEv6fN
	 2+jMc1N1+KbS2IpW7svxgo4o+QSjZoEe2iIrWUmUTZFl/NU9as4QYVv7SKMpKZEoih
	 0PZq2InIjBTiw==
Date: Fri, 21 Feb 2025 17:54:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: mtd: mxc-nand: Document fsl,imx31-nand
Message-ID: <20250221-unloader-fanatic-c7ad3eee4f38@spud>
References: <20250220125812.2370056-1-festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250220125812.2370056-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_095410_413721_66A6E39D 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: multipart/mixed; boundary="===============7229849911028613383=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7229849911028613383==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ysC56cTDtLbmiSx7"
Content-Disposition: inline


--ysC56cTDtLbmiSx7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 09:58:12AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> imx31.dtsi uses the following NAND compatible:
>    =20
> compatible =3D "fsl,imx31-nand", "fsl,imx27-nand";
>    =20
> Document 'fsl,imx31-nand' to fix the following dt-schema warning:
>    =20
> compatible: ['fsl,imx31-nand', 'fsl,imx27-nand'] is too long
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ysC56cTDtLbmiSx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7i9vQAKCRB4tDGHoIJi
0qsEAQCzFewYbcKURnLdC1rP8RYwtaahu1pRa2W/G5QKSF3NygEAlBe5X08ObEk0
q+g99jSHlsWd2NNtCZkRoGNdMbi+VAE=
=LgvR
-----END PGP SIGNATURE-----

--ysC56cTDtLbmiSx7--


--===============7229849911028613383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7229849911028613383==--

