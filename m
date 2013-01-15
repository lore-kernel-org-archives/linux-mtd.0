Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv6LQ-0008LZ-1p
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 13:14:26 +0000
Message-ID: <1358255748.2731.135.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd-www: remove any references to
 dtype/UBI_SHORTTERM/UBI_LONGTTERM
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Tue, 15 Jan 2013 15:15:48 +0200
In-Reply-To: <1356421025-10968-1-git-send-email-shmulik.ladkani@gmail.com>
References: <1356421025-10968-1-git-send-email-shmulik.ladkani@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Sqp9+S74iIcniX15OoWB"
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


--=-Sqp9+S74iIcniX15OoWB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-12-25 at 09:37 +0200, Shmulik Ladkani wrote:
> These no longer exist.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> ---
> 1. Artem, this patch completely removes these parts of the documentation.
>  Would you prefer to keep, with a statement they no longer exist since
>  [whatever kernel version]?
> 2. Piggy backed is a tiny style fix at the affected area: </p>. to .</p>
>  I assumed no need for a separate patch, but let me know if you prefer a
>  separate patch.

Thanks Shmulik for this, very appreciated. I think it is OK to remove
this information completely. Pushed to mtd-www.git and updated the
server side.

--=20
Best Regards,
Artem Bityutskiy

--=-Sqp9+S74iIcniX15OoWB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9VaEAAoJECmIfjd9wqK0ZIwP/RuL9yXqqBrYGn5dIs3kqrC0
BhiKQvCGPkKQNf+wFKaJgi6hl0eZlgceGq08gCrBE5COn32h1XfLSCN464QX3t9B
4bUJEkjPrkqJIiYkP42GV2mDg5IFKBEsp+grkKOvt/DDJT8vbt32BkPlspqeZDTq
2wkaO0daK383Fy7oVAwyXl3yFGqgZA9rxm1g0TbzoqbMBTb+FxRcGnVTA9A2b8fO
wCabX4kXOLOc9Gq2blsiv7AQwLcBhnP7uEOmFpiP9/W80/ZeNngx9ls0qUhPHtl1
nmWg9LAL3fqdLf3Y4iyjbGfrNZQN7RH8y8JbFGSuYT3C3BcSLhZP9sCyKG/vDVZ6
BjWqCVP9gp4e7nCOygo5EmoSJJvzXlhxOIzmS5vYKTC6f9qQ6dAYFFcuqOVUIbdT
Y81h8oqqCwo6a390e7e5OFH3xdMoo5WSsutXzOitLtUBDhnA3GDvs5KzoHxk7HsB
Z+AN+cOLnpUWTFc5Ew2eOfqtibvGRAg5KpLzMLdYZzcufGrBaQjU6e3sK+Dac+ig
5nPteZWJVIDAwHNa/M5qXzbNW4vjfG0MC1gxHZjAHyum3mU8a8JR/I/eCqKpF88T
pLhKNr9/LCZW0p8iRQHwRr+8PqEzZ548ZPAOJtwkDlOehLSMV7lziJZqGTLCMq2w
PjgTsjdfoMpxIrGiqlun
=BnuU
-----END PGP SIGNATURE-----

--=-Sqp9+S74iIcniX15OoWB--
