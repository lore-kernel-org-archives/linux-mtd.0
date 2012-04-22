Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwg3-0005Lw-K7
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 13:18:07 +0000
Received: by mail-lb0-f177.google.com with SMTP id l5so3603928lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 06:18:07 -0700 (PDT)
Message-ID: <1335100532.28267.9.camel@brekeke>
Subject: Re: UBIFS mount failure upon power off
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark <xiaoming1981.zhang@gmail.com>
Date: Sun, 22 Apr 2012 16:15:32 +0300
In-Reply-To: <4F85764C.7070408@gmail.com>
References: <4F85764C.7070408@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Y35fXLuhrsdw0ZgbsINA"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Y35fXLuhrsdw0ZgbsINA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2012-04-11 at 20:17 +0800, Mark wrote:
> brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
> offset=3D3c81c00, ret=3D-77
> UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
> 21:4096, read 2048 bytes
> UBIFS error (pid 484): ubifs_start_scan: cannot read 126976 bytes from
> LEB 18:0, error -5
> mount: mounting ubi13_0 on /usr/local/appdata failed: Input/output
> error
>=20
Please fix your NAND driver and why it returns strange error code
-EBADFD (-77). Uncorrectable ECC errors should be reported as -EBADMSG
instead. Bit-flips as -EUCLEAN.

--=20
Best Regards,
Artem Bityutskiy


--=-Y35fXLuhrsdw0ZgbsINA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlAR0AAoJECmIfjd9wqK0kqQP/iNO+G8ggAuLQNpVO5icExw/
sP9wy0eGdcmJc03XfNpZKahQK5XsrOXn+44n3s8V00T36xPkpAgqS04Orh9MnZlo
evQ/9O5f9mxTeqRGKaK4aQATsLxbqKsxVlxyA1QXHP7wNmaw7YdnEhZNYMJRXGdL
juPVPm+3Pjq8VSa31W4urdwyDiZ9EY1Um+sJoP8ywCplr/7NsEJ6SoAIFC0LOqBN
hqaVS1qY0tY8OmHp+ZBcutCdP+XmRqqhLTSsL/vV3WNhonhKB8GJjJWsS4MVK+bC
B9lXRW0+iaEq8doZ1839coCXSfiuLjMmPN7aPnavll3yaiUMYQTJP/9S+lbXLY23
+lmtQwLAyj83zi7jP7ZhbKcor9P2JV0P4ItRWE2R+rGG3GmJ+hUxWJ7tci9BRJDf
z98nW1s7EHfRQrDXzPvCktCNysJZepl3gZWc0u1DDz7qBKL81gHW7wCrmzApDKcs
JffMMqiR9+hFQ597qqtUil4P+qefPxIDvjpRnxif975OLw/hDbMjNsziXH4eQoO9
BOVFVRdPLEKfcS4uivNeSSFs51iBTbsBzsD9krHbMpHxf3eo/80BG0tNiUNldru9
nFPEdVKfktxe5pvdQF0KMwJm6CqYfk2AN2uYPQJczKqHBBbvk9kTwZgXbwQ+9RkC
J4rsaPabnNGra/qXIsjO
=UKAK
-----END PGP SIGNATURE-----

--=-Y35fXLuhrsdw0ZgbsINA--
