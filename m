Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTewA-0003T2-I5
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 06:50:07 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: Andy Hawkins <a.hawkins@cabletime.com>
Date: Fri, 28 May 2004 12:44:57 +0200
References: <1085737289.5617.3.camel@adh>
	<200405281227.34312.tglx@linutronix.de>
	<1085740962.5617.9.camel@adh>
In-Reply-To: <1085740962.5617.9.camel@adh>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200405281244.57973.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Large flash concatenation
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 28 May 2004 12:42, Andy Hawkins wrote:
> Hi,
>
> Thanks to both Thomas and David for replying.
>
> On Fri, 2004-05-28 at 11:27, Thomas Gleixner wrote:
> > 1. Please use the latest NAND code, as the support for the larger devic=
es
> > is already there and the old code does not handle the large page device=
s.
> > We have actually problems with CVS access (is IPV6 only). I can provide=
 a
> > current snapshot on request.
>
> I'm now doing that. I've downloaded the latest snapshot
> (mtd-snapshot-20040527.tar.bz2) and am trying to get it to compile now.

The snapshot is outdated due to the same reason. I'm building one and putti=
ng=20
it somewhere for download.

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
