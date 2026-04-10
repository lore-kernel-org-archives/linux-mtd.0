Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6512E9905C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uD/KSUNdesM+2iyEOSByoA54tjdB4qlo3guOnjw6UA=; b=wXIaIFmogEzjOVjaw2I/tTbSQV
	C5AtMTqm/ItmUeXSCfYP674RPjuXwMs4f7+xS30eCkVqTvyauS5XVgLCMTILyGwknKJsei1cYqUOn
	fC2jgZ3o5VLKD+ASF3FvNAcJefsOCuIRmVlX7gDfCgZ04UXwV1Fu7gM2lgUszmh2hk9LZ/7v4EPmR
	DU1FMiRJaX6TtmN4dFVoGm00hWCh8j+rskJaGbRjazA19nWMnb7pg37VnXCGw/0Z4tvSngg1/B2/0
	WxQQ6ise7dQE0GfxneyuxiFPbR7v6r68x6p47TqnipkK+vLuA0/KT2cDCCS0e+vnGUd0SsC0mRhj8
	l1dnGYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB883-0000000BuVS-17gb;
	Fri, 10 Apr 2026 09:26:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB882-0000000BuV5-0AhY
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 09:26:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A97A60126;
	Fri, 10 Apr 2026 09:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82718C19421;
	Fri, 10 Apr 2026 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775813176;
	bh=yeueMyCXUJ/GdnHH/2kLt3EXQYtr5RfmxZXObvf3sLI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=cCxMT7WaU2uFW4DLTovf7AvV232BmabDuU1VztHcHzWFmmfS1sMF5hCGeBZOd5/Hy
	 nRClXrzg+Mex7R14tocvgxHxlhYosyAyfhKW+PywkfPQzZBEZd4TWDVwsDCaSYzVx+
	 TRgFl8cpjkpXqxW6GJpiYCmVH9hWjWxyXgyMNMDDGDkbhVv21o/F5mjgW5S6C22KZZ
	 zBwCQJfmsgycYZUPud9DpUBoXNqn2vAsMMToCA8B23VIRO9x9UdXxkIE3EtoSTLOiN
	 ZfuhJi/I+4VIGEOusSaGtFZcQB5mIJIO+UkaJNEMqvCE+FVumrEpOq529BPJwe7Oe7
	 Mv/8Me/DpXfgQ==
Mime-Version: 1.0
Date: Fri, 10 Apr 2026 11:26:12 +0200
Message-Id: <DHPD8DFIQCMM.13NPOBDQOSXL2@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Document support for additional
 flash aliases
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alvinzhou@mxic.com.tw>, "Cheng Ming Lin" <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260410091039.389911-1-linchengming884@gmail.com>
In-Reply-To: <20260410091039.389911-1-linchengming884@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3027600363192403437=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3027600363192403437==
Content-Type: multipart/signed;
 boundary=77d1532b3bbbd1b8c7caf587f89c3339908d3f2a3c63e4f6669bf035dc8a;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--77d1532b3bbbd1b8c7caf587f89c3339908d3f2a3c63e4f6669bf035dc8a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 10, 2026 at 11:10 AM CEST, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> Several Macronix SPI NOR flash devices share the same ID.
> For instance, the MX25L51245G and MX25L51273G share the same ID
> (0xc2201a) with the currently listed MX66L51235F.
>
> Add these equivalent part numbers to the comments above their
> corresponding flash_info entries.
>
> While this change does not affect the functional driver logic, it
> significantly improves the searchability of the kernel source tree.
> This helps users easily verify that their specific physical part is
> fully supported, preventing confusion and deterring redundant patch
> submissions that attempt to add duplicate entries for these alias parts.
>
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Hi Cheng,

could you please provide an SFDP dump of all these chips? See [1]
for more information.

Thanks,
-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

--77d1532b3bbbd1b8c7caf587f89c3339908d3f2a3c63e4f6669bf035dc8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCadjCNRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iFLwGAgueu5XDaWUcl2SRo2u7zDSA0mAmyJ+yo
BK+Mz7wPDbmyUm/5RwmTyxDgGFDRNrtAAYDSKOsFPlqeCLlAceTKaRpcVulL3Sdp
1vyOOcsj9h1CPAgAzVImQB28JAOUqdAkYD0=
=/kEs
-----END PGP SIGNATURE-----

--77d1532b3bbbd1b8c7caf587f89c3339908d3f2a3c63e4f6669bf035dc8a--


--===============3027600363192403437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3027600363192403437==--

