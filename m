Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ko1f-0006az-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2002 16:49:36 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Henrik Nordstrom <hno@marasystems.com>
To: mateo@posta.star.si, leland@sway.org
Subject: Re: 48meg DOC
Date: Fri, 30 Aug 2002 17:49:24 +0200
Cc: linux-mtd@lists.infradead.org
References: <20020830140409.A7B5B11DE6@sitemail.everyone.net>
In-Reply-To: <20020830140409.A7B5B11DE6@sitemail.everyone.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208301749.24444.hno@marasystems.com>
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

Have been playing with a 24megs DOC2000 lately, and soon gave up on the stock 
Linux drivers. Haven't had time to test the CVS version of the MTD drivers 
yet.

What I have ended up doing for the time beeing until I have more time is the 
simplest possible path.. M-Systems 5.1.2 firmware, a single DOS partition 
covering the whole DOC drive, and a normal GRUB as boot loader loaded in the 
normal manners via MBR (not the DOC enabled GRUB firmware).

GRUB loads the kernel and a compressed romfs root image from the DOS partition 
and starts the system. To access the DOC from within Linux for configuration 
data storage and upgrades the 5.0.0 Linux driver from M-Systems is used.

My final goal is to be able to partition the DOC in five pieces and to not 
having to depend on binary only drivers (is a hassle to have to use a initrd 
to be able to boot)..  1 binary flash partition for boot loader (GRUB), plus 
4 partitions for system (ro) and configuration (rw), two of each.

Boot area (GRUB in the binary flash partition)

System image (RO while running, compressed)

Primary configuration database (RW)

+ secondary system image and configuration database.

The configuration databases should preferably be journaled and flash friendly, 
but the write frequency is very low with small amounts of data so it is not 
critical.

But I have not yet figured out how to do this in a stable manner. GRUB does 
not like my DOC chips complaining about a UnitSizeFactor parameter in the 
NFTL header (perhaps because of them being formatted by the new firmware? I 
do not know. Was not aware there was firmware related problems), and if I 
partition the DOC in more than one partition using fdisk then it seems the 
M-Systems firmware craps out and I get all kinds of wierd results and the 
system cannot be booted from DOC. (once booted however it seems to be fine 
when accessed using the 5.0.0 version Linux driver, but I have occationally 
lost the flash disk partition when playing with this so I am not sure...)


> I am not sure, what is map installer?

The LILO map installer is /sbin/lilo. This creates the boot map in /boot/map. 
The boot map contains the block numbers of /boot/boot.b and your kernels or 
initrd images.

Regards
Henrik
