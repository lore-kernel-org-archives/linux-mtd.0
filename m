Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23B5C54FCD
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 23:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ly2lGHiYbbhrnfLcxIh/rT6dKmMUBygEStEUfyCJxgo=; b=PYQ/FlYbZ/Blp0i7VgKdjyrDyK
	SJ6VLWAbYG0703V9Pu4zDqYXjHqZef1tRQ71lbmJKVHlOhJkh/jeem54wFZFBuZb0HDaneyPo+Wjo
	H4eJ1fSI+7nAh0gwT6lIeUvXtRC44Gidb+AcOwfe9g6THTBB082Qdjbwhc6DUeGvPJGXpG1JVC0pG
	pzqcyPDnM8zAngCPzBixaKBKpMM+5+nkNIKns6Rps30RhwlkOPOCKNgmiIiSK1ZZi5GrY5E7oTvGG
	xhezVf08R47TUlMo400oUDYd1BKZW2OJ6zJwxIacALI3H6IvYG6GaVw65Suah5/Vrzt1dOJ6E1JZA
	/CW4xZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDim-000000097Uk-3uOZ;
	Wed, 29 Jul 2026 23:29:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDil-000000097Ud-0UUU
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jul 2026 23:29:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE693600AB;
	Wed, 29 Jul 2026 23:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B421F000E9;
	Wed, 29 Jul 2026 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785367792;
	bh=VxP0uduREoJ7Be/glwK1hb2fg1EFYacNeHpFwDFHE90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QgTHhqwUoMCHWAQLhJrVPBswxSvAvDNBqQv7iVpbMilUI8rtewpEpRxW7NUvFLX12
	 JmvLfQTyNOR41HLtt00kurJjtoVrUDscJX4fhlLNHEiSn1Yb2SxEei116lfUn2noVQ
	 MIN9RlWbNtCk55jkElKfmVvVLQ8xNBG6bOm73SGfOdjLQFsD1ycN6GRCYS6PnvSOkD
	 6DmqmgPt9mcLqq9fQh1il5DcY0uTdip2pibqPnIYt++LsT5CVCJqcKVAeyzjt2YQJe
	 2XCZkzspj+X4jURxmq5M2gSG/MxuqcInX53paCmn21uGBVBaMSmaXEdw22L9RSZ0TJ
	 La+GssTLln0ig==
Date: Thu, 30 Jul 2026 00:29:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com,
	u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 0/4] mtd/spi-mem: Enable DQS support
Message-ID: <e2acbded-b8bc-4f45-a852-0abecec45de2@sirena.org.uk>
References: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
X-Cookie: Captain's Log, star date 21:34.5...
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
Content-Type: multipart/mixed; boundary="===============0778391004240496312=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0778391004240496312==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="csLLV3JhdNRIAkyk"
Content-Disposition: inline


--csLLV3JhdNRIAkyk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 05, 2026 at 08:06:57PM +0100, Miquel Raynal wrote:
> For his PHY tuning series on the Cadence QSPI controller embedded in TI
> SoCs, Santhosh needs to access the availability of the DQS (data strobe)
> signal. This is a chip dependent capability, which may sometimes be
> enabled.

> base-commit: c5884449d02575c7984000eb30d2a2971c7dfcc7

I don't appear to have this commit and this doesn't seem to apply
against anything I do have, can you please resend at least the first
patch against my tree or Linus' tree.

--csLLV3JhdNRIAkyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqjOoACgkQJNaLcl1U
h9CsPAf/fHHDAt+oKKCfY07bWGQaSVkV6a/LhY8URpM1lhWtZa95tUwIWiyZFjZc
m/2yODd4iyJ+XK2+ois6FCYy3HcUSu5auGzNY0g6+DWPCbZavSbC3vJjVYPLolXK
qjpi+Ab6brgj+xRPVUo6D6xVUBMR1mblpEEHKJU0FNg/z1GPUU5atZLdIEIruPT8
V5srEvz14tZz8ND7IGFieYjTojcELpJe9FeXg/+3vNaqBNPODeCz5IbylX3v9YyU
zzilTY8LdTqv11xnW/nLaLExewFjiZ+IbZDB4gnzCpioBV8eN343Cfam3VOHRx4u
soUfZuVn2+AbxTDms6nPGx7Ka1C7uw==
=MEZG
-----END PGP SIGNATURE-----

--csLLV3JhdNRIAkyk--


--===============0778391004240496312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0778391004240496312==--

