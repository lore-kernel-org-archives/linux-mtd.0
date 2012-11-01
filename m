Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TTofC-0005vz-KL
 for linux-mtd@lists.infradead.org; Thu, 01 Nov 2012 06:54:05 +0000
Message-ID: <1351752867.1891.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Take celltype into account when parsing
 Samsung ext. nand ID's
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 01 Nov 2012 08:54:27 +0200
In-Reply-To: <1351701009.8774.24.camel@shinybook.infradead.org>
References: <1351679539-30651-1-git-send-email-robin@protonic.nl>
 <50914F32.7020605@gmail.com>
 <1351701009.8774.24.camel@shinybook.infradead.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IlLSmlUjDm+HfFZG5u3P"
Mime-Version: 1.0
Cc: Robin van der Gracht <robin@protonic.nl>, tglx@linutronix.de,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 sjhill@realitydiluted.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IlLSmlUjDm+HfFZG5u3P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-31 at 16:30 +0000, David Woodhouse wrote:
> On Wed, 2012-10-31 at 09:17 -0700, Brian Norris wrote:
> > I believe this regression has already been fixed and accepted by David=
=20
> > Woodhouse and is awaiting upstream submission - hopefully for the 3.7-r=
c=20
> > cycle. This should be its ID, in linux-mtd.git (and linux-next):
>=20
> Hm, did I not push that to Linus yet? I'll do so shortly. Anything else
> we need to get in to 3.7 while I'm at it?

The 'for-3.7' branch in the l2-mtd.git tree.

--=20
Best Regards,
Artem Bityutskiy

--=-IlLSmlUjDm+HfFZG5u3P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQkhykAAoJECmIfjd9wqK0sucP/RDag2MdbeZBRgH+F8gzDyqA
3d1omnCGDYBSL/wnfmSle/SGxhfvuDLJB7uGR7d1bjmSN5PRjgEx8baTAeAdMQSF
KLMwQ5TqlRmsDV1mmO4dWiMYKZ+cvL9rfl8GDxYO3O49KzRPy1qJYQA5xI6kVIsp
3q99RB1QbnJvqhBRtGcbpPVf2qchOyzab1CNWwB+kMGBgNy+DitzeRZMjt8CF8Yu
Xnvrgy8tTtv7LL8beT4I8Wyis3iSvkU8SeB/qkTYcahW5cFJgWLvuzW53HGMD5au
GbmYehy1LB4ap/P4nDW6W+GcLgSTpA73L4cInhJCaPWPKRkOXPiXI/dhFTQU6Ckb
Fepu50D9wBxWoyrpErZSFAnHpb4zhqsF48rtHQVlGKl+wAw3rIEf4ZCCr6nZSddw
aP0UPBthFfasmqExonSkSe8Jl9gSpXuFUjtY9msUwW+p8NPQB5M89s3QcxssoxoF
gEU+mUENMA9aHYzVWJY2HAEGg5xYoTY8pGwoKeCbo1BLFsoHdCHivBJjc6ZhuycP
D9FXoU2f3B/05GmFXH3YT93EfnI4hu2rc3Nc7LEcVJ4lkKMgrrF+t+KVPySfInP5
9Qy86b7LGJkwGNSjRITd0fmpT8iyWIfJ2lPtPwlLyNDlVazJKihkJ265eGuXlwbY
XC2b9gdznhsspuxbqlor
=+i/s
-----END PGP SIGNATURE-----

--=-IlLSmlUjDm+HfFZG5u3P--
