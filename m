Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D9fKA-0002nr-Ev
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 03:16:47 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: William J Beksi <wjbeksi@setabox.com>
In-Reply-To: <42310F21.5030405@setabox.com>
References: <4209C985.3020902@setabox.com>
	<1108969145.24721.419.camel@tglx.tec.linutronix.de>
	<42310F21.5030405@setabox.com>
Content-Type: text/plain
Date: Fri, 11 Mar 2005 09:16:39 +0100
Message-Id: <1110529000.29330.284.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] accessing NAND flash through an IDE interface
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-03-11 at 11:23 +0800, William J Beksi wrote:
> > As I said before, I'm not going to accept a change which needs to tweak
> > a source file to make use of it.
> 
> I was not aware of this. I have made all the changes as per your 
> suggestion and then you finally reject the patch, a little discouraging.

I did not intend to discourage you and I'm sorry if I did not express
myself clear enough. I guess my assumptions of what's obvious are wrong.

> Is there any other way let people choose between using readb/inb and 
> writeb/outb inside nand_base.c? 

Sure, more than one.
The simplest is to convert your #define into a CONFIG_OPTION with the
appropriate dependencies.

Another possibility is to make it runtime selectable via the nand
options. Also here it should be compile time dependend on CPU
architectures which have seperate I/O instructions.

> Or should I just create my own separate 
> patch to allow people to use the driver and make it available elsewhere?

Running away is not a solution. Stick your nose into LKML and watch how
patches are dissected several times before acceptance. Whats wrong with
that ? It's the way Open Source development works. 

tglx
