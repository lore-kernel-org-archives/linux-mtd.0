Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv3cn-0000vX-Uu
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 10:20:11 +0000
Message-ID: <1358245292.2731.120.camel@sauron.fi.intel.com>
Subject: Re: linux-next: Tree for Jan 14 (mtd)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 15 Jan 2013 12:21:32 +0200
In-Reply-To: <874nija8ry.fsf@free.fr>
References: <20130114154649.cb077b499876da60463fb304@canb.auug.org.au>
 <50F43197.6010308@infradead.org> <874nija8ry.fsf@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-eRN9/7eR5P4w7/7S+L+o"
Mime-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mtd@lists.infradead.org,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-eRN9/7eR5P4w7/7S+L+o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-01-14 at 20:01 +0100, Robert Jarzmik wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> > ERROR: "byte_rev_table" [drivers/mtd/devices/docg3.ko] undefined!
>=20
> Thanks for the report. I have a trivial patch attached. Should it go thro=
ugh
> Artem's tree or do you want to take it directly ?

David just picked this patch to the MTD tree.

--=20
Best Regards,
Artem Bityutskiy

--=-eRN9/7eR5P4w7/7S+L+o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9S2sAAoJECmIfjd9wqK0hmMQAIZsKXeZxrUN2qMdIU2U1GKt
7qzVvCZ0ZrEoBB1TMV1ZFrzrjk+AFwxkWplFk67NmQbYsPb87knRf+7MtDelA/pG
8fWYT6KQJfq8z0GazEBM1E7eBXUOeo+d8trCmHNbrDHYAT//DM99m1hUullWn6Hk
F6RXIvcfW4mYtG7TI4v3xwFV2JLedPDC0SxdUsynQElV5r7xYLbuKQJJK1Ovd/9R
NxAAZGncw/1t4PWQyLACNRPTK7Bs8HFkrAuB12n6byUkQGPMLCjQiFa4YJeSAhr9
Twy++EXyODDjc8Dt98tZeizaB4kz9fGQOHSyRCgtwrW5zn2Sg91Eqg3+tNxwRk5+
vmYeTzrvHMt0q057OmU9rcJ/SC3il/L3FuVutK5UutI1OGTEnxkw9FJH4nLbmLj1
poYF3kHk8+XEEpy/es26Fm6v/CLAQzTyz3SllGkVqUDM/g8NUPaSyIc7Rt/G1fhR
31SIAbwJGO0bPkwmjsW5azzEww+UHGqFIf06B1E6vMHTJAabX37vxpKlKCuLgM30
ZXccEdVMHBaqPtVyc5lJCvrTgaD7HCG4sOv4yYxr7m64+0fpKFG8iB7Xh+zZ2w86
sGci2ZP9xz4Wos5achyVit6v1GIVuFgE3MmcT8sZbNez7rOFjiIqyXn6gGhI8T7D
OHk6VuUEeFw/3oWvD0cW
=RYSJ
-----END PGP SIGNATURE-----

--=-eRN9/7eR5P4w7/7S+L+o--
