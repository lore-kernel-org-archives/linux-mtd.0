Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF62ED29FEC
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 11:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KLBKzL66M2+zbaTzTi0zDFDNW89cGWldqB3jPuVP+4=; b=yK65wD8aV3Dr3v06i02uv8RKWU
	10qMoheFkrzP8mNn1EJqm/jr6Drs2Okwwz91koSZYcJWC3b0iXJeBt2B4zIeSIARZ5ieu4P1TS3XY
	oA0hErnrgNNRDKrILXdGubkgqqTindamcgCRbFqjR/K1y/BnWwkorCMb4QYAegEOXn8Z19bMHCZNu
	pyN4t6O9y5Mm0kx65czEnibzkDE/U0sQPZ4Bozc7tt6pvM4kIkrbdm6xTTvQVaXTlcu+7RDtR8D3V
	zRVKOxNYk7Ksbyf3+CGQrBJ2xY+A69mMB5d3nZOSojzBW8LhhCb8FhnTA2Y8WzqM9GxlSAPCDQsuV
	KtXS9Xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfz0R-00000008wx0-30eU;
	Wed, 14 Jan 2026 11:25:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfz0M-00000008wwL-2En1
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 11:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A27F0600AA;
	Wed, 14 Jan 2026 11:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4886BC19422;
	Wed, 14 Jan 2026 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768389937;
	bh=U6RMlAgcFRqPdzpR/EIwWZLTgG6XUg9BI1Pj/Gbu3QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRxBz2YNtMNGHq1aCPPsMx0QHp4s8EDEZCsxOLNTTC6oqWlYR2SoG0G+ymX53S/Y8
	 e5z3B8UL6c/YhoCzk3QgGy37GFJckD5WJxeEvTp+ht1mTfFXEaqn1imiP0bGCSf20O
	 Fai/jt+k1gGXLqJYS+LHiMI4J/3/Oq1EALiZtXQSQOUanB5qeLCc1UUnr5liFRpW3g
	 TLkrS+0PlR6t1pAlz2FSq3DWYmPqWX6cIrrrpRGgXJtjhPSXQ5TvpoC0Bm4cA+1hyE
	 1VAtYAmKa5gXL29T7qXTNgqrxG8v9evr6WIZiKAGT1jJx7Jl4x8pnhDxZv2mGDc+ZB
	 TRO5y46ie0YEA==
Date: Wed, 14 Jan 2026 11:25:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/27] mtd: spinand: Octal DTR support
Message-ID: <61a547d0-592c-4cf5-ae4f-54456b08e83d@sirena.org.uk>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
X-Cookie: Absence makes the heart grow frantic.
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
Content-Type: multipart/mixed; boundary="===============5245005908009706232=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5245005908009706232==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="itinsQmmtHTcSc+n"
Content-Disposition: inline


--itinsQmmtHTcSc+n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2026 at 06:17:58PM +0100, Miquel Raynal wrote:

> This series adds support for 8D-8D-8D in SPI NAND, which can already be
> leveraged without any SPI changes as controllers already have this
> support for some SPI NOR devices.

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-octal-dtr

for you to fetch changes up to 8618271887ca10ac5108fe7e1d82ba8f1b152cf9:

  spi: spi-mem: Limit octal DTR constraints to octal DTR situations (2026-01-12 12:40:30 +0000)

----------------------------------------------------------------
spi: Octal DTR support

This series adds support for 8D-8D-8D in SPI NAND, which can already be
leveraged without any SPI changes as controllers already have this
support for some SPI NOR devices.

Among the few spi-mem patches, they are needed for building the SPI NAND
changes (especially the ODTR introduction at the end) and therefore an
immutable tag will be needed for merging in the MTD tree (unless all the
series goes through MTD directly ofc).

----------------------------------------------------------------
Miquel Raynal (3):
      spi: spi-mem: Make the DTR command operation macro more suitable
      spi: spi-mem: Create a repeated address operation
      spi: spi-mem: Limit octal DTR constraints to octal DTR situations

 drivers/spi/spi-mem.c       | 15 +++++++++++++--
 include/linux/spi/spi-mem.h | 14 +++++++++++---
 2 files changed, 24 insertions(+), 5 deletions(-)

--itinsQmmtHTcSc+n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlnfSsACgkQJNaLcl1U
h9B91wf/ZanJsMJVyxIu9u84HYAFqkU4Kl+90t40mG9eWlxraksjBKZpzqupnA3D
Nrzw1RwMPqiWTlkcKlyJPzYnTb++uuYEDTOexISgEBN3WKBhkV6fFQQrkuWYqsZ1
qnaRwV3NwC5wGjXrbufqkIXrIvgdex9lZWMu3YRL1N2bHTscK5xZYo0q7IOZ0YvY
vP7TeSF7ldXzpWo+z2hFdHxKAcXtHopbvDxWFWFR6kDZ4eoItyvRpJ5P3eqAuUC8
X6IVy4ajVfL4eKlmnkwwktKsKq1bQBUVZmup6LKzoEwymLfvmSgi1Pqifgm5f15V
1QTg5nj5vZrDOKUMfi3wF4P/cvIuaA==
=xyvE
-----END PGP SIGNATURE-----

--itinsQmmtHTcSc+n--


--===============5245005908009706232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5245005908009706232==--

