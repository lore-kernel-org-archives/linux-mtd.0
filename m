Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48571C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:42:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1797060F41
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1797060F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMHzinRAyTHpWtq1yNV3r3c6kGgyZwNG2alyc9lP6GU=; b=FoIPiraxdc6ETfENXeXhpeuo4x
	q6VU5WT1jXpK43hRqnZi1J3v3QC1tQ7fshiKTIRLmYlQ3KTMp4PZJLq4QaPLEjlWvn2mv5FP9VZGB
	w9N7+HGyvZBXw68NTaLp9LlQhOvQ8rGXHIZfuooaJ3HaYwSIPhGnrkilC4jZW/6x8hqXv7KwFTajr
	/xywYY322Q1SXQyx8u2XxY5pFxK1CYKMwuZlLJ65T444s88m34LFR6nAa45t55W4CvU1nWTeO2/bo
	cIa8+ASBzGgvDDFFnn83VvSH2lbGz5CMEQrTQVhEj4p3KqN/BUeO1smUctguT4TEC2iFx6hFQvQrN
	l1Z3Rzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlYh5-00B9AM-6F; Fri, 12 Nov 2021 15:42:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlYh2-00B99s-Nd
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 15:42:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B59A260273;
 Fri, 12 Nov 2021 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636731739;
 bh=FrgtxQueiA5lI+TWBc3wSldGKxLoxmuqNNxs7RILpJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bmms0yP3c2v3gW8ZIIaerpZBdKUis9bykY9kD8+5EsRtmx3rTjqOfqKmQVaw947/+
 tNTfLwaYM6S9vAipGNML/Fa/uapBRvQAFJDYYAcKxcZ5UeBEzGhIuInOcogtZwK4fb
 0VDdf+ULtBWpb5PW1lSZqcRio6xk+RY2zs0cvJUrJnlGxQE7s5DsNdxU/GZ18xbq0j
 nYyj+R2EaM9y/Gv16FJ4Nd6SgTYeexeJkipuXyd+rFzHwebr3YPxoorOoMT1XGpP60
 Zi4HXJ/qBMCM1y/ObYTljBbqawhL8oKOmpig7skq8qeOX1CUtMJxrhJhyb63j6+WXY
 NIE/BVSWp8DfA==
Date: Fri, 12 Nov 2021 15:42:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
Subject: Re: [RFC PATCH 3/3] spi: dt-bindings: zynqmp: Describe dual
 stacked/parallel memories modes
Message-ID: <YY6LVhcplIWwMly7@sirena.org.uk>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
 <20211112152411.818321-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20211112152411.818321-4-miquel.raynal@bootlin.com>
X-Cookie: While supplies last.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_074220_808394_96066D6E 
X-CRM114-Status: UNSURE (   7.97  )
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
Content-Type: multipart/mixed; boundary="===============7357508576035977981=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7357508576035977981==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9AKQhJmrupC7oYxe"
Content-Disposition: inline


--9AKQhJmrupC7oYxe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 12, 2021 at 04:24:11PM +0100, Miquel Raynal wrote:

> Describe the two dual memories modes which are available on the ZynqMP
> QSPI controller: stacked and parallel.

Shouldn't this be a property of the controlled device rather than the
controller?

--9AKQhJmrupC7oYxe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGOi1UACgkQJNaLcl1U
h9Bp3wf/Sj6pDo4YztxGoSRnJdyd6JgIBipfAI7fi718RKslcbzlV89UJTRhpM3J
sv38gYg54E7R1p4gMrluVBz2my1f+SOL8O7U4l10fmblVB6jqk+1SR0FKkvvFfKa
8sgB58DGRd0xDEJyJHFPs/fsAEfVXHkJ26pc4KHjc8i/aV7bXxHm4WHLYISvgekz
lzFzHqd/W0WrzaKD5eYU+5Q3dpmli41HNZQgViHD/hxZVJJvpgzP1tlhwVaJwgnU
FI1jt4KzjLJBnQi1cT0hxnTrbzBvOMwxLslJdda2+R+xnGjOLYE1j/fQg3+LJDvZ
Z1kMoF9NEgH63LqMZwQ4AwZcfG8nRw==
=2Co2
-----END PGP SIGNATURE-----

--9AKQhJmrupC7oYxe--


--===============7357508576035977981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7357508576035977981==--

