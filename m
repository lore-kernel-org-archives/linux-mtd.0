Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPtR3-0001rH-EE
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 10:38:58 +0000
Message-ID: <1336041737.13013.34.camel@sauron.fi.intel.com>
Subject: RE: State of read-only filesystems in NAND / MTD bad blocks
 handling when reading
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Thu, 03 May 2012 13:42:17 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-B7sjZFMLsWjNL0uj6XWm"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 'Thilo Fromm' <fromm@dresearch-fe.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-B7sjZFMLsWjNL0uj6XWm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-02 at 13:14 -0400, Atlant Schmidt wrote:
>   I can answer that one.
>=20
>   MTD "materializes" an imperfect block storage device. It contains
>   m PEBs (Physical Erase Blocks) of n pages each. It can erase whole
>   PEBs, write pages, and read pages, but some of these pages are
>   bad, other pages may go bad, and you have to be aware that you
>   can wear out PEBs by repeated erasures.

Nitpick: s/block device/flash device/ or something like this. Term block
device has more or less standard meaning and neither MTD nor UBI devices
are block devices:

http://www.linux-mtd.infradead.org/faq/general.html#L_mtd_vs_hdd

--=20
Best Regards,
Artem Bityutskiy

--=-B7sjZFMLsWjNL0uj6XWm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPomEJAAoJECmIfjd9wqK0besP/0/Nzd9ikOAv9cUIQrv+HX6x
I8bY4MTg99RxLcxNko8sd6pHNIpqLsVLkyuaiaRBmAod8dRQO9BqVcDLJmAFI4mA
+6y03cCsB4wTQQ7XpKMYog15mjvQjdxu1Eq7NH6sAZ6wLyLT9OrcYzKiOehX24gs
Zn7DKIcbg9UvbhFdx4lsO7J5dkz/ArECAiTLdWzDYEPEAM6C/jh0wRj9SjdLcZks
QUIf14VXdKKQFjVh8FcP+GzbYX1PYrqkyaE0BixJ5Wwf9lwh4uqaDAKa/THcy4l7
KwlZLywDAb3eyBGnbEEo5lMZOl0iM66FkTMS2oD7G3zagIbRJzrMHIv39pTt4gKR
hLZuMazdS7ftV5Wv9tMjkGelf/71xpQe5xy1ScBMWFLZR9egNWObnjSPuSr9JlZQ
it46nrNh2q1TXh0FJKsbhB+V2/00Q3SxJj+zyaC2c3QBhxSEAYMOsTAlswJ4szWs
G7Ta10/vQseyYi5PUo20UGOLlOF2z2hKltzxHmrS85M4dSZ7qqXCOXKP5V3NCrGs
ivWH3emxwDmDJgnD732Yefu+pGPi2xmkJv7KEtYZPRI/uFCf6MCMrXwavbxqS+xr
6ZAg7s6+2ad9A7D1jjuMp0dg9fW+eSTPDvx8RT276AOqw5MMAiAOLGe9PscDCr6X
yxc6F5aXNZeCjhp39Wth
=LBdV
-----END PGP SIGNATURE-----

--=-B7sjZFMLsWjNL0uj6XWm--
