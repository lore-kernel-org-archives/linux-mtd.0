Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E25D3E785
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Dec 2025 02:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufKiFiBQXNkHu7fpxGAcq2FnVRAsykxPBluM8jVkaeo=; b=x5aW6cBoTgUd96/V75glLqaLgs
	neKIYuAfJHm8ijahDadKT0QSogZC+wTbc/r4R8LtCEvx9WRYn16A2FeL2Fgy1wqryGUFEGOJEiaFv
	fATLo7v19Dzbakc4Xw6PtRf1HZyYV53bDdm9xGOerZqHuQ+cy6jIy8HjWe+APXaL8vBSYG4As9jun
	6sd1EcnahlMoaPqONceFSH8A+/vh5mu5HjKflUpKlxzEoeMdxo1ewUdzjFu9iJIJwdtMkM0me+mzP
	9K4SBMBPO/0RMeZmtcYYO9a2m96b+XGBsuJRW25a9ajrK+zxvPWSNGA2JxhR/0N/DyTYc8Fbk8PuQ
	AHzbyT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTW2A-0000000G6nD-2bh9;
	Thu, 11 Dec 2025 02:03:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTW27-0000000G6n4-1lba
	for linux-mtd@lists.infradead.org;
	Thu, 11 Dec 2025 02:03:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E6F760010;
	Thu, 11 Dec 2025 02:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BF2C113D0;
	Thu, 11 Dec 2025 02:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765418634;
	bh=PfABCHBuQxs6JSsRsLlCjnA2XQqe7tsm9POCd9VldsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdCgnk5f/yQhFt4awJCDYh4BuXejOlOrAgavcyslqy+eYqxRhHLuCmeMX/smAKoGs
	 bIrUF0PVCFcJ31gVxZAC5XAi/Xhn6hRdEqpfv1VxKYOjE0VtubSkFnQDrY0ymoMLhu
	 OHGqCGJNVJLH+BfEK0wvhGQb1PGUb9F3wymnmWL3zigs222SFBvfkP49IvmQ7tgkc+
	 wMXHAA9TKb/NoIbIAQ4wSzst8P7VSYmPxniebSG6WXt1GdhyQk5mE1wCJqeQvQ2JNO
	 Lz36zsXQtH//QZeDvJBLLT0zPcO8/grRmvOrQJ9O8+RFtGSSUydtNcqOcgbdjYQHEh
	 FLhf7qEtp6tVQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B60241ACB974; Thu, 11 Dec 2025 02:03:51 +0000 (GMT)
Date: Thu, 11 Dec 2025 11:03:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <mwalle@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 4/8] spi: spi-mem: Transform the read operation
 template
Message-ID: <aTomh0TJmxn9Raqt@sirena.co.uk>
References: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
 <20251205-winbond-v6-18-rc1-cont-read-v1-4-01bc48631c73@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20251205-winbond-v6-18-rc1-cont-read-v1-4-01bc48631c73@bootlin.com>
X-Cookie: It's clever, but is it art?
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
Content-Type: multipart/mixed; boundary="===============9108965407979987685=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9108965407979987685==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sH0fLPh9o6r8ZzpK"
Content-Disposition: inline


--sH0fLPh9o6r8ZzpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2025 at 08:38:55PM +0100, Miquel Raynal wrote:
> As of now, we only use a single operation template when creating SPI
> memory direct mappings. With the idea to extend this possibility to 2,
> rename the template to reflect that we are currently setting the
> "primary" operation, and create a pointer in the same structure to point
> to it.
>=20
> From a user point of view, the op_tmpl name remains but becomes a
> pointer, leading to minor changes in both the SPI NAND and SPI NOR
> cores.
>=20
> There is no functional change.

Acked-by: Mark Brown <broonie@kernel.org>

--sH0fLPh9o6r8ZzpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk6JoYACgkQJNaLcl1U
h9Apggf+NLpfrOuDb9NLagToe5Ui9BBZrHFDahLhw6zxtnGzhcm/Le9SGK5MvTP8
5s3yAC7PKp/BraqVV8YKlWFbM3CsK4f2ml2KeZn9ndKUHOz10T1KhLx5p5mTpilI
Q6B4QPICU/Jp5sE1cE/j1bDGKYQZrP37MwCjRjn5HNI81ieAjEqaq5Q0U/PXeQCC
iQTavX3bnrFCBkUF1U+TVgEaR5/6iWIm2cHNvuLXzTHibRrFRUZ6+lKnilRgi+3H
gziVWO2WJANC1H86tDTL8KP+GqP4UrADZSjLPuiBdzaSOKGJMD31/RuRiB4rP8AN
p5EmiusQeqr8ha0cucrC5v5vLq9wlg==
=hBGJ
-----END PGP SIGNATURE-----

--sH0fLPh9o6r8ZzpK--


--===============9108965407979987685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9108965407979987685==--

