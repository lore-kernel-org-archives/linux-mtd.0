Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aHuC-0000MF-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 13:53:36 +0000
Message-ID: <30724FF712DFD2119E6200104B2448920119745E@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: 'Robert Kaiser ' <rob@sysgo.de>, 'David Woodhouse '
	 <dwmw2@infradead.org>
Cc: "'mtd@infradead.org '" <mtd@infradead.org>
Subject: RE: Using mtdblock as root device
Date: Tue, 6 Mar 2001 07:49:16 -0600 
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>Now my question is: is there any particular reason (other than "nobody
>has told Linus") why this is not already in the standard kernel ?


because it's easier to do a
$rdev <your kernel image here> /dev/mtdblock0 before installing
the kernel with lilo. You don't need to pass any root kernel
line parameters then.

You can even boot a compressed root file system this way by
passing the bit LOAD_RAMDISK=1, the RAMDISK_OFFSET=<your offset in
1k from the start of your root device>. See the bootdisk
howto.

Additionally, You have to go and hack the rd.c code in drivers/block/rc.c to
remove the check to see that the boot device for compressed f/s
is a floppy.

As one additional matter you have to add a call to rd_load() just
before mount_root() in init/main.c so that the ramdisk loading code
runs *after* the mtdblock device has been registered.

Go back in the archives a few weeks. There was quite a bit
discussion re. this matter. I've found all these problems before :)

There's quite a big update to the HOWTO pending that I'll commit
as soon as I get some time (that includes all this stuff and
some corrections). There is a bigger power fail issue
in jffs1 that's hogging all my time right now.

Vipin


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
