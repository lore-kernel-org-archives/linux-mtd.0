Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLbzq-0005Fl-Jk
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2016 19:31:19 +0000
To: linux-mtd <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Sebastian Frias <sf84@laposte.net>
From: Mason <slash.tmp@free.fr>
Subject: Using a generic upstream driver with a custom NAND controller
Message-ID: <569E8EEA.6060106@free.fr>
Date: Tue, 19 Jan 2016 20:30:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm porting a 3.4 kernel to a 4.4 kernel, and I'm having a hard time
with the NAND driver, because it made changes to "core" files, and
these core files have possibly changed a lot between the 20 releases.

 drivers/mtd/Kconfig                                            |    3 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                            |  127 ++-
 drivers/mtd/devices/m25p80.c                                   |  100 +-
 drivers/mtd/maps/Kconfig                                       |   11 +-
 drivers/mtd/maps/physmap.c                                     |  195 ++++
 drivers/mtd/mtdchar.c                                          |   54 ++
 drivers/mtd/nand/Kconfig                                       |    8 +
 drivers/mtd/nand/Makefile                                      |    1 +
 drivers/mtd/nand/nand_base.c                                   |    6 +-
 drivers/mtd/nand/nand_ids.c                                    |   18 +
 drivers/mtd/nand/foobar_nand.c                                 | 1903 ++++++++++++++++++++

I assume a regular driver is not supposed to make changes to
(some of) these core files?

As far as I understand, the NAND controller is custom (it's not a
hardware IP block sold to SoC manufacturers) but I think there is
some kind of standard (ONFI?) that all controllers adhere to?
(Kind of like USB has generic EHCI.)

Is there some generic driver upstream that I could try to see if
it works with this controller?

Note: the SoC is using these chips:
nand: Micron NAND 512MiB 3,3V 8-bit
nand: 512MiB, SLC, page size: 2048, OOB size: 64

Regards.
