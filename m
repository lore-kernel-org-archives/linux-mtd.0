Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bbb9u-00036r-Ed
	for linux-mtd@lists.infradead.org; Sat, 19 Jun 2004 04:25:09 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Marc Singer <elf@buici.com>
Date: Sat, 19 Jun 2004 10:19:09 +0200
References: <20040613214329.GA2282@buici.com>
	<200406190216.29671.tglx@linutronix.de>
	<20040619003818.GB21609@buici.com>
In-Reply-To: <20040619003818.GB21609@buici.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406191019.09268.tglx@linutronix.de>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 19 June 2004 02:38, Marc Singer wrote:
> > The common case can just be solved by using the physmap driver and the
> > command line partition parser. Maybe we should think about an extension
> > to physmap so the board support code can supply an appropriate
> > partitioning scheme along with the chip description.
> >
> > I was thinking about simliar support for the NAND driver too, but there
> > it turns out that the anomalities are given per design, although it
> > should not be an unsolvable problem.
>
> I've chatted with Russell King about this, too.  I think we agree that
> board-specific code would be a bad idea.  The better solution appears
> to be something on the command line.  I'm going to look into it.  For
> now, consider this PATCH discarded.

Yes, for the common case where we dont have special functions neccecary the=
=20
commandline resp. ATAG (unfortunately only for ARM) is the right place.
This works if the only information which is neccecary is

base address, size and buswidth.=20

Russell, can you please give define two ATAG numbers for this purpose ?=20
ATAG_MTD_PHYSMAP and=20
ATAG_MTD_PARTITION
I would be happy to provide the data structures and parsers to make this wo=
rk.

BUT,

=46or chips which need Vpp setting for programming and erasing this is rath=
er=20
impossible. Same applies to NAND drivers, as the NAND interface can hardly =
be=20
specified board independent on the commandline.

=46or general purpose boards (PCI, PC104 whatever) drivers/mtd/ is surely t=
he=20
right place. For embedded boards I'm not sure if it makes sense to have all=
=20
this code in the mtd subsystem or if it would be better to have this in the=
=20
board specific code in arch/xxx/boards/myboard.c which is there anyway.

Another possiblity would be to include a hardware related header file in th=
e=20
physmap driver and the to be written counterpart for NAND.

#define BOARD_SPECIFIC_MTD_FUNCTIONS
#include <asm/hardware.h>

asm/hardware.h includes board_hardware.h if available.

Inside board_hardware.h then we would have

#ifdef BOARD_SPECIFIC_MTD_FUNCTIONS
board_mtd_functionA(){}
board_mtd_functionB(){}
(nand)pyhsmap chip =3D {
	.address =3D xxxx;
	.....
	.functionA =3D board_mtd_functionA;
	.functionA =3D board_mtd_functionB;
}
#endif

Not all arch's provide a hardware.h file but this should be a solvable=20
problem. For ARM this should work right out of the box.

I know it looks weird in the first place, but it could be one of the possib=
le=20
solutions to solve the board support mess. Russell uses a similar approach=
=20
for the timer init and interrupt handler for the various subarchs of ARM=20
since long.

Any thoughts ?

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
