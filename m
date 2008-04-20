Received: from py-out-1112.google.com ([64.233.166.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JnceK-0006M0-AJ
	for linux-mtd@lists.infradead.org; Sun, 20 Apr 2008 16:44:20 +0000
Received: by py-out-1112.google.com with SMTP id a73so1872341pye.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Apr 2008 09:44:18 -0700 (PDT)
Subject: Re: [U-Boot-Users] ubi and u-boot
From: Josh Boyer <jwboyer@gmail.com>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20080420160413.GC14268@shareable.org>
References: <4808AE6F.4030505@largestprime.net>
	<1208536808.6654.6.camel@vader.jdub.homelinux.org>
	<20080418165957.GG31520@shareable.org>
	<1208546341.6654.8.camel@vader.jdub.homelinux.org>
	<20080420160413.GC14268@shareable.org>
Content-Type: text/plain
Date: Sun, 20 Apr 2008 11:44:13 -0500
Message-Id: <1208709853.6654.23.camel@vader.jdub.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sun, 2008-04-20 at 17:04 +0100, Jamie Lokier wrote:
> Josh Boyer wrote:
> > > Is it even a good idea?  The UBI (version 1 :-) initial scan is not
> > > fast for large flash, and if the bootloader does it too, that's twice
> > > as much time to boot.
> > 
> > It's a good idea, yes.  Particularly if you want to boot from NAND
> > flash.
> > 
> > Can you define "large device"?  It only scans the first 1 or 2 pages for
> > each eraseblock to build up the volume tables.  That really isn't that
> > slow...
> 
> I was thinking this:
> 
> Hamish Moffatt wrote (Message-ID: <20080407073227.GA6317@cloud.net.au>):
> > Sorry I should've said 512MiB perhaps: 512 megabytes.
> > UBI attach time appears to be about 6 seconds.
> 
> If 6 seconds is as fast as it can be done, annoying but fair enough.

You should read that thread a bit more carefully.  The scan time is
highly dependent upon the NAND driver beneath UBI.  For example, a UBI
scan/attach on a 1GiB device on OLPC was 2 seconds.

> 
> Adding _another_ 6 seconds to the boot time seems a lot to me.

You mean adding another "X amount of time depending on factors outside
of UBI's control."

> The only ways I see to improve the speed in general are:
> 
>    1. Partition the NAND into multiple independent UBIs, so the boot
>       loader doesn't have the scan the whole chip, but that is
>       obviously not so good for wear levelling.  (It's probably
>       alright, though, if it's like the /boot partition on a standard
>       Linux distro - not updated very often.)
> 
>    2. Change UBI's data structure so that the number of pages it needs
>       to read is a sub-linear function of the number of erase blocks.
>       I think this is what's meant by 'UBI 2'.
> 
> To remove the double scan:
> 
> > > However, if there was a protocol for bootloader to pass the scan
> > > results to the booted kernel, that would be very nice.
> > 
> > Maybe.  I was never fully convinced of that.
> 
> I can understand the hesitation, but I think 6 seconds just to find
> the kernel - especially when doing a 'disk resume' - is quite a lot.

You should really stop quoting this 6 second number.

Anyway, passing the scan results from a bootloader becomes very
involved.  You have to store it somewhere, probably preserving a section
of DRAM, which isn't always easy.

> Note that I haven't tried UBI myself yet.  I'm going on what has been
> written to the list so far, as quoted above.

Maybe you should try it :).

josh
