Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbRCx-0007SS-Cf
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 07:28:24 +0000
Message-ID: <1353569347.2701.16.camel@sauron.fi.intel.com>
Subject: Re: /dev/ubi{x} MAJOR number enumeration
From: Artem Bityutskiy <dedekind1@gmail.com>
To: simon widmer <simonxwidmer@gmail.com>
Date: Thu, 22 Nov 2012 09:29:07 +0200
In-Reply-To: <50A3CE88.1080402@gmail.com>
References: <50A3CE88.1080402@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-T2BM2R4/Np6yTJT9n8Xi"
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


--=-T2BM2R4/Np6yTJT9n8Xi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-14 at 18:02 +0100, simon widmer wrote:
> hej,
>=20
> I'm faceing an issue with ubi-enumeration. I am using UBI out of=20
> mtd-1.5, i hope its more or less recent.
> My issue is as follows. i have 7 ubi partitions. if im detaching every=
=20
> partition and try to reattach a single partition, in this case /dev/mtd6
> to /dev/ubi2, there is some issue with the MAJOR nummer. I suppose its=
=20
> ubiattach's fault, it tells me to have attached the partition to ubi2
> but in fact it attached it to the first (ubi0). Please consult the log=
=20
> below.
> Is it me how is maloperating or is this a bug?

Not sure what is going on. The ubi tools use /sys/class/ubi/ directory
for finding most of the things. I suggest you to clone the latest
mtd-utils, compile UBI tools with -g, and debug with gdb and see what
see what is going on.

--=20
Best Regards,
Artem Bityutskiy

--=-T2BM2R4/Np6yTJT9n8Xi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrdRDAAoJECmIfjd9wqK0TtUP/3WLwGYkXll7yzsspviwBqmQ
cPjVdV3+t7EGoJfykhY8DEDiz8tSqlNUPq026jwt69LMH7HrT5WBumT7cY+5KbNG
WtRnKN5H2w/+9589CXuCGEok64AtchBnxFb2jQDJKBH2AqXp6EdGH7jgLJhNEoz3
fFFg1UcnCo+w4YkdAkUsNj52L0RyMiaPXUoj2Td8+kuJ0qYIYUvLn8E2XdFUsjyo
rD1Q5FMQ//yl4AHMlge3/bxHQ/a8EkAfcqINrQ5r4ZwZ1H3Oia8l7yHd6MRKjFJI
0p3EPXKtSWemfy5BMTInXlDh91kvv9NuBo9Jr4oDdlRYjtAihwPIxhI7mBpy4vhc
FTJRWI6NEeAUIBa88MWIhBoGCi2T5HxMflSmKrXCOBZOVo0NUVY7LhDTlZIkKygA
KHKdHoW8QEqEgLO8i1NeVj8gEUf44jg34hQKut8iBxjmzR5CMKKXcKcb8umd5c8R
yi7zImFaJYdNA4UKHdaQCWvVsIyug6pViQXYQ3pgnH1cE8aCB4pDz/2NGyhJxOI7
c6cPwfBT2DpdKwiYZbe/z2aJNm6L1Ored6NUPZsPcXs6zxEyv/PBVYSPURZ3s2lF
B71+uCzlkW/PTGrTyYboy+5b6mwMFpWEJYIqWw4Gq8L5cMRN4+TCKHBXZVN5gOCZ
ZPSp9yrQOWJHp8tUgsPC
=dqDd
-----END PGP SIGNATURE-----

--=-T2BM2R4/Np6yTJT9n8Xi--
