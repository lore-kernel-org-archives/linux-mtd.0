Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107BBC7115A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idUtA0zvJGov0bMzJlZZFN2yKun+1Mnb1lw4SicpQYE=; b=XnmqwexS0l/+VYdUFt8LfAk8th
	4ezkY9lOKMgWnyMxL77Tf8MjQhwhuV8783IfexEdvFC8peV893qe5fxMIwhWduJI7Yh902oROP7rY
	qCPLROJDvdVKGYS7Fj4x0+g3lqyu1UyEOEb2ecB3qD9H9fSn1XziJIEJ+vWpek1eQ1SsrFfGTvFkU
	jwqbZW0ckRIpKMEEb84dQ+6wFDpsEIwMoGMlvjgeiRzguriV5N2zdXjZVuht+qadaPo7+BH5lXyS7
	GInlOqsdMJ+C/Ld6QrAm7OADrUG2NFPz1dPZjrKL3Xd5fLBVTqQTnk/67pxt7TeeKvCMbuhf6YQJh
	PYZ8Rayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpR-0000000ARM6-39uL;
	Wed, 18 Jun 2025 14:31:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrqD-0000000A6xn-1eJN
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 12:24:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7F37629CE;
	Wed, 18 Jun 2025 12:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743D8C4CEE7;
	Wed, 18 Jun 2025 12:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750249472;
	bh=zHK+0dJw9hbKdjwDqLPDdTE7UAQG7bf8mukhi58+Qzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEQFVbGtdoxye5TgEDftWMX5K/o7OKZiUL15zhRKaKhGk78Hhc6fBlGGLDsJe/C6V
	 rjWDcD0pJxgtFb9pHpnu77JJ6Iqp3krYvGlcDJrIBwNlETUn6PKwmsphwpLDxWgKz1
	 DU/mUrBMWXo42o9des5sO0hq9ljvo2VVN9QF51NqyT0eDAqAOnWVi3PYhmHXeaLRxp
	 WxXVvbjP5juvlMGUOTLfRza/R0lkhUjbBC6CYXchG+CFMdKARzU7RIqUVEVUg9ABup
	 Wp9/eJaCjKhVrawaXxnPG6V7n8gDdyswb6nfr6cRshd9zTBsZ40Tn7/H7xrTabAXv9
	 ZtcFquSzeQh7A==
Date: Wed, 18 Jun 2025 13:24:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Yogesh S <yogeshs@ti.com>,
	Santhosh Kumar K <s-k6@ti.com>, Steam Lin <STLin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/8] spi: spi-mem: Use picoseconds for calculating the op
 durations
Message-ID: <a44f8212-1d72-46a1-983b-9f46ed66da03@sirena.org.uk>
References: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
 <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-1-513202126013@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-1-513202126013@bootlin.com>
X-Cookie: This bag is recyclable.
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
Content-Type: multipart/mixed; boundary="===============0581159237107114201=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0581159237107114201==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lfg94TGuaFvTP94K"
Content-Disposition: inline


--lfg94TGuaFvTP94K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 18, 2025 at 02:14:18PM +0200, Miquel Raynal wrote:
> spi_mem_calc_op_duration() is deriving the duration of a specific op, by
> multiplying the number of cycles with the time a cycle will last. This
> time was measured in nanoseconds, which means at high frequencies the
> delta between two frequencies might not be properly catch due to
> roundings.

Reviewed-by: Mark Brown <broonie@kernel.org>

--lfg94TGuaFvTP94K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhSr/oACgkQJNaLcl1U
h9DxUAf9GvYchrnMdIcTNMB9jdHHlfaLK/FwKb3Ilgyeyek+3ELS/xvAkxnZFvsB
QZ0R21ZR86JtbgXqo8+s5P7E+y8wbfGRkhuan8C0fpCAppMH7vGbjroYijR9JbaL
koOZc5Mk9F+zAjKEhPA//OinNX4QLikcrM6BfgasFmmUgnTIlpxVGnv+0qz73bQ6
zRH+b00aMa0Sy6vYYxKkQaL9nMEWMmvAwMTBHtTChje/jvBOxTA/c3d3KLc6PCld
5aTehbQXMQdwlvwo/70vl7gR9vy4FmAz/4EPKBcO8YleQ69JL93xV3ub92T6Bv8R
6IkeyuzONyKWBjgnQ/8BECZmiNNJ0w==
=b2iI
-----END PGP SIGNATURE-----

--lfg94TGuaFvTP94K--


--===============0581159237107114201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0581159237107114201==--

