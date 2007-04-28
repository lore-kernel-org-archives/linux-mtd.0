Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hhu1u-0006Pt-05
	for linux-mtd@lists.infradead.org; Sat, 28 Apr 2007 17:00:31 -0400
Subject: Re: [PATH] NAND Flash support for Intel IXP4xx platform
From: Thomas Gleixner <tglx@linutronix.de>
To: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
In-Reply-To: <46334F28.70506@ru.mvista.com>
References: <463332F9.9040105@ru.mvista.com>
	<1177763736.7646.149.camel@localhost.localdomain>
	<46334F28.70506@ru.mvista.com>
Content-Type: text/plain
Date: Sat, 28 Apr 2007 23:02:31 +0200
Message-Id: <1177794151.7646.312.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ruslan,

On Sat, 2007-04-28 at 17:42 +0400, Ruslan V. Sushko wrote:
> > How excatly is this functionally different from the generic write_buf
> > function in nand_base.c ?
> >
> This function should be removed. It was different for originally. ALE 
> and CLE signal assertion was herre, but I decide this functionality is 
> not necessary for data writing, so I've remove that, but forget to check 
> remainder with generic code.

I did a review and pointed this out. No need for lengthy explanaitions.
Just remove it.

> > Aside of that I agree with Lennert, that we really need to get around
> > and make this real platform code.
> >   
> Sorry don't understand
> Do you propose to move all these (especially hw_ctrl function) 
> functionality to platform/arch code?

That's what Lennert said. And I agree. Many of the drivers just differ
in the hardware control function and the pyhsical address where the
device is located.

We have already platform support for NAND:

See include/linux/mtd/nand.h:

struct platform_nand_chip / struct platform_nand_ctrl

As far as I can tell, there is everything covered what you need for a
generic platform driver.

Again. Lennert is right and another post of your driver does not change
anything unless you listen to his and my advise.

	tglx
