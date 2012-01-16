Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmkiv-0005sp-GT
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 11:27:37 +0000
Received: by obcuz6 with SMTP id uz6so1604194obc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 03:27:36 -0800 (PST)
Message-ID: <1326713359.14299.59.camel@sauron.fi.intel.com>
Subject: Re: linux/mtd/gpmi-nand.h: No such file or directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 16 Jan 2012 13:29:19 +0200
In-Reply-To: <4F14097D.9060601@freescale.com>
References: <4F1013DC.8040902@prolan.hu>
 <1326712888.14299.55.camel@sauron.fi.intel.com>
 <4F14097D.9060601@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-JsFfD/ksyZ3IAV55eIJh"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Peter Rusko <rusko.peter@prolan.hu>,
 Shawn Guo <shawn.guo@freescale.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-JsFfD/ksyZ3IAV55eIJh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 19:26 +0800, Huang Shijie wrote:
> >> Where can I find that header?
> > It looks like it has never been added to the kernel tree. Huang?
> >
> Shawn has added it to his git tree to fix the compiling error.

This issue is upstream for long time, when are you planning to submit
this patch? Can you send it now and I'll ask David to merge it - there
is anyway another patch which requires quick merging upstream.

--=20
Best Regards,
Artem Bityutskiy

--=-JsFfD/ksyZ3IAV55eIJh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFAoPAAoJECmIfjd9wqK0sHcP/0TZWT1xxkx1BmmrDr5U0rDZ
hceTAskmORdQP0GTDkI6fm/BDEPz9KRu3n2iHTH+mB+T9Va/krtXh8BQki6fQo3p
E3gk58KeIQ0O56Xyg6p/b+/xtDLGMpOq69Dn8sSiHWe0RCq/Isfs02dShc8YjSJK
nCnvbOjdxpxJnxEIPuzsyEUlSnIhHcFrZDIFfQJ2gThdwBpkpDObqpmQpM3u0LCV
/ns/aYPhNE9gVlVyq9otWIfDR5tIzq7JpeHZsOsRcBiFMUW24gRYQTFsj0xkY14X
Pskrbg1iNUG00MJ20FoJg/EpKZ9U+RFornwxOUvzsTh01ouQfci+DX9+x6C86Om2
3oGeu+ajtV40+dGh3zcDB/yB2MuvMwBKgxJp+TE8reJaEBZVVPnsvvSzrgNui4df
x/pL7c8x+PSysgmr6qBbGS/xaft6ppcrr8WygM3sE32Ntvzo+LALZ7pqVcbrKnYn
iC344c4QVKxCd58lgZnme2bgQf2jsb8ZIeF9QWqK1cwNq9+7A062nxL9Q6BHJYUN
DxUksMiycldhPnx4Wv0oOf1lopIuA35O8k+DJFnNOCQM6okLOopmKOeiWpyAC19F
mByy91sTChuxjtUpTLDuprC2ozJEPzmaj+bHJ2AtqtcN+/Vy0FSLIQ5VgdwE+DOR
8xosDRSuc1U2G6fRG5YM
=V505
-----END PGP SIGNATURE-----

--=-JsFfD/ksyZ3IAV55eIJh--
