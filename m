Received: from serverd.sea.theriver.com ([216.39.128.34])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 173nzf-00065B-00
	for <linux-mtd@lists.infradead.org>; Sat, 04 May 2002 02:05:47 +0100
Date: Fri, 3 May 2002 18:05:11 -0700 (PDT)
From: Paul <paul@oz.net>
To: linux-mtd@lists.infradead.org
Subject: Advice sought: new SmartMedia driver
Message-ID: <Pine.LNX.4.44.0205031647020.8561-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I'm currently writing a driver for a PCI SmartMedia controller chip,
which I would like to have merged with the MTD CVS when it becomes
usable.  Unfortunatley I don't have full chip specs, so I'm somewhat
fumbling in the dark.  I used autcpu12.c and spia.c as a starting point,
added some PCI initialization, supplied my own nand_cmd() (more on this 
later), etc.  When I install the kernel module, I get:

May  2 23:44:54 coho kernel: SM controller found, base address 0xfcee6fe0
May  2 23:44:54 coho kernel: PCI: Found IRQ 11 for device 02:09.0
May  2 23:44:54 coho kernel: PCI: Sharing IRQ 11 with 00:1f.6
May  2 23:44:54 coho kernel: PCI: Sharing IRQ 11 with 02:07.0
May  2 23:44:54 coho kernel: PCI: Sharing IRQ 11 with 02:0d.1
May  2 23:44:54 coho kernel: NAND device: Manufacture ID: 0xec, Chip ID: 0xe6 (Samsung KM29U64000)
May  2 23:44:54 coho kernel: Creating 1 MTD partitions on "Samsung KM29U64000":
May  2 23:44:55 coho kernel: 0x00000000-0x00800000 : "flash partition 1"
May  2 23:44:55 coho kernel: mtd: Giving out device 0 to flash partition 1

Now I can read the contents of the SmartMedia card using
"dd if=/dev/mtd0 of=foo", or by using the nanddump utility.
So far so good.  But I have run into some problems and would
like some advice.

[1] The NAND routine nand_scan(), called during module initialization,
    seems to assume that a Flash memory device is always present.  If not,
    nand_scan() quits and unloads the kernel module.  I have a SmartMedia
    slot where the SmartMedia memory card may or may not be present at a
    given time, and may be yanked in/out at any time.  How can I best 
    handle this "hot plug" situation without disrupting much of the
    existing MTD code?

[2] I had to supply my own nand_cmd() via "this->cmdfunc" because I don't 
    have direct control of the ALE/CLE/NCE lines, and I don't know
    precisely how to control those lines through the controller chip.
    Also, I found that I needed to insert a 1ms delay (udelay(1000))
    after resetting the Flash memory chip; otherwise subsequent operations
    (e.g. reading the Flash chip ID) didn't seem to work.  Could this be
    because the other NAND drivers are for embedded systems with 
    presumably slower processors than my 850MHz PIII laptop?  Is a 
    1ms delay out of spec for NAND Flash?  I'd like to avoid large
    delays and I'd like to use the existing nand_cmd() in nand.c as much
    as possible (to prevent maintenance headaches down the road).

[3] One of the things I'd like to do is to be able to read photos
    taken on my digital camera, which uses SmartMedia and a FAT12-like
    filesystem like many other cameras & MP3 players.  However, I'd
    like to avoid writing a FAT12 Translation Layer for MTD, if possible.
    Currently, the SmartMedia image isn't recognized as any FAT filesystem:

    # dd if=/dev/mtd0 of=8MB
    # mount -o loop -t msdos 8MB /mnt/tmp
    mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       or too many mounted file systems

    # fdisk /dev/mtdblock0
    Device contains neither a valid DOS partition table, ...

    Indeed the SmartMedia image (the "8MB" file) looks very different
    from a FAT12 filesystem created by "mkdosfs -F 12".

    _BUT_ people have reported success automatically mounting SmartMedia
    cards using USB SmartMedia readers.  For example, they use the
    sddr09 USB storage module plus the SCSI emulation layer, and are
    able to automagically mount SmartMedia cards.  I would like to
    leverage this existing functionality if possible, but the sddr09.c
    driver doesn't seem to grok FAT12, so I don't understand where the 
    "magic" (i.e. translating the strange FAT12 to a FAT or VFAT) is
    taking place ... the SCSI emulation layer?

Any advice and pointers would be greatly appreciated.
Cheers,

-- Paul
