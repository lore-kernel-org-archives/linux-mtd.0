Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apbZz-00071B-0P
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 13:08:36 +0000
Subject: Re: [PATCH] mtd: gpmi: Deal with bitflips in erased regions
To: Stefan Christ <s.christ@phytec.de>, linux-mtd@lists.infradead.org
References: <1458030937-4245-1-git-send-email-s.christ@phytec.de>
Cc: han.xu@nxp.com, eliedebrauwer@gmail.com, shijie8@gmail.com,
 mpa@pengutronix.de, ptx kernel <kernel@pengutronix.de>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <570BA1B4.8060806@pengutronix.de>
Date: Mon, 11 Apr 2016 15:08:04 +0200
MIME-Version: 1.0
In-Reply-To: <1458030937-4245-1-git-send-email-s.christ@phytec.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Bxjkj0fQjWBiA0x7x4cXda2Xm24fB9JTX"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Bxjkj0fQjWBiA0x7x4cXda2Xm24fB9JTX
Content-Type: multipart/mixed; boundary="9bAAp2wNcTR13PfmJXLlvi7jAVBR8gSwD"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Stefan Christ <s.christ@phytec.de>, linux-mtd@lists.infradead.org
Cc: han.xu@nxp.com, eliedebrauwer@gmail.com, shijie8@gmail.com,
 mpa@pengutronix.de, ptx kernel <kernel@pengutronix.de>
Message-ID: <570BA1B4.8060806@pengutronix.de>
Subject: Re: [PATCH] mtd: gpmi: Deal with bitflips in erased regions
References: <1458030937-4245-1-git-send-email-s.christ@phytec.de>
In-Reply-To: <1458030937-4245-1-git-send-email-s.christ@phytec.de>

--9bAAp2wNcTR13PfmJXLlvi7jAVBR8gSwD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/15/2016 09:35 AM, Stefan Christ wrote:
> From: Elie De Brauwer <eliedebrauwer@gmail.com>
>=20
> The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is on=
ly
> able to correct bitflips on data actually streamed through the block.
> When erasing a block the data does not stream through the BCH block
> and therefore no ECC data is written to the NAND chip. This causes
> gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
> found in an erased page. Typically causing problems at higher levels
> (ubifs corrupted empty space warnings). This problem was also observed
> when using SLC NAND devices.
>=20
> This patch configures the BCH block to mark a block as 'erased' if
> not too much bitflips are found (by setting the erase threshold). A
> consequence of this is that whenever an erased page is read, the
> number of bitflips will be counted and corrected in software,
> allowing the upper layers to take proper actions.
>=20
> Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> Acked-by: Huang Shijie <b32955@freescale.com>

You moght want to coordinate with Markus (Cc'ed) as he tries to solve
the same issue.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--9bAAp2wNcTR13PfmJXLlvi7jAVBR8gSwD--

--Bxjkj0fQjWBiA0x7x4cXda2Xm24fB9JTX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJXC6G0AAoJED07qiWsqSVq2S8H/RC4ZlFf9BeZMcjijttzCaMg
yEQ75TWnvkDMT2Nrg2yv+VrYWY+xf2ir2AXklv1P4nvLu9JSle1KeNLe8iepqFi2
i481w+2qSfi9K3xGYyPtZwR/1PDTDHP1YsPii5xQM9xGGQDgrOVeb7u5MVdALz9S
KJLo9H5oME4RM1G3fpNbHXwIZM/NYYugVVI1eD8j3wUqJVAibOqokfa0AYd5NUf9
gsbzP7fZRMPMDyL8D+droS5zu8RTddC6sWbRtOn0waQZw5cAiUL/+CD62Zzk8HfM
izFaSjcv8c7QLq12cqSNG0743BOBABX4r0T7AaiplDeQoTBzGu6ufvGzJDEck5o=
=0sI9
-----END PGP SIGNATURE-----

--Bxjkj0fQjWBiA0x7x4cXda2Xm24fB9JTX--
