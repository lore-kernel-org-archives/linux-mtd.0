Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SAO4P-0002El-Eq
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2012 16:07:30 +0000
Message-ID: <1332346218.14983.20.camel@sauron.fi.intel.com>
Subject: Re: [patch] Add design document for UBIFS secure deletion
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Wed, 21 Mar 2012 18:10:18 +0200
In-Reply-To: <alpine.DEB.2.00.1203191752300.22256@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1329152067.22240.214.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1202231558400.13720@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202231628360.13720@eristoteles.iwoars.net>
 <1331277476.22872.2.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191752300.22256@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-m3outrbS+1ACkzWMD0gC"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-m3outrbS+1ACkzWMD0gC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-19 at 17:54 +0100, Joel Reardon wrote:
> Design document should be self explanatory.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>
>=20
> ---
>  Documentation/filesystems/ubifsec.txt |  358 +++++++++++++++++++++++++++=
++++++
>  1 files changed, 358 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/filesystems/ubifsec.txt
>=20
> diff --git a/Documentation/filesystems/ubifsec.txt b/Documentation/filesy=
stems/ubifsec.txt
> new file mode 100644
> index 0000000..4eb41fb
> --- /dev/null
> +++ b/Documentation/filesystems/ubifsec.txt
> @@ -0,0 +1,357 @@
> +UBIFS Secure Deletion Enhancement
> +
> +Written by Joel Reardon <reardonj@inf.ethz.ch>
> +Last revised: 19.3.2012
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +UBIFSec provides efficient secure deletion for the flash file system UBI=
FS.
> +Trivial secure deletion by overwriting the deleted data does not work fo=
r
> +flash memory, as there is a large difference between the size of the I/O=
 unit
> +(page) and the erasure unit (erase block).

I think for correctness you should use term "LEB" everywhere, not
"eraseblock".

>  UBIFSec encrypts each data node
> +with a distinct key and stores the keys colocated in a key storage area =
(KSA).
> +Secure deletion is achieved by atomically updating the (small) set of er=
ase
> +blocks that constitute the KSA to remove keys corresponding to deleted d=
ata,
> +thereby deleting the data nodes they encrypted.
> +
> +Key Storage Area (KSA)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +UBIFSec uses a small migrating set of erase blocks to store all the data

"Migrating" set? To me it sounds like the KSA area changes the position
withing the UBI volume. I'd suggest to remove word "migrating".

> +node's keys---this set is called the Key Storage Area (KSA). The KSA is
> +managed separately from the rest of the file system. In particular, it d=
oes
> +not behave like a log-structured file system: when a KSA erase block is
> +updated, its contents are written to a new erase block

s/to a new erase block/to a new KSA LEB/ ?

> , the logical reference
> +to the KSA block is updated, and the previous version of the KSA erase b=
lock

s/KSA block/KSA LEB/ ?

Also, it is not clear what is the "logical reference" - would be nice to
probably introduce this notion before using it.

--=20
Best Regards,
Artem Bityutskiy

--=-m3outrbS+1ACkzWMD0gC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPaf1qAAoJECmIfjd9wqK0V7QP+gMBaQVhy5vWNKJWLQU5OeJC
LzwQisDFvcXq2SRj9TG/Ml4ZdVtR/Byk83DjKC3pnZtVeQFYMb60N8N9DcH3FFeH
pK8S2g/cEAe2PWAzASmaF8CxGeaQTS/tV0mfKDMfTotpVkGyaauEbxxFWD8ZNKW0
YIq0xcNbTf6HfO6H2YdxjFrEPG4DBm1EUwnmROlyZQhIyvzDal/vAFKqW7Jk7xgY
7buaf4y6YS+ZBsHF57O+j3W048KTxUlnxWcfxylo8Yx/qC7vYtmKpehMaUrPfIQR
GJjx4Y541X+AyGf4HN4MnnAcHAV3PL6/Zh3+VjoqLOFDdDq3d9oS7rYZYI3MiR5n
DuRTNTd1A0XtEiZiFuwebpaMM6ywadO5ZmXGPjrLUGSOpsa4q8ocaFudQgdMMJ8M
vxRS9l4QB069E7qs2b0lkDuKJic89FWU/CgeP1FrEtc4ZYSdrz7Nvri1H3dXBsHr
nZ114EnkqkFhgyZtkBn9xVURAqfz7U5sPAlx5lJG/bYU9dBMRIwLuy8NwLqfu8Ci
bLEsD12zKxqFW+XHte+Axqm73VQtIP6YjZUPk1PXubojIDzKMKgN/m1o4QraX4vK
WaYyjbdqGQNCap6tjVrgci/O9p9hV0WgTMF0TksxYhvcEDJqBYHlA4CGxqS3uX7g
a9K0Th9hWUNqWTum5shg
=RXua
-----END PGP SIGNATURE-----

--=-m3outrbS+1ACkzWMD0gC--
