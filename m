Received: from mailout10.sul.t-online.com ([194.25.134.21])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Baj2T-0001m4-8s
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2004 18:37:50 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Dan Brown" <dan_brown@ieee.org>
Date: Thu, 17 Jun 2004 00:32:09 +0200
References: <073c01c453ac$de849e10$0100a8c0@superfortress>
In-Reply-To: <073c01c453ac$de849e10$0100a8c0@superfortress>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406170032.09129.tglx@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Towards DiskOnChip support as a NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 16 June 2004 16:19, Dan Brown wrote:
> Please realize that this needs a lot more testing.  I still haven't gotten
> JFFS2 to run properly with this (though I suspect that may reflect my
> inexperience with JFFS2).  Also, the change to nand.h may break other nand
> drivers (though the fix is trivial).

The nand.h change is fixed in nand_ecc.c

>     - Modifying JFFS2 to use autooob layout?  (Not sure about this)
>     - Modifying flash_eraseall to use autooob layout?  (Should work OK on
> DOC by coincidence)

Yes, flash_eraseall works by coincidence, but I will look into this.

>     - Adding the nand/diskonchip driver into the kernel build system
> instead of the old one

Can you make it optional to use or should we break the code in=20
drivers/mtd/devices to enforce the development on Dan's code in=20
drivers/mtd/nand ?=20

dwmw2 ??

IMHO the current DOC code in drivers/mtd/devices has too many todo's which=
=20
inhibit proper usage.=20

They are partly related to the bad block management. The bad block manageme=
nt=20
support in the generic nand driver is able to support all types of bad bloc=
k=20
tables found on DOC devices.=20

We fixed the HW ecc problems in nand_base.c today.=20

It should be not too hard to adjust (I)NFTL to work on the new driver.

Some specialities of the DOC variants which are already working in the old=
=20
drivers should be easily copyied to the new one as Dan has already done for=
=20
his chip.

Another point is the error correction code. I have a generic reed solomon=20
library nearly finished which is then usable for all kind of reed solomon=20
based hw ecc generators. I don't want to make the old drivers use it and I=
=20
dont wan't to have duplicate code around.

=2D-=20
Thomas
_____________________________________________________________________
=46rom slash dot org
"When customers are visiting, engineers are not allowed to wear ties.=20
That way the customer can tell who is the engineer and who is the=20
salesman (and therefore whom to believe.). Ties cut off blood flow=20
to the brain, making it easier for the salesmen to do their jobs."=20
_____________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
