Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUfUF-0004pE-VJ
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 14:46:00 +0000
Message-ID: <1337179769.24809.66.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: add volume id and LEB number to struct ubi_scan_leb
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Wed, 16 May 2012 17:49:29 +0300
In-Reply-To: <1337178865.24809.62.camel@sauron.fi.intel.com>
References: <alpine.DEB.2.00.1205161419590.27131@eristoteles.iwoars.net>
 <1337178865.24809.62.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-VGXf697C2CPCzbVffhQ8"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-VGXf697C2CPCzbVffhQ8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-16 at 17:34 +0300, Artem Bityutskiy wrote:
> I've added this code to the joel branch. But please, test this and
> other
> UBI merge candidates with all the UBI debugging checks enabled as
> well.
> Similar to UBIFS.=20

To do this:

1. Mount debugfs, in my Fedora it is already mounted:

sudo mount -t debugfs none /sys/kernel/debug/


Then:

$cd /sys/kernel/debug/ubi/ubi0
$sudo sh -c 'echo 1 > chk_gen'
$sudo sh -c 'echo 1 > chk_io'

This will enable "general" and "IO" extra self-checks for UBI device
"ubi0"

--=20
Best Regards,
Artem Bityutskiy

--=-VGXf697C2CPCzbVffhQ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs755AAoJECmIfjd9wqK0pswQAIVEk0T2fvTOW+vhsdqyKXfA
vEdEO6qEpCRXIkATlhi3qOd/oCSyUxaUyailHETBcd07vi8YJIvWd84uclXXHdUw
VSEaQJERFnWk8fw4sTkDNJJhOcm4shmputIpqgndJs7smke7fzJrJrXSE/8W+v9e
ZCjZkuyY7wEcqTrOU6DbMQRq/NOz14SEx8qh2/jtVQ4kDsnJkX8PVZDaR9AML0HK
GYFq3qdgqS/x7KUyr3zYM5coBzfcYdAvtOx1u7NzILZCZOPkxSPfb5QMWnB0ECXg
0aKy/A0hhCcgQ8gWatxNAleeVbIjLCKbugqz0gxzpMxDyPQMI8FncNpSEuJjscU5
9OACzAcBU8x/AYf/zwDi3GpQEYVae7pxr4rVFDrbBbz6GDqsACG+zuI3+OMgJLV3
bcThbQqMfk22zdQ5smLvY68BcHGtFA/dLf3+XTGn6hLFe9pPUI/aw7uONfq0fe7m
/TaoNfXU6FbcUCzVpLnBmNbda7Tw1QPJOlo9rmYZ8RGtJsbghbtsK86zCESOBnrq
/5N6rlesS12rGxdiqjLe2qeIsB0frfupta6mfsC6es7o2nHPXA3M0m2Q6/1OM+oF
0Y+mBzVq51MHzNzk8MbtTm6/qRCKydb2MSmwtMKOdja0nv0QmPDFxVtE8ihfvrsR
Fwoj2hDf3D3BcWRiHWYJ
=VJ66
-----END PGP SIGNATURE-----

--=-VGXf697C2CPCzbVffhQ8--
