Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11yH8x-0003p4-00
	for mtd-list@infradead.org; Wed, 15 Dec 1999 16:19:11 +0000
Received: from [216.211.97.50] (helo=gizmo.adis.on.ca ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11yH8s-0003ox-00
	for mtd@imladris.mvhi.com; Wed, 15 Dec 1999 16:19:08 +0000
Date: Wed, 15 Dec 1999 10:27:12 -0600 (CST)
From: Adi Linden <adi@adis.on.ca>
To: ralph stickley <ralph@datalux.com>
cc: Embedded <linux-embedded@waste.org>, MTD <mtd@imladris.mvhi.com>
Subject: Re: Anyone embedding RH 6.1 / 2.2.12 ?
In-Reply-To: <3857ABA8.A6A1024B@datalux.com>
Message-ID: <Pine.LNX.4.10.9912151000340.6229-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi,

> Yes, we will need to use the flash read-only.  I can make another partition (or
> two) to use for storing user data.  If the software only writes to one partition,
> then only that partition can be damaged during power down.   By alternating
> partitions, only the last changes are lost. Have the application save it twice and
> then you have it (That's my solution for the power down problem ).

That's a neat idea. How do you detect error in writing? Use fsck on boot?
So far I haven't had any user data to save. The emphasis has been on
building an appliance type deal where you ask the user if the lights are
on and if they're not on unplug the power to reset. However, even for
dhcp it would be nice to save the dhcp.leases file...

> I'd like to make a configuration utility like "make menuconfig", but since I only
> need one configuration, that may be considered a waste of Co. time :-)  I should
> finish my V0.0 shell script today...

I created the *.list files with the idea of eventually creating a script
that parses a file containing the *.tar files to use to build the system.
Then it might be possible to use the *.list files to tag files that should
be deleted from the system if they're not needed. A menu type system would
be nice... :-) but I am not fluent in C, doing a lot of shell and perl
programming. I opted to to this embedded project and learn about CISCO
router admin instead of learning C... 

> Hmmm...I'll need to get run level 5 in also, since we need to run X (but thats
> another task, after I see this thing boot ).

I haven't tackled X yet. I am still looking for an inexpensive embedded
platform with a LCD touch screen for an Internet kiosk. So far US$2300.00
was the bottom line I found...

> AFAIK shutdown is not needed if your running from ram disk.  Any software running

I need to be able to telnet into the box and force a reboot.

> on the system
> should force the writes to be completed when the user is saving something.  (Isn't
> there a kernel flag or configuration file somewhere to force writes to happen
> right away ?? I think QNX had that ...Hmmm...)

There are mount options that force immediate writes. Would it be sync?

> I like the idea of sharing files from a desktop to the embedded system...Thats got
> to be the easiest way to debug the setup (especially when you don't have a floppy
> disk on the embedded system (it is fun to use hard disks like floppies - 9 hard
> drives sitting on my desk as I write <:-;).

I almost had to build a remote boot system using bootroms for my employer.
The idea got scrapped. The embedded platform I use has a build in bootrom.
I'd love to use it to have a full system mounted nfs to do development,
install software on the doc, etc... I alread spend significant time
researching the remote boot thing, unfortunatley my research was centered
on Windows clients booting from a Linux server.

> Well, Duh....My mistake...I never knew...I was under the impression that there
> were DOS files involved: command.com calling config.sys or something.  Hey, that
> means I can leave the lilo (and especially plilo) in the trash - Whoopee Yeah Ra
> Ra !!

Just found a problem, though. Didn't compile MS-DOS filesystem support in
the kernel. I tried the driver using using an ext2 formated doc... Got to
fix that. 

> Spare time ?? whats that, please explain :-)

Hey, after working 30 hours a day and 10 days a week there's still time
left in the day ;-)

> I'm thinking your connection is getting limited - best I could get on 3 different
> downloads was about 2.8Kbps...maybe 56K is your upload speed ? Hmmmmm.... Well, if
> you split it up, this won't be a problem...

RAD modems on 2 pairs of wires, 256k in and 256k out... I wonder, I am far
up in the boonies. Perhaps I could mirror on xoom.com or something like
that. I am rearranging my site bit that should make mirroring possible.

TTYL,
Adi




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
