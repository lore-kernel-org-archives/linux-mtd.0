Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7C5C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 11:54:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE2761414
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 11:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE2761414
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfrGA6ODfUf/5hmZy3dHxBgfjBfHoAsOAvQpyevCenQ=; b=Otfe9JHizaY7NiENHcGVfRQ0tX
	7XnZBNn7kWNuS4iiT1JcBUZccScKdSrrMWSmiN1WIL8ZZspT1tW9eZsn+N9HYVy9+ksyzt+MVVrtC
	2LYCqjDwK/SZjRY4heEL/iCieNBra5BHDMLjdCAXoB+Da8mTO1RiKt/G3scTchUZe26JmEsCvJrZS
	1fcXtO9IDmM4cDRJKMq8bsyTNEfDTHhkWtEB4Y1baqYmA7/d8rI1w1xwxjAccpiSpQW8h1H3nrxIP
	j1P+9z5IReYQtOqPBuM27sdxrwMDFuDljiOxNNsvUzM+4Wxnl0dhAL20W4g2sdeAtsJd1CRh4MAj8
	bHUrIFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp8Og-00DQ5N-Kj; Fri, 04 Jun 2021 11:53:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp8Od-00DQ3z-Iy
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 11:53:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B27646140B;
 Fri,  4 Jun 2021 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622807631;
 bh=wkfBTP/8Cl/ZYhpzN7ZVw7aCTOAdTvV8+7bQBKp3nZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvakbyQQCWtRIie4mr+fW8ixx5ZhdhV+5EQXrALyKAawM8b7jRBcj9uARUx3Ha7Bi
 h5qJMBL5cf1oYy+U1NZUcgpiI8uHBUmDW9sFqVVxN/1/+fpUO+g23IlQv66RvsdzF+
 3cFLi02K17Zr9ilnAxJbczMV7MnVRyklIlzP167BZzKJIdpDBy5k2NZWjX7yqnP0Al
 yBUvT8ie5lrAU0ifTIALP1WNKBCaLijLqrxrks6ABSXatjl/OGLgJAwzi6/8F8Au7v
 /B2K571o3i8hLBUoiH7LabIgiRvWd8f153TiquK7pg4dLPy+KSHbaxNFWqI6c+MCCO
 v2hcATRA9SfPg==
Date: Fri, 4 Jun 2021 12:53:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for second flash chip
Message-ID: <20210604115339.GC4045@sirena.org.uk>
References: <20210525160318.35802-1-mika.westerberg@linux.intel.com>
 <20210525191414.dc45h27rzqen4dce@ti.com>
 <20210526091250.GY291593@lahna.fi.intel.com>
 <20210526092417.GA291593@lahna.fi.intel.com>
 <e82f44552d0d4284fc5ed22ee0bee85a@walle.cc>
 <20210526102810.GB291593@lahna.fi.intel.com>
 <YLTILUh+bPhZ4ToR@lahna.fi.intel.com>
 <YLi3/DRqGzdlosNf@lahna.fi.intel.com>
 <20210603180843.hjzynysgby3d3e5r@ti.com>
 <YLoOSMxeGXP07Tfw@lahna.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <YLoOSMxeGXP07Tfw@lahna.fi.intel.com>
X-Cookie: There is a fly on your nose.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_045351_666526_183810B9 
X-CRM114-Status: GOOD (  13.69  )
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
Content-Type: multipart/mixed; boundary="===============4440712607490930033=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4440712607490930033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 04, 2021 at 02:28:08PM +0300, Mika Westerberg wrote:

> Yes, exactly. With ACPI/DT the SPI core handles this after the SPI
> master device is registered and that would result spi_nor_probe() to be
> called for the children. However, with this one there is no ACPI node
> for the controller (it is PCI enumerated) so there would need to be some
> way to create that child device. In the old days that would be "platform
> data" but that's pretty much frowned upon these days ;-)

No, that's totally fine and normal - it's just like probing a MFD, we do
it all the time for child devices.

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC6FEIACgkQJNaLcl1U
h9D6Ggf8DZvlbuhVo6ZA52w7CxSWflHRgEqUmQ3ABMtOk7hUgKOiaRL1Wq4Poz9T
2sCKQgDlQAQo8isCFh+7wUlcIvLG4RHEFs5xns/0+u4ZQGXfovR35yCdKpGfzoR3
X4+vtWBvG+tRyv7ZimkiUSEtlZxMjzPzFipboBDAwaa8vaTKDfPOfIiS+1Addbrw
T8RgG7hYD5eZJ8kbzxxzI4e7oQKVD7ceg39hBwdhEzWtNQyvz3g9g+psInmwaqAI
31RMJzdL3J01OUIPPbxQxw+sfKItkW+SOXHfihUjwK/9wj9KOxZNuNMt7f6bUAcM
lq4LtBV5fRgq6l8OTWdOWCDZMkTryQ==
=51cF
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--


--===============4440712607490930033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4440712607490930033==--

