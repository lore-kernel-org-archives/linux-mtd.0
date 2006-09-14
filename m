Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GNspE-0005a6-DK
	for linux-mtd@lists.infradead.org; Thu, 14 Sep 2006 16:08:25 +0100
Date: Thu, 14 Sep 2006 16:29:26 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Andrew Morton <akpm@osdl.org>
Subject: [-mm patch 0/4] AVR32 MTD: Introduction
Message-ID: <20060914162926.6c117b36@cad-250-152.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrew and MTD people,

This patchset adds the necessary drivers and infrastructure to access
the external flash on the ATSTK1000 board through the MTD subsystem.

With this stuff in place, it will be possible to use a jffs2
filesystem stored in the external flash as a root filesystem. It might
also be possible to update the boot loader if you drop the write
protection of partition 0.

Andrew, can you apply this to -mm? They probably don't make sense for
the MTD tree until the rest of the AVR32 patches are merged into
mainline, but I'd really appreciate if someone could have a quick look
to see if I did something stupid.

This also needs two patches I've submitted earlier (included in
git-mtd.patch) in order to work, but it should still apply without
them. For the record, these are:
  MTD: Add lock/unlock operations for Atmel AT49BV6416
  MTD: Convert Atmel PRI information to AMD format

This patchset includes the following patches:

  AVR32 MTD: Static Memory Controller driver
  AVR32 MTD: Define struct flash_platform_data
  AVR32 MTD: Mapping driver for the ATSTK1000 board
  AVR32 MTD: AT49BV6416 platform device for atstk1000

And the combined diffstat looks like this:

 arch/avr32/boards/atstk1000/atstk1002.c |   46 ++++++++
 arch/avr32/mach-at32ap/Makefile         |    2 
 arch/avr32/mach-at32ap/at32ap7000.c     |   10 +
 arch/avr32/mach-at32ap/hsmc.c           |  164 +++++++++++++++++++++++++++++
 arch/avr32/mach-at32ap/hsmc.h           |  169 ++++++++++++++++++++++++++++++
 drivers/mtd/maps/Kconfig                |   10 +
 drivers/mtd/maps/Makefile               |    1 
 drivers/mtd/maps/atstk1000.c            |  179 ++++++++++++++++++++++++++++++++
 include/asm-avr32/arch-at32ap/board.h   |    7 +
 include/asm-avr32/arch-at32ap/smc.h     |   60 ++++++++++
 10 files changed, 647 insertions(+), 1 deletion(-)

Best regards,
Haavard
