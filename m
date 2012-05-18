Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVLbZ-0006e5-Eb
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:44:22 +0000
Message-ID: <1337341669.2483.31.camel@sauron.fi.intel.com>
Subject: Re: UBIFS and NAND issue (works only once)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
Date: Fri, 18 May 2012 14:47:49 +0300
In-Reply-To: <5D308BD40154E4439D82454FE483A50206B6FFDD@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A50206B6FFDD@EVS4.nam.ci.root>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-T5cXBka7vhlsNo5BI5Bs"
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


--=-T5cXBka7vhlsNo5BI5Bs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 2012-05-17 at 16:08 -0400, Bishop, Mark wrote:
> root:/> ubiattach /dev/ubi_ctrl -m 3
> UBI: attaching mtd3 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI error: process_eb: bad image sequence number 125589241 in PEB 1012,
> expected 817099782

This means that you did not flash it correctly. Image sequence number is
a random number associated with an image. UBI tools pick it randomly.

This message says that half of your flash contains the new image, but
the half of it contains the pieces of the old image. I have no idea
which tools you use for flashing images, but you should check that your
tools erase the flash area beyond the new flash image.

Read here:


> slab error in kmem_cache_destroy(): cache `ubi_scan_leb_slab': Can't
> free all objects

This seems to be a bug on error path - we leek memory. A patch for
fixing this will a good way to contribute back to the community.

--=20
Best Regards,
Artem Bityutskiy

--=-T5cXBka7vhlsNo5BI5Bs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtjblAAoJECmIfjd9wqK0YkYQAJNAKNC0QoGV+VU6aBFhnEI9
KGx2IzPlENjTI550OQiPqX+xFj0+swVSiAhfEjYfXKOWx3+mISDxEkQQy2B+4nv4
vtH1+1BTRa5jAwPptv9XmIqi7UeXer755fMHkH1J90V6JdJi/lQstyqUM1orJuI6
55klqTI14SYHetAkl6M+J/zak2HrntqLtJ1gfH/NvDEiw+gzhEeuXB2q+Rr3X3xi
Uoljask6VAJz2Ldo+rK1WRhnSTmB2SOeUXMBtmGunqNntDQx6Rp4yjbATvHn1ei4
ZcJESPLhibw33dx0OS0vFIwlHIu7N8KddIyWbpEkK/SZyz7HdhZD+9dI/u0PCLAT
E+jGl9OJPgDQyGisWOlOQbpDgLK/8EaNl3qqXE+6/jtr1yXamwV9ha2JWLs/Ffnn
P56jMjBo9o/gjWu6qCdyEWW5/QRBBuAdMjpcuUFn3wv88SHYcZHM6CVXbiR74KSV
QvnlR8XdPqdKu4NrhsA6eFZ5LRIJbb6F38d3C11TyB6X7Qg+ftne0B7gvYyy+VQ1
vSsFhwH4nLkHAS9LduHn7gvvQZF+dt5p1/2TZvM/qwqqH1IhV5B4csYAQxl3Y52L
IbjThrTReW9FXQuZqKqIX1Mex0ZNSBDw686jXrQBpOsKfshVDTiioz3gZGyOOA0K
ihVv/9tGb/soWevIIFN/
=73Hn
-----END PGP SIGNATURE-----

--=-T5cXBka7vhlsNo5BI5Bs--
