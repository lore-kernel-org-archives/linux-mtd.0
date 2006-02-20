Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBKII-0003iT-3L
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 18:18:15 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200602211140.30069.manningc2@actrix.gen.nz>
References: <43EB96DC.3030900@eptar.com>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
	<200602211140.30069.manningc2@actrix.gen.nz>
Content-Type: text/plain
Date: Tue, 21 Feb 2006 00:18:44 +0100
Message-Id: <1140477524.2480.827.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>, Vitaly Wool <vwool@ru.mvista.com>,
	linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-02-21 at 11:40 +1300, Charles Manning wrote:
> Just going for the lowest common denominator all the time is like saying "run 
> all serial links at 9600 and never use 115200 because 115200 might not be 
> supported on all possible serial links", or "you can't run an ftdi USB serial 
> port at 230k because most PC serial ports only go up to 115200".

Again, the comparison is still flawed. 

The worst serial device still guarantees a baudrate > 0 and the
effective baudrate has no impact on data storage size.

> The benefits of good clean interfaces are modularity. If you were to write a 
> nand driver from scratch that obeys the interface then you can use it with 
> mtdpart, mtdconcat, various fs etc. This is the major reason I don't like to 
> have oobinfo hanging through the interface.

I'm well aware of interface design, but I see no convincing argument not
to remove oob access at all. At least there is no in kernel user
essentially depending on it. Making JFFS2 oob independend is a no brain
patch.

> OK I got that wrong. I don't have the specs for the device you're looking at 
> so I can't see all the details.

Simply as I said. Standard NAND interface, no oob access. Well, I can
read the raw device (including OOB) for diagnostic purposes in a special
mode.

> > > I lose no sleep that it does not work with YAFFS.
> >
> > Wake up please. Thats going to be reality for NAND based stuff in the
> > future. The controllers will expose the raw FLASH but claim the OOB area
> > for their own purpose - hardware based error correction.
> 
> Yes that is so for a few parts like OneNAND etc as well as some modules. 
> However, there's still a lot of NAND out there that will provide OOB.

That's no reason to keep a dead thing alive. There are still a lot of
cars which need leaded fuel. I dont see any gas station providing it
within a 100km range.

> Perhaps opening up YAFFS to those people would be valuable. Would you like to 
> see YAFFS run on your non-oob board?

At least for a test.

> I guess it could also make YAFFS easier to use for NOR people. Currently NOR 
> folks have to do quite a bit of trickery. Enough people do this for me to 
> think this could be valuable.

:)

> However, if that happens I'd still like to be able to use OOB if it is there 
> (just like I want to be able to use 115200 if it is there) because OOB can 
> make a more efficient fs with page alignment etc.

Go back to top - and as you said before:
> > Already, many people replace nand_base.c for performance reasons.

Nobody is going to prevent this, so they can expose any interface they
want for their private performance gain. 

	tglx
