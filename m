Received: from smtp-out5.atlngahp.sys.nuvox.net ([70.43.63.23]
	helo=smtp05.atlngahp.sys.nuvox.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jrca7-0003ac-45
	for linux-mtd@lists.infradead.org; Thu, 01 May 2008 17:28:31 +0000
Received: from webmail.nuvox.net (webmail.nuvox.net [64.89.70.59])
	by smtp05.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m41HSMJ7015756
	for <linux-mtd@lists.infradead.org>; Thu, 1 May 2008 13:28:22 -0400
Message-ID: <34025.137.237.242.42.1209662902.squirrel@webmail.nuvox.net>
Date: Thu, 1 May 2008 13:28:22 -0400 (EDT)
Subject: Strange faults using Intel P33 flash
From: jkimble@one.net
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Yes it's an old 2.6.10 kernel but it's CFI NOR flash. Shouldn't it work
with mtd circa 2.6.10?

The flash memory I am using is the Intel P33 (256P33B) NOR flash. I
have two chips with the chip selects tied to the same logic line. The
chips are on the Flexbus of a Coldfire processor (MCF5484). I'm able
to work with the flash fine in the boot loader (Colilo) after porting
the driver template from Intel into it. My question is how do I
configure MTD to work with this. I've set the beginning address and
the size. This is CFI complient NOR flash. I've set a chip interleave of 2
with a 32 bit bus. As the kernel is booting I keep getting the
message:

================================================
$Id: ftl.c,v 1.54 2004/11/16 18:33:15 dwmw2 Exp $
Unlock all sector for Intel on Fire Engine...
physmap flash device: 4000000 at f0000000
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x010A
  Unknown Intel/Sharp Extended Query version 1.4.
gen_probe: No supported Vendor Command Set found
cmdlinepart partition parsing not available
RedBoot partition parsing not available
Using physmap partition definition
Creating 2 MTD partitions on "phys_mapped_flash":
0x00000000-0x00040000 : "Colilo (256K)"
mtd: Giving out device 0 to Colilo (256K)
ftl_cs: FTL header not found.
0x00040000-0x00200000 : "user (other Flash memory) 2Mb-256K"
mtd: Giving out device 1 to user (other Flash memory) 2Mb-256K
ftl_cs: FTL header not found.
mice: PS/2 mouse device common for all mice
                 :
                 :NET: Registered protocol family 15
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x1f8b in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x40c7 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0x0003 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0x6c69 in
stead
========================================================================

Then of course the kernel panics since this is where the root file system
lives. The  "gen_probe: No supported Vendor Command Set found" message is
obviously critical but with this being a CFI device how can that be? Is it
because my chip selects are tied together? Is there a way to configure
this to correctly handle this like one device (CS's tied together) but
with the commands concatenated into one 32 bit message?

Kinda stuck here. Any help/suggestions much appreciated!!
