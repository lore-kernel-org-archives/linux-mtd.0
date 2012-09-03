Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Qqh-0004Kr-1S
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 07:13:31 +0000
Message-ID: <1346656701.3061.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Mon, 03 Sep 2012 10:18:21 +0300
In-Reply-To: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9fZP69khWFNkhHgyu8ei"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shmulik.ladkani@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9fZP69khWFNkhHgyu8ei
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
> + *
> + * Note:
> + * If you choose to set the @offset for the <partdef>, please set all
> + * the partitions with the same syntax, such as:
> + *     gpmi-nand:100m@0(boot),100m@100m(kernel),1g@200m(rootfs)
> + *
> + * Please do _NOT_ set the partitions like this:
> + *     gpmi-nand:100m@0(boot),100m(kernel),1g@200m(rootfs)
> + * The `kernel` partition does not set with the @offset, this is not per=
mitted.
>   */

I guess it is indeed OK to sort the partitions, just makes things a lot
simpler. But we probably then should also do the following:

1. Make sure there is only one partition without offset. If there are
several - error out.
2. Check that partitions do not intersect - I did not notice that we do
this in the code.

So AFAICS, this patch is not needed and we better have the following
patches:

1. Add sorting
2. Add a check that partitions do not overlap and there is only one
offset-less partition.

How does this sound?

--=20
Best Regards,
Artem Bityutskiy

--=-9fZP69khWFNkhHgyu8ei
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRFm9AAoJECmIfjd9wqK0alEP/2N4sLMc+BCZORu/hH7gEHQd
99Rb8zTcZKASwJac0Mj1aRDwFO91Cf/vQGNbQ/kjKq+Sx3R/MjODDss5Ltq8cldb
1QwUiBfnz70Dgp7sIjTBlM36d/udYI0Nv8VkyS1WTHZcXWxPXnmIW24o7JwXkktP
VDZypdRUoW1pqif4CrevKBmPcDqmrChFRLgSpZDBJkV3zTSW08yylNhFYelbVc6H
m/yR45uuOKytpNE0S/GTJZmSMKuJr0yR0CYZxNIvrDUihuZYvERQuP8a98R8NEa8
RRgX0FctkRhxDreuco07U74g1pooI1q12QBsUzSotkpqrjf5jbKVSz1fElNYqIX1
LIMz6VWIDNs8Ro0/N/ei31VaBFLBCumMkWsDmZ/+AUcGoUmQ/tCpNDIc7g5l4j1I
nf8LTytu0vWNCPMc3rQI3vNFDoC1WhikrxevitXJg8CLcAESHKJeq32KJUsOeVLC
UFO8TWM5Npk8Pj4N5QVuZ0QE/Ms15Z5hS4SYKzbInXcWAS8JDhZEKL1ULViiWvd0
5x+fiOCzLblDnF5LNLFZI0fieU8Pywnh9z5OgX+6xkXH2kiSQgg1kuYSLjk9Qcdk
gqYayBB+qDu/vQ5F/lX8CNt3z4Ycr8NXeBzKzDzediz2THDlqx5vic2vHk2V+DCf
hzs5tWaRF+dm4KkXkZ1U
=OYQ/
-----END PGP SIGNATURE-----

--=-9fZP69khWFNkhHgyu8ei--
