Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB84CA0EE0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Aug 2025 20:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dpd5RZxQwJg8TmRrFjUG8jJfZZtMI2vyAc17Dczo7HY=; b=YajwWJgvW+AXzBpHVO/XGNKEYY
	DDu3IibtIvj7ZGJgOWmtIIU4e9zmq7hNJakXSahZmnM3bqiD6V5diPJE1OHReb5kXsu8ti/iFsNEM
	ZDHFCWrJT5qCcIFOhoWfoLME+oHY0dKF79bElsSAr6PncDGce1rHWakvgaiYJ7yeJ87WkJ309oSaG
	q3JLu6R/CTjyRy9WfV82GnyCRTVwx5XFz3BIYjVL6/rwLRYBxkS2c1rbQ1gOAwTP2WFS1j0eY40GR
	tEaB+uESO3XuEB05tfLTouGghpYPUM1Midjkem5iBzEG7pbK1Ghv0p54S7d8Ekt2L+4HCBBFaChHY
	QnuYnQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umI36-0000000Ew1h-2ZfW;
	Wed, 13 Aug 2025 20:26:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umI32-0000000Ew1E-3Ps9
	for linux-mtd@lists.infradead.org;
	Wed, 13 Aug 2025 20:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AE58A57DB0;
	Wed, 13 Aug 2025 20:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0CAC4CEEB;
	Wed, 13 Aug 2025 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755116771;
	bh=ZvdX09wJY4AtaHH7PJqDx5iUZlrZup188ldJOJfxmq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVVdArbwWk5bR1aJCb+7CvS6zZU1DxBh48HyhLTJtH/LaEjzHscNNotUYjlIzp2+G
	 DJw8zz35xFWnCAHyCsg6fqixWFUstdfB1bdw04AzniszC5CdS1qT/1H7JrRkxhmjBs
	 ANjKIRcfTMPIum34tyN4mPq8G61taAlhtb/uS9satT1AT5n9PJbN9xelqGWXoHBVWf
	 P0hHUH/I34k2ufHgdPy1XX5s1pAhS7ffIsuxuvM2bOHnyMFWYJbvmH5xAtyqqCGmMo
	 XNRiKNjM9ASOw/V1dvDCIFFVNZvaN747HOm8CnJvuCVHka9qBR2lyxrSKfi5XMmOUG
	 qWXxFYMzaDfIQ==
Date: Wed, 13 Aug 2025 21:26:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
	p-mantena@ti.com, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	a-dutta@ti.com, u-kumar1@ti.com, praneeth@ti.com
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
Message-ID: <6c35baad-a332-4b0a-96ca-1cdb3840ad94@sirena.org.uk>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com>
MIME-Version: 1.0
In-Reply-To: <20250811193219.731851-2-s-k6@ti.com>
X-Cookie: Turn the other cheek.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_132612_920217_F5D8E6C8 
X-CRM114-Status: GOOD (  13.22  )
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
Content-Type: multipart/mixed; boundary="===============6861042300066588126=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6861042300066588126==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mmZIKx6gFDPoRpc4"
Content-Disposition: inline


--mmZIKx6gFDPoRpc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 01:02:10AM +0530, Santhosh Kumar K wrote:
> From: Pratyush Yadav <pratyush@kernel.org>
>=20
> Some controllers like the Cadence OSPI controller need to perform a
> tuning sequence to operate at high data rates. Tuning is needs to happen
> once the device is switched to appropriate mode (say 8S-8S-8S or
> 8D-8D-8D). Add a hook that spi-mem client devices can call in order to tu=
ne
> the controller to operate in a given mode and data rate.
>=20
> This is somewhat similar to eMMC/SD tuning for higher speed modes like
> HS200, but there isn't a standard specification around the same though.

Should we have something that blocks these tuning required modes without
the appropriate tuning, and/or allows discovery of which modes require
this tuning?  This all feels very landmineish - client drivers just have
to know when tuning is required.

--mmZIKx6gFDPoRpc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmic9N0ACgkQJNaLcl1U
h9Aiqwf/Vw8eFxn/K8yK04nsuHsfQ4PO9rCdzoEwZDqZtu2pEScOTW/DICKZXBMU
fd+M8RbnaDN/yFplMeMV7VHTsUMaCr3l7iuiy86PXmCvG7BY3LWWIwiFhBgbxtXn
Gwwhsybuh11DeZLM9Ekfiw7BlgJ10DuNxRbMZaS/am4tx23WDsSeivILzJJjkgo3
daj27PmjDX2zaTt7Tj/htGNINjG+MHlAfjPWaIscccJzvdKxKpMSrfpyuxl9Zuu9
qTyAfUBqHGsL0+IUHRJd4RzwoRAYKPEq5xNqtp1b5eE27tGs+ESloRWh3r/dSB8o
n2ZIJpyYr9Lb9mlDTBT821tp0xRztQ==
=AZ6f
-----END PGP SIGNATURE-----

--mmZIKx6gFDPoRpc4--


--===============6861042300066588126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6861042300066588126==--

