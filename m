Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbTci-00025Q-8k
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 20:22:21 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Jun Sun <jsun@mvista.com>,
 Marc Singer <elf@buici.com>
Date: Sat, 19 Jun 2004 02:16:29 +0200
References: <20040613214329.GA2282@buici.com> <20040614005455.GA4070@buici.com>
	<20040618170514.A6101@mvista.com>
In-Reply-To: <20040618170514.A6101@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406190216.29671.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
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

Jun,

On Saturday 19 June 2004 02:05, Jun Sun wrote:
>
> How about just using physmap mapping driver and keep all your
> board specific stuff to your board directory?   See
> include/linux/mtd/physmap.h for more details.

Thanks for jumping in. That's what I was trying to point out.=20

In fact most of the board drivers in drivers/mtd/maps could / should go awa=
y.=20
The reason to have one is crappy hardware, unusual chip constellations or=20
other anomalities.

The common case can just be solved by using the physmap driver and the comm=
and=20
line partition parser. Maybe we should think about an extension to physmap =
so=20
the board support code can supply an appropriate partitioning scheme along=
=20
with the chip description.=20

I was thinking about simliar support for the NAND driver too, but there it=
=20
turns out that the anomalities are given per design, although it should not=
=20
be an unsolvable problem.

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
