Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11yFob-0003kW-00
	for mtd-list@infradead.org; Wed, 15 Dec 1999 14:54:05 +0000
Received: from stonewall.shenandoah.com ([204.111.72.3] helo=mail.datalux.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 11yFoX-0003kQ-00
	for mtd@imladris.mvhi.com; Wed, 15 Dec 1999 14:54:02 +0000
Message-ID: <3857ABA8.A6A1024B@datalux.com>
Date: Wed, 15 Dec 1999 09:54:33 -0500
From: ralph stickley <ralph@datalux.com>
MIME-Version: 1.0
To: Adi Linden <adi@adis.on.ca>, Embedded <linux-embedded@waste.org>
CC: MTD <mtd@imladris.mvhi.com>
Subject: Re: Anyone embedding RH 6.1 / 2.2.12 ?
References: <Pine.LNX.4.10.9912141724410.5711-100000@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Adi Linden wrote:
<snip>

> I also created a bootable CD version which loads a big ramdisk. This was
> before I considered flash.
>
> I've thought about mounting the flash read only and creating ramdisks for
> /etc /dev and /var. However, since my filesystems are rather small I opted
> for small flash devices and more physical ram.
>

Yes, we will need to use the flash read-only.  I can make another partition (or
two) to use for storing user data.  If the software only writes to one partition,
then only that partition can be damaged during power down.   By alternating
partitions, only the last changes are lost. Have the application save it twice and
then you have it (That's my solution for the power down problem ).

>
> There is a directory that contains files ending in .tar and .list. These
> are the compiled packages. I use mc to extract them. The mnt directory is
> just a temporary mount point for building the filesystem. So untar
> everything you need into the mnt directory. Start with
> _base_filesystem.tar and _base_libs.tar. The remainder can be any order.
> All the libs in _base_libs are required. If any other libs are required
> they are part of the respective tar files (libproc is part of procps.tar,
> etc).

I'd like to make a configuration utility like "make menuconfig", but since I only
need one configuration, that may be considered a waste of Co. time :-)  I should
finish my V0.0 shell script today...

>
> I guess the philosophy behind this particular setup is a system that boots
> into a ramdisk but doesn't have to gracefully shutdown. So there's only
> one runlevel, runlevel 3. The scripts I create to start services only care
> about starting the service. To be able to drop Redhat files from
> /etc/rc.d/init.d into my etc/rcS.d all the scripts are called with start
> as argument. There is nothing (yet) to stop services upon shutdown.
>

Hmmm...I'll need to get run level 5 in also, since we need to run X (but thats
another task, after I see this thing boot ).

AFAIK shutdown is not needed if your running from ram disk.  Any software running
on the system
should force the writes to be completed when the user is saving something.  (Isn't
there a kernel flag or configuration file somewhere to force writes to happen
right away ?? I think QNX had that ...Hmmm...)

I like the idea of sharing files from a desktop to the embedded system...Thats got
to be the easiest way to debug the setup (especially when you don't have a floppy
disk on the embedded system (it is fun to use hard disks like floppies - 9 hard
drives sitting on my desk as I write <:-;).

>
> Sure, I'd be interested. Is a DOS license required for a DOS formated
> filesystem??? Never thought of that. Syslinux works from a FAT12 and FAT16
> filesystem but it does not require and DOS files at all.
>

Well, Duh....My mistake...I never knew...I was under the impression that there
were DOS files involved: command.com calling config.sys or something.  Hey, that
means I can leave the lilo (and especially plilo) in the trash - Whoopee Yeah Ra
Ra !!


>
> > Also, if you need any help with the documentation I'd be able to provide some
> > time..our system needs to be documented also...
>
> Right now this is what I am doing for fun in my spare time. I developed a
> satellite router using a minimal Redhat 5.2 system. I just thought of
> ideas to improve upon it and choose Redhat 6.1 as a development platform.
>

Spare time ?? whats that, please explain :-)

>
> > BTW...any way to host this on a site thats available at >56K ?? (or parse out
> > the standard files ?)
>
> Well, the site is connected at 256k. Yup, I looked at the file size last
> night. It's 16MB, I will split the source packages and compiled packages
> into their own archive and update those only when compiled packages are
> added. That should leave the actual collection of binaries, perhaps 1/3 of
> the total size if not less...
>

I'm thinking your connection is getting limited - best I could get on 3 different
downloads was about 2.8Kbps...maybe 56K is your upload speed ? Hmmmmm.... Well, if
you split it up, this won't be a problem...

Thanks again for your work on this project!

Ralph

Oops - Sorry about the double mailing ... my address book "First Name" and "email
address" were the same.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
