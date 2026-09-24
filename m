Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB9AC98318
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfbFak/sqyjq+4Dn1EfW1Y9scjOwiMVqqrGWx+UHkIs=; b=06XBBX47/fNw+l9EocwA+oDr8U
	BnQvnTNE/ym6qyPna4NSNyW3+EKyb3aW3tQ4d0+c6TYsOENewie4G210wjPFk+/tNbApAbi+1cX3a
	LTHJGEaWQ/yhY9V/tisjGm8QGtgB6A8sx+NCjYXswXrC7YZ/jPOWqfWmXtnXZsUPnvPagd78ej9AA
	BcFUSyeSepctchTlz8WcJLTl8A8AwJ1RMonyGg/ykSPeKG85lWYX03Qe2w2NDhEKYg68lPapJU1ug
	ac1AgvTxiWe9EhZg+p8ouRZrg7IpagDRal08O/i52ONvqRXO5MCn2Z4QKRPwPw0cbq2fRynR6lC0c
	7We4i7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oc1-0000000Byb0-3xxO;
	Thu, 24 Sep 2026 18:56:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9obz-0000000Byae-3RFI
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 18:56:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31C5B40851;
	Thu, 24 Sep 2026 18:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B623F1F000FF;
	Thu, 24 Sep 2026 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790276163;
	bh=dWsSriTFP/l1SThxOsNHAT5Wuz8a/YdKnSltBFmwQqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iMFZnU+l7QFuhCk+LgUxioaavEExOWoLtZg8A7iqDMCkUeIwy9OMZB7KEw5kPVkVs
	 wIp3OvawKyufdtjI7eBoMgXaArbykQJgnmHBgJUJCbH+52ztwBVc3fSFDc3PA3SeFH
	 EmArRX5e4THFokYSIONgh6cN0/NyZCXfOjrunAY6h0TuGVwI5UlWWZooHhgftwG8r5
	 XKif8T2srnA/0K/GZ6T35JG+saHeZs7UP7NV17OGvMXxaKAT8a+zaFekm1/bEZHsSh
	 UU8C5BinIJkyA76Lzf90NhgrTBGC4ptxzejeWtzSMAh9cx9s3ZW1pqWx+nxCECR/sO
	 n6/8wbo4aeL3Q==
Date: Thu, 24 Sep 2026 19:55:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Fei Xie <fei.xie@horizon.auto>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parshuram Thombare <pthombar@cadence.com>,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
Message-ID: <67f4e1a4-fc0e-4b2b-b41e-8dbb33227302@sirena.org.uk>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <20260921093701.1341766-3-fei.xie@horizon.auto>
 <arFEjzkHGMbecWWV@sirena.co.uk>
 <20260923061211.1608907-1-fei.xie@horizon.auto>
MIME-Version: 1.0
In-Reply-To: <20260923061211.1608907-1-fei.xie@horizon.auto>
X-Cookie: Oh, so there you are!
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
Content-Type: multipart/mixed; boundary="===============5927409514430593697=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5927409514430593697==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GGC4+w1wYRwqkSmg"
Content-Disposition: inline


--GGC4+w1wYRwqkSmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 02:12:11PM +0800, Fei Xie wrote:

> The difficulty is that the hardware ACMD sequencer needs the complete
> multi-operation sequence to be described before it is started. For
> example, the SPI NAND core currently submits PAGE READ, status polling
> and READ CACHE as separate spi_mem_exec_op() calls. The STIG path can
> execute those operations individually, while the ACMD hardware combines
> them into one programmed sequence.

> Would an SPI-mem operation-sequence interface be a reasonable direction
> to explore? The NAND core could describe the ordered operations and
> polling condition, and the controller could either execute the sequence
> in hardware or fall back to the existing individual operations. This
> would keep NAND-specific knowledge out of the controller driver.

I think that makes sense, that mirrors some ideas people have had for
optimising SPI mesages in general - submit the sequence to the driver to
see if it can do it in one, falling back to just running individual
operations if that doesn't work.  See spi_optimize_message().

--GGC4+w1wYRwqkSmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1cj0ACgkQJNaLcl1U
h9CgUAf/UWAcE2/VgHsBHsrdWIvev7pY5jSrNTWfchc/Eeek0coOo6mIyxBMphDc
t+q4GKwk3QWJNRuaXmzFkhmNWlEkcVxY1YNUluq5vIP5XtzyXHBoTs0W+ueCNLiG
fEfY0Wlay87obn08uduCMJ/4v7RM6JyuRI8Si4qqeKXKwBiNcjZFsMLcuiDxkIkt
5yAQJQRsvEf4v9UaptOdGqxyTWQP+H1z33hBflXX7jMFvc3uMWMp1ucl2lC10odO
uHMInH0MXNz4mv8/nGiGOZzsVhOZ9abOhFBWhQF/MU5SX3MCuzaec6Db3Ms6/pRv
k/Wzf8uRQPiTBVpWhBhFTPqnzwzN3Q==
=b69J
-----END PGP SIGNATURE-----

--GGC4+w1wYRwqkSmg--


--===============5927409514430593697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5927409514430593697==--

