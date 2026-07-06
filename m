Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AE8C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eydjPCMTUXKAw9tm8X8mIQDSZF263eC8em5JsD3HyTA=; b=O4iaAhCDFkKK8pgCHGgtgDofrK
	ggWY9rkVhE0SL/lZPMFGunoba2H11ltAmN2cABti7ho4tU7bWs4RgjMJa1eM7Ysrwy9Z5bqbfL9+Y
	Zx/80dD3rPRu9Y0c3tsBVk09LK5cBCxnGrToDgnqjyvBV9kaI29IRVLpDwVL5QCQpC1p6fUisHiLk
	uQxlfF+WfhcBj7F0AtFE+yr6viow3Zfe6ZS+Ov2pmUsEuYqVxpcqLitgMHgItw7eeAnIF3yYsNMo/
	/C7h0aKGxxFUig+EiO2HTddve6Qhkvqxq2Bi9U6xm9G+WD55WQb6YkKYNkg0SU21QbibP0yWmgscX
	2HmVE54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk80-0000000CixB-3ZQR;
	Mon, 06 Jul 2026 14:16:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk7z-0000000CivT-3Bih
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:16:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id D6645600DA;
	Mon,  6 Jul 2026 14:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 13D7B1F000E9;
	Mon,  6 Jul 2026 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783347414;
	bh=7zVdxzdoukOO5YcWp2VdJ5+gkoTN00ldW+8CFs9RZPk=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=G29th2JbcrtvOil3s5F72t4HAmwrdsT5dDgGSSPaz5Ky4u1m5oto1XtihMRBBcbWv
	 ZHVkTnYxa0mJIYuwJfk/IjsgCWC7mbN4IVLUpdpJKTaCpwGl6Z7dQivQxVdbI5W237
	 LdubLtNfPNSvqzD6nSLXne+aP4mDyUWrLVri8qUuM8UvvSwvBPicc74lYAFOYgJTxT
	 20E+VRSHeOVd11Iqj6AxyktDLGr4ND9RXoqGq6P6lfuOb9QDsy/9LJttYf4OLtLeNl
	 4Zwn3rVqfg2sRl7mLE6RuAO91SsTfTA444JJsSd8l0FbLp7GxMMSz1ngJbpHErdJz2
	 ObggeeXB8XMNA==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 16:16:50 +0200
Message-Id: <DJRJWAM9BCOB.2NBILEFO5EBTJ@kernel.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH 08/30] mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad
 page program capability
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-8-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-8-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============1288146675164498041=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1288146675164498041==
Content-Type: multipart/signed;
 boundary=8bc0224c47795e4dafaffe517c3ea5ad3840e332f3b6c14e4c3d84eabdbf;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8bc0224c47795e4dafaffe517c3ea5ad3840e332f3b6c14e4c3d84eabdbf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> The benefit is not massive @25MHz, yet it is a supported feature
> of the chip which is already handled by a flag, so let's enable it and
> earn that little 1% write throughput.

If we really go the drop any support for non-SFDP flashes and I'm
still not sure about that. I'd argue that the entry should have been
dropped entirely. Cleanup up the that table instead of adding a
feature you already say isn't that useful, nor do I think is often
used, as these tiny nor flashes are mostly used for read-only
storage (or at least not writing that much).

-michael

--8bc0224c47795e4dafaffe517c3ea5ad3840e332f3b6c14e4c3d84eabdbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku40xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hz1wF+PcA4uPZ/lt568zAGPyZsTINAu2hiFrZW
cDPMEwdcF+vfzApJ5rlb2JScmAqQGxGsAYC54DEs6hhUmZ3kztmQaMwZiLSWNOdc
ielvzGhGgwxRatD2XQfKdkANSOgSGhfozzE=
=gd1U
-----END PGP SIGNATURE-----

--8bc0224c47795e4dafaffe517c3ea5ad3840e332f3b6c14e4c3d84eabdbf--


--===============1288146675164498041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1288146675164498041==--

