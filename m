Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BajKd-00029B-VD
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2004 18:56:37 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 17 Jun 2004 00:50:49 +0200
References: <073c01c453ac$de849e10$0100a8c0@superfortress>
	<200406170032.09129.tglx@linutronix.de>
	<1087426007.4530.6.camel@localhost.localdomain>
In-Reply-To: <1087426007.4530.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406170050.49881.tglx@linutronix.de>
Cc: Dan Brown <dan_brown@ieee.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Towards DiskOnChip support as a NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 June 2004 00:46, David Woodhouse wrote:
> On Thu, 2004-06-17 at 00:32 +0200, Thomas Gleixner wrote:
> > Can you make it optional to use or should we break the code in
> > drivers/mtd/devices to enforce the development on Dan's code in
> > drivers/mtd/nand ?
> >
> > dwmw2 ??
> >
> > IMHO the current DOC code in drivers/mtd/devices has too many todo's
> > which inhibit proper usage.
>
> It's not so bad on the original DiskOnChip 2000 and Millennium devices.
> I'd rather keep it an option for now, at least till the todo list for
> the new nand-based driver is reduced. We need to get the HW ECC working
> on the driver, and fix up NFTL to work with it. We also need to fix up
> the probing to work properly -- currently my hack just had the address
> hard-coded.

My main concern was to wake up those, who asked for DOC support / improveme=
nts=20
recently and point them to the new code and make clear that the code in=20
drivers/mtd/devices is a subject to be removed in the near future.=20
So, if they need proper DOC support they can provide testing and hacking=20
capacities. This should get us along quite fast if enough interest is there=
=2E=20

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
