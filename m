Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53681C3F2D2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 16:21:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A5E2467B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 16:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NAAPz2i4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A5E2467B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NK0uW51COIONH5kQ+d08vhMFGJxuas15UxbX+fASwj0=; b=NAAPz2i4jbvSG72Zfw4Ls+z1H
	pWBBDj+Yu7Jth/D6bZVhbc/s3O+wnrRW97SgfpR64lLcRT9C2hBJ6eSVwS0Nq5ytZ1V3zpTfPsUO3
	nhdbzqws/z6hmPvDCrDM9wutpDPuLahotDgAE/rbm3m3M8r1s2d3p7NBgR2z6ML2E3VgmY4C9mp3f
	zVBwCseTAKHM3X82pxv6wNO4phUzAMDOHsoY8y7i44EQ+YTNSx1qD+hIaAW5TYMynrn8rCdZGY+qv
	3CpLVApr4+82Nm3i2jvwAPYdryOEieUfKPLM6a+r24mPZoh/auTNvkhuC2y/jhSsAEMJpMSV4cJv+
	5wj5WKmZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7iNr-0007XB-6F; Fri, 28 Feb 2020 16:21:03 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7iNo-0007Ws-IX
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 16:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED7B431B;
 Fri, 28 Feb 2020 08:20:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FBA73F73B;
 Fri, 28 Feb 2020 08:20:59 -0800 (PST)
Date: Fri, 28 Feb 2020 16:20:57 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH RFC 3/3] spi: HiSilicon v3xx: Use DMI quirk to set
 controller buswidth override bits
Message-ID: <20200228162057.GC4956@sirena.org.uk>
References: <1582903131-160033-1-git-send-email-john.garry@huawei.com>
 <1582903131-160033-4-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1582903131-160033-4-git-send-email-john.garry@huawei.com>
X-Cookie: There Is No Cabal.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_082100_656097_B039A6FD 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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
Cc: linuxarm@huawei.com, andriy.shevchenko@linux.intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============7096171953081296276=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7096171953081296276==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 11:18:51PM +0800, John Garry wrote:
> The Huawei D06 board (and variants) can support Quad mode of operation.
>=20
> Since we have no current method in ACPI SPI bus device resource descripti=
on
> to describe this information, use DMI to detect the board, and set the
> controller buswidth override bits.

Hopefully this is something that the ACPI people will be looking to
address going forwards :/

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5ZPekACgkQJNaLcl1U
h9BxUwf/TDuNgCXr7WDgjO72Sd8M518jpCW63B2SJ/nhlOul+uSQtPp38AvFbOKG
xdPHKVoh82UV1cn6w79H71fMVmDy3y9uPlIB+GTxvnGze9F03HHo0ybJuAD6pvmb
gW4TsG3xZ9TatTMfM5n3sc0APvcfxXe3DjqWOhsdw9zlGddgfpObtyTApRiScQWK
UBZQnih2B8Fkgfbb5QSCjMEuxd4Hwp6lz/EkxKbBvgG3m8H41ONev6XKRkPCNagd
8tS65tJb0nhEuP6X8F0NpkkyQaDwsWSybWp06Zo8X1f5E2yxdhgc0qCbPThGFnil
f30KtWcvkDjZRu0eymnJ+Zab1jvEHQ==
=T+F5
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--


--===============7096171953081296276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7096171953081296276==--

