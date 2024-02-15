Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC2AC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPRfkcxnjwCh/HQY8/UtF3tHGKD5kks2tivSZ3elJZ0=; b=o+RKCCMqFJzcA9VHzt1fFJ26c3
	vgpQ9QeXGQPFxcAIAIOliXWB8TQvYrG1+5/fmj3ctlTn5pQKPACMdiNknh8hmwUh1wqxOPLPe1FQR
	tUDb4OoQwztf5L5cHl11f4bII25F/80F8ynzHRmM4gifZWQvsmEBuryOWY4Z22zK2tz86RSaiqKsD
	u4mmVmwgzXdDT12DRRhQuw6q41Q54KcvER8iOIHVC0BWpS0u4YmilFD0L4LS6ax6A8a1KLMuP8KSq
	zCwf5JhCyMb0yNs8eSBLw7p1IOtWOizeumt0qK0p8WRBqp94GmheLgE0svLXFXLA3QFJE1C1Hly6b
	r1rj/XSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raeMU-0000000Gv5y-2BQg;
	Thu, 15 Feb 2024 16:13:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raeMR-0000000Gv49-3Mku
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 16:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C37F61A9F;
	Thu, 15 Feb 2024 16:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9744C433C7;
	Thu, 15 Feb 2024 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708013597;
	bh=xDPcn1rR6a/SyJCjj/HH9BGqufqZNDz/BbgJRxvXZXw=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=lSdwcUFgaGR58ZNDJxLVqUsRCtjKIrVXWW2KN2+krjR2loF0emf+mHLsYdCBYfgah
	 Yu2x7egshrLZGonarq6itilVqlCIu4CVo1vTXQuChkEcX4tW8bW5GiLtKnHWN1VGN0
	 uh22DKE70W2+EGGwwCSSLXphgMtxo0TF8GAGcI03+pGMOMoPkT5RaZs1Gd1pspUJPp
	 AIvSdIwrH+Axs5gtH+kVbEV4typdXqO+mkTBU/M4PFujhK1NLgV+0tBQzOcMAM42jp
	 diK2r/ltDyegJlODykc68IZzBmHUMbGUT7qefRRAteFk4phUB/QjrMldVz1cLi6Aa/
	 lhXCmQjT3yFEQ==
Date: Thu, 15 Feb 2024 17:13:03 +0100
Message-Id: <CZ5SA85G1KD9.THX8OJP3NY43@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add support for mx66l2g45g
Cc: <linux-mtd@lists.infradead.org>, "Sebastian Falbesoner"
 <s.falbesoner@schrack-seconet.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Sebastian Falbesoner" <sebastian.falbesoner@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240215155520.68159-1-sebastian.falbesoner@gmail.com>
In-Reply-To: <20240215155520.68159-1-sebastian.falbesoner@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_081319_956073_569F22E2 
X-CRM114-Status: GOOD (  18.88  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4760428464693106516=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4760428464693106516==
Content-Type: multipart/signed;
 boundary=86a749c4a87fde6ead17abc2671860e46c143d9e2ed111bc203ac668f4a7;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--86a749c4a87fde6ead17abc2671860e46c143d9e2ed111bc203ac668f4a7
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Feb 15, 2024 at 4:55 PM CET, Sebastian Falbesoner wrote:
> From: Sebastian Falbesoner <s.falbesoner@schrack-seconet.com>
>
> For reference, see the corresponding entry in u-boot,
> introduced in commit baef13ec9d592a27b5d3bf03967bfd2bebd65157:

Please keep in mind that you still need a proper commit message,
SFDP dumps and test have it included in linux, see [1].

>
> [ in drivers/mtd/spi/spi-nor-ids.c:274 ]
> ----
> { INFO("mx66l2g45g",  0xc2201c, 0, 64 * 1024, 4096,
>   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) }=
,
> ----
>
> Signed-off-by: Sebastian Falbesoner <s.falbesoner@schrack-seconet.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macroni=
x.c
> index ea6be95e75a5..1a8f8b654dda 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -90,6 +90,12 @@ static const struct flash_info macronix_nor_parts[] =
=3D {
>  		.name =3D "mx66l1g45g",
>  		.size =3D SZ_128M,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id =3D SNOR_ID(0xc2, 0x20, 0x1c),
> +		.name =3D "mx66l2g45g",
> +		.size =3D SZ_256M,
> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>  	}, {
>  		.id =3D SNOR_ID(0xc2, 0x23, 0x14),
>  		.name =3D "mx25v8035f",

I'm pretty sure, this flash will work without any modification by
using the generic driver (and maybe using the vendor fixups). See
also previous discussions [2]. Thus, I think the following should be
enough:
+	{ .id =3D SNOR_ID(0xc2, 0x20, 0x1c) }

*But* there is already a patchset under review to add SNOR_ID(0xc2)
to match any macronix flashes. Therefore, with the patch in [2]
applied, this flash should work without any further entries.

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
[2] https://lore.kernel.org/linux-mtd/?q=3Dmx66l2g45g
[3] https://lore.kernel.org/r/8b80cf233ea0065adf9841408e59f6a2@kernel.org/

--86a749c4a87fde6ead17abc2671860e46c143d9e2ed111bc203ac668f4a7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZc44DxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvuOTQEA2I2+gmK9wB2Qhar8AKhienWETNwltnow
hq1/r3btHxMA/ivWOWEi4v3l560JlDvzSJyo3hEIfZE0Rs3ZgWJoLAEI
=uFZ8
-----END PGP SIGNATURE-----

--86a749c4a87fde6ead17abc2671860e46c143d9e2ed111bc203ac668f4a7--


--===============4760428464693106516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4760428464693106516==--

