Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jnc1k-0001jv-OP
	for linux-mtd@lists.infradead.org; Sun, 20 Apr 2008 16:04:29 +0000
Date: Sun, 20 Apr 2008 17:04:14 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [U-Boot-Users] ubi and u-boot
Message-ID: <20080420160413.GC14268@shareable.org>
References: <4808AE6F.4030505@largestprime.net>
	<1208536808.6654.6.camel@vader.jdub.homelinux.org>
	<20080418165957.GG31520@shareable.org>
	<1208546341.6654.8.camel@vader.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208546341.6654.8.camel@vader.jdub.homelinux.org>
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
> > Is it even a good idea?  The UBI (version 1 :-) initial scan is not
> > fast for large flash, and if the bootloader does it too, that's twice
> > as much time to boot.
> 
> It's a good idea, yes.  Particularly if you want to boot from NAND
> flash.
> 
> Can you define "large device"?  It only scans the first 1 or 2 pages for
> each eraseblock to build up the volume tables.  That really isn't that
> slow...

I was thinking this:

Hamish Moffatt wrote (Message-ID: <20080407073227.GA6317@cloud.net.au>):
> Sorry I should've said 512MiB perhaps: 512 megabytes.
> UBI attach time appears to be about 6 seconds.

If 6 seconds is as fast as it can be done, annoying but fair enough.

Adding _another_ 6 seconds to the boot time seems a lot to me.

The only ways I see to improve the speed in general are:

   1. Partition the NAND into multiple independent UBIs, so the boot
      loader doesn't have the scan the whole chip, but that is
      obviously not so good for wear levelling.  (It's probably
      alright, though, if it's like the /boot partition on a standard
      Linux distro - not updated very often.)

   2. Change UBI's data structure so that the number of pages it needs
      to read is a sub-linear function of the number of erase blocks.
      I think this is what's meant by 'UBI 2'.

To remove the double scan:

> > However, if there was a protocol for bootloader to pass the scan
> > results to the booted kernel, that would be very nice.
> 
> Maybe.  I was never fully convinced of that.

I can understand the hesitation, but I think 6 seconds just to find
the kernel - especially when doing a 'disk resume' - is quite a lot.

Note that I haven't tried UBI myself yet.  I'm going on what has been
written to the list so far, as quoted above.

-- Jamie
