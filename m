Received: from mail.ss7-link.com ([209.204.106.218] helo=slink12.ss7-link.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 152IFg-0005Cs-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 May 2001 20:55:32 +0100
Message-ID: <F1BD619B2A58D41197990050DA2C08E40258E4@SLINK12>
From: Jan Rovins <Jan.Rovins@radisys.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, Steve Ferri <steve.ferri@radisys.com>
Subject: RE: MTD on a Motorola MPCN765 ? (32 bit linux and 64 bit flash) 
Date: Tue, 22 May 2001 15:59:40 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Have been thinking about your suggestion about treating flash as 
two entirely separate chip mappings. (Trying to understand all the
repercussions)
I guess that would mean:
setting up 2 map_info structs,
doing a cfi_probe on each one,
doing a add_mtd_device() on each one.

I was using partitions before, mostly to isolate & protect the boot image.
Can I have a setup that uses separately mapped devices and multiple
partitions
at the same time? (I am having trouble visualizing this)

Separate chip mappings also would imply that I would have to alter the
read(),
write() copy_to/from() functions to skip over the bytes that would show up
in the other mapping, since my address lines are wired up to treat the four
chips as one range.
is this what you had in mind by your suggestion?

Jan

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Monday, May 21, 2001 9:16 PM
To: Jan Rovins
Cc: linux-mtd@lists.infradead.org; Steve Ferri
Subject: Re: MTD on a Motorola MPCN765 ? (32 bit linux and 64 bit flash)




Jan.Rovins@radisys.com said:
> But the recommendations I was given assume I am running Linux in 64
> bit mode,  which I am not. My longs are still 32 bit,
>  and I can now read the flash through MTD, but can't yet form commands
> to write and erase the upper two 16 bit flash devices. (To access
> those upper two devices I would have to add 0x04 to the unlock1,&2
> addresses) When using interleaved chips, are the commands always given
> to the whole bank simultaneously? Could I fake a 64 bit write by doing
> two 32 bit writes? Basically I will be reading & writing flash as a 32
> bit machine would, but faking up 64 bit commands.  Would this work?

That should work.

But if you're doing that, why not just pretend that you have two entirely 
separate chip mappings, with two entirely independent pairs of 16-bit chips 
in them? Then you don't need to muck about with the 64-bit flash command 
stuff. You just need to be aware that your bootloader will probably then be 
split between the first erase block of each device. But that's easy enough 
to deal with.



--
dwmw2
