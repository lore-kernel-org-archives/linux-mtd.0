Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UB1b5-0006VA-NH
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 11:24:25 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 0/4] mtd: cfi_cmdset_0002: Add OTP support for Micron
 M29EW NOR flashes
Date: Thu, 28 Feb 2013 12:23:22 +0100
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <bf9a9f72-17b8-42d7-9f6c-7c1c152ef246@mary.at.omicron.at>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
 Christian Riesch <christian.riesch@omicron.at>,
 Gerlando Falauto <gerlando.falauto@keymile.com>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this patchset is a first attempt to add support for reading and
writing the one time programmable (OTP) memory of Micron M29EW NOR flashes.

These flashes have a 256 byte OTP memory, which is called extended
memory region in its datasheet. The flash is compatible to Spansion S29GL
and Macronix MX29GL devices, so support for the OTP memory of these
flashes should also be possible.

Later I would like to add support for locking this memory region, too.

I only did a few basic tests with this patchset with a single Micron
M29EW device (512Mbit, 16 bit, only one chip) on a custom board
with a Texas Instruments AM1808 system on chip. I am submitting this
patchset now before doing more testing since I would like to hear
your comments on it; this is my first patchset in the mtd subsystem.

Please see also my comments in the patches, I have a few questions there.

Thank you!

Best regards, Christian

Cc: Gerlando Falauto <gerlando.falauto@keymile.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>

Christian Riesch (4):
  mtd: cfi_probe: Fix detection of Micron M29EW flashes
  mtd: cfi_cmdset_0002: Add support for reading OTP memory of Micron
    M29EW
  mtd: cfi_cmdset_0002: Invalidate cache after entering/exiting OTP
    memory
  mtd: cfi_cmdset_0002: Add support for writing OTP memory

 drivers/mtd/chips/Kconfig           |    1 +
 drivers/mtd/chips/cfi_cmdset_0002.c |  228 ++++++++++++++++++++++++++++++++---
 drivers/mtd/chips/cfi_probe.c       |    4 +-
 3 files changed, 212 insertions(+), 21 deletions(-)

-- 
1.7.9.5
