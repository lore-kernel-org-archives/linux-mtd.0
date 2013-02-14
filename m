Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5xRc-0006pW-Ma
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2013 11:57:41 +0000
Message-ID: <511CD12F.40902@pengutronix.de>
Date: Thu, 14 Feb 2013 12:57:35 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH RFC 1/5] UBIFS: xattr: protect ui_size and data_len by
 ui_mutex
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
 <1360750998-15191-2-git-send-email-mkl@pengutronix.de>
 <1360826613.12703.156.camel@sauron.fi.intel.com>
In-Reply-To: <1360826613.12703.156.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2AJVGFEDVMHJKDCUVFLSC"
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2AJVGFEDVMHJKDCUVFLSC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/14/2013 08:23 AM, Artem Bityutskiy wrote:
> On Wed, 2013-02-13 at 11:23 +0100, Marc Kleine-Budde wrote:
>> This patch moves the modification of ui->ui_size and ui->data_len in t=
he
>> create_xattr() and change_xattr() functions, so that they are protecte=
d by the
>> ui_mutex as stated in the documenation of the the struct ubifs_inode.
>>
>> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
>=20
> I guess this one and 2/5 should have 'Cc: stable@vger.kernel.org',
> right?

Will do.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2AJVGFEDVMHJKDCUVFLSC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEUEARECAAYFAlEc0S8ACgkQjTAFq1RaXHOQqACfRc6/1bmi4sNXBwgfPuEOVyWR
ki4AmNWxskeCXVR6lx9RvutWyfhcfFs=
=I9Nl
-----END PGP SIGNATURE-----

------enig2AJVGFEDVMHJKDCUVFLSC--
