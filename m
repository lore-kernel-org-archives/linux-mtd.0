Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11y1rC-0003ET-00
	for mtd-list@infradead.org; Tue, 14 Dec 1999 23:59:50 +0000
Received: from [216.211.97.50] (helo=gizmo.adis.on.ca ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11y1r8-0003EN-00
	for mtd@imladris.mvhi.com; Tue, 14 Dec 1999 23:59:47 +0000
Date: Tue, 14 Dec 1999 18:07:46 -0600 (CST)
From: Adi Linden <adi@adis.on.ca>
To: ralph stickley <ralph@datalux.com>
cc: "'linux-embedded@waste.org'" <linux-embedded@waste.org>,
        MTD <mtd@imladris.mvhi.com>
Subject: Re: Anyone embedding RH 6.1 / 2.2.12 ?
In-Reply-To: <3856A51A.FB60D73A@datalux.com>
Message-ID: <Pine.LNX.4.10.9912141724410.5711-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi,

> Got it!   Looks great ... Now what do I do ?:-)

Well, that depends :-) At this time I am working solely with ramdisks.
That is I format the flash with a DOS filesystem and use syslinux to boot
the kernel and an initrd. If you pass root=/dev/ram to the kernel it will
keep the initrd as the root filesystem.

An alternative to syslinux is to use plilo or lilo to boot the system from
a Linux partition/filesystem. I haven't been able to patch lilo for the
M-Systems driver. And lilo is harder to use than syslinux. Once syslinux
is installed it doesn't have to be run again. If I configured it to boot
the bzImage kernel and the ramdisk.img initrd it will do just that. The
kernel and ramdisk can be changed as long as the name stays the same.

Another version is to have an uncompressed filesystem on flash. Boot the
kernel and an initrd. The initrd copies the filesystem from flash to a
ramdisk and sets the root device to the newly created ramdisk. The nice
thing about this setup is you can mount the flash and make changes to it.
Those changes take effect upon reboot.

I also created a bootable CD version which loads a big ramdisk. This was
before I considered flash.

I've thought about mounting the flash read only and creating ramdisks for
/etc /dev and /var. However, since my filesystems are rather small I opted
for small flash devices and more physical ram. 

There is a directory that contains files ending in .tar and .list. These
are the compiled packages. I use mc to extract them. The mnt directory is
just a temporary mount point for building the filesystem. So untar
everything you need into the mnt directory. Start with
_base_filesystem.tar and _base_libs.tar. The remainder can be any order.
All the libs in _base_libs are required. If any other libs are required
they are part of the respective tar files (libproc is part of procps.tar,
etc). 

kernel-basic-net-doc.tar contains the kernel and modules. Since this
particular kernel is meant for a single floppy wireless router it contains
masquerading modules and drivers for the ne2000, pcnet32 and tulip cards.

Edit the folowing files:
etc/rc.sysinit  -->  executed by init and the section to mount
                     filesystems needs to be edited/added.
etc/config      -->  configuration for ethernet, etc. Very close
                     to the Redhat 6.1 stuff in /etc/sysconfig/
/etc/rcS.d	-->  script files executed in alphabethical order
                     by init upon entering runlevel 3
/etc/rcS.d/05modules  -->  insmod [module]

A couple of bugs to mention, /etc/rcS.d/05modules needs to be chmod 755.
And I trimmed /etc/termcap to aggressively. elvis doesn't work perfectly
and top only fills 1/2 screen. Works fine with a termcap copied over from
the Redhat 6.1 system but it's 111k.

I guess the philosophy behind this particular setup is a system that boots
into a ramdisk but doesn't have to gracefully shutdown. So there's only
one runlevel, runlevel 3. The scripts I create to start services only care
about starting the service. To be able to drop Redhat files from
/etc/rc.d/init.d into my etc/rcS.d all the scripts are called with start
as argument. There is nothing (yet) to stop services upon shutdown.

Now, ctrl-alt-delete, shutdown -h now and shutdown -r now work just fine.
I need to be able to telnet into a system an remotely reboot. Processes
are killed bu the rc.shutdown script with killall5 just as Redhat 6.1
does.

Hope this helps! 

> I have a shell script that erases/formats and loads files onto the DOC for
> booting (setup for plilo boot since we can't afford DOS for each of our
> units).  I'm converting this over to your directory structure - if you want a
> copy let me know - however, I'm a relative newbie to this stuff so it may not
> help..

Sure, I'd be interested. Is a DOS license required for a DOS formated
filesystem??? Never thought of that. Syslinux works from a FAT12 and FAT16
filesystem but it does not require and DOS files at all.

> Also, if you need any help with the documentation I'd be able to provide some
> time..our system needs to be documented also...

Right now this is what I am doing for fun in my spare time. I developed a
satellite router using a minimal Redhat 5.2 system. I just thought of
ideas to improve upon it and choose Redhat 6.1 as a development platform.

> BTW...any way to host this on a site thats available at >56K ?? (or parse out
> the standard files ?)

Well, the site is connected at 256k. Yup, I looked at the file size last
night. It's 16MB, I will split the source packages and compiled packages
into their own archive and update those only when compiled packages are
added. That should leave the actual collection of binaries, perhaps 1/3 of
the total size if not less...

Regards,
Adi



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
