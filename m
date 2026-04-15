Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01FAF4198E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLxtw1I4osoQiCaiRuUY45pYSSkAveonssS1hrxe3eg=; b=tzCHV+6OpCiCn/CD9GiGIElXno
	Vjcc30P1zNaO3t4d/tobNZVggUyZ+3Bzy/ZL+yp4LexRNfG+EuYzGC6DMXAHJMi9jjNnooNx7Rgc5
	RczOMWFpY/sjzKxEE9AvwCYlPOTUrvTEoYBxMgOxr8BFIQ/dRBc9PUgGvhmHISmfTUl6W0Dp8Ym8L
	O2A6dWFmmepTUj6bUm+floR90H920kJW0W07HzgaJ2jHk9Hmnzz3HvT55H7gVJ3ZYLD8Gie/hEChF
	CZWD6XgdPvRDSBc/sovAJMotiWydEfj6Va1bmgSYT1i6k+APkjOiRzww10Yfr+kqHDtODziQfVWMA
	RijGUrRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxze-000000010q2-3zwE;
	Wed, 15 Apr 2026 11:01:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxzd-000000010pN-07tV
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 11:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EEC844276;
	Wed, 15 Apr 2026 11:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0655C19424;
	Wed, 15 Apr 2026 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776250872;
	bh=wfSztOscJ6g/GvEpSVS3LSsRFPoa6LURY6+CBFYZQ+s=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=MQMIOS6AxxAJQ8sUBbFDrJoEy9RkD4U9pdOgRbuOzOuOzBS6sWIhP+r8OVNDE0u6t
	 X9WGqko1b92kz6F9jVboim5E0Phq+1Vjdkv4R5qF1vj5xPGPIC6efTMO8ip4GH8fxl
	 o5MPu/6Np8ZkWRVOZSnopb/PXzkIb6YaHXkl1PO0Vens35th0tjlevZIzig5jkbqGS
	 BxWIA7Ic6nlUhZv5NRrMLc7qDTQjvWSk8lhQK9ztBE61aPmz2c5A63wnJiKxZiIoxf
	 qsLgDO+NCyxv9dSTFl/DYAUWxIxSx5FdCQvn6nHDu9OIbEJDf/Gvgq5qI0rj1RZ60l
	 fQFiejZo9xbRw==
Mime-Version: 1.0
Date: Wed, 15 Apr 2026 13:01:08 +0200
Message-Id: <DHTODRW66PEH.3O3564LPS4D6D@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_040113_108498_ADE28050 
X-CRM114-Status: GOOD (  20.48  )
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
Content-Type: multipart/mixed; boundary="===============3685336521537661080=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3685336521537661080==
Content-Type: multipart/signed;
 boundary=3ead2d14c1a4f5c82c814e17eba31aae951c8697eb2218ceb6047b83a57f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3ead2d14c1a4f5c82c814e17eba31aae951c8697eb2218ceb6047b83a57f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Cheng,

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

Honestly, this sounds a bit hyperbolic. Macronix is notoriously bad
with reusing flash ids where you actually have to be able to tell
them apart from each other in software.

So, if you really have to reuse your flash ids, how about having an
unique id in the SFDP tables, like in a manufacturer specific table?
That would really help us. Could you please discuss that with your
product management?

Anyway,

Reviewed-by: Michael Walle <mwalle@kernel.org>

Thanks,
-michael

>
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macroni=
x.c
> index e97f5cbd9..c557525b0 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -138,7 +138,7 @@ static const struct flash_info macronix_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xc2, 0x20, 0x19),
>  		.fixups =3D &mx25l25635_fixups
>  	}, {
> -		/* MX66L51235F */
> +		/* MX25L51245G, MX25L51273G, MX66L51235F */
>  		.id =3D SNOR_ID(0xc2, 0x20, 0x1a),
>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>  		.fixups =3D &macronix_qpp4b_fixups,
> @@ -186,11 +186,11 @@ static const struct flash_info macronix_nor_parts[]=
 =3D {
>  		.size =3D SZ_16M,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		/* MX25U51245G */
> +		/* MX25U51245G, MX25U51293G */
>  		.id =3D SNOR_ID(0xc2, 0x25, 0x3a),
>  		.fixups =3D &macronix_qpp4b_fixups,
>  	}, {
> -		/* MX66U1G45G */
> +		/* MX66U1G45G, MX66U1G93G */
>  		.id =3D SNOR_ID(0xc2, 0x25, 0x3b),
>  		.fixups =3D &macronix_qpp4b_fixups,
>  	}, {


--3ead2d14c1a4f5c82c814e17eba31aae951c8697eb2218ceb6047b83a57f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCad9v9BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hhtwF9EQd7fkyJXzbQQgjCcF/2lMOu+4WAqQc/
oH0aKh/gL3emnCIaB5OuRfwN/QOrIDflAX0cui5Smu/ooizlxihKO1Atn6JxCEhg
CoobprOo3QYbjQan1C5uMSLmXaUgPaKPwmU=
=P5wp
-----END PGP SIGNATURE-----

--3ead2d14c1a4f5c82c814e17eba31aae951c8697eb2218ceb6047b83a57f--


--===============3685336521537661080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3685336521537661080==--

