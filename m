Received: from web13603.mail.yahoo.com ([216.136.175.114])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15VQNv-0004bw-00
	for <linux-mtd@lists.infradead.org>; Sat, 11 Aug 2001 05:28:27 +0100
Message-ID: <20010811043417.4943.qmail@web13603.mail.yahoo.com>
Date: Fri, 10 Aug 2001 21:34:17 -0700 (PDT)
From: Luke <luke_epsilon@yahoo.com>
Subject: Am29LV065D woes???
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hello all,

I have just read through the MTD HOWTO and am trying
to figure out what everything means.  I am new to
flash and at work I was given a project to figure out
how to use flash in an embedded linux system.  The
system uses a Cyrix 486dx4 as the processor and has 4
banks of 8M of SDRAM (so 32 M total) and a Am29LV065D
flash chip.

The data sheet for this flash chip says it is CFI
compliant which sounds good as the main example in the
HOWTO is a CFI example.  Some other things that may be
relevant from the data sheet (like I said I am NEW to
this stuff):

Am29LV065D:
    - 64 Megabit (8M x 8-bit)
    - uniform sector flash memory
    - 128 64 Kbyte sectors
    - 8,388,608 = 0x800000 bytes total
    - data appears on DQ0 - DQ7

I built a kernel with the relevant pieces (nothing as
a module) and when I burn the kernel/initrd/linux
loader onto the flash (through a dongle connected on
the parallel cable and some flash burning utility that
amd has made) 

When I reboot I get a working linux system, mostly.  I
get the message about no CFI flash chip found.  I am
assumng that for one that I have entered the wrong
values when I was compiling the kernel.  When setting
the physical address mapping in the mtd section of the
kernel - what should the values be for this chip?  I
assume from the above info that the bus width is 8 bit
and the size is 0x800000 - but I am unsure what to put
down for an address to start.  Do I want this to point
to someplace on the chip not already used by the
kernel, initrd, linux loader, and the bios (which is
sitting in the last 256k region on the flash).

I want to be able to eventually mount the free space
on the flash and use it as I would use any other
mounted device.


Any help and suggestions would GREATLY be
appreciated!!!

Thanks,
Luke
 




__________________________________________________
Do You Yahoo!?
Send instant messages & get email alerts with Yahoo! Messenger.
http://im.yahoo.com/
