Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVrSX-0000m0-46
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2004 08:36:40 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: Florian Boor <florian.boor@kernelconcepts.de>,
 elvin@masteria.com.tw
Date: Thu, 3 Jun 2004 14:30:58 +0200
References: <OFEAD3BCB5.CEF27553-ON48256EA8.003D7F5E@com.tw>
	<1086261995.737.17.camel@thunder>
In-Reply-To: <1086261995.737.17.camel@thunder>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406031430.58787.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: SAMSUNG NAND Flash (K9F1208X0B) driver support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 03 June 2004 13:26, Florian Boor wrote:
> Hello,
>
> >       I am porting SAMSUNG K9F1208x0b serious nand flash on my platform,
> > which is arm922-based platform.
> > I am using 2.4.18 arm linux kernel. I cannot find any driver in the
> > driver/mtd/nand directory for nand flash of this kind.
> > I am wondering if I could get driver support for the flash of this type
> > from somewhere?
>
> it is quite easy to use drivers from CVS. There is a script in CVS
> repository that helps patching in latest drivers from CVS. If you intend
> to use jffs2 don't forget to add the new drivers too.

Yes, the chips are already supported in the current MTD code.=20
But the MTD code does not support ancient kernels out of the box. Use a rec=
ent=20
kernel version >=3D 2.4.26.

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
