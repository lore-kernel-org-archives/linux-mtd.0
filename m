Message-ID: <1358423675.2731.232.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] MTD: at91: atmel_nand: for PMECC, add code to
 choose the ecc bits and sector size according to the ONFI parameter ECC
 requirement.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Thu, 17 Jan 2013 13:54:35 +0200
In-Reply-To: <50F664BC.7@atmel.com>
References: <1355912840-29501-1-git-send-email-josh.wu@atmel.com>
 <1355912840-29501-2-git-send-email-josh.wu@atmel.com>
 <1358252760.2731.133.camel@sauron.fi.intel.com> <50F664BC.7@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LGCLUCydEGJn4+dSyjXd"
Mime-Version: 1.0
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LGCLUCydEGJn4+dSyjXd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-16 at 16:28 +0800, Josh Wu wrote:
> Hi, Artem
>=20
> On 1/15/2013 8:26 PM, Artem Bityutskiy wrote:
> > I cannot compile this patch:
> >
> > ERROR (phandle_references): Reference to non-existent node or label "pi=
nctrl_ssc0_tx"
> >
> > ERROR: Input tree has errors, aborting (use -f to force output)
> > make[2]: *** [arch/arm/boot/dts/at91sam9g20ek.dtb] Error 2
>=20
> As Bo Shen already mentioned, they are caused by ssc pinctrl patches. it=
=20
> will be merged in next rc or late.

Then ping me when the patches are ready to go, please.

--=20
Best Regards,
Artem Bityutskiy

--=-LGCLUCydEGJn4+dSyjXd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9+Z7AAoJECmIfjd9wqK0Hb4P/0aFTbGIynzRNMPMUjZTGW5g
bYn5ylTW9JxssTdBLWNfej4GD0rlkCn8jiWhjH6hRB1CGqlYVB2Zbs1Eq1OkTc68
lpSZv4auBY+GQCulknKyJZ13Y/mtsZWjMeLaKyIFILRqBOQJw6cIc4CHvXMs28a/
PM5jP3BiIuKC8BZoH6njhqmg1egDjI9bTW7QBeG+bb2b3jUkAQBIG3nKXN46xrR7
KQzqA9GmcsEG3Sw7u/+nBLYylMXI3iyBJ+Sqkf7jytI4/+C9BeOYtTStvgU/Io83
Z5GeElPyT8bXck4sW5AC2ok9wVvNH5XrRAvW/8Yy702AGlHeWfWWt+j5pr6uki8j
yz0XqcO/PDY9icg4ks10MxDVhsrkSAphVNsLFRGycMTykcxwTxrvgwQb3gxtalkF
/Df1mGUKM1p/9+YzXLYBlxVuXhGHBEmEQY14cMINTW1AEYsrJ8TalnK772v1Xnzo
RAVp23GbW9j4sVmK/f6QpU5Gq9t8bc2mz4wZMj77Gh3SLNN36mkriBtmSF3s4tH/
7Jlqrvzkf2zFuqd09yZENjr5pyV9J7LRFEG/heDecPbrgPhN17/+C/UZXeeWOGIw
JSi4n23Ykig34gg0XzJ0yZi2MaHo25s5eMWQ8vgoXEFOpUamSqpY22U+TqeOUuQM
97wRrvQgOupYiRj+vNaL
=6cm3
-----END PGP SIGNATURE-----

--=-LGCLUCydEGJn4+dSyjXd--
