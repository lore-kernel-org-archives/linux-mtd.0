Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDDMH-0002M3-RU
 for linux-mtd@lists.infradead.org; Sun, 16 Sep 2012 11:49:54 +0000
Received: by bkcji2 with SMTP id ji2so2069021bkc.36
 for <linux-mtd@lists.infradead.org>; Sun, 16 Sep 2012 04:49:52 -0700 (PDT)
Message-ID: <1347796189.2032.7.camel@kyv>
Subject: Re: [PATCH V2] mtd: basic (read only) driver for BCMA serial flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Sun, 16 Sep 2012 14:49:49 +0300
In-Reply-To: <CACna6ryroY=Xbv7+VsRfBYdhRd9P6uz935b9scQqCmTjneM7sQ@mail.gmail.com>
References: <1346699237-414-1-git-send-email-zajec5@gmail.com>
 <1347358840.21359.67.camel@sauron.fi.intel.com>
 <CACna6ryroY=Xbv7+VsRfBYdhRd9P6uz935b9scQqCmTjneM7sQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SL3wL/+uFsgbmCNbJjxT"
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


--=-SL3wL/+uFsgbmCNbJjxT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-11 at 12:35 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2012/9/11 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Mon, 2012-09-03 at 21:07 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> This registers MTD driver for serial flash platform device. Right now =
it
> >> supports reading only, writing still has to be implemented.
> >> At this point it's marked as BROKEN, because it requires code present =
in
> >> net tree that wasn't mainlined yet.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> >
> > What are exactly the changes it depends on? URL? Are they staged for
> > 3.7?
>=20
> http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-testing.git=
;a=3Dcommitdiff;h=3D23cb3b2121323443834296a8ecb582b8aeb78d75
> http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-testing.git=
;a=3Dcommitdiff;h=3Dd57ef3a6a2eeb88df47e892c66692e3f59722ffe

Please, remove "BROKEN" and re-send the compilable patch against the
l2-mtd.git tree. I've pulled Dave Miller's tree with your patches into
l2-mtd.git. Thanks!

> Well, I just didn't implement writing yet (it's more complicated than
> that trivial reads) and I didn't know the correct values for the above
> ones. I just set writesize to 1 to avoid some WARN/BUG (not remember
> right now).

OK. Just add 'mtd->writebufsize =3D mtd->writesize =3D 1; for now.

> In case some other driver handling platform device was loaded earlier.
> Is that wrong?

I do not really understand why you need this - can the general code
really call the removal method and the platform data be NULL? If not,
kill this check - if this happens, this is a bug and we'll end up with
an oops. If it can, please, explain in more details how this can
happen.=20

--=20
Best Regards,
Artem Bityutskiy

--=-SL3wL/+uFsgbmCNbJjxT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQVbzdAAoJECmIfjd9wqK0Hz4QAM+wl3dKWfUxfe349C5KgU0U
MSDR1jADmr7h381eWOl9gGfE56t9l3m4RT0nkH1sMcBPdM+LJieVJPxoNw1T/u9s
JQR1pPilr2XDRL7SWn4+joRPE0LAHAjfJc5Jg5bPv0ObIfMdXvAMhTCsC51bI1ig
/D3slnt0YCb507CjueaXczlCHVTMiPCGHGKEiV0uzr1HGqkxv95R4183+z9hFWe8
RhpmX4vjExmmpMd4MmZTS6FOBoxfgJmEcYEmKGn8YnizOQmnBhyIrPbZoZ6GB8L3
fCqUvdQi29+QN4Omv+Mk08NPl587nd5tJlZ2Huo7TZ5zkWTQ0a6pz9KVDQYbyMtx
ybOm7nD3rTp9L2v9hEA26oyN9lAqN2NQFHoDmJRc25r92w41sgYKVQDBLsFB+uOd
wPLiXKn5OH/gvRK5wuaU9Rk1dcClJfN705c3PEDXm5ghHQs2SmHJjCp/sxIQDVmE
mGVKlAHTbxWkZEsyBxErleZqnfITAD5wmjI+iFSz3T+2Q1jXtfsf1kGPeogxflWW
TH//nfIoUnqq7nFqHKyXj4r5OcckQKXpf133cWOjqzq0cMmpDybSsncLT63wUwMk
MEwvQzsZGS6SnaVMbj5oqkTnjdJS3t27keSZyH72P654ijecK7O3gblXRknL9bQR
gylZMaNoj1J7mvuEP4zB
=tKgt
-----END PGP SIGNATURE-----

--=-SL3wL/+uFsgbmCNbJjxT--
