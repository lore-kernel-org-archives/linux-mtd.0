Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Qa52-0002TZ-00
	for mtd-list@infradead.org; Wed, 07 Feb 2001 19:16:40 +0000
Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Qa51-0002TT-00
	for mtd@infradead.org; Wed, 07 Feb 2001 19:16:39 +0000
Message-ID: <3A81A520.6D15C445@danielind.com>
Date: Wed, 07 Feb 2001 13:42:24 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>
CC: jffs-dev <jffs-dev@axis.com>
Subject: AMD Elan SC520 development board linux 2.4.x boot problem
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi all,

There may be folks using the AMD SC520 processor (and their development
board from AMD) or thinking of using it. Thought that I would share some
issues I had with it trying to setup MTD  w/ JFFS on it. It may save
someone hours of debugging.

The CDP (Customer Development Platform -as AMD calls it), boots all the
2.2.x kernels fine. It will NOT boot the 2.4.1 kernel out of the box. It
just hangs after printing "Uncompressing Linux....Ok, Now booting the
Kernel".

Upon further investigation (which involved downloading, building and
trying  about 12 previous kernels) and endless hours of digging through
asm code, I've found the following:

Booting broke going from 2.3.22 to 2.3.23.

The problems seems to be in the e820 bios reported memory map. Any
kernel after 2.3.22 just hangs trying to map the memory reported by the
general software BIOS on the board.
One "easy" way to bypass this is to tell the kernel how much memory the
system has- with the "mem=<your memory size here>M" option. The kernel
then just ignores the e820 memory map and goes with what you tell it.

Another way (if you cannot pass kernel boot time options because of some
special way you'r booting the kernel) is to hack the
arch/i386/kernel/setup.c file to only loop thrice in reading the e820
memory may, while trying to map that memory.

The system just boots fine after that.

Hope that helps someone out there.

Now on to the (more ?) difficult task of trying to setup mtd and jffs on
the system :)

Vipin Malik
Daniel Industries
Houston, TX.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
