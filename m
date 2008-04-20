Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JndMH-0003oq-4y
	for linux-mtd@lists.infradead.org; Sun, 20 Apr 2008 17:29:45 +0000
Date: Sun, 20 Apr 2008 18:29:37 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [U-Boot-Users] ubi and u-boot
Message-ID: <20080420172937.GA16184@shareable.org>
References: <4808AE6F.4030505@largestprime.net>
	<1208536808.6654.6.camel@vader.jdub.homelinux.org>
	<20080418165957.GG31520@shareable.org>
	<1208546341.6654.8.camel@vader.jdub.homelinux.org>
	<20080420160413.GC14268@shareable.org>
	<1208709853.6654.23.camel@vader.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208709853.6654.23.camel@vader.jdub.homelinux.org>
Cc: u-boot-users@lists.sourceforge.net,
	Bernard Blackham <bernard@largestprime.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> > Hamish Moffatt wrote (Message-ID: <20080407073227.GA6317@cloud.net.au>):
> > > Sorry I should've said 512MiB perhaps: 512 megabytes.
> > > UBI attach time appears to be about 6 seconds.
> > 
> > If 6 seconds is as fast as it can be done, annoying but fair enough.
> 
> You should read that thread a bit more carefully.  The scan time is
> highly dependent upon the NAND driver beneath UBI.  For example, a UBI
> scan/attach on a 1GiB device on OLPC was 2 seconds.

Ah, I intended to quote the 2 seconds too but forgot, sorry.  I think
2 seconds per gigabyte is a significant time, too, but not so much.

The followup suggested it was due to the speed of the chip, not so
much the driver.

> > Adding _another_ 6 seconds to the boot time seems a lot to me.
> 
> You mean adding another "X amount of time depending on factors outside
> of UBI's control."

Well, yes, that would be a reason to consider whether doing it is a
good idea :-)

> > I can understand the hesitation, but I think 6 seconds just to find
> > the kernel - especially when doing a 'disk resume' - is quite a lot.
> 
> You should really stop quoting this 6 second number.

Let's call it 2 seconds per gigabyte, then.

> > Note that I haven't tried UBI myself yet.  I'm going on what has been
> > written to the list so far, as quoted above.
> 
> Maybe you should try it :).

I will when good looking figures are being quoted on the list ;-)

-- Jamie
