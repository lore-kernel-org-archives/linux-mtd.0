Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN2hS-0007jS-BK
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 13:56:06 +0000
Received: by lagy4 with SMTP id y4so107679lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 06:56:04 -0700 (PDT)
Subject: Re: [PATCH] [JFFS2] check xattr data integrity during the scan.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Wed, 25 Apr 2012 16:55:53 +0300
In-Reply-To: <4F942F27.2090807@tribudubois.net>
References: <1334175816-20688-1-git-send-email-jcd@tribudubois.net>
 <1335100558.28267.11.camel@brekeke> <4F942F27.2090807@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-S431syThs62NY51FQnsR"
Message-ID: <1335362163.5114.14.camel@koala>
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


--=-S431syThs62NY51FQnsR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Christophe,

On Sun, 2012-04-22 at 18:17 +0200, Jean-Christophe DUBOIS wrote:
> > The same is done for xattrs - during scanning we do not check the data
> > payload.
> In case of attributes, JFFS2 do detect that they are corrupted later but=
=20
> it is too late. At that time we have lost reference to earlier=20
> "versions" of the attribute and I think we would need to rescan the all=
=20
> partition to find it back (assuming it has not been deleted in the mean=
=20
> time as I am not sure how GC deals with earlier versions of the=20
> attributes). So it seems better to do it in the first place.

Wait. Now I think I starting remembering a bit more. First of all, you
surely have many good arguments. But my counter-argument - the same
happens for data nodes. We do not check data CRC during scanning. Xattr
nodes should be treated the same way.

JFFS2 scans in 2 phases:
1. early scanning - it scans only the headers of the nodes, but not the
payloads. No I/O on the FS is possible.
2. late background scanning - the GC threads goes through every single
inode and reads it, so forces data CRC checking. JFFS2 is available for
reading, but write requests may block (if they require GC, AFAIR,
because we cannot do GC before we have checked everything, otherwise we
may lose a valuable older node version).

So I guess this is what you should do for xattrs as well - check payload
CRC at the second stage scanning, not the first one.

The idea on this split was to do minimum and make the FS available for
reading, and continue the rest in background. This background thing is
quite heavy BTW, and slows down the entire system boot.

> You also have to consider that attributes are generally "short" (unlike=
=20
> the file content) and there is not much data associated to them. so the=
=20
> overhead implied by the attribute data scanning is not very important=20
> (considering the attribute data is already in memory). But it is true=20
> that there is an overhead added by this patch.
> What happen for now is that if an attribute is corrupted, then we will=
=20
> not be able to ever read it again (JFFS2 returns a negative/recoverable=
=20
> error on corruption detection on any access and does not try to cure the=
=20
> problem).

AFAIU, this should be dealt with during the second stage scanning.

--=20
Best Regards,
Artem Bityutskiy

--=-S431syThs62NY51FQnsR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmAJpAAoJEJtuLFy+q7fejI4H/3ylOKTw82YdvWTEva4liEs2
8epb33waAFWmCpqZuV5QkdR+xiuEUGyict8L7hsXh9yLwSb7drux7WH7bRup3iJZ
8brmQqV6iTjqEW4juEEZXQcmxERamwpLJ32mvb/maEqcwS0sNo7VXdKJ8MsDwzPC
cNkpyqvcSAXG0ctL7HNfjU5Hcjcj68xLAKcVKS0F/MIOjoVLpkxQtGqA4pCrkqzy
5ARlSADDqqJnzjHYE76IkdyEcFKu9UlZWcmnQ3jLpTm3R2ZGb24UH3WSLeH9oB3R
1mQ5v2z8E3GNUHYjiBBaQDt1Tbzqgs8VHGmYyEkYjORnueSH1gVHHOgiK/d3JNc=
=qQcd
-----END PGP SIGNATURE-----

--=-S431syThs62NY51FQnsR--
