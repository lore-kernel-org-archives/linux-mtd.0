Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTfUu-0003zB-QQ
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 07:26:02 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: Andy Hawkins <a.hawkins@cabletime.com>
Date: Fri, 28 May 2004 13:20:53 +0200
References: <1085737289.5617.3.camel@adh>
	<200405281227.34312.tglx@linutronix.de>
	<1085740962.5617.9.camel@adh>
In-Reply-To: <1085740962.5617.9.camel@adh>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200405281320.53554.tglx@linutronix.de>
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
> > 2. The nand driver itself can handle multiple chips now. The scan
> > function supports multiple chip detection. Do not use the concat functi=
on
> > for this purpose. The chips are provided as one big device to the MTD
> > layer if you do not use partitions.
>
> How do I do this? Each chip appears at a separate address (we've used
> the lower 6 bits of the address lines to decode the chip selects for
> each chip). At the moment, I'm looping over all the possible addresses
> calling 'nand_scan' at each address. Is this this correct way to do
> this?

nand_scan now takes a parameter maxchips. This tells nand_scan to scan for =
up=20
to maxchips chips.

The selection is simple. Only one chip can be selected at a time.=20
All you have to do is write your own select_chip function and set the funct=
ion=20
pointer in the nand chip structure to this function before calling nand_scan

the function gets the chipnr (0 - maxchip-1) which should be selected or -1=
 to=20
deselect.
Inside this function you simply modify the IO_ADDR_R and IO_ADDR_W fields o=
f=20
the nand structure so the appropriate chip gets selected.

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
