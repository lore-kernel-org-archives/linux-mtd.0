Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6440D3E785
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Dec 2025 02:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snz0mOObG455PJwz37f6HGWDalOZty+GhwdkGMfQLXA=; b=4OJND4pCz03wN+AzGg7vYcZiAi
	dEQAOZkbZV5vH0XIugduFR2jTYTdCFYvradINvUZR+3+GIEcVyq70CEYSijjPQGM9y1f9e9T6/6es
	1IKes+75wdETZO0Dmdu4PyFQfkYT7z/Yk3fUQULGp4k9gFnFt/bRqZOjMwJOy2qXt2/yIseBe0Fow
	tuikeax3dIhLLN8Ny3WA+AkfeKeVQFgi0mV66jdpA2L/KaMu8cV67fRBxEb1oGjr8CUnTBhU83QgC
	ISB1YL6d7PhUOWk35hh2x74toDSrI0k4ZsY0tt9+QD1yO5x5OyxfsFoYUYUXokYQLHbE5AtUjRnpN
	dZ1vnl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTW4Q-0000000G70Q-0Eky;
	Thu, 11 Dec 2025 02:06:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTW4N-0000000G702-0Lhe
	for linux-mtd@lists.infradead.org;
	Thu, 11 Dec 2025 02:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50E9E41AAD;
	Thu, 11 Dec 2025 02:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6D1C4CEF1;
	Thu, 11 Dec 2025 02:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765418774;
	bh=5C17/+Bb9Zn4/BTp8r9Bzr0kO9d1R7kDEKS8scbMZBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaKlWRsgaZMEQ3sAbjrhdmbo7Ifn8gz4EHFeb5IRl86OyYsuw02ww+O+fU7VU85xT
	 XClN2u0uw86aXycwqvEGyKHnqyboep5MPzoP6OK6LG24A3A/pC8vxNe2vfUw+2OyNS
	 N+ySoWBck8Cy2IjZVCTOOTnH1L8QpIJ2XbkMCXp5MO5sWTEbCxnZz1q3dSkVWiodF/
	 Sx604uYupFFxaGIY+uQor2CpOBMw23gR1gJ//IjJxJdg89sGXDeJFOciYrFTebP5Qp
	 g3g3iHqUZ36ocgjQbRCN6iCwiDPegnplpp4WHlgSTLSj2SB8vA5wi6a8snZtkiKL7A
	 JzWgWx83YMYSw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BFE5B1ACB974; Thu, 11 Dec 2025 02:06:11 +0000 (GMT)
Date: Thu, 11 Dec 2025 11:06:11 +0900
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
Subject: Re: [PATCH RFC 5/8] spi: spi-mem: Create a secondary read operation
Message-ID: <aTonE4REBDfaWBQo@sirena.co.uk>
References: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
 <20251205-winbond-v6-18-rc1-cont-read-v1-5-01bc48631c73@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20251205-winbond-v6-18-rc1-cont-read-v1-5-01bc48631c73@bootlin.com>
X-Cookie: It's clever, but is it art?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_180615_144093_09DE2449 
X-CRM114-Status: GOOD (  13.04  )
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
Content-Type: multipart/mixed; boundary="===============1254629830682531925=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1254629830682531925==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zAseFASQ0wTIorCg"
Content-Disposition: inline


--zAseFASQ0wTIorCg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 05, 2025 at 08:38:56PM +0100, Miquel Raynal wrote:

> The choice of defining two variables named primary and secondary instead
> of using an array of templates is on purpose, to simplify the reading. I
> find less obvious the use of an array here but this is personal taste.

This makes sense to me:

Acked-by: Mark Brown <broonie@kernel.org>

Feel free to carry both these patches along with the rest of the
series, if/when you do end up applying it a signed tag would probably be
a good idea in case there's some collision with other SPI work.

--zAseFASQ0wTIorCg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk6JxIACgkQJNaLcl1U
h9DT+Af9GQygkqGyABqwCLIlDQKKXFBWkb7slRPX13S3gBENffalZQq+07eKnE2I
YxGLcOc/dTeiSV0L2VK/LUDH2K2W245kRaO4kf/v824LA9nO+/ZsuEVyTgYBcLAL
GLDeQ5+iYupJM0S0np5bVj9UcxFrhIezHvyFEqPtVtmcGvDnkKLl1nGnFxKD7ilH
wnWyYmg0N/lVfxhL1KEqwYfUs/Rtp+2K8TFFZPTygl1jbZxlBcOWX1YJpaNrd1Qb
VQvx8UdjYY8O9xTTGVq/ONSNAHOLhSu6srDsy/gMyiY8Gdewu16WQU0aD4CkSGZX
pPZTP5ZtFZrQexyW/GPEHm3JYyUhMw==
=w/f0
-----END PGP SIGNATURE-----

--zAseFASQ0wTIorCg--


--===============1254629830682531925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1254629830682531925==--

