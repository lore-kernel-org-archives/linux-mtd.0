From: David Woodhouse <dwmw2@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce050112092246ae9277@mail.gmail.com>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<20050112170256.GF25638@wohnheim.fh-wedel.de>
	<6934efce050112092246ae9277@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 12 Jan 2005 17:34:53 +0000
Message-Id: <1105551293.26551.133.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 09:22 -0800, Jared Hulbert wrote:
> Think of the flow of data to start executing an application from
> JFFS2.  We copy the data 3 times in RAM? decompress it, CRC it. 

We ought to be decompressing directly from flash to RAM. It takes 0.5x
flash, and 1x RAM. And the RAM usage is dynamic -- you can throw the
page away if memory is tight, and read it back again later.

>  Compare that to mmap() in XIP cramfs.  It just points to the flash
> address.

And takes twice the amount of flash. Yes, it uses less RAM, but I don't
see how it can reduce the ROM cost. 

I haven't seen a decent analysis of the real-life cost of startup -- the
CELF numbers at OLS included decompression of the kernel in their
startup timings.

-- 
dwmw2
