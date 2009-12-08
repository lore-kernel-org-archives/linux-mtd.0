From: "Scott Branden" <sbranden@broadcom.com>
To: "Joe Perches" <joe@perches.com>, "Leo (Hao) Chen" <leochen@broadcom.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
Date: Tue, 8 Dec 2009 10:25:46 -0800
Subject: RE: Missing ARM/BCMRING MTD NAND DRIVER files?
Message-ID: <9383297B60843144AC17878B479520F110B62DF365@SJEXCHCCR01.corp.ad.broadcom.com>
References: <1260296515.27677.45.camel@Joe-Laptop.home>
In-Reply-To: <1260296515.27677.45.camel@Joe-Laptop.home>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

They have been sitting in David Woodhouse's GIT tree.
They are already in linux-next. and should have made it
 in 2.6.32 put did not get pulled.
Just waiting a pull from Linus in 2.6.33.=20

Cheers,
 Scott

-----Original Message-----
From: Joe Perches [mailto:joe@perches.com]=20
Sent: December 8, 2009 10:22 AM
To: Leo (Hao) Chen; Scott Branden; linux-mtd
Cc: linux-arm-kernel@lists.infradead.org
Subject: Missing ARM/BCMRING MTD NAND DRIVER files?

Commit 57a473f2f97cf3bca78df08aac2f438ddef03bee added
this MAINTAINERS entry, but not the files listed.

No other commit added these files either.

Are these files supposed to be part of kernel sources?
If not, I think the MAINTAINERS entry should be removed.

ARM/BCMRING MTD NAND DRIVER
M:	Leo Chen <leochen@broadcom.com>
M:	Scott Branden <sbranden@broadcom.com>
L:	linux-mtd@lists.infradead.org
S:	Maintained
F:	drivers/mtd/nand/bcm_umi_nand.c
F:	drivers/mtd/nand/bcm_umi_bch.c
F:	drivers/mtd/nand/bcm_umi_hamming.c
F:	drivers/mtd/nand/nand_bcm_umi.h
