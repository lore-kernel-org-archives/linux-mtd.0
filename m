Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JjgJ-0000fm-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 00:15:55 +0000
Date: Wed, 4 Dec 2002 21:00:51 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: Thomas Gleixner <tglx@linutronix.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: IF eraseall will destryed(phys) the nand flash ?
In-Reply-To: <200212041135.55747.tglx@linutronix.de>
Message-ID: <Pine.LNX.4.44.0212042057460.6509-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 4 Dec 2002, Thomas Gleixner wrote:

> On Tuesday 03 December 2002 23:46, shadow wrote:
> > On Wed, 4 Dec 2002, Thomas Gleixner wrote:
> > > > Another problem is why the new SMC has some bad blocks and occurred
> > > > at the same page with using eraseall program erase it.
> > >
> > > NAND FLASH can have factory marked bad blocks at shipping time. See
> > > datasheet. Bad block is bad block and does not go away by erasing it. In
> > > fact you _MUST NOT_ erase it, as bad block information is lost and
> >
> > 	I don't understand what is shipping time, your meaming is it was
> > destroyed at the shipping time between the factory to retailer ?
> Nope, the blocks were bad, when the chip was produced or do you believe that 
> the postman is a heavy source of gamma rays ? :)
> 

Thank your response,

Brian
