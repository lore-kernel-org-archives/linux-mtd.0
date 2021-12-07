Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9691BC4321E
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AQELSO6804gjDu5mo7yNoIeKp0aSIJ6hya+4eTq604=; b=hG+U9yLNTuvmJCGlBsvHv+FYg3
	DFqD0o1fmP0FkZv47PomblmipXtiqNrk5/frFP3WnaZ3DlhrStAHeblhE67R6gsiNeoQxdzwR4Xfa
	VWR/zCJ1yd+KYvUu4lMkKoSBIfItUkqp8y3yEQZbGzZTRhKcQ8+20M6m+uw5ESxs+WiNaM2TXPgeO
	Gp4K7wU2+xy35d/IDIwjBY1KXgV1DAHUFHcAjcppaGjS1vSv21E30WpNa0QigUERd2NyM+hi6b0rO
	azzXKhtR7ZsgrGqlb6yHXpxr+gb4v/VPq3XU28yNApbUbpnHcXyPFy8iEz4VkH5JJslul2wBp6Y5H
	8CzsWWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubuC-0093KE-50; Tue, 07 Dec 2021 14:57:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mubVF-008wmn-M2
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 14:31:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E6340CE1AB3;
 Tue,  7 Dec 2021 14:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950E9C341C1;
 Tue,  7 Dec 2021 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638887490;
 bh=2Bh4lh5Rkbfd222vBGTTXMX5WNUB+LpWa4lBwnCFCk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DUKm/3ZOViVMPj/2iSbnfYwuu6LUpqK1EKt5eWIRgJX17jQchbt+HGore89+qOtWZ
 VLsP4wguNH8jcjCJ+wNCw9FgPorPt2pwgAKtAQxddV579euQjkY+lmD+Zs+sakTKu1
 jndGPhRLP+rrq65xNVohCzLFoHenMcE7zz71mJjx01q2MJ7Xj8Mbyi8hCeQSoAP0i8
 e4ZhUd39Z5Fjd65MHUn2ZooMTHw1YEHHXPz7raS/S8RnQp/Jv9iXS0Or17je5kXvtg
 zO6DBaa1Am2BHFuXyBDxQofq7pNyXzM+ZOvaSh8psUp4acI0zBVfPyVgZRaq1NBeCU
 WGTno7r0a66iA==
Date: Tue, 7 Dec 2021 14:31:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v3 0/3] Stacked/parallel memories bindings
Message-ID: <Ya9wPJRbXU/PPQyE@sirena.org.uk>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <Ya6BNGHhflkXOItV@robh.at.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Ya6BNGHhflkXOItV@robh.at.kernel.org>
X-Cookie: Only God can make random selections.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_063133_942458_BC20E8E9 
X-CRM114-Status: GOOD (  13.78  )
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
Content-Type: multipart/mixed; boundary="===============3495386919568479584=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3495386919568479584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7A/CUCjAopGcjyUx"
Content-Disposition: inline


--7A/CUCjAopGcjyUx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 03:31:32PM -0600, Rob Herring wrote:

> Mark, can you either provide a stable branch with this or apply the=20
> series? Note that there's going to be some other patches needing=20
> spi-peripheral-props.yaml, so providing a branch might be better if you=
=20
> don't want to collect the patches.

I'll apply the series but there's still debate about it so it looks like
there will be further revisions.  Unfortunately the patch is buried in
the middle of history so it's hard to pull out a sensible stable branch,
Linus gets upset about topic branches which makes doing this sort of
thing retroactively painful.

--7A/CUCjAopGcjyUx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGvcDsACgkQJNaLcl1U
h9DvkAf/WNSVex+DPxkrNpBCMq//Q078vBs2gu5YblTGl1/Q+9SZj7itBvS7nhkR
UivBWCuOjGetI9o9Hk2iaMdmOkB+pKMyZrgcNlPG1gN/R5ATuxQbXWpClPD0vieU
ycB/OZkrPm65/8+7W3cnKvjafg1Hp6xsSiJjKSLobR50WqecnA8sc2SemIB4JR2U
7PKBkhK9TJsTrLmAWp43f0oQ6RX5vL537cA8bM8VlalX1L2zCpGfYNB3tzhAQwWe
7vfJqkFJrl0vu6Cr2ai9oVeFfjA8marBUVlAlHzDsaVSoh3FRPXp33QArxm9uTMk
cBICj53P2du8lFyzrfYDBsoRumowAw==
=lecr
-----END PGP SIGNATURE-----

--7A/CUCjAopGcjyUx--


--===============3495386919568479584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3495386919568479584==--

