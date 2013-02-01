Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U1JsM-00068i-6n
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2013 16:54:07 +0000
Message-ID: <1359737697.2942.16.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] mtd: physmap_of: fix illegal dereference
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Stef van Os <stef.van.os@prodrive.nl>
Date: Fri, 01 Feb 2013 18:54:57 +0200
In-Reply-To: <1358446932-7238-1-git-send-email-stef.van.os@prodrive.nl>
References: <1358446932-7238-1-git-send-email-stef.van.os@prodrive.nl>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ebqknbQGuq9xXAtlwDkw"
Mime-Version: 1.0
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 wfp5p@virginia.edu, linux-mtd@lists.infradead.org, sr@denx.de,
 plagnioj@jcrosoft.com, dwmw2@infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ebqknbQGuq9xXAtlwDkw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-17 at 19:22 +0100, Stef van Os wrote:
> d68cbdd introduced a new way of getting the name of an mtd
> partion. The character pointer is not initialized, and only
> checked against NULL, not at other random garbage.
> This patch fixes the resulting panic.
>=20
> Signed-off-by: Stef van Os <stef.van.os@prodrive.nl>

A similar fix already sits in the mtd tree:

http://git.infradead.org/mtd-2.6.git/commit/7dfe4be351e81656ca1068e5d4ead23=
5c7ba94b1

--=20
Best Regards,
Artem Bityutskiy

--=-ebqknbQGuq9xXAtlwDkw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRC/NhAAoJECmIfjd9wqK0JKEP/0SDnKu9lwYhKKbREIxhh4Mw
KHqHQFzio2R5KCEJ0ZV8hgtCg8irKze9Rd07edJqZvtL7icNPcyX0lIGAgK9plUq
wwFw7o8L33IsLHl57D3BnnBRZaNhX5P5cWW/w3jz1/xvdvcluhbLW8o8EnGuHDrg
EsTehuTYU0iYfA+UTJCtOFFLxKz0CYsO7MNfQMDvqTzW8PrxHdLx/0hPu7AzKE10
e7pBaqtNnom5m1mJf0eycqtQxJE2yg1tjVFFRJx4PaQ78mti3aYGw4JUk9zYq97N
5Tcku34BghBXidpqPgREemciEDWo19q71TpMtgJ2u7wnD5P7up3+EN/N1TAPL9El
bTk2kMwWijsBw+9yXF3NIHEFId8FEQvCYMuLgsZ4Q3Im8W5PUT1zuAr6vYddLqwI
ghT9Ip29wpBhf8Za7xMX56C3XcOLc5oREwlxh7X4X6/PqLv/e6WXt/W0s9eXoiw6
Ek2tEqObzf0wlNl/EEoe65yOJcCGU8Wcv+oxshDXw1v4d57LvQnKs6IBZXKDObdJ
Iyt1qgf1g1VNrgZ/I3LqKt+U2zmfyoRXqnGy3lgESYe5mizLN3Ts59m9G1VHKQJH
Wi4XVcTjOEQTMhiR0/rfzswZGP+zTqFLa7Ty3MSzPvsQZIh3akhoVT783RTwlF1Q
p+wcCRdFhYsgMnFV5yuY
=LJTR
-----END PGP SIGNATURE-----

--=-ebqknbQGuq9xXAtlwDkw--
