Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drLAF-00067z-P9
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 09:38:01 +0000
Received: by mail-it0-x244.google.com with SMTP id z81so3846636itb.5
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 02:37:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
Subject: [PATCH v2 00/10] spi-nor: intel-spi: Various fixes and enhancements
Date: Mon, 11 Sep 2017 02:41:50 -0700
Message-Id: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series does several bug fixes and clean ups against the intel-spi
spi-nor driver, as well as enhancements to make the driver independent
on the underlying BIOS/bootloader.

At present the driver uses the HW sequencer for the read/write/erase on
all supported platforms, read_reg/write_reg for BXT, and the SW sequencer
for read_reg/write_reg for BYT/LPT. The way the driver uses the HW and SW
sequencer relies on some programmed register settings and hence creates
unneeded dependencies with the underlying BIOS/bootloader. For example,
the driver unfortunately does not work as expected when booting from
Intel Baytrail FSP based bootloaders like U-Boot, as the Baytrail FSP
does not set up some SPI controller settings to make the driver happy.
Now such limitation has been removed with this series.

Changes in v2:
- Add stable kernel tags in the commit message (patch [03/10])
- Fix typo of 'operatoin' (patch [10/10])
- Add Mika Westerberg's 'Acked-by' tag

Bin Meng (10):
  spi-nor: intel-spi: Fix number of protected range registers for
    BYT/LPT
  spi-nor: intel-spi: Remove useless 'buf' parameter in the HW/SW cycle
  spi-nor: intel-spi: Fix broken software sequencing codes
  spi-nor: intel-spi: Check transfer length in the HW/SW cycle
  spi-nor: intel-spi: Use SW sequencer for BYT/LPT
  spi-nor: intel-spi: Remove 'Atomic Cycle Sequence' in
    intel_spi_write()
  spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS
  spi-nor: intel-spi: Remove the unnecessary HSFSTS register RW
  spi-nor: intel-spi: Rename swseq to swseq_reg in 'struct intel_spi'
  spi-nor: intel-spi: Fall back to use SW sequencer to erase

 drivers/mtd/spi-nor/intel-spi.c | 209 +++++++++++++++++++++++++++++-----------
 1 file changed, 151 insertions(+), 58 deletions(-)

-- 
2.9.2
