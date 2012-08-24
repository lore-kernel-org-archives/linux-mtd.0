Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4pH7-0004QD-UX
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 08:29:54 +0000
Message-ID: <1345797282.2848.274.camel@sauron.fi.intel.com>
Subject: Re: Potential issue on UBIFS for Kernel 3.4.7
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabien Comte <fabien.comte@ercogener.com>
Date: Fri, 24 Aug 2012 11:34:42 +0300
In-Reply-To: <005901cd70ab$4356c150$ca0443f0$@ercogener.com>
References: <005901cd70ab$4356c150$ca0443f0$@ercogener.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kcxhWHLW3HfZLWynn8qn"
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


--=-kcxhWHLW3HfZLWynn8qn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-02 at 14:35 +0200, Fabien Comte wrote:
> Hello,
>=20
> I migrated some products (embedded devices with 256 Mbytes NAND flash, ab=
out
> 5 products broken by the transition) from a kernel 3.4.4 (they had previo=
us
> versions before 3.4.4) to a 3.4.7. And after a clean shutdown (no power
> cut), I got these messages and some files corrupted (random, not always t=
he
> same).

The only UBIFS change between 3.4.4 and 3.4.7 is:

commit 863c806617059e412ade0b1bbb6d215106be14c1
Author: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
Date:   Sat Jul 14 14:33:09 2012 +0300

    UBIFS: fix a bug in empty space fix-up
   =20
    commit c6727932cfdb13501108b16c38463c09d5ec7a74 upstream.

I very much doubt it is guilty, but you can check.

But first you need to make sure you have a reliable setup prove that the
upgrade cause the issue.

I'd got this way.

1. Save flash dump of a working device before the upgrade. Make sure you
can always flash this flash image back and the system works fine.
2. Make sure you really have no problems with 3.4.4.
3. Upgrade to 3.4.7, reproduce the issue.
4. Put the saved image back.
5. Try to upgrade to 3.4.5, and see if it is reproducible.
6. Continue bisecting and find the guilty commit.=20

--=20
Best Regards,
Artem Bityutskiy

--=-kcxhWHLW3HfZLWynn8qn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNzyiAAoJECmIfjd9wqK0iHEP/RgN2JzMFeSXdexlbJ9/nfVs
Ltm56MFfInWx7rDA9NvEU4z0aysyrwW8Jda2+o/TJfGRMCcjWpck9QCGvRTpj13T
0ws81r01d0lXYPIrWKMdXPrLjhSYPOXr2OCvblxmP4HjJ1hF/Toz+xDJHKwDvbTD
DKWWmJ2WNoYZMsdxGZP4Xhzkrk1xXTNAMwRGwVN7FPSZXafS+IrZVBZ5fh6+xlWR
/2RansJocdT4jyljx7G1qCiRXg/C9LNTlj4vXZd+I2DRNV906uTv1+1+8hgzraFr
M8cHSXx7fZHVxATQmeaPtQvkQP/R0RRiv0UNS+DICYfU4qCvHQKldZ2DiJtqT08/
iv8OBw0FmdDPCvEBtSEFs4P2MmQEraYCLKfKi/bnvhhV/4nUw4pU9bresWISXncL
NqfqL+d9qBU5FE1VL39CtbXWTsXnqJC6HGnC13DzxaW4SNhd9RLqW2Wx/4ur/lJn
EYcSxNB80z5cdMA0QRaHKMr7u7aMZf7a1h44QUOxqaNhSDCAOqM7yomhf+YLhjF0
BIXh97AK/FGWjpZ2DAKPF2Y2H6yWuQkJRG5XIpZI3Jy3W6G2+/sTDLTaULtVGBV2
iIo3V79456E9c6Pd9YnKT0yx5AmcetaCGWZUGZwZC8cPARR3jBQyF6Hv3UZu/SQ4
pmyMPMkUuhU3WeXPF/MF
=Foml
-----END PGP SIGNATURE-----

--=-kcxhWHLW3HfZLWynn8qn--
