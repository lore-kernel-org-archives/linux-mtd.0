Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BZ7N4-0003K1-2i
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2004 08:12:29 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Marc Singer <elf@buici.com>,
 linux-mtd@lists.infradead.org
Date: Sat, 12 Jun 2004 14:06:50 +0200
References: <20040611191921.GA32182@buici.com>
In-Reply-To: <20040611191921.GA32182@buici.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406121406.50536.tglx@linutronix.de>
Cc: 
Subject: Re: MTD Maps driver for Sharp LH7a40x
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 11 June 2004 21:19, Marc Singer wrote:
> I've written a maps driver for an ARM CPU.  Do I need to submit the
> patch to you in order for it to be included in the kernel?  Presently,
> I've posted it to Russell King.  Though he hasn't said why he hasn't
> included it, I wonder if it might be easier for the MTD maintainers to
> handle the patch.

RMK explained quite detailed which patches should be submitted to him. Read
http://www.arm.linux.org.uk/developer/patches/info.php

Subsystem patches should always be sent to the subsystem maintainer(s) or t=
he=20
appropriate mailinglist. RMK can review a MTD patch of course, but he has=20
enough stuff to take care of.=20

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
