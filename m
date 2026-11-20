Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B65606A320
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ONwiZbjJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZlwrzCG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c3WNf/EfwDwkVi2u6J6PD52W/AcgzOZyh4lKJ5OIyaA=; b=ONwiZbjJ1ExqsraZAw/oYWWwiQ
	zRyCFcGQGOEoWPY1fLXklW9/vIohJm7WaNLltokJg6gKHGC+msSFS27UCJye63bubwqMGtO+cG5YN
	AB6N3QgoUWisZvPqGvT5tGUS94FROAD4BJLdtidKcnffxU7+Dd5Bs8mK0eJ4zTGRP/VODA4gSmhyr
	rLQUgjsUSzYhHl8Eaoy6wcFIqmZL2SYRVDXlc4jxqDoSjq0qDVcgsBeyvsYichgKYzcQ13STHGafZ
	/4qMQUXwmJ+/yjvF85FR4xcLP0QWIH1MwcXgJyz03XjD1rhPN6JGQjIFjQeJThxS6ciM2myeXkNiu
	Hw3e6d5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOLb-0000000F3AY-42ev;
	Fri, 20 Nov 2026 13:08:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOLa-0000000F3AE-3ZYj
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 13:08:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id C5F6861E1D;
	Fri, 20 Nov 2026 13:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 06F311F000C4;
	Fri, 20 Nov 2026 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795180089;
	bh=bp1gpixkccc6LO466CpvyGIblODxrqd8Ot9b3hg+I+E=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=mZlwrzCGvf31KzfYa5T3DOIKSP3YJywSc1QEISzBmNDGt/ublb4ZU2/ottafIC0/1
	 5uh1GXbnD/ibf/Tzl7mAt3C3kcc9hZZcSX6q41BR89qOUqdBvaU7s+eBYG/BKO6nkd
	 32w+j8lSKt2FVDsozWoYD0IMlyLnPR9+vEydAltTxuAmND1RSZ+/WLW5rYhWkftAVy
	 Eshr4U6/eUGpEfxVH9YIKek8S0WyazvQRuvPuzRaiw19W4g7YAGscoCE4dXZY9Ia8K
	 38tIIB1S9iQ9u43QsiSAtUKpHAZdFzSC4pv11ZmpWxYMqrFdNC80c824fZAQQ74Tw/
	 nsSm1TwzWtxtg==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 20 Nov 2026 14:08:05 +0100
Message-Id: <DN028AALEL5P.BR73QEJF46H1@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Weimin Wu" <wuweimin@huaqin.corp-partner.google.com>
Subject: Re: [PATCH] [v5] mtd: spi-nor: gigadevice: Add support for
 GD25LQ255E & GD25LQ256H
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
 <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260527032823.771616-1-wuweimin@huaqin.corp-partner.google.com> <20260728064954.3474270-1-wuweimin@huaqin.corp-partner.google.com>
In-Reply-To: <20260728064954.3474270-1-wuweimin@huaqin.corp-partner.google.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4330776577286237539=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4330776577286237539==
Content-Type: multipart/signed;
 boundary=72822c0bb88c2aa1c209a46d8e2a1d87de798bc419193b8023d847dac2de;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--72822c0bb88c2aa1c209a46d8e2a1d87de798bc419193b8023d847dac2de
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

I'm going through the backlog of patches, excuse my very late reply.

On Tue Jul 28, 2026 at 8:49 AM CEST, Weimin Wu wrote:
> Add support for the GD25LQ255E & GD25LQ256H (JEDEC ID c8 60 19),
> a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.
>
> GD25LQ256H shares the same JEDEC ID (c8 60 19) with GD25LQ255E.
> Since GD25LQ256H supports DTR (Double Transfer Rate) mode while
> GD25LQ255E does not, use the post_bfpt hook to detect this capability
> via SFDP and dynamically redirect the info pointer. This allows both
> chips to be supported correctly without breaking write protection on
> GD25LQ255E.
>
> Without this patch, The WP status cannot be obtained using flashrom:
> device:/ # flashrom --wp-status
> ...
> linux_mtd_wp_read_cfg:
> ioctl: Operation not supported on transport endpoint
> Failed to get WP status: failed to read the current WP configuration
>
> and with this patch:
> device:/ # flashrom --wp-status
> ...
> Protection range: start=3D0x00000000 length=3D0x00000000 (none)
> Protection mode: disabled
> SUCCESS
>
> Link: https://download.gigadevice.com/Datasheet/DS-00562-GD25LQ255E-Rev1.=
2.pdf
> Link: https://download.gigadevice.com/Datasheet/DS-01085-GD25LQ256H-Rev1.=
3.pdf
>
> Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
>
> ---
> Changes in v5:
> - Add a feature to distinguish between GD25LQ256H and GD25LQ255E by detec=
ting whether DTR is supported.
> - Link to v4: https://patchwork.ozlabs.org/project/linux-mtd/patch/202605=
27032823.771616-1-wuweimin@huaqin.corp-partner.google.com/
> - Link to v3: https://patchwork.ozlabs.org/project/linux-mtd/patch/202604=
18084253.792395-1-wuweimin@huaqin.corp-partner.google.com/
> - Link to v2: https://patchwork.ozlabs.org/project/linux-mtd/patch/202603=
13133806.2390946-1-wuweimin@huaqin.corp-partner.google.com/
> - Link to v1: https://patchwork.ozlabs.org/project/linux-mtd/patch/202602=
13144133.1778932-1-wuweimin@huaqin.corp-partner.google.com/
>
> Refer to the following documents:
> https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requi=
rements
>
> For GD25LQ256H
> 1. Specify the controller that you used to test the flash and specify the=
 frequency at which the flash was operated:
>
> This flash memory has been successfully tested at 100Mhz frequency on a C=
hromebook device running the Intel Patherlake platform, which is currently =
under development.
>
> 2. Dump the sysfs entries and print the md5/sha1/sha256 SFDP checksum:
> root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> gd25lq256h
>
> root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> c86019
>
> root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> gigadevice
>
> root:/ # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450070102ff00070114300000ffc8000103900000ff84010102c000
> 00ffffffffffffffffffffffffffffffffffe520fbffffffff0f44eb086b
> 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ffd4299dfe84d2
> 14c7ec6316337a757a7507b3d55c190614ff885018010000000000008800
> 00000000f6f5ffffffffffffffffffffffffffffffffffff002050169ff9
> 7764fc8bffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffff8e00fe215cdcff
>
> root:/ # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 09f61fe623df200d86b4ab47c48e3a13718fadbb450fcd430b3cdc49a902b1f6  /sys/bu=
s/spi/devices/spi0.0/spi-nor/sfdp
>
> 3. Dump debugfs data:
> root:/ # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
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
>   mode cycles	4
>   dummy cycles	0
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
>   dummy cycles	2
>
> Supported page program modes by the flash
>  1S-1S-1S
>   opcode	0x12
>  1S-1S-4S
>   opcode	0x34
>
> root:/ # cat /sys/kernel/debug/spi-nor/spi0.0/params
> name		(null)
> id		c8 60 19 c8 60 19
> size		32.0 MiB
> write size	1
> page size	256
> address nbytes	4
> flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_=
READ_CR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET
>
> opcodes
>  read		0x0c
>   dummy cycles	8
>  erase		0xdc
>  program	0x12
>  8D extension	repeat
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
>
> 4. Use mtd-utils and verify that erase, read and page program operations =
work fine:
> Because Chromebooks lack the necessary mtd-utils directives, the correspo=
nding data cannot be provided.
>
> For GD25LQ255E
> 1. Specify the controller that you used to test the flash and specify the=
 frequency at which the flash was operated:
>
> This flash memory has been successfully tested at 100Mhz frequency on a C=
hromebook device running the Intel Patherlake platform, which is currently =
under development.
>
> 2. Dump the sysfs entries and print the md5/sha1/sha256 SFDP checksum:
> root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> gd25lq255e
>
> root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> c86019
>
> root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> gigadevice
>
> root:/ # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450070102ff00070114300000ffc8000103900000ff84010102c000
> 00ffffffffffffffffffffffffffffffffffe520fbffffffff0f44eb086b
> 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ffd4299dfe84d2
> 14c7ec6316337a757a7507b3d55c190614ff885018010000000000008800
> 00000000f6f5ffffffffffffffffffffffffffffffffffff002050169ff9
> 7764fc8bffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffff8e00fe215cdcff
>
> root:/ # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 09f61fe623df200d86b4ab47c48e3a13718fadbb450fcd430b3cdc49a902b1f6  /sys/bu=
s/spi/devices/spi0.0/spi-nor/sfdp
>
> 3. Dump debugfs data:
> root:/ # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
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
>   mode cycles	4
>   dummy cycles	0
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
>   dummy cycles	2
>
> Supported page program modes by the flash
>  1S-1S-1S
>   opcode	0x12
>  1S-1S-4S
>   opcode	0x34
>
> root:/ # cat /sys/kernel/debug/spi-nor/spi0.0/params
> name		(null)
> id		c8 60 19 c8 60 19
> size		32.0 MiB
> write size	1
> page size	256
> address nbytes	4
> flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_=
READ_CR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET
>
> opcodes
>  read		0x0c
>   dummy cycles	8
>  erase		0xdc
>  program	0x12
>  8D extension	repeat
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
> root:/ # cat /sys/bus/spi/devices/spi0.0/
> driver/                          mtd/                             statist=
ics/                      uevent
> driver_override                  power/                           subsyst=
em/
> modalias                         spi-nor/                         supplie=
r:regulator:regulator.0/
> root:/ # cat /sys/bus/spi/devices/spi0.0/s
> spi-nor/                         statistics/                      subsyst=
em/                       supplier:regulator:regulator.0/
> root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/
> jedec_id      manufacturer  sfdp
> root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/
>
> 4. Use mtd-utils and verify that erase, read and page program operations =
work fine:
> Because Chromebooks lack the necessary mtd-utils directives, the correspo=
nding data cannot be provided.
> ---
> ---
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 33 ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigad=
evice.c
> index ef1edd0add70..9fc97feb2849 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -33,6 +33,34 @@ static const struct spi_nor_fixups gd25q256_fixups =3D=
 {
>  	.post_bfpt =3D gd25q256_post_bfpt,
>  };
> =20
> +static const struct flash_info gd25lq256h_info =3D {
> +	.name =3D "gd25lq256h",
> +	.id =3D SNOR_ID(0xc8, 0x60, 0x19),
> +	.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB | SPI_NO=
R_TB_SR_BIT6,
> +};
> +
> +static int
> +gd25lq255e_post_bfpt(struct spi_nor *nor,
> +		     const struct sfdp_parameter_header *bfpt_header,
> +		     const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * GD25LQ255E and GD25LQ256H share the same JEDEC ID (c8 60 19).
> +	 * We can differentiate them by checking if the chip supports DTR
> +	 * (Double Transfer Rate) mode, which is only supported by GD25LQ256H.
> +	 *
> +	 * SFDP parsing sets the DTR hwcaps if supported.
> +	 */
> +	if (bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_DTR)
> +		nor->info =3D &gd25lq256h_info;

We got a new .match which should help you here. You can add both
entries and add a .match. windbond.c should have enough examples you
can look at.

-michael

> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups gd25lq255e_fixups =3D {
> +	.post_bfpt =3D gd25lq255e_post_bfpt,
> +};
> +
>  static const struct flash_info gigadevice_nor_parts[] =3D {
>  	{
>  		.id =3D SNOR_ID(0xc8, 0x40, 0x15),
> @@ -82,6 +110,11 @@ static const struct flash_info gigadevice_nor_parts[]=
 =3D {
>  		.size =3D SZ_16M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id =3D SNOR_ID(0xc8, 0x60, 0x19),
> +		.name =3D "gd25lq255e",
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.fixups =3D &gd25lq255e_fixups,
>  	},
>  };
> =20

--72822c0bb88c2aa1c209a46d8e2a1d87de798bc419193b8023d847dac2de
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawBGNRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gRDgF/fJCUEJYxwNTbxPHtVJZ1JjljPnC3BV2q
6SfUvh2OjGdz/5D7MfoVaiC/hbBSuljNAYDbaFnQ21h9QcZtGCaju75x0Ts2YY6q
vQADc2E4phYwD8og2BdaKgfKJFA+eyJmgN0=
=WQXo
-----END PGP SIGNATURE-----

--72822c0bb88c2aa1c209a46d8e2a1d87de798bc419193b8023d847dac2de--


--===============4330776577286237539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4330776577286237539==--

