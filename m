Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeMvR-0002HH-Fm
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 09:30:26 +0000
Message-ID: <1354267874.30168.73.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: Advice request on how to reduce orph_buf size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>, Ezequiel Garcia
 <elezegarcia@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 30 Nov 2012 11:31:14 +0200
In-Reply-To: <CAJA4uhcD+bGAdKMb6Nv-Kvs+o229PaLQL-9Dok-ddCUS5rbGpg@mail.gmail.com>
References: <CAJA4uhcD+bGAdKMb6Nv-Kvs+o229PaLQL-9Dok-ddCUS5rbGpg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2t9sMZX64UhJTIpauyqv"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2t9sMZX64UhJTIpauyqv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-16 at 12:14 +0100, Josselin Costanzi wrote:
> In order to reduce UBIFS memory consumption when used in RW I'm trying to
> reduce orph_buf size from one LEB to max_write_size. I changed avail_orph=
s and
> tot_avail_orphs functions to report correct orphan counts but I'm now stu=
ck
> with the consolidate function. I don't see how I could atomically write a=
ll my
> orphans in a new LEB with a max_write_size sized orph_buf. One potential
> solution would be to try allocating a LEB sized buffer only when consolid=
ating
> the orphans but this means commit_orphans may now fail due to memory exha=
ustion.
>=20
> Have any of you an idea on how to correctly do this? What would be an acc=
eptable
> solution?

Hi,

well, it does not look like you can easily do this. The difficult
solution would be to implement scatter-gather lists support in UBI and
UBIFS, so that it would not require continuous buffers at all. Then may
of the LEB-sized buffers would not be needed at all.

I mean, why do we allocate a lot of LEB-sized buggers on mount time?
Simply because later we may have no memory, and we do not want UBIFS to
fail at random point with an error like "cannot write your files - no
memeory".

But if we implement SC support, we will be doing small allocations
instead of 128KiB+ allocations. Small allocations, like allocating one
page, do not fail. I mean, thy can fail sometimes, but extremely rarely.
And if they do, your system is dead anyway. Besides, the kernel always
have some pool of memory for urgent needs. Additionally, we can always
create our own memory pool with some amount of pages which are always
guaranteed to be there.

So, this is basically my answer. This is a big work. But it would make
UBIFS use a lot less RAM. It would also solve another problem people
scream for years about - UBI/UBIFS use vmalloc() which is not DMA-able
in many ARM systems. With SC lists we'd allocate smaller amount of
memory (mostly one page, and sometimes 2 pages), and we could use normal
kmalloc().

CCing Ezequiel Garcia <elezegarcia@gmail.com> - may be he is
enthusiastic enough to make a proposal about this in http://elinux.org.

--=20
Best Regards,
Artem Bityutskiy

--=-2t9sMZX64UhJTIpauyqv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuHziAAoJECmIfjd9wqK0mrQP/2hdzrWWoy1qXXzlKhrpJ734
t2jyMeS3Ye1S/zFohAkulpwiuKoWKUXzIA4CJNqPi+V6tWM+Vn8UzGG9zqepIbsI
soyR+isDkq56HlmY9p411iavyfW5xhllWDPZSxy0myuhq96vLjzx0lsFopkzH+Ph
FRHmmLkmoC4zUZjNB2D1eZRvbxd5k4komwY2fh+64mxgbfcZtywrc+kkR54JR08b
ucpQlBaia/eopRuW2OkA7hJ1kluBIAlQ2eR4kjm324auq7U3f7zVg90egxe6AdJ8
Wli1WBfMf/pXsm0/BLT7iYBTv0aVdSoeAm5Mg+Hnon7lW13NQaRUy+Ugah6/kV1D
ml0cRgivqHdclTUlE2y2Pac10Yf3VKfE/bzR2BNaz7oriX1qY0m49A3JNhJ65Ana
dTbL8UUEw1QKwcqZEj7kI2ZLpxmLW6T5M3v7FJhgaxuItdxkwkQujUWc70MESwZO
v3Cr7wcqXAaynu8IkEVEN2Tvb3dTR74tHgPSBh510ynLdWP7fNSdFQYHOEK1wHif
TeIhk/NMKsL/TEI12TkCjCc+20/9LSk+Ldtach51Fe8LNPfqkC5ugnfYVMd9VZMX
gpaplCPwlOuq/DkN9vBxI+JhuPU9+poGP/OmMwRhexO9JAmthFE3G154C/f1EJqK
LXyp8t4Nm3WIkSyFtesX
=fnJw
-----END PGP SIGNATURE-----

--=-2t9sMZX64UhJTIpauyqv--
