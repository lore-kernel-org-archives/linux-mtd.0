Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RwwSj-0006BC-25
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 14:01:01 +0000
Received: by dakp5 with SMTP id p5so5511841dak.36
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 06:01:00 -0800 (PST)
Message-ID: <1329141796.22240.154.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: unify initialization of erase_info->fail_addr
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 13 Feb 2012 16:03:16 +0200
In-Reply-To: <1329141752.22240.153.camel@sauron.fi.intel.com>
References: <20120209153629.16bb9b01@pixies.home.jungo.com>
 <1329141752.22240.153.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kwqj6XOyyrO00kpIZXgj"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kwqj6XOyyrO00kpIZXgj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-13 at 16:02 +0200, Artem Bityutskiy wrote:
> On Thu, 2012-02-09 at 15:36 +0200, Shmulik Ladkani wrote:
> > From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> >=20
> > Initialization of 'erase_info->fail_addr' to MTD_FAIL_ADDR_UNKNOWN prio=
r
> > erase operation is duplicated accross several MTD drivers, and also tak=
en
> > care of by some MTD users as well.
> >=20
> > Harmonize it: initialize 'fail_addr' within 'mtd_erase()' interface.
> >=20
> > Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
>=20
> Could you please re-send this one and
>=20
> [PATCH] sfc: mtd: Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff
>=20
> as a single patch or a series of 2 patches?

I mean this patch should also patch 'sfc' or just contain that change,
right?

--=20
Best Regards,
Artem Bityutskiy

--=-kwqj6XOyyrO00kpIZXgj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPORgkAAoJECmIfjd9wqK0+aoP/iFnPfpTbd3woW9+ft4U6K+E
YnmcHcimeVGR2I9jE7wFyrwG462sCVUj5HJFy1HBdZrCCH6xc5o7odwQ6HWSd4eG
yBgrJOc9WveSRYme8E6WFPLzOYkVtBXgSD6Hx1Ud8WUqZrIqq0/oVU+KoP5sjbHX
GXVgTuzIiZ7eqHkQzW8Df7SJgH/TM1rntmOZOxFItYj2Ll++/WprgRmwbVBzCLTQ
7TW+bftAOIm7Wg57H4E+kIQjt5+TvGN1bnfz8MhG2a5eBEjiF9TxZyxM6Auog9vm
CPE49bETnXwxiL306mOktDNWQCqEuYgvXjVvYOlw4bSZ2gjaEqMVI4Z2Sm2/znUL
AqIO0CGwJ1nyepzey9cbiLg3+kBZYknqDdO3J2RP11WtIU5cEvf3andFL4HfLBBs
E1r+E0wI3wQNrS/lZrqkjp4y1L8YVdiYGhYtA8VyaKRAVhzDmAyUjCVRfKNOFJlS
nvaCBX/N2QPp/2dwemjjUqscHqy4+Txr/SCIegwEZleLDhlyv+29C5LtSAJuZaax
mu7Ojw62wB2tUf7+BUj+VFtspwgkzosbLV49lZ5btZxfMitJjWyNUYp4ToSm+kt0
6YZB2Ls7+NG0uc8R+h5O1uJVPuDnNPL+0waObKcad+FSgD2jrCSn01DQP86SatGW
jUx7zBuVMGGW3MUvMYvX
=J3zw
-----END PGP SIGNATURE-----

--=-kwqj6XOyyrO00kpIZXgj--
