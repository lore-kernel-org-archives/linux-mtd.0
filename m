Received: from mail-wi0-f182.google.com ([209.85.212.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUbiC-00081A-Az
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 12:53:12 +0000
Received: by mail-wi0-f182.google.com with SMTP id d1so3240474wiv.3
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 05:52:49 -0700 (PDT)
Message-ID: <533963AE.30405@monstr.eu>
Date: Mon, 31 Mar 2014 14:46:38 +0200
From: Michal Simek <monstr@monstr.eu>
MIME-Version: 1.0
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: Re: [PATCH RFC 3/3] nand: pl353: Add driver for arm pl353 smc nand
 interface
References: <1395944467-26291-1-git-send-email-punnaia@xilinx.com>
 <04cb5d02-db4c-4a4c-ba3c-3a5958e42324@VA3EHSMHS036.ehs.local>
In-Reply-To: <04cb5d02-db4c-4a4c-ba3c-3a5958e42324@VA3EHSMHS036.ehs.local>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Aw4lsEHKOjuKwtjRTTjf7ualwFbVhnr49"
Cc: mark.rutland@arm.com, jussi.kivilinna@iki.fi, linux-doc@vger.kernel.org,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>, arnd@arndb.de,
 michal.simek@xilinx.com, ezequiel.garcia@free-electrons.com,
 grant.likely@linaro.org, devicetree@vger.kernel.org, jason@lakedaemon.net,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, joern@logfs.org,
 kpc528@gmail.com, robh+dt@kernel.org, acourbot@nvidia.com, pekon@ti.com,
 kalluripunnaiahchoudary@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rob@landley.net, galak@codeaurora.org,
 ivan.khoronzhuk@ti.com, computersforpeace@gmail.com, dwmw2@infradead.org
Reply-To: monstr@monstr.eu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Aw4lsEHKOjuKwtjRTTjf7ualwFbVhnr49
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 03/27/2014 07:21 PM, Punnaiah Choudary Kalluri wrote:
> Add driver for arm pl353 static memory controller nand interface.
> This controller is used in xilinx zynq soc for interfacing the nand
> flash memory.
>=20
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
>  drivers/mtd/nand/Kconfig      |    8 +
>  drivers/mtd/nand/Makefile     |    1 +
>  drivers/mtd/nand/pl353_nand.c | 1122 +++++++++++++++++++++++++++++++++=
++++++++
>  3 files changed, 1131 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/pl353_nand.c
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 90ff447..31c1d0c 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -510,4 +510,12 @@ config MTD_NAND_XWAY
>  	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is a=
ttached
>  	  to the External Bus Unit (EBU).
> =20
> +config MTD_NAND_PL353
> +	tristate "ARM Pl353 NAND flash driver"
> +	depends on MTD_NAND && ARM
> +	select PL353_SMC

Here should be probably depends on PL353_SMC.
I just found it.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--Aw4lsEHKOjuKwtjRTTjf7ualwFbVhnr49
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlM5Y64ACgkQykllyylKDCH+1ACcCvakTIoVaiVC/ixHNJ1sYzfq
lbUAnjx45bVGYZDfn40TFNOOQR3Cq1nd
=lZl0
-----END PGP SIGNATURE-----

--Aw4lsEHKOjuKwtjRTTjf7ualwFbVhnr49--
