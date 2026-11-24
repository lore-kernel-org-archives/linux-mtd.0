Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3A606A323
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sfxVUBmB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N23fKN+U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xNDFYt/NBgis41E13Xeu/zWJ9MTEXw4/Zj58aCq6ykM=; b=sfxVUBmBxN+nQD3KdeTBv/eupu
	ZeGX+HjdBwZs+L5Ij9vxKOovfiUxjoEZsSTNzF0ntAGDCiqK6WYro4epcil4oQYBVoRkCa7RUt8ss
	IRdCuDON8PkxtPV0aOojf/iedOxCFJqJ179CNdt5BuWVyoAl3ZLL5w3BGGC6gV74rLsC49Mm1PIt1
	O0zaMdVvu7tRUhGSAEpvADJcv2ReyVCBpf3VocrSkKj/NXBeqZQEo+iak+wR9ZzdeNydWosHTlmVw
	V9m7I/3/GdLaLwNU4eKO6OsPNVIIQcqUWLfw0tLNK+V15xd52vQ4+eB267IP/FUcgM1LJGdM0mLJC
	oZEo91vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsRz-00000006teb-2nZN;
	Tue, 24 Nov 2026 15:28:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsRz-00000006teH-1Cvx
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 15:28:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DC29408ED;
	Tue, 24 Nov 2026 15:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD241F000D8;
	Tue, 24 Nov 2026 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795534134;
	bh=woN7dX42/QEfdHkXNoIkI+sOdH5SgWjgz+68nCPxUF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N23fKN+UzfLec8SkLRYPloYVrCpUpgQDmrteL/rHwsXMg5ePevTG9rFJAyCjzpJdM
	 ko34az+IIQKOPrrg4I3XddletoDrTQzOto5FdKS1kBVNhoNHWVZS030hkgAAL6skOA
	 ceN8wsSb+BWU+go6T79jTVaWh48TL6gzi5L3Ht7N0Ah7exHeFj6yIFTf+QVbb0OBhy
	 8+9zgucJBvBS9vFoqR2pwq12Ue6dLM4mcrEIvCUlvvzt52/nVz0WyXfsuXyElU/szH
	 D7YUqECRpg2opFv0dMkxhc9o19DYqiSeshFpJ6FxuI+nZC3C06NPzuxpRllTHWfxaI
	 d70nKxM/yk9+A==
Date: Tue, 24 Nov 2026 15:28:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com,
	u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: spi: Document the spi-dqs-not-wired
 property
Message-ID: <815ecaec-7bf6-4ba4-9869-f54f1c85a7e1@sirena.org.uk>
References: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
 <20261124-winbond-nand-next-phy-tuning-v5-3-261e0e712857@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261124-winbond-nand-next-phy-tuning-v5-3-261e0e712857@bootlin.com>
X-Cookie: If you can read this, you're too close.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8117571908936895814=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============8117571908936895814==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axoJEjM2GoVi6XeC"
Content-Disposition: inline


--axoJEjM2GoVi6XeC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2026 at 03:43:04PM +0100, Miquel Raynal wrote:
> The DQS line is a data strobe line that is typically driven by flash
> memories (NOR and NAND) when the data flows from the peripheral to the
> host controller when running at high frequencies in order for the data
> bits to be sampled by the host at the right moment. The SPI bus already
> features a clock but this clock is driven by the host, which means it is
> not accounting for any chip internal delay.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--axoJEjM2GoVi6XeC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFrS8ACgkQJNaLcl1U
h9AAwgf9HaTs4e2f/UrGLH8UQ9/Led6UPT1G6vWCeWG/AZe7BGOlHv50yqXp63CB
Js0Xzt0NyXgDTeAcRxJpZxb/p452QHyO+WMdkt6rBpvj96wgdCOjzNSDoGmVl4fL
CYom+nMAVJOtZhcanmuPCjgVoDAosfm/WIc04Io6XXfp248irSd/bhABH5pSRIrf
UN3n/BZILy5VaG7rFcb2RRC/IYETPnNZ3fFFeurH5j6XXi21IQwpibLxcF7yAMag
DWKaEElYsF7cTHqu+zmbvRpaj3kOsMschPqwNPoGxxM3QxZl1p0CkTwBEwrr/HSq
s3Q8w87hREg8NskKRUEl/d0EIzEg4w==
=el/G
-----END PGP SIGNATURE-----

--axoJEjM2GoVi6XeC--


--===============8117571908936895814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8117571908936895814==--

