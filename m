Received: from moutvdom.kundenserver.de ([212.227.126.249]
	helo=moutvdomng.kundenserver.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DeBzd-0001GA-K8
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 09:13:47 -0400
Received: from [212.227.126.221] (helo=mrvdomng.kundenserver.de)
	by moutvdomng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1DeBzb-0001uL-00
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 15:13:43 +0200
Received: from [84.154.104.163] (helo=[192.168.1.10])
	by mrvdomng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1DeBzb-0006ix-00
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 15:13:43 +0200
Message-ID: <42A05775.3010102@anagramm.de>
Date: Fri, 03 Jun 2005 15:13:25 +0200
From: Clemens Koller <clemens.koller@anagramm.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: MTD for FPGA framegrabber
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

Okay, after some more reading and testing, I try to get an overview
of what I am doing :-) I still have some questions which are unclear
in the little documentation I've found... see below.

Well, my goal is to use an MTD to access my SRAM in my FPGA at
0xfc000000, size=0x100000 (1MByte) with direct read and write
operations (and DMA later on). All that should happen on the
Local Bus Controller on an MPC8540 embedded PowerPC CPU.
The goal is to get direct io / bulk data transfers via DMA as
fast as possible. (It looks like I need MTD_WRITEB_WRITEABLE)

Currently, all my stuff is compiled as modules to be able to play
around with all that things.
First, I wrote a little module which sets my Local Bus Windows
to generate the right chipselects and timings... which seems to
work fine.

Then I tried to start the MTD stuff:
# modprobe mtdchar
	loads mtdcore also... okay!
# modprobe map_rom
	loads chipreg also... okay!
# modprobe physmap
	probes my SRAM area via map_rom and adds mtd_to mtdcore, so I get
	two devices: /dev/mtd/0 and /dev/mtd/0ro

Okay, I'm wondering why do I get the 0ro device, too?

Now I can read from 0 and 0ro and I get data read from my SRAM.
But I cannot write to that area.

Okay, I've tried to use mtd_ram instead of mtd_rom, but then I cannot
load physmap:
FATAL: Error inserting physmap (/lib/modules/2.6.11.11/kernel/drivers/mtd/maps/physmap.ko): No such device or address

Hmm... okay, if I look into physmap.c it seems like as it won't use the
mtd_ram probe for my SRAM:

First line of static int __init init_physmap(void):
	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };

Is that correct?
Can I just use map_ram instead of the others and do I then end up
with a r/w device? Or do I need more?


I also thought about a mixture of the mtdram and physmap driver?
Well, I've had a look at the latest CVS and realized that there
are plenty of drivers available. But do I need to write one of my
own or can I just recycle some other code?
Can you give me a good starting point in the sources?

Maybe some of you can just give me some raw directions or
correct me if I am at the wrong trail with my plans above?!.

Thanks in advance,
best greets,

Clemens Koller
_______________________________
R&D Imaging Devices
Anagramm GmbH
Rupert-Mayer-Str. 45/1
81379 Muenchen
Germany

http://www.anagramm.de
Phone: +49-89-741518-50
Fax: +49-89-741518-19
