Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BWARe-0004Bq-Br
	for linux-mtd@lists.infradead.org; Fri, 04 Jun 2004 04:52:59 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 4 Jun 2004 10:47:28 +0200
References: <E1BW9s0-0007ic-LQ@phoenix.infradead.org>
	<1086338874.4588.62.camel@imladris.demon.co.uk>
In-Reply-To: <1086338874.4588.62.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406041047.28915.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/include/mtd mtd-abi.h,1.1,1.2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 04 June 2004 10:47, David Woodhouse wrote:
> On Fri, 2004-06-04 at 09:16 +0100, gleixner@infradead.org wrote:
> > Log Message:
> > Extend eccpos array to support HW8_512 ecc on 2k chips. Signed-off-by:
> > Thomas Gleixner <tglx@linutronix.de>
>
> Er, you just changed the kernel<->user ABI and broke all existing
> userspace tools compiled with the old one.
>
> Which is OK since this hasn't gone to Linus yet.... but as soon as it
> goes to Linus these things are set in stone and you have to extend, not
> change.

I know.

> Do we want a couple of ints in that structure saying how big the arrays
> are? While we're at it, it's better to use explicitly sized types to
> make 64<->32 bit ioctl conversion easier.

Sure.

> > --- mtd-abi.h	5 May 2004 14:44:57 -0000	1.1
> > +++ mtd-abi.h	4 Jun 2004 08:16:06 -0000	1.2
> > @@ -86,7 +86,7 @@
> >  struct nand_oobinfo {
> >  	int	useecc;
> >  	int	eccbytes;
> > -	int	eccpos[24];
> > +	int	eccpos[32];
> >  	int	oobfree[8][2];
> >  };

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
