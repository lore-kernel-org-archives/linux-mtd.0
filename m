Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91F0E73156
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Feb 2026 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsHWDtk9apgQcpwy4MKujbo9LljtTpbTioyE9zQ1gbE=; b=jSauxAUWKwM1O1YRW8kHvXOCoe
	ekhJVOitZj7yGoumgk2csRAcLUkuMIPIKukjSXkzorpN6tGXO/1kvwFQOFrTK3uMEwaPFIPCwua1R
	oRaoOWJY9Xk7SjywjuWq21CaCS5tjgM0JrCU5NGEGDEYGGjaYpyzCttwSVOnd6Y9jFCMz0sPTTggw
	+BqwAOxrpmt1PEQXdDkBYxK0Cy+CriwHZomQ4HLmU/z/UMIXaRwDA+Ydlh5QlzySFiSHZzD1/LVwZ
	1zTGllkGFv1O47Lfbis6cTBq2YgNDxJmquiSAmJrcvX404O+8D5GaJgEOJ5IdqSy8fteUyLyfIYdH
	QHn0Y9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrLf-00000004pyX-0IRg;
	Mon, 02 Feb 2026 10:40:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrLe-00000004pyR-0Q53
	for linux-mtd@lists.infradead.org;
	Mon, 02 Feb 2026 10:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AD9960125;
	Mon,  2 Feb 2026 10:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587E9C116C6;
	Mon,  2 Feb 2026 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770028800;
	bh=2lugR36GnalZjbbLdHU0QekyDTB6OyQsw8/ncpORJos=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Xb7XNeoJJjcCwGlS/DAo79DmNe3j7QrgnPH7mWgA5F5YKxQPu7D1hDtUTd2PcPlZR
	 9tk+sJ+RBARFhEEpuT4z/NI+IeaD9bnPfmzCbHHESWM2k83X236LXi6WnBRoQi1vou
	 PltJzuM7IaXo4Wys9g1diGMuKWPFaORztmlDDsg/egiiwwBpeB8tNKnBE1huSQZfdU
	 n8MoCHzSIxYjJdLljOv7iCOvX9wjRUJxynFtthYMorv5Sq6wWS+iJrAbwg3LdSneSA
	 sSL1S3f+6dgT9CxB3nKtS1/QlUQ/jLr3/9sh3aK+P4871ESlArtEbBmiJytCA0uipB
	 /UdXO9zi9c9fQ==
Mime-Version: 1.0
Date: Mon, 02 Feb 2026 11:39:56 +0100
Message-Id: <DG4EUBLBNP5L.1PETV74CXJCAM@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: add support for BoyaMicro BY25Q128AS
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "David Bauer" <mail@david-bauer.net>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Shiji Yang" <yangshiji66@outlook.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <OS7PR01MB1360230CC7F2682FDD26FE40ABC9CA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB1360230CC7F2682FDD26FE40ABC9CA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============2634590992346429399=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2634590992346429399==
Content-Type: multipart/signed;
 boundary=702d1f9d6b894d331fd76a3db258386ffa0dc42026b086f0f18fedefe9cc;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--702d1f9d6b894d331fd76a3db258386ffa0dc42026b086f0f18fedefe9cc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Jan 31, 2026 at 4:10 AM CET, Shiji Yang wrote:
> Add new SPI NOR flash vendor BoyaMicro and flash chip BY25Q128AS.
> This chip has 16MB of total capacity, divided into a total of 256
> sectors, each 64KB sized. The chip also supports 4KB sectors.
> Additionally, it supports dual and quad read modes. This chip does
> not support 16 bit SR writing, so we have to introduce a fixup for
> it to handle quad_enable mode correctly. SFDP dump:
> 00000000  53 46 44 50 00 01 01 ff  00 00 01 09 30 00 00 ff  |SFDP........=
0...|
> 00000010  68 00 01 03 60 00 00 ff  ff ff ff ff ff ff ff ff  |h...`.......=
....|
> 00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000030  e5 20 f1 ff ff ff ff 07  44 eb 08 6b 08 3b 42 bb  |. ......D..k=
.;B.|
> 00000040  ee ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.=
. .R|
> 00000050  10 d8 00 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000060  00 36 00 27 9e f9 77 64  fc eb ff ff              |.6.'..wd....=
|

Thanks. This need to go below the "---" line. Also, you'll also need
to provide some basic tests, see
Documentation/driver-api/mtd/spi-nor.rst

> Co-authored-by: David Bauer <mail@david-bauer.net>

What is that? There is Co-developed-by:, but you'd need the SoB tag
from David, see Documentation/process/submitting-patches.rst

> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  drivers/mtd/spi-nor/Makefile    |   1 +
>  drivers/mtd/spi-nor/boyamicro.c | 110 ++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.c      |   1 +
>  drivers/mtd/spi-nor/core.h      |   1 +
>  4 files changed, 113 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/boyamicro.c
>
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 5dd9c35f6..0024ea03f 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -2,6 +2,7 @@
> =20
>  spi-nor-objs			:=3D core.o sfdp.o swp.o otp.o sysfs.o
>  spi-nor-objs			+=3D atmel.o
> +spi-nor-objs			+=3D boyamicro.o
>  spi-nor-objs			+=3D eon.o
>  spi-nor-objs			+=3D esmt.o
>  spi-nor-objs			+=3D everspin.o
> diff --git a/drivers/mtd/spi-nor/boyamicro.c b/drivers/mtd/spi-nor/boyami=
cro.c
> new file mode 100644
> index 000000000..059eccb3d
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/boyamicro.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +#define BOYA_SPINOR_OP_WRSR2		0x31
> +
> +#define BOYA_SPI_NOR_WRSR2_OP(buf)					\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(BOYA_SPINOR_OP_WRSR2, 0),		\
> +		   SPI_MEM_OP_NO_ADDR,					\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
> +
> +static int boya_spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
> +{
> +	int ret;
> +
> +	ret =3D spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =3D BOYA_SPI_NOR_WRSR2_OP(sr2);
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret =3D spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret =3D spi_nor_controller_ops_write_reg(nor, BOYA_SPINOR_OP_WRSR2,
> +						       sr2, 1);
> +	}
> +
> +	if (ret) {
> +		dev_dbg(nor->dev, "error %d writing SR2\n", ret);
> +		return ret;
> +	}
> +
> +	return spi_nor_wait_till_ready(nor);
> +}

Are you sure, the chip doesn't support writing two status bytes for
the 01h instruction?

In any case, the 31h instruction isn't specific to boya, so that
should go into core.c. I.e. SFDP already describes this .quad_enable
(15th DWORD, bits 22:20, value 6) but we doesn't support it yet.
Also, this flash doesn't contain that info in the SFDP, a pity. But
it's described in the JESD214 standard, so it should go into core.c
not into a manufacturer specific module.

What you'll probably have to do is, to add a special casing in
spi_nor_sr2_bit1_quad_enable() or spi_nor_write_16bit_cr_and_check()
and check whether the flash supports the 01h command with 2 bytes
(SNOR_F_HAS_16BIT_SR).

> +
> +static int by25q128_sr2_bit1_quad_enable(struct spi_nor *nor)
> +{
> +	int ret;
> +	u8 sr2_written;
> +	u8 *sr2 =3D nor->bouncebuf;
> +
> +	/* Check current Quad Enable bit value. */
> +	ret =3D spi_nor_read_cr(nor, sr2);
> +	if (ret)
> +		return ret;
> +	if (*sr2 & SR2_QUAD_EN_BIT1)
> +		return 0;
> +
> +	/* Update the Quad Enable bit. */
> +	*sr2 |=3D SR2_QUAD_EN_BIT1;
> +
> +	ret =3D boya_spi_nor_write_sr2(nor, sr2);
> +	if (ret)
> +		return ret;
> +
> +	sr2_written =3D *sr2;
> +
> +	/* Read back and check it. */
> +	ret =3D spi_nor_read_cr(nor, sr2);
> +	if (ret)
> +		return ret;
> +
> +	if (*sr2 !=3D sr2_written) {
> +		dev_dbg(nor->dev, "SR2: Read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}

This will then be the same as spi_nor_sr2_bit1_quad_enable().

> +
> +static int
> +by25q128_post_bfpt(struct spi_nor *nor,
> +		   const struct sfdp_parameter_header *bfpt_header,
> +		   const struct sfdp_bfpt *bfpt)
> +{
> +	/**
> +	 * BY25Q128xS series SFDP table does not define the Quad
> +	 * Enable methods. Overwrite the default Quad Enable method.
> +	 */
> +	nor->params->quad_enable =3D by25q128_sr2_bit1_quad_enable;
> +
> +	/* The 01H command can only be used to write SR1 */
> +	nor->flags &=3D ~SNOR_F_HAS_16BIT_SR;

That should probably go into the manufacturer default_init.

> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups by25q128_fixups =3D {
> +	.post_bfpt =3D by25q128_post_bfpt,
> +};
> +
> +static const struct flash_info boyamicro_parts[] =3D {
> +	{
> +		/* BY25Q128AS, BY25Q128ES */
> +		.id =3D SNOR_ID(0x68, 0x40, 0x18),

And here we are again. 0x68 isn't the boya manufacturer id. They are
missing continuation codes.
I'm really not sure, what we can do about that. We'll have to pick
between
 (1) reject patches like this and just don't support vendors who
     doesn't play by the rules
 (2) only offer bindings via a device tree, so there will be no auto
     probing
 (3) merge it as is, hoping that the real 0x68 vendor won't ever
     produce any flash chips. Or we have to deal with that later and
     facing the possibility that this vendor will be at a
     disadvantage because someone already hijacked their ID and
     they'd need to come up with special handling.

-michael

> +		.fixups =3D &by25q128_fixups,
> +	},
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_boyamicro =3D {
> +	.name =3D "boyamicro",
> +	.parts =3D boyamicro_parts,
> +	.nparts =3D ARRAY_SIZE(boyamicro_parts),
> +};
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d3f8a78ef..b9adf5ca1 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1941,6 +1941,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *no=
r)
> =20
>  static const struct spi_nor_manufacturer *manufacturers[] =3D {
>  	&spi_nor_atmel,
> +	&spi_nor_boyamicro,
>  	&spi_nor_eon,
>  	&spi_nor_esmt,
>  	&spi_nor_everspin,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 16b382d4f..b1667a08c 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -591,6 +591,7 @@ struct sfdp {
> =20
>  /* Manufacturer drivers. */
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
> +extern const struct spi_nor_manufacturer spi_nor_boyamicro;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
>  extern const struct spi_nor_manufacturer spi_nor_esmt;
>  extern const struct spi_nor_manufacturer spi_nor_everspin;


--702d1f9d6b894d331fd76a3db258386ffa0dc42026b086f0f18fedefe9cc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYB+/BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iy6QF9HIh1RBXvqCjiGQU6a318A00xniGWG9/p
MpsdmnPejlVgTmh6QiDAeSFrdcK0OEDzAX9+chM9sSvFppbt6H+ofCTVxynHH6sC
nQZL+6BWUpK9+ZTy/4OtSMHvy3r/vGKB3RQ=
=f3op
-----END PGP SIGNATURE-----

--702d1f9d6b894d331fd76a3db258386ffa0dc42026b086f0f18fedefe9cc--


--===============2634590992346429399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2634590992346429399==--

