Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729FAC3DA60
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2XpxDhYrJD70A+HIUzeh25y8GVrh/Ggz+vrOWDtSgQ=; b=D20IoTonhAY8OTauS+Xw2h7da3
	JsNe4umU645VfLyHUKd+DjWGuWBxEtWr3yuToRXVbJhpEvl0K8a9hsFwHVxf8AoaoXXBT0Z6zT4d1
	+zls1pXBvN3sG/dWiTuqE06AvtD5hWZAdo4ueQuKFURoJog5Na3HYdLvdAnxEeoL4sM8PHJ+tBoRh
	kknpKA3LQdnLlx6UbgavaIXTexS/lq0yJZH3buDpOBC2BFQdZTQ2mCft3AVJOeOImvV12YHfkItOg
	fQPHgZT1TIWwnPA8U9bjnuLy0VCMnm4bvtwxjhZfbdn1RGnwXg8S/VI0Hky7MquCS2cPocXFk0aFs
	CBdeOXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUOzt-0000000GmhK-2vIB;
	Thu, 18 Jul 2024 11:08:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUOzp-0000000GmgL-4BYj
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 11:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F01D61985;
	Thu, 18 Jul 2024 11:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7995C116B1;
	Thu, 18 Jul 2024 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721300904;
	bh=ZN0pfgpa0h7azAOrGIhoAmuGEZwhBLLWXbFXqsh4JG8=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=h6dxjD+W+1KBsJmorH+kzYS6OC3n/7vk5YubMYIkMHfssB4lSlYx4U3HLzNDDVeW3
	 jjBeLGTnvoW1xDdCY0HAHwdeSOxfxVnVqKGVaOvKEC5BSdgi9yv0Mi1hMbBcmKfwtB
	 JSsygvwTseI0kdqMkIeVdCTs/wWt32Ej9i6FiCLIDu5XZq1zD/PWi/x7dYWFc1dJyx
	 b7j5AwwA6wPCDDbw5MFI/YD9+0wP7T4GE5Ai7ePbful+ZwfQDp4RUTbQDboaK2TU9s
	 UwrHE95jc0mWnr5H3LDtfB6VMur+elj005mUjPQZf0LXFl8igZNajTC7pVnPAA1pQO
	 MsqPzRLit7Ppg==
Date: Thu, 18 Jul 2024 13:08:18 +0200
Message-Id: <D2SM8SE7KJCC.3DY7BH5LJMM6M@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <claus.fabig@emerson.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: Subject: [PATCH] mtd: spi-nor: add support for MRAM Everspin
 EM008LXB
X-Mailer: aerc 0.16.0
References: <ZpjY9APb+VdiFO0q@5QFXWL3.emrsn.org>
In-Reply-To: <ZpjY9APb+VdiFO0q@5QFXWL3.emrsn.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_040826_191111_CADB08A9 
X-CRM114-Status: GOOD (  27.38  )
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
Content-Type: multipart/mixed; boundary="===============5388921455567153370=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5388921455567153370==
Content-Type: multipart/signed;
 boundary=25fd51e0eade6fc92ff5244ae630edc3fe71c2c62d389baf92d948343c5d;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--25fd51e0eade6fc92ff5244ae630edc3fe71c2c62d389baf92d948343c5d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

There is something odd with your mail client, maybe have a look at
git send-email.

Also we usually push back on the MRAM devices and refer the users to
the at25 driver. But as this doesn't use the NO_ERASE flag.. I'll
let Tudor and Pratyush decide.

> From: Claus Fabig <claus.fabig@emerson.com>
> Date: Thu, 18 Jul 2024 09:53:36 +0200
> Subject: [PATCH] mtd: spi-nor: add support for MRAM Everspin EM008LXB
>
> The Everspin EM008LXB MRAM has 8Mb and is populated on a custom board
> using Microchip's PCI12000 spi host controller running on low 30MHz clock=
.
> According to Everspin Read Fast (0xb) command below 60MHz is neither
> specified and nor tested. Test shows that using Read Fast (0xb) will
> result in reading inconsistent data in this setup but writing is fine, so
> only supporting Read (0x3) command should be acceptable for the moment.

This is really odd. Is there an explanation for that? Usually, fast
read will just add dummy cycles in between. Also the datasheet just
mentions a "maximum frequency" which actually makes sense. Do the
dummy cycles for our fast read operation match the number of dummy
cycles in your device?

> The device is JEDEC compatible (JESD251 and JESD251-1) but not able to
> provide SFDP information.

There is no SFDP data for this chip is it? But it has a READ_ID
command.

> For spec v3.2 refer to www.everspin.com/file/158315/download.

Please as a "Link:" tag just before your SoB.

> Successfully tested according to
> www.kernel.org/doc/html/latest/driver-api/mtd/spi-nor.html:

Great thanks, this should go below the "---" line.

> cat /sys/bus/spi/devices/spi-EMR5555\:00/spi-nor/partname
> em008lxb
>
> cat /sys/bus/spi/devices/spi-EMR5555\:00/spi-nor/manufacturer
> everspin
>
> cat /sys/kernel/debug/spi-nor/spi-EMR5555\:00/capabilities
> Supported read modes by the flash
>  1S-1S-1S
>   opcode        0x03
>   mode cycles   0
>   dummy cycles  0
>
> Supported page program modes by the flash
>  1S-1S-1S
>   opcode        0x02
>
> cat /sys/kernel/debug/spi-nor/spi-EMR5555\:00/params
> name            em008lxb
> id              (null)
> size            1.00 MiB
> write size      1
> page size       256
> address nbytes  3
> flags           HAS_SR_TB | HAS_16BIT_SR | HAS_4BIT_BP | HAS_SR_BP3_BIT6
>
> opcodes
>  read           0x03
>   dummy cycles  0
>  erase          0xd8
>  program        0x02
>  8D extension   none
>
> protocols
>  read           1S-1S-1S
>  write          1S-1S-1S
>  register       1S-1S-1S
>
> erase commands
>  d8 (1.00 MiB) [0]
>  c7 (1.00 MiB)
>
> sector map
>  region (in hex)   | erase mask | overlaid
>  ------------------+------------+----------
>  00000000-000fffff |     [0   ] | no
>
> cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00020000 00020000 "spi-EMR1010:00"
> mtd1: 00100000 00100000 "spi-EMR5555:00"
>
> mtd_debug info /dev/mtd1
> mtd.type =3D MTD_NORFLASH
> mtd.flags =3D MTD_CAP_NORFLASH
> mtd.size =3D 1048576 (1M)
> mtd.erasesize =3D 1048576 (1M)
> mtd.writesize =3D 1
> mtd.oobsize =3D 0
> regions =3D 0
>
> dd if=3D/dev/urandom of=3Dspi_test bs=3D1M count=3D1
> mtd_debug erase /dev/mtd1 0 1048576
> mtd_debug read /dev/mtd1 0 1048576 spi_read
> Copied 1048576 bytes from address 0x00000000 in flash to spi_read
> hexdump spi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0100000
> sha256sum spi_read
> f5fb04aa5b882706b9309e885f19477261336ef76a150c3b4d3489dfac3953ec  spi_rea=
d
> mtd_debug write /dev/mtd1 0 1048576 spi_test
> Copied 1048576 bytes from spi_test to address 0x00000000 in flash
> mtd_debug read /dev/mtd1 0 1048576 spi_read
> Copied 1048576 bytes from address 0x00000000 in flash to spi_read
> sha256sum spi*
> cf9a1f3f4089602d194d67d1a918a574a5ca1d9aa71d391a661818c1f0ee1aab  spi_rea=
d
> cf9a1f3f4089602d194d67d1a918a574a5ca1d9aa71d391a661818c1f0ee1aab  spi_tes=
t
>
> Signed-off-by: claus.fabig@emerson.com
> ---
>  drivers/mtd/spi-nor/core.c     | 2 +-
>  drivers/mtd/spi-nor/everspin.c | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e0c4efc424f4..95267d9e8b65 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3713,7 +3713,7 @@ static const struct spi_device_id spi_nor_dev_ids[]=
 =3D {
>  	{ "mr25h256" }, /* 256 Kib, 40 MHz */
>  	{ "mr25h10" },  /*   1 Mib, 40 MHz */
>  	{ "mr25h40" },  /*   4 Mib, 40 MHz */
> -
> +	{ "em008lxb" }, /*   8 Mib, 133 MHz */

Nope. No new spi_device_ids. See also below.

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, spi_nor_dev_ids);
> diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspi=
n.c
> index add37104d673..c1f004c39c1c 100644
> --- a/drivers/mtd/spi-nor/everspin.c
> +++ b/drivers/mtd/spi-nor/everspin.c
> @@ -31,6 +31,11 @@ static const struct flash_info everspin_nor_parts[] =
=3D {
>  		.size =3D SZ_512K,
>  		.sector_size =3D SZ_512K,
>  		.flags =3D SPI_NOR_NO_ERASE,
> +	}, {
> +		.name =3D "em008lxb",

Drop the name, but add the corresponding ".id" property. Then, this
entry will be fetched automatically. In your DT you use the generic
compatible.

> +		.size =3D SZ_1M,
> +		.sector_size =3D SZ_1M,

This is odd. The sector size is 64kB.

> +		.flags =3D SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
>  	}
>  };
> =20

-michael

--25fd51e0eade6fc92ff5244ae630edc3fe71c2c62d389baf92d948343c5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZpj3oxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i+2gGApwFatLfNayXGxzmcHrseo4uGtOfMoENB
O6DNoU9/Fm5+HD3aztpm+7gv9xgT5Ks6AX9nNgXKf8l7tp0bLp0i+Em3rv69B4iL
oji3p955e17/s30L9jQTx46ty9oPvZ0bLkM=
=ojOc
-----END PGP SIGNATURE-----

--25fd51e0eade6fc92ff5244ae630edc3fe71c2c62d389baf92d948343c5d--


--===============5388921455567153370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5388921455567153370==--

