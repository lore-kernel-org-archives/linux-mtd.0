Received: from gate.epygi.de ([212.126.211.241])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19asOy-0003Tn-Vq
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2003 08:33:09 +0100
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: <tglx@linutronix.de>, "David Woodhouse" <dwmw2@infradead.org>,
   <jasmine@regolith.co.uk>
Date: Fri, 11 Jul 2003 09:33:05 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJGEJBDEAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
In-Reply-To: <200307110218.28358.tglx@linutronix.de>
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
cc: Charles Manning <manningc2@actrix.gen.nz>
cc: linux-mtd@lists.infradead.org
Subject: RE: nand flash driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>=20
> It will work with addresslines, if
>=20
> 1. All datasheets are reliable
> 2. Your hardwaredesigner can precalculate all the timings in details =
even=20
> under high interrupt load !!!!
> 3. the softwareguy is aware of the above problems
>=20
> My experience is (I have a bunch of different solutions here on top of =
my=20
> desk):
>=20
> Either you have a genius in hardware and software design available or =
you have=20
> a rock solid solution with GPIO/FPGA/CPLD. The second one will either=20
> increase your production costs by <1$ per piece or decrease your =
performance=20
> by about 8%.
> Both negatives will be less than the debugging and redesign costs.
>=20

I don't know exactly what our hardware guys did but from softer =
perspective I can say the most "difficult" part is to copy =
nand_command() and modify it so it uses your addresses to switch between =
data, address and command mode. You can remove a few calls of =
hwcontrol(). Write your own hwcontrol() and dev_ready() function, that's =
it. Few magic in there.
The important question is: did the hardware designer a good job? And I =
hope ours did. ;-)

Stephan
