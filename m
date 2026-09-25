Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046A2C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tY8Er7dP4y4g9553k2pWfjegABAnZvTt/fH7okT6o5A=; b=WYlHUxfaOYgD1+fzdsdnXpBaMT
	/v6GJGcSLZuq1bSVb0OV4x6s6xS8l7k/mEoeu9XKWtivWdhbe2nslxbR2ZK+GPtk4Zi54jSf1z5CM
	tjrfd4TDYnZ42zLaXXneG5qkSSbeO1xLSkrMAz0t9uea9WH1Zp/ETvKAQg5cN+vgPVpxOypAW2F17
	nvHeaZVqPJddLYuQZ14kkZkiCAxTyw9YRSUzLJmnWfOcDNklO0WpyASX8QPxli3JHUYepewG+qaF/
	6cCqBqjLDs5FD4ZiuZeFgLhB3Mx59bQiygwb8PL/dU4cioTSbjpUMxtHIGq8kwA4EA4cQDZw8r3s8
	Ryuue7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4aq-0000000DGlX-3dzu;
	Fri, 25 Sep 2026 11:59:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4ap-0000000DGlO-1ypv
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 11:59:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1BB6404A4;
	Fri, 25 Sep 2026 11:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1112D1F000FF;
	Fri, 25 Sep 2026 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337594;
	bh=yao8TTMKIXgdl3wojlTg6Y/FV7O0NF2CMfYlrTOp9Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mSjRlykWg86Pu/F5pZgdu+XMDVimFtOYOZIljKg1P5E3dX88R1AGcXUDCo9B3qOT1
	 l2DYpCyMSOEYqTWEkc3I0iw1bb9xY4mhaGznERZiWWfD5M/O44bDcY/S3LB20qnSWk
	 fMCTe4duP1S5JUTr/BjOO8hvPQOqi2ROhZapmoSNM6XYX2yOPQD/puh7tLADBJEybm
	 QjAmA5I4pCZln8uFPMdeA1VFKcg06nE7xBFAj269LT81vuGwSLrZjmY4e8tNU3M6Z0
	 5dgSzQozSQqr5WE3uKkW/TKS9efUKP+zrmEZ4JW3QnKbCmzIbsmD2TaaMwU0GNqbns
	 YoWhtVKeUehzQ==
Date: Fri, 25 Sep 2026 12:59:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Fei Xie <fei.xie@horizon.auto>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parshuram Thombare <pthombar@cadence.com>,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
Message-ID: <85dc596e-4378-4d23-b48e-80053cb5166d@sirena.org.uk>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <20260921093701.1341766-3-fei.xie@horizon.auto>
 <arFEjzkHGMbecWWV@sirena.co.uk>
 <20260923061211.1608907-1-fei.xie@horizon.auto>
 <67f4e1a4-fc0e-4b2b-b41e-8dbb33227302@sirena.org.uk>
 <87pky1ll4g.fsf@bootlin.com>
 <arZHjbzUEFhydnHt@nsa>
 <87ecehljdy.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87ecehljdy.fsf@bootlin.com>
X-Cookie: Love America -- or give it back.
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
Content-Type: multipart/mixed; boundary="===============1030583038908969426=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1030583038908969426==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jDLHmqGwvebW3fWJ"
Content-Disposition: inline


--jDLHmqGwvebW3fWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 12:23:21PM +0200, Miquel Raynal wrote:

> > As for PROGRAM and ERASE commands I really did not saw any added
> > value.

> Yes, most of the time is spent in the wait_ready, which is not getting
> faster with hardware automation.

It might potentially help a heavily loaded system if you can do fewer
waits, the rest of the tasks running on the system will have more time
if we're doing fewer waits for interrupts.  Not sure it'd be enough to
write home about though.

--jDLHmqGwvebW3fWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2YjQACgkQJNaLcl1U
h9BG/Af/VlsMwBCFOEYj/oDnzW99d3z6TFME0rFxNTBnEzGCGCwQXc5d7DSDtg84
XV7214iwuiQXIFuZpbAXAETQ2r0W24h1lISlLeKyqlkKmBQ14RGQJNpUVmv80zqs
aWk7Q3qFkWWnJJrPFNiApBREsaTraPIXydnWkx5khAjUNn5U7kTWWPbB+ohcsLEQ
TFlyHV9six7mwAZeUMqz606OltqhLBHxPF8sKp+6/PhhlubMYf9DYtwGUHbGYVRp
ucYW2ySARCKDuRWanGABrLA1DRuTUd9OLzx71srTgHR5Z2TsSvGsu/7kNvcnAw0c
YPXZKonOnwLBQTzkS+gGouRWZDyAPg==
=ueYj
-----END PGP SIGNATURE-----

--jDLHmqGwvebW3fWJ--


--===============1030583038908969426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1030583038908969426==--

