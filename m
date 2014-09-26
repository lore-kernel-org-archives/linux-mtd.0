Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXfAR-0001IQ-R8
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 23:43:16 +0000
From: Marek Vasut <marex@denx.de>
To: Jeremy Garff <jer@jers.net>
Subject: Re: [PATCH] spi-nor: Fix for Freescale i.MX6 reboot issue when using
 a N25Q00A boot device.
Date: Sat, 27 Sep 2014 01:42:10 +0200
References: <CAKbvp-NuFWzCCT+eo-WO47kazNuHbcA4KxhjDLYGR9p9Jh9FRg@mail.gmail.com>
 <201409251909.41740.marex@denx.de>
 <CAKbvp-PKW6e7m7Szt+EJfm3+ATLPkeT5KgBUU0TQB1R=2bDKzw@mail.gmail.com>
In-Reply-To: <CAKbvp-PKW6e7m7Szt+EJfm3+ATLPkeT5KgBUU0TQB1R=2bDKzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201409270142.10226.marex@denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, September 26, 2014 at 09:46:10 PM, Jeremy Garff wrote:

[...]

> > This patch would not work in case you were doing a PageProgram operation
> > and I came around and mashed the 'reset' button on your board. The SPI
> > NOR would be somewhere in the middle of the PP and your MX6 would simply
> > not boot.
> 
> It's actually worse than this.  _Any_ time the reset button is pushed
> after linux initializes the device, the system won't boot.  Not just
> during a page program.  Obviously this problem is outside the scope of
> my fix, but it does however fix the case where the user initiates the
> reboot.

That's just papering over bugs.

> > So the solution here is to fix your hardware ;-)
> 
> Easier said than done.  In many circumstances, hardware fixes like the
> one you suggest are outside the control of the developer and/or incur
> additional board and part costs.

Again, this doesn't justify papering over bugs. It's a plain and simple hardware 
bug.

> In my opinion, the real fix for this issue is in the Freescale boot
> ROM, which should do a soft reset of the SPI NOR prior to any reads.
> Unfortunately it doesn't do this, and can't be changed except by
> Freescale.

In case the SPI NOR is completely stuck, the only way to bring it into defined 
state is to power-cycle it or toggle it's reset pin. Software reset would again 
be just a plaster as the SPI NOR might ignore it.

> > btw this is a common issue, we should really document this before more
> > people get hurt.
> 
> What you are effectively saying is that you simply can't and shouldn't
> use this part with a i.MX6.

Does MX6 not have an Reset Out ? I recall it does have one.

> But why not implement the fix if the
> following are true?
> 
> - It's as you say, a common issue.
> - A hardware fix may be outside the developers control or parts are
> fielded. - The fix simply puts the part in a consistent state on
> reboot/shutdown and seems reasonable.

Because this just hides the bug ; the real solution is to make hardware which 
has correct reset routing, the software in this case cannot solve the problem.

Best regards,
Marek Vasut
