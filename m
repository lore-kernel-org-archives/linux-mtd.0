Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMFcm-0000Yj-Os
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 10:04:17 +0000
Message-ID: <1349949842.12014.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: m25p80: fix missing MTD module owner
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Gr=E9gor?= Boirie <gregor.boirie@parrot.com>
Date: Thu, 11 Oct 2012 13:04:02 +0300
In-Reply-To: <50728A5E.3020102@parrot.com>
References: <50728A5E.3020102@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ANczm5ngKLpS82fUI4aH"
Mime-Version: 1.0
Cc: marex@denx.de, linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ANczm5ngKLpS82fUI4aH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-08 at 10:10 +0200, Gr=C3=A9gor Boirie wrote:
> Marek,
>=20
> Sorry about that. I didn't really mean to submit an official patch at
> first...
> Nevermind, please find one just below.

It misses a nice commit message and Signed-off-by. Please, try again. Or
I can do it for you if you want (please, let me know), but then I will
be the patch author.

Also, please add the stable tree tag there, as this is a bugfix which is
worth having in -stable.

--=20
Best Regards,
Artem Bityutskiy

--=-ANczm5ngKLpS82fUI4aH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdpmSAAoJECmIfjd9wqK04xIP/jk5LFdYd6wRmz35P3QnbB8/
wudUyauy0UV0IwHl3qMgsUmuAir93xcV4UeTPSbEJnj3qhJPep8kOHftsKNfkn1e
ZdfYEc2BRLY/u+bzlz4oQuFHON5AKtqhvw8Wt4ZuZF8TY8kz5jIZ2FwLT2DohECA
vNDOHymADWQoFJ0SzbM2qD4238d8ue9ARIx/VuOp6IzaBIGq01P819T43oB9DFCd
Pi138brAhNFhYjVMAZn99fnGCTHlkKslr0Y7QHSBykW6aBxbFz8DSy2NCx3T8onm
IvFmZRX6/4JJ8f/0iv5gEkexXs34iB/oYWEpS7NC5X8HyYQBW6hDB2fES56jx5QU
mr1ys46tSINIwX2d7zxzsHhwaQL0Tk9RoLX2b7I1PWZkoiVctK+SY5yXrDwdRLDy
hA5QNyZuzv7Nu3Tqp8JdZeEjM/o0m9ixAuOT1a8va197PkCFrVfbyoqo3WXDYOMD
MKEwrCx3Hd/S6Y9lRR1BGFC2u+NGtnIfxZIXXdlRuzuhex0BMSSCwcJQHoFhDMMQ
sMbTqANUQjmONAY/9ErqNMLNk7WA4UKgKGD1pMFD3Ds0mQH9pvDjifKaT7kcFjHG
qIwew+wyjua11ANyj5a8686c70NQaF61QwgsAWqfjx4YSgpTefApslAjwG2L8bQr
pvtPpSpj0apKKyzk+Ff5
=phT/
-----END PGP SIGNATURE-----

--=-ANczm5ngKLpS82fUI4aH--
