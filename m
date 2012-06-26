Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjY6T-0005bI-0Q
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 15:54:57 +0000
Message-ID: <1340726334.3119.150.camel@sauron.fi.intel.com>
Subject: Re: Patch MTD: increase time out value for buffer program
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Changming Chen (changmingche)" <changmingche@micron.com>
Date: Tue, 26 Jun 2012 18:58:54 +0300
In-Reply-To: <6ACDE3A4C2F7E94C8DBB6FCC0D06A0873DA88046@NTXBOIMBX05.micron.com>
References: <mailman.0.1338988276.11201.linux-mtd@lists.infradead.org>
 <6ACDE3A4C2F7E94C8DBB6FCC0D06A0873DA88046@NTXBOIMBX05.micron.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wTSv4k6jD8Dmc46LJRnG"
Mime-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Youxin He \(youxinhe\)" <youxinhe@micron.com>,
 "Frank Liu \(frankliu\)" <frankliu@micron.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wTSv4k6jD8Dmc46LJRnG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-13 at 04:29 +0000, Changming Chen (changmingche) wrote:
> The time out value(1ms:typical HZ defined smaller than 1000) defined for =
function "do_write_buffer" in "cfi_cmdset_0002.c" is not enough. Because th=
e enlargement of buffer size, much time will cost for buffer program. It's =
has risk that time out will be triggered before buffer program finished and=
 make misjudge for buffer program. we suggest that 4ms is more appropriate =
compare to 1ms. This change has no impact of program performance.
>=20
> diff --git a/a/drivers/mtd/chips/cfi_cmdset_0002.c b/b/drivers/mtd/chips/=
cfi_cmd
> index 9d93c45..7da8fca 100755
> --- a/a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1312,7 +1312,7 @@ static int __xipram do_write_buffer(struct map_info=
 *map,=20
>          struct cfi_private *cfi =3D map->fldrv_priv;
>          unsigned long timeo =3D jiffies + HZ;
>          /* see comments in do_write_oneword() regarding uWriteTimeo. */
> -        unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
> +        unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 4;

No, sorry, this is not a fix, this is a band-aid. The whole HZ/1000
thing is broken. You should not use HZ at all. For this driver it looks
like you should use ' schedule_timeout()' with the right timout instead
of 'schedule()' and get rid of all the HZ and jiffies stuff.

--=20
Best Regards,
Artem Bityutskiy

--=-wTSv4k6jD8Dmc46LJRnG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6dw+AAoJECmIfjd9wqK0WZkQALxwheOGn83uJhSMP6uauXtY
Z7S1HzecdsTuEpOJIGHgF5cEZLBfaRFf0Yf1Rye+jjjNPYBevqDeaLVFIz5Nwisy
k04u12bMEcmfRYzSsJE1WL/Foejr2zLwclTLg4sk90Kx3SX+A46dAErYcTIxFQcd
0xigqouxQjOmzWnkNCzyyTmqfvMA692Ovc3Fp5JUFW6bvaMjGswblkowhqKB3cbE
UqePE3q0xgFwCkvFJpDMQh0b8eAjdZKlnVCXiVqoXikc7wTkvTDV1yx3JyJe8sCL
94cXWMq760j1qctDPLlxCHPylKUS+chTOZunIwJFIAKGYhzPDkaUwJ0aWsxQ4mtL
gF9V6cPiEgyLngVjUgWcPIw4FGe/3iTOTuYE3HyVEZ8oa8S7gpvIr/JTTypKiajK
U77OgXv6vsSHfSjAGBTB8Uep6Ji1ESi8q5jGQaPcollxMJ9vo3RJ3ju90jnou8NF
wziAb0Kyrlw6e8OOdJm3nSRYvEgI4wFXWuS7N1FDCyAC5kUDGgeVjOKrTTRcWIdh
8xz9ZhZiCJ5JcKfA+JA7kL8E3iHCJtFoeqj46adOZ8IFIIPypY530YFgC5avn30+
XlUieq3UyPx5ab51HldF0WgqdqbW6dNZ96Xo4303Y2u7SIOXXOHQxpiqcgYPiOx7
Podn5vRF7JTPOR/PyhJM
=XZ7M
-----END PGP SIGNATURE-----

--=-wTSv4k6jD8Dmc46LJRnG--
