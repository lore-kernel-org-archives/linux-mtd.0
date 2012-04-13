Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIjpe-0003UC-Li
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 16:58:47 +0000
Message-ID: <1334336505.13160.19.camel@sauron.fi.intel.com>
Subject: RE: Unstable bits and JFFS2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Fri, 13 Apr 2012 20:01:45 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD3351F9CADBE@dekaexchange07.deka.local>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
 <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
 <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
 <1334334462.13160.10.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADBE@dekaexchange07.deka.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UDDrcLZ1gTDvKVmIGNmK"
Mime-Version: 1.0
Cc: 'Matej Kupljen' <matej.kupljen@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UDDrcLZ1gTDvKVmIGNmK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-04-13 at 12:40 -0400, Atlant Schmidt wrote:
> Artem:
>=20
> > Yeah, thanks for correcting. Yeah, read/write-disturb may make bits
> > to become unstable, but we assume this is a slow process which will
> > gradually make more and more bits flip and ECC will take care of
> > that. So I think Matej can exclude this.
>=20
>   Unfortunately, ECC can only fix those PEBs that
>   are actually read. If one of the PEBs in your
>   filesystem is being used entirely to contain
>   obscure data that only gets read once in a
>   blue moon (i.e., very rarely), then multiple
>   read-/write-disturbs can hit accumulate in
>   that PEB and when it is finally read, it may
>   already contains too many errors to be
>   corrected by the ECC.
>=20
>   We've seen this exact scenario occur with the
>   current UBI/UBIfs and will be implementing a
>   userland "scrubbing" system to ensure that
>   every PEB gets read at least once in a while
>   (e.g., weekly or whatever interval seems right).

This is right, people should have a user-space app which periodically
reads all /dev/ubiX_Y. Care to send a patch against mtd-www with some
explantion of this issue and extend the unstable bits issue?

But in Matej's case I do not believe he is testing long enough to hit
this scenario. But everything is possible of course.

--=20
Best Regards,
Artem Bityutskiy

--=-UDDrcLZ1gTDvKVmIGNmK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiFv5AAoJECmIfjd9wqK0xpQP/2wEX2rCP5yIAxQHXABO6+0o
zzlYZQq3TyQ+PuYpA+WVpk0NFVF5zXhYWO54eGCyxTXcnTl6Q+ze+UsL+l7gjDfG
6KU4ZaB1a3+5sCV5hDbeeW3crH2o6O1+OdceA38T30yRj5qCbJyJEkTkfwc8IlQN
rXf7nI8px69pRir7DS4Bv0Ihsuxqcmh+e2mmIPZ9aQMBjGQ5HlbTzVosr6L6zEeF
quK8/QgAqG42iSpQ1lmCaYTHGtz1Idkhu9qezrMY0sxoADA/cOnWgf7coGz7WFU6
k+P8DIv1wZLY5E72ws3Wh8C943HMfVrsODncltG62GXlwnJIP7W2INNXSYbwr+k5
4MwA4HCwXgGqAfrwcRyEyZoTXekFoSb+Hi0CXxcCailGvuI45DyKL6eqwOS6hjOh
TQfvtTvVzBKh5HHQjyjAXS5CiDWuH0QL4syz11MDkxU4S66rY1uYDNL1n4UzIUO5
hKAFTpyFJbhuCOvUR8vzyGokHTViQ/xFvuond/4BulQ5M42DkvRdtGhIX6qHDSLV
55m/6MpBrRN+oPx7PPmBWTH6G1FoeWr+gvSFb2gJt+yKuMKrdQet6XRrQsOhFWfK
346ChZD+uADg3o78km2kRs49KK5r4bVrgAcna7GhpVUKYKwRzRwKSOFnAHvIMU5Q
0AdZv+wSnpvVnbXuSapP
=3iKP
-----END PGP SIGNATURE-----

--=-UDDrcLZ1gTDvKVmIGNmK--
