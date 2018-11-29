Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSNW2-0002hw-4T
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 14:42:08 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v4 0/3] mtd: spi-nor: mx25l25635f: Use 4B opcodes
Date: Thu, 29 Nov 2018 15:41:40 +0100
Message-Id: <20181129144143.26079-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This is another attempt at fixing the bug reported by Alexandre and
impacting mx25l25635f flashes that do not have the reset line properly
wired. Since mx25l25635f and mx25l25635e share the same JEDEC-ID, and
only mx25l25635f supports 4B opcodes, the core decides to enter 4B
mode, and when a reset occurs, the NOR stays in this mode and the ROM
code (why only supports 3 byte addressing) can't read the flash
anymore.

Adding broken-flash-reset in the DT fixes the reboot issue but prints
a WARN_ON() backtrace at boot time. The proper solution is to use 4B
opcodes when available, but we need a way to flag the F variant of the
chip as supporting this feature.

This patchset paves the way for more SFDP-related fixups hooks by
adding a spi_nor_fixups struct which can be provided on a per-chip
basis (and soon on a per-manufacturer basis).

In this series we add a single hook called post_bfpt() to allow fixups
just after the BFPT parsing has occurred. Thanks to the BFPT array, we
are able to differentiate the F and E variant and add the 4B_OPCODE
flag when appropriate.

With this infrastructure in place, we'll be able to fix SFPD tables at
runtime instead setting the SKIP_SFDP on NORs with broken SFDP.

Feel free to comment on the general approach or implementation details.

Regards,

Boris

P.S.: This series depends on [1]

[1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=78826

Boris Brezillon (3):
  mtd: spi-nor: Add the SNOR_F_4B_OPCODES flag
  mtd: spi-nor: Add a post BFPT parsing fixup hook
  mtd: spi-nor: Add a post BFPT fixup for MX25L25635E

 drivers/mtd/spi-nor/spi-nor.c | 441 +++++++++++++++++++---------------
 include/linux/mtd/spi-nor.h   |   1 +
 2 files changed, 253 insertions(+), 189 deletions(-)

-- 
2.17.1
