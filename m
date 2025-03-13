Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14B3C28B2E
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KebnoMHhBwR71daKSXXaNuedSka5XCGGfVMlWaLik78=; b=qWFKlhEUqCIZBs0j9tvsijpa7B
	JeKaRiUpqSCOvgEtN208FDnPiEfXe5kjUivySGSK7swrD6wwa4axJQt8s/M1x5JSU9LLephiNjJMK
	v+7qPLg87DCX3y2X0PbctCZh1y/UDFcCg3LJuJdS/xknEg04J/A3//MYDxOk8outKKID2bnafQPfb
	kNhznAJARO3vijcz/QbQOPJth7VBH8XT0Hv2XYA90F+xTxHnuuSa42AuLzboPpuqcEOmPZBCWjTMa
	m64hDwvx3Yev5L/ImjJetl71bQdz43wpxbD97baxT7QczJL2zIJH8ajn1IR3nTdPAIocWcPD4r6zC
	MZ2V/pEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiAE-0000000BJGo-1ULh;
	Thu, 13 Mar 2025 12:59:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsi9m-0000000BJE8-1pCs
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 12:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E2A55C5A81;
	Thu, 13 Mar 2025 12:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71668C4CEDD;
	Thu, 13 Mar 2025 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741870765;
	bh=o1JokyjlqWN8gJ/eoZQUlSigREd9jnHfkinY7XpmE+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m49Xp00XfLAITcQER8VcGT7UtdqnNpSa1iL3rBZcQfRBl4OU9q69SQCwjLgBUE2Q4
	 gXm5/MBUy1x5igul64eQjyxQ4oiK36VPOECUmdurnIepNmPPbqKtKJCdsTuxkNAJXf
	 5mhYVJdv+N0Xuk/XywDFy0wYSPyIIQEM7p2qZdOfHIs6bIJ54NrWNpjDqVloX9PZ9V
	 ZNVvxaUvFUsenAoPFLkyqWPNZUY/mzxXOA+6cqVO/uZcyYYR3mo6DLSvpyGY6Vl/j+
	 +YMT4tfKsVdj2Q5BD8Xlw9QcuxM02TjC5j1ovy8Hw7N2EL0h398eLZp5lZhOoVJWZU
	 B8qqSZkPyLB8g==
Date: Thu, 13 Mar 2025 12:59:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 4/4] spi: spi-qpic-snand: set nandc_offset for ipq9574
Message-ID: <ac5673a7-d573-42ca-8535-254e2c1083aa@sirena.org.uk>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-5-quic_mdalam@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20250310120906.1577292-5-quic_mdalam@quicinc.com>
X-Cookie: A beer delayed is a beer denied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_055926_518140_708C9EA4 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Type: multipart/mixed; boundary="===============3446731287387069531=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3446731287387069531==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DLVPIcV9y3hPcH44"
Content-Disposition: inline


--DLVPIcV9y3hPcH44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 10, 2025 at 05:39:06PM +0530, Md Sadre Alam wrote:
> The BAM block expects NAND register addresses to be computed based on
> the NAND register offset from QPIC base. This value is 0x30000 for
> ipq9574. Update the 'nandc_offset' value in the qcom_nandc_props
> appropriately.

Acked-by: Mark Brown <broonie@kernel.org>

--DLVPIcV9y3hPcH44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfS1qcACgkQJNaLcl1U
h9AZQAf7B6HWMHCl2lowKK3SbhxOes8At7H7cGoilgVUlhRLpGHnkHSjYEJ1FlTG
QDGuOYVraIvxayTbRQNnxBDDAaGWWD4JYR/ukvFPL3CbN5+pyAuOKM1R2TsLwafC
TidjQjxxD1Azv9+NwPaJYn9wTcwis7D/ENNLUqW7H9edkdxCmKIEYPQ0jtOIq4hI
UnEtYy1FJN6ADYZeDJXLQZKyZY7steggwFKzz5HBekgS7Z2ILo3sFAfAVqb3C6p7
qdf4X1H1fs+QuSAPJa1k632ZKMiPHy95hGkJssPyz/ft2zBuUbjQJbaDvt/GQAhk
6Ha6C1g0bN2cV/ts0mfZaO2q2ld3BA==
=pp4l
-----END PGP SIGNATURE-----

--DLVPIcV9y3hPcH44--


--===============3446731287387069531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3446731287387069531==--

