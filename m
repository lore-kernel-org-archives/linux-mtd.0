Received: from penguin-ext.wise.edt.ericsson.se ([193.180.251.47]
	helo=penguin.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1912ge-0001kF-W4
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 12:15:18 +0100
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: tglx@linutronix.de
In-Reply-To: <200304030258.25876.tglx@linutronix.de>
References: <004301c2f96b$0c111c20$1200a8c0@JOHNB>
	<200304030258.25876.tglx@linutronix.de>
Date: 03 Apr 2003 13:15:05 +0200
Message-Id: <1049368506.32205.28.camel@spawn>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
cc: Mtd <linux-mtd@lists.infradead.org>
cc: John Burch <jburch@vincisystems.com>
Subject: Re: Can mtd partition span multiple devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-04-03 at 02:58, Thomas Gleixner wrote:
> On Thursday 03 April 2003 00:56, John Burch wrote:
> > I'm wondering if a single mtd partition can span more than one physical
> > flash device.  For example, if two flash devices span the following
> > address ranges, 0x0-0x3FFFFF and 0x400000-0x7FFFFF, can an mtd partitio=
n
> > be defined as follows?
> >
> > Name: spanning_partition
> > Size: 0x200000
> > Offset: 0x300000
> >
> > So this partition would span physical addresses 0x300000 - 0x3FFFFF
> > (device 1) and 0x400000 - 0x4FFFFF (device 2).
>=20
> Enable MTD concatenating support.
>=20

You mean MTD partitioning no need for concatenating with this layout.=20

--=20
Kenneth Johansson=09
Ericsson AB                       Tel: +46 8 719 70 20
Tellusborgsv=E4gen  90              Fax: +46 8 719 29 45
126 25 Stockholm                  ken@switchboard.ericsson.se
