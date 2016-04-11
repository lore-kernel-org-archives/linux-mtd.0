Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apVRL-0004Kq-Vw
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 06:35:17 +0000
From: Markus Pargmann <mpa@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Han Xu <han.xu@nxp.com>, David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Huang Shijie <shijie.huang@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Date: Mon, 11 Apr 2016 08:34:35 +0200
Message-ID: <3992227.rRuQ67A3ma@galactica>
In-Reply-To: <20160224145750.21050def@bbrezillon>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <20160224145750.21050def@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2550797.b0OmCA1pJv";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2550797.b0OmCA1pJv
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Boris,

On Wednesday 24 February 2016 14:57:50 Boris Brezillon wrote:
> Hi Markus,
>=20
> On Sun, 21 Feb 2016 13:52:06 +0100
> Markus Pargmann <mpa@pengutronix.de> wrote:
>=20
> > ECC is only calculated for written pages. As erased pages are not
> > actively written the ECC is always invalid. For this purpose the
> > Hardware BCH unit is able to check for erased pages and does not ra=
ise
> > an ECC error in this case. This behaviour can be influenced using t=
he
> > BCH_MODE register which sets the number of allowed bitflips in an e=
rased
> > page. Unfortunately the unit is not capable of fixing the bitflips =
in
> > memory.
> >=20
> > To avoid complete software checks for erased pages, we can simply c=
heck
> > buffers with uncorrectable ECC errors because we know that any eras=
ed
> > page with errors is uncorrectable by the BCH unit.
> >=20
> > This patch adds the generic nand_check_erased_ecc_chunk() to gpmi-n=
and
> > to correct erased pages. To have the valid data in the buffer befor=
e
> > using them, this patch moves the read_page_swap_end() call before t=
he
> > ECC status checking for-loop.
> >=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 49 ++++++++++++++++++++++=
++++++++----
> >  1 file changed, 44 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/n=
and/gpmi-nand/gpmi-nand.c
> > index 235ddcb58f39..ce5a21252102 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -1035,14 +1035,58 @@ static int gpmi_ecc_read_page(struct mtd_in=
fo *mtd, struct nand_chip *chip,
> >  =09/* Loop over status bytes, accumulating ECC status. */
> >  =09status =3D auxiliary_virt + nfc_geo->auxiliary_status_offset;
> > =20
> > +=09read_page_swap_end(this, buf, nfc_geo->payload_size,
> > +=09=09=09   this->payload_virt, this->payload_phys,
> > +=09=09=09   nfc_geo->payload_size,
> > +=09=09=09   payload_virt, payload_phys);
> > +
> >  =09for (i =3D 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> >  =09=09if ((*status =3D=3D STATUS_GOOD) || (*status =3D=3D STATUS_E=
RASED))
> >  =09=09=09continue;
> > =20
> >  =09=09if (*status =3D=3D STATUS_UNCORRECTABLE) {
> > +=09=09=09int flips;
> > +
> > +=09=09=09/*
> > +=09=09=09 * The ECC hardware has an uncorrectable ECC status
> > +=09=09=09 * code in case we have bitflips in an erased page. As
> > +=09=09=09 * nothing was written into this subpage the ECC is
> > +=09=09=09 * obviously wrong and we can not trust it. We assume
> > +=09=09=09 * at this point that we are reading an erased page and
> > +=09=09=09 * try to correct the bitflips in buffer up to
> > +=09=09=09 * ecc_strength bitflips. If this is a page with random
> > +=09=09=09 * data, we exceed this number of bitflips and have a
> > +=09=09=09 * ECC failure. Otherwise we use the corrected buffer.
> > +=09=09=09 */
> > +=09=09=09if (i =3D=3D 0) {
> > +=09=09=09=09/* The first block includes metadata */
> > +=09=09=09=09flips =3D nand_check_erased_ecc_chunk(
> > +=09=09=09=09=09=09buf + i * nfc_geo->ecc_chunk_size,
> > +=09=09=09=09=09=09nfc_geo->ecc_chunk_size,
> > +=09=09=09=09=09=09NULL, 0,
> > +=09=09=09=09=09=09auxiliary_virt,
> > +=09=09=09=09=09=09nfc_geo->metadata_size,
> > +=09=09=09=09=09=09nfc_geo->ecc_strength);
> > +=09=09=09} else {
> > +=09=09=09=09flips =3D nand_check_erased_ecc_chunk(
> > +=09=09=09=09=09=09buf + i * nfc_geo->ecc_chunk_size,
> > +=09=09=09=09=09=09nfc_geo->ecc_chunk_size,
> > +=09=09=09=09=09=09NULL, 0,
> > +=09=09=09=09=09=09NULL, 0,
> > +=09=09=09=09=09=09nfc_geo->ecc_strength);
> > +=09=09=09}
>=20
> You're not checking ECC bytes. I know it's a bit more complicated to
> implement, but as Brian stated several times, you should always check=

> ECC bytes along with data bytes when testing for an erased chunk.
>=20
> Indeed, it might appear that the user really programmed ff on the pag=
e,
> and in this case you don't want to consider the page as erased.
> In this case, the ECC bytes will be different from ff, and you'll
> be able to identify it by checking those ECC bytes.

Thanks for the feedback. Talking with a coworker about this we may have=
 found a
better approach to this that is less complicated to implement. The hard=
ware
unit allows us to set a bitflip threshold for erased pages. The ECC uni=
t
creates an ECC error only if the number of bitflips exceeds this thresh=
old, but
it does not correct these. So the idea is to change the patch so that w=
e set
pages, that are signaled by the ECC as erased, to 0xff completely witho=
ut
checking. So the ECC will do all the work and we completely trust in it=
s
abilities to do it correctly.

I will send a modified patch as soon as I have some time for this.

Best Regards,

Markus

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2550797.b0OmCA1pJv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXC0V7AAoJECi9+rkzbKwykRsP/2mEwqKs2qdTHBeB6thIRhjc
3CW5a3vCUoNPHx7q/nDMRkGFoG2i1soWybzBB5/QvK/KzbeB/yPZ0iDTD7hzi5m4
8tMjm0kYXzCxRE4en6AwQcBf0IMflx3qhEKos7IHANsS3BVWkfcFLjXyhWMg87wE
VyiS7WXJ6DJ6W7v8qC5i7TStq9XhPqGFKlLFFAZgdfca9HKIGwjMIB+RC3m4dm4i
Mjns1Z1tV3BNuo1J5DIrrztgau8gWK0vnquPAeLQDn4OGs3ib/+xWMfSZMBMJ5JG
X3zr5G5mhnjd4BlqM3ccAfirvAUbya+xDRLT8ccX9X3O0az+oz7z+AFXH0SZFYU9
cn6Fp7SdzPkUYrT0fHNQ6kaJj1xlMM6REnHDrNsGNNkk1JpK/bl73elE0keWR26j
RdjHqBd86fJjILLkhGl7Z8B6JHFECjRubPagIxCVaGYccueRwBc9xLuKoPDNqvlX
BaDV27Ah+RAkvQ0+Fsoh67iTIR0NcDmHWY5JJh2U+QJ43VLyThIoZEFuOzcoyuVq
Ct5Ve16kH5KaC0ez7tfkguxj36DJZXB6EwGgYNUms8iFC1E+rYvNDsPiSLQWo01S
/16VnZsH0NCg4evjBbN+vZktAVNkgFHRoYuWqNIbYtbbS+0TFbI2LIosEY0zCQ8F
HtX3e6N5Cr4oOMIFeLn0
=9R6r
-----END PGP SIGNATURE-----

--nextPart2550797.b0OmCA1pJv--
