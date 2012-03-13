Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7Q9k-0003wR-DD
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 11:44:45 +0000
Message-ID: <1331639237.3595.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] drivers/mtd: docg3 lessen read alignement burden
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 13 Mar 2012 13:47:17 +0200
In-Reply-To: <1331461726-10087-1-git-send-email-robert.jarzmik@free.fr>
References: <1331461726-10087-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Aldeh3mAuEDYdo1ZEtfs"
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


--=-Aldeh3mAuEDYdo1ZEtfs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-03-11 at 11:28 +0100, Robert Jarzmik wrote:
> The read function was so far requiring the reads to be aligned on page
> boundaries, and be page length multiples in size. Relieve these
> constraints to ease the userspace ubifs programs runs, which read ubifs
> headers of 64 bytes.
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Aldeh3mAuEDYdo1ZEtfs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXzPFAAoJECmIfjd9wqK0wSYP/iDKQqkvrdCAntSRphfSRPRD
1qe46JxgIYvzX819oxT4qxXlmOiLESD/7A4jwoH09sNkgfLRueFpx7EBa1/sIPIj
r87P/og+/qObf33JxFbIW8ag2AQlqiZjCg8oNQtF4ebbfn3Je8DfrIY8EVanpvx2
a3H6KA+DtnZwxppnl9Si/Fl6xdNsPHtBNzyQB9AiUdaNDbxiQExOJZ1IQAznpwS5
82Ibwnt/NJWrcnyrPmGNRUuxmFhTEKZrfHVLabdbB1NVQVicnxnEeY63pdVfD5gI
4tBdNxAdP0DkZj7IJZWkmnyjQ+DccjwOpz1Cl68htX7O7uUYHq4+b00ofHjL3Oix
qhKpqKjFRu8FwL/KyQgXxDpJtOKC7141wfUuIeozaIXJgxq7qaYU7Dw4kGRQ28Qd
PR+WjjnSeF/GNMhe8PPQOVnvtLA5v3u41EPV9jRjsl8dubpI4dXzWpsXECo8Vfzr
2/jm8cGJ5In6yK8j0x/VSf2Inq/D7Q5xieXHa/O414yQnpSwdWsrDQmaYpMmWa3P
OIFZ2Q5Mp9QMbfaOlbpd4x6IpXBdhcGfE7Yps/aaW3KHp5GCwmDN3zcnpXuzu2xe
YT4YPcNmYrnGZ6Pj5R6PunDePzldQYh3eS/ougRUvm/WjuRnDLBvE6ZC7mOz3fPZ
Rp/iC5o2mAeLs8iYuxTJ
=xKpN
-----END PGP SIGNATURE-----

--=-Aldeh3mAuEDYdo1ZEtfs--
