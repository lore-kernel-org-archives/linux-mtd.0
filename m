Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbseD-0007VD-Ba
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 12:14:05 +0000
Message-ID: <1338898670.2507.48.camel@sauron.fi.intel.com>
Subject: Re: mtd nand erase and bad block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Tue, 05 Jun 2012 15:17:50 +0300
In-Reply-To: <20120601175407.7c39a8fb@halley>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-B43VQ27YpP5QE4r9Sy9/"
Mime-Version: 1.0
Cc: Angus CLARK <angus.clark@st.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-B43VQ27YpP5QE4r9Sy9/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-01 at 17:54 +0300, Shmulik Ladkani wrote:
>=20
> My personal preference would be:
> 1. A new ioctl (MEMSCRUB?)
> 2. debugfs flag, PER MTD PART (slightly safer than your global flag)
> 3. global debugfs flag
>=20
Yes, I guess option 1 is the best I think. Option 2 needs too much work.

--=20
Best Regards,
Artem Bityutskiy

--=-B43VQ27YpP5QE4r9Sy9/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzfjuAAoJECmIfjd9wqK0flQP+wTW7/R85Rh8Ua84fe9ghfwV
2skuJmhEW4+QY019GB/PdGrqk/cP46eZnbF2L6Uo7I/8Ag1kg2nkzfKlGKWM37yc
64532vB7h8d4jY836Q1l5gbOil/WldIQdrJPb9rure5yXcy9kvWAHa0ukWwChDWW
8hCHBxzjq1mty8kaS06q30RdAC63dvzTco9pYRU6Z77EAyle/IAj7CtbgtEHACtL
qWDhJJjXCgeKe6ejf4UuPYB7/SWyOef9y3J7PaeBlTzi5ev3j0GRkub19QvjboUO
nw7MlcUyjpWPtMUx/8DNgchZnTsMOnM5/+JtXh4DkKMpyZA1cCTcigXyk1VYe88q
FfiEhhXZBPDqLp/WNyb9UBcD0Qknf8T+qOzh2OKzijzDQhWD056kbjbGoLJiKH0J
Uzp/90PLAoS1DGXeNKDgtXimwDmXYL+/WPclQFdEth0rBSr4pyx4ecYnCn2tDGaH
IsAiEefGwm7wZQCn+vmpDFPgJytXSqz81Z3CBVNV6ukTN7RNHmAV7qQSoLe2ZUXf
sH+Sp5cxA5kzkh7XvQtbZpMagsMkduHgSgOzHwl+OnhPOt85SKPUrQss22SDfUNx
aHx8FxQ+7rSu89vWXN3Vdpzc4o7H+D/oVwaCrl2rNQVU0IbbiCQaqihtJ540zl5i
uOXJP48mc9F+v/Q2IZcz
=ZBLH
-----END PGP SIGNATURE-----

--=-B43VQ27YpP5QE4r9Sy9/--
