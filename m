Received: from [2002:d556:63eb::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BQse1-0001v7-Re
	for linux-mtd@lists.infradead.org; Thu, 20 May 2004 14:51:54 -0400
Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BQsdx-0005HB-O5
	for linux-mtd@lists.infradead.org; Thu, 20 May 2004 19:51:49 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Gurhan Hatipoglu <gurhan@hatipoglu.biz>,
 linux-mtd@lists.infradead.org
Date: Thu, 20 May 2004 20:46:10 +0200
References: <200405201538.40677.gurhan@hatipoglu.biz>
In-Reply-To: <200405201538.40677.gurhan@hatipoglu.biz>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200405202046.10681.tglx@linutronix.de>
Cc: 
Subject: Re: Fwd: NAND Flash Problem.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 20 May 2004 14:38, Gurhan Hatipoglu wrote:
> Hello sir/madam;
>
> I forwarded the message attached, by the advice of CVS group. Please info=
rm
> me about the problem forwarded.

CVS is no group. It's a read only mailing list which keeps you informed of=
=20
changes in the CVS.

> I'm working on Hyundai GMS30C7201 board, using ARM Linux V.2.4.18 Rmk 3.

Is this the kernel from Hynix ? Use the reworked one available from my=20
homepage.

> In addition to NOR Flash, we mounted KM29U64000T 64Kbit NAND flash on the
> board to use as a disk, I changed sample VIA board driver according to the
> directions given in the Document directory

Which version of MTD do you use ? The one in the kernel source ?=20
Use latest MTD CVS code, as everything else does not properly support NAND.

> and by referencing addresses in
> hardware.h (NAND_BASE 0xf2000000, physical address is 0x08000000).
> When I boot the system, VM error is appearing, as below and system is
> crashing. When I test ioremap for physical address 0x0800000, system is
> giving no nand flash found message.

The pyhsical address must be converted to a virtual adress by ioremap. Get =
the=20
physical address through which the NAND chip can be accessed. In your drive=
r=20
use:=20
nand_virt =3D ioremap (nand_phys, SZ_1K);
nand_virt must be stored in the IO_ADDR_R and IO_ADDR_W members of the nand=
=20
chip structure.

> Function entered at [<c0093284>] from [<c00952b0>]
> Function entered at [<c0095278>] from [<c000ee60>]
>  r8 =3D C00C2B44  r7 =3D C00C6C20  r6 =3D C01342E8  r5 =3D C00E6120
>  r4 =3D C0134260

Such a backtrace is worthless, as I dont know anything of your kernel. Deco=
de=20
it with ksymoops. Read linux/Documentation/oops-tracing.txt

=2D-=20
Thomas
________________________________________________________________________
Steve Ballmer quotes the statistic that IT pros spend 70 percent of their=20
time managing existing systems. That couldn=E2=80=99t have anything to do w=
ith=20
the fact that 99 percent of these systems run Windows, could it?
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
