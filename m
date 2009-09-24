Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mquzn-0006VT-2W
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 20:32:59 +0000
From: "Scott Branden" <sbranden@broadcom.com>
To: "Joe Perches" <joe@perches.com>,
	"Leo (Hao) Chen" <leochen@broadcom.com>
Date: Thu, 24 Sep 2009 13:32:43 -0700
Subject: RE: linux MAINTAINERS: drivers/mtd/nand/bcm* files not in
 kernel
Message-ID: <9383297B60843144AC17878B479520F110AEDCAED9@SJEXCHCCR01.corp.ad.broadcom.com>
In-Reply-To: <1253824122.1806.20.camel@Joe-Laptop.home>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joe,

I wish they were in the main repository already.

They are sitting in Artem's git tree waiting for David Woodhouse to merge t=
hem upstream.
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/eef42e4b8b0de=
71f3fdac4577c0eea0537ce0386

David,

Can you please merge this upstream?

Thanks,=20
Scott



=20

> -----Original Message-----
> From: Joe Perches [mailto:joe@perches.com]=20
> Sent: September 24, 2009 1:29 PM
> To: Leo (Hao) Chen; Scott Branden
> Cc: linux-mtd@lists.infradead.org
> Subject: linux MAINTAINERS: drivers/mtd/nand/bcm* files not in kernel
>=20
> Hi Leo and Scott.
>=20
> These pattern files are not (yet?) in the linus' repository.
> Are they expected to be soon or is this just an error?
>=20
> cheers, Joe
>=20
> ARM/BCMRING MTD NAND DRIVER
> ddd559b1 (Russell King                      2009-09-12=20
> 12:02:26 +0100  540) M:  Leo Chen <leochen@broadcom.com>
> ddd559b1 (Russell King                      2009-09-12=20
> 12:02:26 +0100  541) M:  Scott Branden <sbranden@broadcom.com>
> 57a473f2 (Leo Chen                          2009-08-12=20
> 22:08:48 +0100  542) L:  linux-mtd@lists.infradead.org
> 57a473f2 (Leo Chen                          2009-08-12=20
> 22:08:48 +0100  543) S:  Maintained
> 57a473f2 (Leo Chen                          2009-08-12=20
> 22:08:48 +0100  544) F:  drivers/mtd/nand/bcm_umi_nand.c
> 57a473f2 (Leo Chen                          2009-08-12=20
> 22:08:48 +0100  545) F:  drivers/mtd/nand/bcm_umi_bch.c
> 57a473f2 (Leo Chen                          2009-08-12=20
> 22:08:48 +0100  546) F:  drivers/mtd/nand/bcm_umi_hamming.c
> 57a473f2 (Leo Chen                          2009-08-12=20
> 22:08:48 +0100  547) F:  drivers/mtd/nand/nand_bcm_umi.h
>=20
>=20
>=20
> =
