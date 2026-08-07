Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEFCC2A09B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM5LfE86w41SpH6c/5FAfukGkL31kwIEdwLoHZB5mpE=; b=lYMUV2TtazAzCEoNFvwftECiTU
	tAFpr22xvhvC9+OrHe+V3fux2FOiB7Dn35Gd9oIQ6WK58I3hxCsx7eQriMouWnYAWo3fsw1YmHZ17
	BpRHEvHwgQwoW7WaXsoAW3Pm1HdbONSUKdFIIiOAaev0nzgWGAmJJeKFfHdqt1SPKS7RjudionTFQ
	qqBoQ//V4CSpiUHqX5HRYiibAT4JdYCGaL+ybGhe88KXfnCIGF5+TdM3dDIRPE/J87oNgU8Xiy61o
	WyS39899E/vsS7Po2goJCujMx/EFpj00ScRcjD4GFHldO6uKkJD+mdAiH4LFEBijMEepw5TzW7JaC
	3GkdFTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNDY-00000008PDt-49qf;
	Fri, 07 Aug 2026 16:14:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNDX-00000008PDj-3tfz
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 16:14:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67111409F0;
	Fri,  7 Aug 2026 16:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D6E1F000E9;
	Fri,  7 Aug 2026 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786119283;
	bh=Ce3bmsMw6Ybvp3hjSTf6Y/EA1mGMrK4DH/wdo1/aRWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPXTWEe/9xqh7SjixQ3J97lvK7K/kNOkQmZrtLQHV6Yxde23o5A2L8lhZtL+xRUXz
	 y7ebNLvcrO3ZCExu+oj6pMK/41arLi8NrS23aKCnYvGybzynZhP3UdbyeqPjepfQ2G
	 L0FPdRMrKPV/PQKY6r14WQvFUatOCoa/ylpfVW2pmBeEuMHvGlPY01T7jdmvqAtpds
	 c1yGMT3uvGuHlQdoueCNdygrfRvnYK0VqLVQerYVCQEsdVRRrh27LkBSA0zT0DL2lC
	 OyIVLNS3V72OB43Z4eKa9WYGc4AD9SNnvii9TOa/IR69XuiIawQE4CTAZ5vMlztJws
	 FS7H7jpD/2nfg==
Date: Fri, 7 Aug 2026 17:14:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com,
	u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/3] mtd/spi-mem: Enable DQS support
Message-ID: <8a729209-3bf9-4f2e-8870-1cbb64a95184@sirena.org.uk>
References: <20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com>
X-Cookie: Make a wish, it might come true.
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
Content-Type: multipart/mixed; boundary="===============0366758432285596220=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0366758432285596220==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r3GbSDDzJpsUdjot"
Content-Disposition: inline


--r3GbSDDzJpsUdjot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2026 at 04:46:46PM +0200, Miquel Raynal wrote:

> Mark, as agreed, you can take the spi-mem patch through spi for this
> cycle, and I will pick up the remaining spi-nand patches after the merge
> window.

As I said on the previous version can you please send something that can
be applied?  The MTD patches are failing to apply.

--r3GbSDDzJpsUdjot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2BGwACgkQJNaLcl1U
h9A9TQf/Xu8QNGCHTl+k89v1pz97+qSw7Z5IUVIZCdcju5wItAyOfqnx0zSoMwhW
aOgrCRuVEplOIB2QUZeaB1regRr/wiIcIUrB/bw29tY9yAJlTYVRrh7mzCwNcgkY
qMGCv9/rff5ZwxOgl1cB7XYuaWuqu42Xjp327b8auTVelLvEf9pXxFtasM46ofBu
YM3AqLogTFXA5UKv+udv4nPtEuTnEx6BQOpz42vooh2aRdeT15iA1WeGgeWrRDio
ORVD56CZ2SRVKsW31t3MpeGmlsr5SzTco9BlhzNw5z3fCu0yxrjIIugI3oChpOVs
Y53wvy5Or7O0vJ80fbpRBoHSEE5oLA==
=RKeR
-----END PGP SIGNATURE-----

--r3GbSDDzJpsUdjot--


--===============0366758432285596220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0366758432285596220==--

