Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0DUT-0001jm-Ou
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 09:21:10 +0100
Subject: Re: [PATCH] CM-x2xx NAND flash support
From: Thomas Gleixner <tglx@linutronix.de>
To: Mike Rapoport <mike@compulab.co.il>
In-Reply-To: <44B36563.9050103@compulab.co.il>
References: <44AD06B5.7060708@compulab.co.il>
	<1152437179.24611.376.camel@localhost.localdomain>
	<44B36563.9050103@compulab.co.il>
Content-Type: text/plain
Date: Tue, 11 Jul 2006 10:23:53 +0200
Message-Id: <1152606233.32107.98.camel@localhost.localdomain>
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

On Tue, 2006-07-11 at 10:46 +0200, Mike Rapoport wrote:
> >>+       unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;
> >>    
> >>
> >
> >what the hell is this type cast for ?
> >
> >	void __iomem *nandaddr = 
> >  
> >
> you can't do |= and &= with void __iomem*

Err, why not ?

> >Can you please combine both drivers into one and make it a platform
> >device. There is no need to keep lots of duplicate functionality around.
> >
> I'm dropping cm-x255 support (management decision) so there's only one 
> platform that can use this driver. What's the point then?

Sorry man, you submitted _two_ drivers in the first place and I did the
review on those. I'm not good at witchcrafting the decisions of your
management.

	tglx
