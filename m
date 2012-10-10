Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLq4y-0007k0-4y
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 06:47:41 +0000
Message-ID: <1349851661.20594.6.camel@sauron.fi.intel.com>
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Date: Wed, 10 Oct 2012 09:47:41 +0300
In-Reply-To: <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
 <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1JEY/cblhN6ab97iXcoK"
Mime-Version: 1.0
Cc: Ricard =?ISO-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1JEY/cblhN6ab97iXcoK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah, I am probably confused.

On Mon, 2012-10-08 at 17:04 +0200, Marcus Prebble wrote:
> We have remounted a static UBI volume which happens to be the rootfs (/)
> onto another location, /tmp/newrootfs

So, you have your UBI volume, it contains your root file-sytem, right?
Then you "remount your" root to /tmp/newrootfs? If yes, I would like to
understand how exactly you do this? Give some more details.

> We are trying to make an image of /tmp/newrootfs with mkfs.ubifs and
> where the output file is /tmp/newrootfs.img.


If the inode number of / is the same as /tmp/newroofs, and the device
number is the same, this is the same inode, no?

This means that /tmp/newrootfs.img will also be visible
in /tmp/newrootfs/tmp/newrootfs.img, no?

--=20
Best Regards,
Artem Bityutskiy

--=-1JEY/cblhN6ab97iXcoK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdRoNAAoJECmIfjd9wqK0xUkP/i9TMjEH6aEb2mcRBJ+nxVBK
SdGANy/CyJYyF/bIyEOKCI6RSP/fu7F/i3tArdAoS/DZUuOdWIw2xQJSeDetDTUg
KB+jqTxfUqCvl9/3k/zoYDV0RUIAMVjYe4vMwDYeY6FmC4burjXV4UkL1LKmMnW6
8pJlJQtZa3jftbs368IJDZ3S+ON8Ntf+CyB1n6xsQW28Tul/79x7x/jqrCCZhC23
Yquyn4kc28JlajIa91VwrcM0LDtHaD4evgKs5xMdlroxnUP1tVB0+W1XuK89BMfX
/oU7jS2C8CNYSJGi8e1zbDGgUON+SJ1OfgHlRv+N21kt0pPJhxM59VspWBfoX2sb
4vkSBcivMUw5RnKQCnoJVGzc7HYDYgNOUU72nmXBgb0It1drUu7wsRK/56uJr9Jx
yl+f87Gmw55lJcUKKnjikCO9to5zW0uou6ZOouscYAtCFFrD3j4F08iOTob0M/in
TeLDVa02hsYaS6JzHVKQ0t10MYkmJKlSPYUdjynyESQFTG/0KyG3L1hpJfvaQ4mn
NH3Nw34GAUaTi4qbLfNa7c9aYSBo86yc95WmI4UMrpflEqJmlry4saxCrCe7w4qb
SOR244IM3tssrCwoG9h5i8GJomtZCqzqCBZvAnqCM5AEsIW0jZ+2dN8FgeWVBPB0
kMBP6w9PvDNvsPNqPnGe
=tBKE
-----END PGP SIGNATURE-----

--=-1JEY/cblhN6ab97iXcoK--
