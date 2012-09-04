Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8pPQ-0000sZ-9m
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 09:27:00 +0000
Message-ID: <1346751114.12610.29.camel@sauron.fi.intel.com>
Subject: Re: Problems after 2nd bootup with NAND and ubifs/ubi
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jaya Kumar <jayakumar.lkml@gmail.com>
Date: Tue, 04 Sep 2012 12:31:54 +0300
In-Reply-To: <CADqH6Vw4FtGjLF-oPVwg0YcwOoQxk90whB6YoYh4mt=1D2SGmw@mail.gmail.com>
References: <CADqH6Vx_doWcOFP6N8qSV-h+KdZi8cqdxyHCROf-SKFvUiYNhg@mail.gmail.com>
 <1345810383.2848.304.camel@sauron.fi.intel.com>
 <CADqH6Vw4FtGjLF-oPVwg0YcwOoQxk90whB6YoYh4mt=1D2SGmw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-5bOKIEnJWJZiq/lYNlRR"
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


--=-5bOKIEnJWJZiq/lYNlRR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 18:31 +0800, Jaya Kumar wrote:
> Would I be correct in assuming that the mtd_oobtest failure can be
> ignored since ubi does not use OOB?=20

If you only care about UBI/UBIFS, then yes, you can ignore this. But in
general - it is asking for troubles.

--=20
Best Regards,
Artem Bityutskiy

--=-5bOKIEnJWJZiq/lYNlRR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRcqKAAoJECmIfjd9wqK006MP/1QVT9w2hWKf2V9TQ9Hvmb0V
6zrP8KUzW7IEGp672z+uhWtcP8CDcDPRZVBSS8dHLqoO47PSxKhN2XVJkmmFRs7M
IC+z8vz43pM3JShQdPSssvnM2qFInUKVOQ5iRwafppcQtzzWrxO+4YifI7BX2QuS
QyRKJrYkVwhi68nR+uwgJAMLRp4pO3TzBQvzBFJT++CJjT/MrmLTTuyXNA88TtNM
NU4vy7o32yxxBKjeXdf7QdZBpFR+73rsxVwQ3160CF1YXfjs13eNP8IEE4X8e/Y/
oqpUUsfD36VFtCKn0kt42V/6kXYq28xZMS4BR56JLZ2YJ5l6hrForaPMKkX3MTRM
/tIBaodE8wncK7gLJ8CFHOypwfQf58gmG6zCqah/UZVtazOLbTgi8+wvWYy+xwOY
wkN4Zt9UAYRvkdIRAsUaZ7i1GC7K9UpzQZNTQX2DeGBUbKA24RK1ivMst7oMlQTi
A/K5wLHz0rgECgs1bduK7yK4B/uZtHVxo7Ye3MuumtNAayMQ5OlO8KThglEF0hNI
J8YoW8ZWUm23XlxWREVT/H30F2aNOBeUJPUt4FBIsZ2cUVRviJnWd3sN5dWEJ6dq
KT81FdNV92nQAj5BH2kJk9D0Lk4oAEoL/qG0LZcEXarYBM7XFdn7WXxR2rSKDTXs
hI4mqyf5Sg7sjKCJ9S0/
=B8/M
-----END PGP SIGNATURE-----

--=-5bOKIEnJWJZiq/lYNlRR--
