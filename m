Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12f9jw-0002Br-00
	for mtd-list@infradead.org; Wed, 12 Apr 2000 00:06:36 +0100
Received: from square.inter.net.il ([192.116.202.83])
	by infradead.org with smtp (Exim 3.03 #1)
	id 12f9jt-0002Bl-00
	for mtd@infradead.org; Wed, 12 Apr 2000 00:06:33 +0100
From: Udi Finkelstein <udif@bigfoot.com>
To: mtd@infradead.org
Subject: DOC2000 and Kernel 2.3 ??
Date: Wed, 12 Apr 2000 01:07:33 +0200
Message-ID: <f1c7fssr0pi4tvjhv4g10trhkqq28j0i6r@4ax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I'm new to this list (and to DiskOnChip 2000 in general).

I have an embedded linux system running with a 2.0.x based kernel and =
m-sys's
drivers.

I want to build a new 2.3 kernel based system with the following =
structure:

* /boot partition with a 2.3 Kernel containing
  a ramdisk based root file system (initrd).
* RAM disk contains a skeleton filesystem with
  99% of the files pointing to a CRAMFS (the
  2.3.x compressed ROM filesystem) based partition
  in the doc2000.
* Data is stored on a 3rd partition (e2fs ??).

Advantages:
1. All fixed data is compressed (kernel is compressed by nature, initrd
compressed by gzip, CRAMFS compressed by design).
2. RAM based root filesystem allows modifying anything in the system =
without
writing to the doc2000, preventing any corruption. Rebooting the system
returns it to a clean state.
3. Separate data partition is separate from the rest of the system and =
can be
easily reformatted without affecting system.

Now the big Question: What is the best (any) way to get a doc2000 working=
 with
the 2.3 kernel?

I see 3 possible options:

1. Hacking the original m-sys 2.2.x driver to work under 2.3.x. Is this
possible? How much of the binary only portion depends on the 2.2.x kernel=
 API?
Can it be adapted to 2.3.x by changing only the skeleton code around it?

2. Using the Axis JFFS code. Is it stable? does it work at all?

3. using the MTD FFS code. Does it finally work under 2.3.x?

thanks,
Udi


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
