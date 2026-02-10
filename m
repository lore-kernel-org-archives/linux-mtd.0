Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E88EEA3F14
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od1TvvtRAVFPztYANkoWxtPDWJKe77aYZsgiHL+6axc=; b=c+hhBVkho551hPiT1/ztQWEeCd
	9jxt8oBwntwau8BIOtqO1H5m274fT46i286P3HsC0Nv7Sp+xZMCPv4zhTTsnQ+ZNPg7X4kAnXiuk/
	rY1F+MtCDjLcwgqtbJ5ALBk4+fFEGfCUFKEwodigCylNgpr0d1/3qfPDZaRzSzwyjY+Wefh+LIiKa
	ClGH9O4lGECKxomfEixC32Wck0DwQ89ZRs+eDU7bWKuuEa5bOiC4LE1i9oK6hlQYD8FuuIaI75B54
	HnLiIfHKvjQ/n3bR6ijqPMr7w659HXh50KzC2NkWyHwdneANgldehsTNtjXYHTZScj4wTGgkTZDOI
	va4QFYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiKs-0000000Gdqn-28ku;
	Tue, 10 Feb 2026 07:39:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiKr-0000000Gdqg-1PJk
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 07:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BEDE6013D;
	Tue, 10 Feb 2026 07:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3ED1C19421;
	Tue, 10 Feb 2026 07:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770709140;
	bh=B0b3B0Qs5/qfPBaaRXW4KMtzJHv7uO/t40eDFJuptU4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=vFrVT8EtdhrkE4evqH6Njmi2jJtu+hkLrThz1DcKBsUiwLZH4/f5XlN7kSUxirgBv
	 wtFeAefFaADN/CWR6oU2FACCW77JaefFbtoQ+vYvHZviJVormhTqnTGipyD4XTOmDu
	 eFUhrT9C+4xD7xGlMNkiX0wzPmUMBUEvqWlebYnmSnK21dp45Wnux0DwhDEtQeaZIZ
	 EtX0/epshi6HwmQnKQQTQrWkEDPKhn6MkreMmB3gOYlNoRNgudsDp2j3PoDxLPsrwt
	 bH55LVkr8JpnwLJ9EHA29UZkiVp7bOJkb7FGrtiJh5KiEdnX34g72z4JRV/rwKbZVQ
	 4SzMKJG2qNCGg==
Mime-Version: 1.0
Date: Tue, 10 Feb 2026 08:38:56 +0100
Message-Id: <DGB403FZHES3.1QMYF6PL3O2YV@kernel.org>
Subject: Re: [PATCH 1/4] mtd: spi-nor: winbond: Fix locking support for
 w25q256jwm
From: "Michael Walle" <mwalle@kernel.org>
To: "Eliav Farber" <farbere@amazon.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260208061919.30498-1-farbere@amazon.com>
 <20260208061919.30498-2-farbere@amazon.com>
In-Reply-To: <20260208061919.30498-2-farbere@amazon.com>
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
Content-Type: multipart/mixed; boundary="===============5290297655934968764=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5290297655934968764==
Content-Type: multipart/signed;
 boundary=e30df2874f9189943a99ced2374909534207af888b11016e532adc210f49;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--e30df2874f9189943a99ced2374909534207af888b11016e532adc210f49
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Feb 8, 2026 at 7:19 AM CET, Eliav Farber wrote:
> The Winbond w25q256jwm device supports four Block Protect (BP) bits and
> uses Status Register bit 6 as the Top/Bottom (TB) protect bit.
>
> Update the flash parameters by enabling SPI_NOR_4BIT_BP and
> SPI_NOR_TB_SR_BIT6. Without these flags, the locking configuration is
> incorrect.
>
> Reference:
> https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=3D=
en&DocNo=3DDA00-W25Q256JW.1
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index fb855fe44733..55f1209936d5 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -337,7 +337,7 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0x80, 0x19),
>  		.name =3D "w25q256jwm",
>  		.size =3D SZ_32M,
> -		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SP=
I_NOR_4BIT_BP,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id =3D SNOR_ID(0xef, 0x80, 0x20),

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--e30df2874f9189943a99ced2374909534207af888b11016e532adc210f49
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYrgkBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jF3QF9EQgzY2hTHby+BzXVzdSSsdl0BkdXH8n6
STtVdonFVaANpGL2DzJ9mBboRrYsPoTgAX0aEl+QptOBsm4GD7GR2oFKMdXJg5nx
3c4TnoRroSQAyhzyVvImIX9kk3D1qQYQpbE=
=3tDT
-----END PGP SIGNATURE-----

--e30df2874f9189943a99ced2374909534207af888b11016e532adc210f49--


--===============5290297655934968764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5290297655934968764==--

