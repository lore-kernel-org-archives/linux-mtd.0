Received: from orngca-mls01.socal.rr.com ([66.75.160.16])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19beij-0001bP-Iq
	for <linux-mtd@lists.infradead.org>; Sun, 13 Jul 2003 12:08:45 +0100
Received: from [192.168.2.4] (rrcs-west-24-24-165-160.biz.rr.com
	[24.24.165.160])h6DB5pM13641	for <linux-mtd@lists.infradead.org>;
	Sun, 13 Jul 2003 04:05:51 -0700 (PDT)
From: roger <rogerxxmaillist@san.rr.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1058094420.2750.13.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 13 Jul 2003 04:08:53 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: intel 440bx unshadow for doc2001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Figured out from scanning through the openbios/devbios code on howto
unshadow the intel 440bx to be able to successfully load the MTD doc2001
module and have it successfully detect the DOC. -- I am not sure if this
is what you call "memory mapping" (ie
/usr/src/linux-2.4.20/drivers/mtd/maps/l440gx.c)

The devbios/openbios project can be found here:
http://www.openbios.info/download/index.html
And the url is at the bottom of the page for
http://www.openbios.info/bin/devbios-0.3.2.tar.gz

Does anybody know if any of this is already in the MTD drivers?  This
code unshadows and gives access to many bios devices.

Went into the openbios/devbios/pcisets.c and commented out the two
statements within the "static void intel4x0_deactivate(void)" function
(this prevents the unshadowing after the bios.o module is loaded -- and
while i was at it, uncommented the a printk debug statement).  Loading
the bios.o module shows the isa bridge info:

Jul  9 02:40:27  BIOS: host bridge is 8086, 7190, 0
Jul  9 02:40:27  BIOS: isa bridge is 8086, 7110, 38
Jul  9 02:40:27  BIOS: isa bridge cfg is 0x64
Jul  9 02:40:27  BIOS: isa bridge cfg is 0x64
Jul  9 02:40:27  BIOS: isa bridge cfg is 0x64
(last line repeated many times)
Jul  9 02:40:27  BIOS: 0k flashchip (ID 0x5f1f) found at physical
address 0xfff01000 (va=0xd8854000+0x101000).
Jul  9 02:40:27  BIOS: Probing PCI device with 256k rom
Jul  9 02:40:27  BIOS: Probing PCI device with 64k rom



Once I unshadowed the intel 440bx, the following script loads doc with
ease:

#!/bin/bash
modprobe doc2001
modprobe docprobe doc_config_location=0xfff00000

cat /proc/mtd

modprobe nft


If i'm correct, the unshadow code just needs to be written into MTD for
everything to work easily? 

-- 

Roger
http://www.eskimo.com/~roger/index.html
