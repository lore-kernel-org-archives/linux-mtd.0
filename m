Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19akjI-0002hx-D1
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2003 00:21:36 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HHU002KG0VH42@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 11 Jul 2003 01:21:18 +0200 (MEST)
Date: Fri, 11 Jul 2003 02:18:28 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1057851161.21073.399.camel@passion.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>, jasmine@regolith.co.uk
Message-id: <200307110218.28358.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
 <Pine.LNX.4.53.0307101611170.844@hex.linuxgrrls.org>
 <1057851161.21073.399.camel@passion.cambridge.redhat.com>
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: quoted-printable
cc: Charles Manning <manningc2@actrix.gen.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: nand flash driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 10 July 2003 17:32, David Woodhouse wrote:
> On Thu, 2003-07-10 at 16:12, jasmine@regolith.co.uk wrote:
> > On Thu, 10 Jul 2003, David Woodhouse wrote:
> > > Hmmm. When sending multiple bytes of address, isn't ALE supposed to
> > > remain high for the entire duration, without going low again between
> > > cycles? How do you achieve this if it's on the address bus?
> >
> > By waiting to see if the next write is to the same address-  it's not
> > hard to do that sort of thing in an FPGA or SoC.  Since the only line
> > involved is the ALE to the NAND, there's no downside in hanging on a
> > little longer before dropping it.
>
> Hmmm. So you deassert ALE only when the _next_ cycle happens and it's
> not another write with the appropriate address bit set?
>
> According to the Toshiba datasheet in front of me there are timing
> constraints on how long you must delay between deasserting ALE and
> performing the subsequent read cycle.
>
> After a READ command and address sending cycle, you must deassert ALE at
> least 50ns before subsequently asserting RE#, and after a READID command
> it's 100ns.
>
> The na=C3=AFve implementation would probably get that wrong. You could
> probably arrange to deassert ALE with a _read_ cycle to the 'address'
> address, though.

It will work with addresslines, if

1. All datasheets are reliable
2. Your hardwaredesigner can precalculate all the timings in details even=20
under high interrupt load !!!!
3. the softwareguy is aware of the above problems

My experience is (I have a bunch of different solutions here on top of my=20
desk):

Either you have a genius in hardware and software design available or you h=
ave=20
a rock solid solution with GPIO/FPGA/CPLD. The second one will either=20
increase your production costs by <1$ per piece or decrease your performanc=
e=20
by about 8%.
Both negatives will be less than the debugging and redesign costs.

=2D-=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
