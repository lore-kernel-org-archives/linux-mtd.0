Received: from main.gmane.org ([80.91.224.249])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bl4E8-0004BN-Pz
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 07:16:37 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1Bl4Dw-0008Eq-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Jul 2004 13:16:26 +0200
Received: from calvin.codito.com ([203.199.140.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Jul 2004 13:16:24 +0200
Received: from amitshah by calvin.codito.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Jul 2004 13:16:24 +0200
To: linux-mtd@lists.infradead.org
From: Amit Shah <amitshah@gmx.net>
Date: Thu, 15 Jul 2004 16:43:55 +0530
Message-ID: <cd5p23$dfj$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Sender: news <news@sea.gmane.org>
Subject: PCI flash: found no device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've added support for flash memory for a PCI card in
drivers/mtd/maps/pci.c, based on the two existing drivers. The flash type
is Intel 28F series and supports CFI probes. On loading the pci.ko module
(I'm using 2.6.6), the message says CFI: Found no 0000:04:02.2 device at
location zero. This also means that it found the PCI card and the flash
memory at the appropriate function and BAR. I've sprinkled some printk's
which show that the pci_resource_start is being read correctly from the
device that's to be used as the flash resource.

Do I have to have some extra driver, like a standalone driver in
drivers/mtd/maps/ which does some other initialization? I tried that
approach as well, but even that thing reports the same problem, so I'm not
sure what I'm missing.

Can someone tell me what's missing?

Thanks,
Amit.
-- 
Amit Shah
http://amitshah.nav.to/
