Received: from idiom.com ([216.240.32.1] ident=espin)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16H6A1-0007N9-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2001 16:35:09 +0000
Received: (from espin@localhost)
	by idiom.com (8.9.3/8.9.3) id IAA13814
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2001 08:45:53 -0800 (PST)
Date: Thu, 20 Dec 2001 08:45:53 -0800
From: Geoffrey Espin <espin@idiom.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: erase regions in partitions?
Message-ID: <20011220084552.A87794@idiom.com>
Mime-Version: 1.0
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

When I create a partition I don't seem to inherit the erase
regions from the underlying device.  In my case, I have an
"amd_flash_x4" (hacked for non-CFI AMD29LV800BB 4-way interleave),
which works fine using physmap.

Korva-Markham PCI 32MB @66MHz
CPU revision is: 00000c70
...
Linux version 2.4.16-mips (espin@espin.necel.com) (gcc version 2.96 20000731 (R1
...
physmap flash device: 400000 at bfc00000
probing amd_flash_x4
Physically mapped flash: Probing for AMD compatible flash
Physically mapped flash: Found 1 x 4MiB AMD AM29LV800BT (x4) at 0x0
Korva Flash: Probing for AMD compatible flash
Korva Flash: Found 1 x 4MiB AMD AM29LV800BT (x4) at 0x0
Creating 2 MTD partitions on "Korva Flash":
0x00000000-0x00200000 : "bootstrap and kernel"
0x00200000-0x00400000 : "filesystem"
...

But when I create my own partition layer, viz.:

    static struct mtd_partition korva_partitions[] = {
	    {
		    name: "bootstrap and kernel",
		    size: WINDOW_SIZE / 2,  /* 2M */
		    offset: 0,
	    },{
		    name: "filesystem",
		    size: MTDPART_SIZ_FULL, /* 2M */
		    offset: MTDPART_OFS_APPEND,
	    }
    };
    ...
    mymtd = do_map_probe("amd_flash_x4", &korva_map);

I get:

# cat /proc/mtd                                                                 
    dev:    size   erasesize  name
    mtd0: 00400000 00040000 "Physically mapped flash"  <<-- overlays mtd1&2
    mtd1: 00200000 00040000 "bootstrap and kernel"
    mtd2: 00200000 00040000 "filesystem"

# einfo /dev/mtd/0                      
    Device /dev/mtd/0 has 4 erase regions
    Region 0 is at 0x0 with size 0x40000 and has 0xf blocks
    Region 1 is at 0x3c0000 with size 0x20000 and has 0x1 blocks
    Region 2 is at 0x3e0000 with size 0x8000 and has 0x2 blocks
    Region 3 is at 0x3f0000 with size 0x10000 and has 0x1 blocks
# einfo /dev/mtd/1
    Device /dev/mtd/1 has 0 erase regions
# einfo /dev/mtd/2
    Device /dev/mtd/2 has 0 erase regions

Is this correct for /dev/mtd/1 & for /dev/mtd/2?
I can lay down a JFFS filesystem by:

    # mtd_debug erase /dev/mtd/0 0x200000 0x200000  #(erase 2M starting at 2M)
    # cp jffs.image /dev/mtd/2
    # mount -t jffs /dev/mtdblock/2 /mnt

And all seems well.  It just seems funky to not be able
to erase /dev/mtd/2 (or any of the non-zero, mtd devices).
Originally, I didn't include physmap... then I had no way to
erase the parts!

I also discovered that JFFS steals 1M of my 2M flash!  Yes, I
know I'm stuck with 256K erase size.  I picked JFFS1 over JFFS2
because JFFS2 was up front about needed 5 * erase size (1.25M)
for its overhead.

Geoff
-- 
Geoffrey Espin
espin@idiom.com
