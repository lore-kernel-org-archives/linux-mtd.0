Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE026E63F3A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Feb 2026 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+emmd/JZibnHtaJ7hf/WygOB97/Xl3ompKCFJtl0NqI=; b=l+GyM3tLgm7TkCCphCQTx/4gtz
	64pGswTBYTOSNEbgTjGgrTEb5yT/W+JUOxGxSQxlJmkIwiebXE2fLa0QeWXfO2r4f5XHP/E0HmgnB
	WplRWgEjCiXD9pvYOAtvlBECZ9siQwuNFYGsRqNDhYalFxKrjIqBFwPgvqcsxrolWUtkow7fnmqgr
	S35H5+o0AouKDYopz5+jEYHR0VEoQ6fCTVf4dQenT3P1gTK2MAiT5DJnjg0rxG0f6vKxv9i40DPvM
	8fF1YEuD1LtZNQfDLa1yUqip2Vwio6FfKSWH5ZEJVJGqpRmREaU1hOuci9y0fwK57ctHxbTGLmX85
	ckRdWZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vru8E-00000006AA3-0IY6;
	Mon, 16 Feb 2026 08:39:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vru8B-00000006A9h-2Ap6
	for linux-mtd@lists.infradead.org;
	Mon, 16 Feb 2026 08:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C420144232;
	Mon, 16 Feb 2026 08:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E19BC116C6;
	Mon, 16 Feb 2026 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771231138;
	bh=z8qQOo4zQz6b18+R4kGihGA9SYWWvrhw+mj/CPevLuE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=asryk9XRNn8S8791ZW4mpQVnATHFq8z2ghggAo1VB10laYoFdv3yma3YU5FtCGtTv
	 v9Z1LbpGAgMVI7plVf8D94b6dAvFTL2Y25vZ7cUBQ84nbHFVsq8y4M1IZMHoMNbyEB
	 PIP8Rport84nGfFwNIpUhkx0/gmfovPpLsvFDVvyCNec5WOREvtaGa+fX4gRphg6am
	 3K5Frw7L+331FIpuBx1CrGlM/xe+wVgwV3GPIG+WWn1czOpU+NDaWmq9GNWrdQWAVb
	 4gMObnCzPNxH/Ou6twWdoc4Jh7yam0Xzar/y7n09RffQpp6qIgQIBZ+BB2q+K5hPaN
	 slaAHh7cKE4Ig==
Mime-Version: 1.0
Date: Mon, 16 Feb 2026 09:38:54 +0100
Message-Id: <DGG91A4GSBE3.1BC2CKTHAI68D@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: add support for GD25LQ255E
Cc: <pratyush@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Weimin Wu" <wuweimin@huaqin.corp-partner.google.com>,
 <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260213144133.1778932-1-wuweimin@huaqin.corp-partner.google.com>
In-Reply-To: <20260213144133.1778932-1-wuweimin@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_003859_614683_62AE4377 
X-CRM114-Status: GOOD (  16.44  )
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
Content-Type: multipart/mixed; boundary="===============8684631461466684034=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8684631461466684034==
Content-Type: multipart/signed;
 boundary=d2b8fe56006c30d20069cee12c988b1bdbd9b68d35faef64f1706f1ac728;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d2b8fe56006c30d20069cee12c988b1bdbd9b68d35faef64f1706f1ac728
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Feb 13, 2026 at 3:41 PM CET, Weimin Wu wrote:
> gd25lq255e is similar with gd25lq256d, has 32MB of total capacity.
> It support Quad Page Program which mean programming the memory using
> four pins: IO0, IO1, IO2, and IO3.

Did you do basic tests, like described in [1]?

> Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
>
> ---
> / # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> gd25lq256d
>
> / # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> gigadevice
>
> / # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> c86019
>
> / # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060102ff00060110300000ffc8000103900000ff84000102c000
> 00ffffffffffffffffffffffffffffffffffe520f3ffffffff0f44eb086b
> 083b42bbfeffffffffff00ffffff44eb0c200f5210d800ffd439a5fe82e4
> 1452ec6216337a757a7504bdd55c2906140008500001ffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffff002050169df9
> 77648fdbffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffff0effff215cdcff
>
> / # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 9f56d460181f7c0b6cc16a69554e3b587948b5f65323e976d0a4f1dbbcb93d94  /sys/bu=
s/spi/devices/spi0.0/spi-nor/sfdp
>
> / # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
> Supported read modes by the flash
>  1S-1S-1S
>   opcode	0x13
>   mode cycles	0
>   dummy cycles	0
>  1S-1S-1S (fast read)
>   opcode	0x0c
>   mode cycles	0
>   dummy cycles	8
>  1S-1S-2S
>   opcode	0x3c
>   mode cycles	0
>   dummy cycles	8
>  1S-2S-2S
>   opcode	0xbc
>   mode cycles	2
>   dummy cycles	2
>  1S-1S-4S
>   opcode	0x6c
>   mode cycles	0
>   dummy cycles	8
>  1S-4S-4S
>   opcode	0xec
>   mode cycles	2
>   dummy cycles	4
>  4S-4S-4S
>   opcode	0xec
>   mode cycles	2
>   dummy cycles	4
>
> Supported page program modes by the flash
>  1S-1S-1S
>   opcode	0x12
>  1S-1S-4S
>   opcode	0x34
>
> / # cat /sys/kernel/debug/spi-nor/spi0.0/params
> name		gd25lq256d
> id		c8 60 19 c8 60 19
> size		32.0 MiB
> write size	1
> page size	256
> address nbytes	4
> flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_=
READ_CR | SOFT_RESET
>
> opcodes
>  read		0x0c
>   dummy cycles	8
>  erase		0xdc
>  program	0x12
>  8D extension	none
>
> protocols
>  read		1S-1S-1S
>  write		1S-1S-1S
>  register	1S-1S-1S
>
> erase commands
>  21 (4.00 KiB) [1]
>  5c (32.0 KiB) [2]
>  dc (64.0 KiB) [3]
>  c7 (32.0 MiB)
>
> sector map
>  region (in hex)   | erase mask | overlaid
>  ------------------+------------+----------
>  00000000-01ffffff |     [   3] | no
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigad=
evice.c
> index ef1edd0ad..356a3f196 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -82,6 +82,12 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>  		.size =3D SZ_16M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id =3D SNOR_ID(0xc8, 0x60, 0x19),
> +		.name =3D "gd25lq256d",

Drop the .name.

> +		.size =3D SZ_32M,
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_QUAD_PP,

Are you sure you need SPI_NOR_QUAD_PP, isn't that covered by the
SFDP? In any case, I think the SPI_NOR_QUAD_PP flag is wrong and
should be replaced, instead a fixup should call
spi_nor_set_pp_settings() directly.

> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

The flash supports SFDP, so drop .no_sfdp_flags.

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

--d2b8fe56006c30d20069cee12c988b1bdbd9b68d35faef64f1706f1ac728
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaZLXnhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g3FwF/aIPWw4gdNakGsdTw+DcZ2EJ8q3tJvq6+
msFPn8aPkEQnGGDwD51yCJbpCo3Ctww6AX4ok+2KgMaXuqjHofsyfh+KLdLzMg9X
vFj+ZNKYhKG2ns5RUt24wTt2mltmHnpII6Y=
=PTkF
-----END PGP SIGNATURE-----

--d2b8fe56006c30d20069cee12c988b1bdbd9b68d35faef64f1706f1ac728--


--===============8684631461466684034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8684631461466684034==--

