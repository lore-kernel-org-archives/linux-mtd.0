Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bg6ti-0007CT-6Y
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2004 15:07:03 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 1 Jul 2004 21:00:27 +0200
References: <40E448BD.8030909@cray.com>
In-Reply-To: <40E448BD.8030909@cray.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200407012100.28033.tglx@linutronix.de>
Cc: 
Subject: Re: nand oob corruption recovery
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 01 July 2004 19:24, David Updegraff wrote:
> I realize that specs say that if you wipe out mfg. bad block markers
> that there is "no way to recover them".. but...
> Are there suggestions for plausibly reliable test sequences that one
> could run a nand chip thru to regenerate valid bad block markers?
>
> Presumeably, it is insufficient to simply try to erase all blocks,
> marking failures as bad...  perhaps verified full page writes ?

Erasing may be not sufficient, as the block could be al ff. Writing all blo=
cks=20
to all zeros and verify that it works. Maybe try a 0x55 and 0xAA pattern to=
o.

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
