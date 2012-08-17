Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2KQO-0004qG-7T
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 11:09:09 +0000
Message-ID: <1345202032.27859.53.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand/docg4: fix oob reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 17 Aug 2012 14:13:52 +0300
In-Reply-To: <1342030099-3326-1-git-send-email-mikedunn@newsguy.com>
References: <1342030099-3326-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-H9UZI8/EoU98PTXFLkvZ"
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


--=-H9UZI8/EoU98PTXFLkvZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-11 at 11:08 -0700, Mike Dunn wrote:
> This patch does two closely related things:
>=20
> (1) Currently the ecc.read_page() method does not fill the nand->oob_poi =
buffer
> with the oob data, but instead reads oob into a local buffer.  Fix this b=
y
> filling the oob_poi buffer instead of a local buffer.  The 'oob_required'
> argument is quietly ignored; the device must always read oob after the pa=
ge
> data, and it is presumed that there's no harm in filling oob_poi, even wh=
en not
> explicitly requested.

Pushed to l2-mtd.git, thanks!
--=20
Best Regards,
Artem Bityutskiy

--=-H9UZI8/EoU98PTXFLkvZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLidwAAoJECmIfjd9wqK0iIEP/AheD63vG8xbY2zbYkT7qXTQ
pQco8NT3bNIvASTjEQb/het51xf28RuigKeJ4GYQVUjJSeW/NbflFaH9FUsxVIiw
ynDn564L9MNvlxjdJ0x2ZwgBUrMNmZn2CPzJfJekAay67U9VenaU3h2F67xu4ZfF
EZeRDCMQeQecIn7sfsA0BguiaAO4CVZyntNXpQpE6oMRHSpWKvXuoF0wak4LknSN
mNpPRnu/pS86AfaTMM2H3zg5bHu+iSDDUBQh+l8oyV4aSYELHmSLO2SbGxRBfWGE
Yz7oMl5uTe+QDHxpDvVOCHYof0wwUhGjvRFIC+WXTjj3KJWYP+OJE842y2LG8HJ/
i7TVeIFiscT0Y1GAROSk9eL4FyubXpDloP2KhZVIIoiDzbtpgrCjFqIF+Mf4KR50
XUGIFISiRHny0opXFinYaEOdUUopcx/kP2+ib68zWeouBCcE5em9nhbkNaBa4DO9
jahVncuTYrmCOJebge2Dz48S7uA2ryOrJ6ff3XLCGOs6D4HD3VBtXjizP9A7Ehpr
Hpp9ZOUKCOO5+6Wn2s4+GDCygrSo620d8hPFE+pRW/oetTcoBDQ5pA5SAY2kyLFB
07Ffi46QU5hUXP00As7BYBOfHYyp4SFDmQDRYoMUkMNNQj13DbZfH+CBnopcmOrT
6f5ZyYEz2F/YPQHddd9y
=KdZR
-----END PGP SIGNATURE-----

--=-H9UZI8/EoU98PTXFLkvZ--
