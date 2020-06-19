Return-Path: <SRS0=4+4/=AA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611AEC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2020 15:17:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389F82158C
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2020 15:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PAjPz9B3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vXN+mD5P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389F82158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xetnbup4Fsk9tgW/NhLcevmuSzmowwka8/qG5YMap5M=; b=PAjPz9B36S46huaiyJwxqljcJ
	FFJckfp5J5bLTSZ0QBbVyjm7VP6ceeONbED/QeDDAbSBrnpYL0byGh2Fl6hPqKK2PjM+l5lmv/WLC
	D+6Qs+OEWs4RdUFR8lsNMu4SvVNvUHqVuUwMwHEse2qzDEqbncMNsU7+hUw8lR3iQSeBeuEuIZIKZ
	7mWqvKqrIgO0KhxF4R6cxl3AlnWFFGefENnqzJMypkcYE7Cr6dK1YZTCmom4iRKCxibmKR3l3oKWg
	mlNl5RIwOtGI2LqK7iCf7o5f9hpvrQ6H2+4L6qBJDL8KbRtx2zjcEVuHkiFbcmTB5qJ0rQC7bFMrS
	dhVkyNu1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmIm8-0004Br-QS; Fri, 19 Jun 2020 15:17:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmIm5-0004Ax-GC
 for linux-mtd@lists.infradead.org; Fri, 19 Jun 2020 15:17:50 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86344218AC;
 Fri, 19 Jun 2020 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592579869;
 bh=UEOOXWngWN83R5j4Pi/o/Dcm/fqzKyyBB3Vt398Ofeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vXN+mD5PP3w4cOHhOURB1wp6S0pItj9Lv2MtK4xP8u/KcD/DeA76FrZ4Xux1jUVHZ
 7bs8c8lFp4lWayAEscM4naiGN3Cm1p8hOLJwYUkKANHvLXbN09AauMtq+P7o7yoBGc
 1WPUPT+rPAVWsTNqLXp2J01bb9664fCb8LEq4G8o=
Date: Fri, 19 Jun 2020 16:17:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Tudor.Ambarus@microchip.com
Subject: Re: [RESEND PATCH v3 0/8] mtd: spi-nor: Move cadence-qaudspi to
 spi-mem framework
Message-ID: <20200619151746.GF5396@sirena.org.uk>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200619105701.GD5396@sirena.org.uk>
 <0007c019-1ecf-1913-56a7-facffe345b1f@microchip.com>
MIME-Version: 1.0
In-Reply-To: <0007c019-1ecf-1913-56a7-facffe345b1f@microchip.com>
X-Cookie: Robot, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_081749_583608_80A06A65 
X-CRM114-Status: GOOD (  11.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marex@denx.de, vigneshr@ti.com, bbrezillon@kernel.org, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vadivel.muruganx.ramuthevar@linux.intel.com,
 linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7537168164131351121=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7537168164131351121==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2020 at 11:47:08AM +0000, Tudor.Ambarus@microchip.com wrote:

> Would you please provide an immutable tag on top of v5.8-rc1 so that I
> can merge back in spi-nor/next?

Here you go:

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/cadence-mtd-spi-move

for you to fetch changes up to 31fb632b5d43ca16713095b3a4fe17e3d7331e28:

  spi: Move cadence-quadspi driver to drivers/spi/ (2020-06-19 14:26:54 +0100)

----------------------------------------------------------------
mtd/spi: Move the cadence-quadspi driver to spi-mem

----------------------------------------------------------------
Ramuthevar Vadivel Murugan (2):
      mtd: spi-nor: Convert cadence-quadspi to use spi-mem framework
      spi: Move cadence-quadspi driver to drivers/spi/

Vignesh Raghavendra (6):
      mtd: spi-nor: cadence-quadspi: Make driver independent of flash geometry
      mtd: spi-nor: cadence-quadspi: Provide a way to disable DAC mode
      mtd: spi-nor: cadence-quadspi: Don't initialize rx_dma_complete on failure
      mtd: spi-nor: cadence-quadspi: Fix error path on failure to acquire reset lines
      mtd: spi-nor: cadence-quadspi: Handle probe deferral while requesting DMA channel
      mtd: spi-nor: cadence-quadspi: Drop redundant WREN in erase path

 drivers/mtd/spi-nor/controllers/Kconfig            |  11 -
 drivers/mtd/spi-nor/controllers/Makefile           |   1 -
 drivers/spi/Kconfig                                |  11 +
 drivers/spi/Makefile                               |   1 +
 .../spi-cadence-quadspi.c}                         | 541 ++++++++-------------
 5 files changed, 222 insertions(+), 343 deletions(-)
 rename drivers/{mtd/spi-nor/controllers/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (74%)

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7s1xkACgkQJNaLcl1U
h9CkZwf/bn/NzkeSHpXBj+R11qSg1PNvnUXgrdmG3O2NoZyp3uimOHDbJOXGe/4Z
9V4XQpiJRI1PPz+7mEQbbKev+mGBt4mVuZ3TlTYn9w5omw33LJhBjnTdwgA/Ik3j
uAHE2kytqegcm30R27bLC5kiNQYT8RKm8MqkgYxwrUREapBGPHJ3LASu1c9mBjns
2FFv7w8YpjzK0cGCE8h/PGT/kPGvnkatMOs5sOXCXfCan3ZQ9F++d6hquYRAhYEG
T1D+GSJJAYOL0pJ2/B39g7ha+EILEhh9P9pNcKw68IM9NdbDMYjE0MJrJ4oj1q4f
JuLI56TLnG1VpcXzRvUAbHgsIkfL4w==
=VBZQ
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--


--===============7537168164131351121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7537168164131351121==--

