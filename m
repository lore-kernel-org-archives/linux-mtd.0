Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vi3G-0008Jk-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 17:35:46 +0100
Message-ID: <20011022094451.A31348@recycle.lbl.gov>
Date: Mon, 22 Oct 2001 09:44:51 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: MTD support for Intel E28F016S3 ?
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

The 28F016S3 is not listed in jedec_probe.c, so it won't work 
"out of the box".  The data sheet for the 28FxxxS3 family says
it's backward compatible with the 28F008SA, and Russell King put
that chip on the JEDEC list, so it should be safe to simply add
the new entries based on the device codes:
   I28F004S3:  0x00a7
   I28F008S3:  0x00a6
   I28F016S3:  0x00aa

 [ The following is a draft of an Intel.README file that I think
   belongs somewhere in the mtd tree.  Would someone please check,
   edit, and commit it. ]

Intel's Flash chips have slightly unusual numbering, they
repeatedly fool people into leaving off the most important
part.  Let's break one down:

   TE28F320B3BA110

TE  - Package
         E, TE - TSOP
         GT, GE, RC - BGA

28F - Product line designator - common to all Intel Flash products

320 - Device Density, with a flag for data bus width.
         004 -  4 Mbit, 8 bit bus     400 -   4 Mbit, 16 bit bus
         008 -  8 Mbit, 8 bit bus     800 -   8 Mbit, 16 bit bus
         016 - 16 Mbit, 8 bit bus     160 -  16 Mbit, 16 bit bus
                                      320 -  32 Mbit, 16 bit bus
                                      640 -  64 Mbit, 16 bit bus
                                      128 - 128 Mbit, 16 bit bus
      (all parts with 16 bit bus hardware can also function in an
      8 bit bus mode; the 8 bit bus parts only have 8 data pins)

B3  - Product Family, one of
         SA - 5 Volt FlashFile (not CFI compliant)
         S3 - 3 Volt FlashFile (not CFI compliant)
         B3 - 3 Volt Advanced Boot Block (not CFI compliant)
         C3 - 3 Volt Advanced+ Boot Block (CFI compliant)
         J5 - 5 Volt StrataFlash (CFI compliant?)
         J3 - 3 Volt StrataFlash (CFI compliant)
***THE PRODUCT FAMILY IS THE CRUCIAL PIECE FOR SOFTWARE SUPPORT***

B   - B3 and C3 product families have a B or T suffix to tell whether
      the small erase blocks are at the Bottom or Top of the address
      space.  Other families don't have a letter here.

A110 - Lithography code and access speed.  An issue for the hardware
       designer, but should not affect the software at all.

Within a Product Family, the parts are software and hardware compatible.
If you leave off the "B3" (or J3, etc.), however, people won't know what
you're talking about, both from a hardware and software perspective.

To see which non-CFI Intel chips are supposed to work with MTD, see
chips/jedec_probe.c.  If you run into an Intel chip not in that table,
you need to add its device identifier to the table, and verify that
it responds to the Intel Standard command set coded in cfi_cmdset_0001.c.

All CFI compliant chips (Intel or otherwise) should be detected by
cfi_probe.c, and work using cfi_cmdset_*.c.

One weird effect showed up using the 28F320B3B on a nanoEngine, where
the CFI detect code "found" the chip, although it is truly not CFI
compliant.  This is apparently a chip bug, and the workaround is to
use the JEDEC probe first, followed by the CFI detect code.  This
order is backwards from the official Intel policy on detection logic.

 [ end readme submission ]

"find drivers/mtd -type f | xargs grep -i 28f" points out several places
where Intel part numbers should be clarified:
  cfi_cmdset_0001.c
  devices/lart.c
  maps/dbox2-flash.c
  maps/elan-104nc.c
  maps/sbc_gxx.c

Hope this helps!

        - Larry
