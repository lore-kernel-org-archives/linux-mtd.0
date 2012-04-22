Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwgW-0005TW-73
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 13:18:36 +0000
Received: by lagy4 with SMTP id y4so9582259lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 06:18:33 -0700 (PDT)
Message-ID: <1335100558.28267.11.camel@brekeke>
Subject: Re: [PATCH] [JFFS2] check xattr data integrity during the scan.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Sun, 22 Apr 2012 16:15:58 +0300
In-Reply-To: <1334175816-20688-1-git-send-email-jcd@tribudubois.net>
References: <1334175816-20688-1-git-send-email-jcd@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-CwXjPd40oDKx+KDSH+xX"
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


--=-CwXjPd40oDKx+KDSH+xX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-11 at 22:23 +0200, Jean-Christophe DUBOIS wrote:
> If the system was powered off while JFFS2 was creating or moving
> (GC) an extended attribute node, it might happen at next reboot
> that the node CRC is OK but the data (name and value) might be
> incomplete and therefore corrupted.
>=20
> During the mount scan we need to check the xattr data integrity to
> weed out bad ones and keep good ones (whith an earlier version).
>=20
> Whitout this check the xattr data integrity problem was detected
> a lot later and was not cured automatically (-EIO was returned).
>=20
> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
> ---

AFAIR, the whole idea of having 2 CRC checksums in JFFS2 nodes is to
speed up scanning. E.g., if we hit an inode node, we check only
"node_crc" to validate the "metadata", insert the inode to the in-memory
data structures, and read the next node. We do not check the data CRC
(data_crc), otherwise scanning would be much slower. If the data are
corrupted, we notice this later, wen reading it.

The same is done for xattrs - during scanning we do not check the data
payload.

I do not say this is ideal design, but it is how it is. So I do not
think your patch should be merged.

--=20
Best Regards,
Artem Bityutskiy


--=-CwXjPd40oDKx+KDSH+xX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlASOAAoJECmIfjd9wqK05HIQAJQZWhNuL5f8GwIWZmV0C5EZ
jD8gzNfHwso19uJ1lurmbUYABJ+7yzoqiOVj0aMwfiEr8m/jqt0VM8ib7hYhv95Z
6KUR9aY3zAq6BaKT36cmFcNG6ZpVYvXDfwFbZ2v7hIWtGq9I3ART8ppaQqMxi5rd
sUFSn62MToX3nAqbUDzBmmLM1H6LXcUVjdSiBHy02fSuNhWpezJvu0V61rzt4fJl
qgYk+cFLMcYooHtu0YpTVApVCtSk7ZuPAi1t+T6EOJLkR8exrxHAempJwjeAf+Qh
Caq8tW+9EryVrL58fksh8n6P6XzxDgQV1M0VbcM5ThVAspIStPbOAdvi0mXvhgx9
7LbuRurUYyS03vmI+iN3KaZyWLcbzyZ+pXNKCyGui7pzbejIrFSawrf+IvFwoe07
IBFrusvYT48YeZfL4J2gxpzFnEpCuYoUgfE6CHT5my38ohJ5pwiVsHcscH2QO6vS
K9LP9OZevQAQax8EwKAPPaCdMRsxxFvALNB04dcWCUccMd6kTFWV3xC7tt3ctvnG
8LrwN+UMPUKg5dlnnZsYUaeuTGhJ0/D2+6GkLova0hDlgrCkbT4J+vFP6G1b4WV1
YmiBhXSq9U4TI3SSPmiueixf/EYSIlVgKw9aB+NaMycfDZAg+stiW/3xqch3LHxk
woZc/2+/rH16ef6bmY5a
=0Y0N
-----END PGP SIGNATURE-----

--=-CwXjPd40oDKx+KDSH+xX--
