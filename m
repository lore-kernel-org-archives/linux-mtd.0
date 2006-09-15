Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GOEqN-0006Jo-Hc
	for linux-mtd@lists.infradead.org; Fri, 15 Sep 2006 15:39:04 +0100
Date: Fri, 15 Sep 2006 16:31:02 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Andrew Morton <akpm@osdl.org>
Subject: [-mm patch 0/3] AVR32 MTD: Introduction (try 2)
Message-ID: <20060915163102.73bf171d@cad-250-152.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, David
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,

This patchset adds the necessary drivers and infrastructure to access
the external flash on the ATSTK1000 board through the MTD subsystem.
With this stuff in place, it will be possible to use a jffs2 filesystem
stored in the external flash as a root filesystem. It might also be
possible to update the boot loader if you drop the write protection of
partition 0.

As suggested by David Woodhouse, I reworked the patches to use the
physmap driver instead of introducing a separate mapping driver for the
ATSTK1000. I've also cleaned up the hsmc header by removing useless
comments and converting spaces to tabs (my headerfile generator needs
some work.)

Unfortunately, I couldn't unlock the flash in fixup_use_atmel_lock
because the erase regions hadn't been set up yet, so I had to do it
from cfi_amdstd_setup instead.

This also needs two patches I've submitted earlier (included in
git-mtd.patch) in order to work, but it should still apply without
them. For the record, these are:

  MTD: Add lock/unlock operations for Atmel AT49BV6416
  MTD: Convert Atmel PRI information to AMD format

This patchset includes the following patches:

  AVR32 MTD: Static Memory Controller driver
  AVR32 MTD: Unlock flash if necessary
  AVR32 MTD: AT49BV6416 platform device for atstk1000

And the combined diffstat looks like this:

 arch/avr32/boards/atstk1000/Makefile |    2
 arch/avr32/boards/atstk1000/flash.c  |   95 ++++++++++++++++++++
 arch/avr32/mach-at32ap/Makefile      |    2
 arch/avr32/mach-at32ap/at32ap7000.c  |   10 ++
 arch/avr32/mach-at32ap/hsmc.c        |  164 +++++++++++++++++++++++++++++++++++
 arch/avr32/mach-at32ap/hsmc.h        |  127 +++++++++++++++++++++++++++
 drivers/mtd/chips/cfi_cmdset_0002.c  |    9 +
 include/asm-avr32/arch-at32ap/smc.h  |   60 ++++++++++++
 8 files changed, 467 insertions(+), 2 deletions(-)

Best regards,
Haavard
