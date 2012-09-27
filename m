Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1THGTy-0006aG-5g
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2012 15:58:37 +0000
From: <dinguyen@altera.com>
To: <linux-mtd@lists.infradead.org>
Subject: nand/denali: split the driver into 3 parts: generic, PCI and DT
Date: Thu, 27 Sep 2012 10:58:04 -0600
Message-ID: <1348765086-27286-1-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dinh.linux@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

The following 2 patches attempts to make the current Denali NAND controller, 
which is PCI-based, to be both PCI and device tree drivers.

The first patch is a resend of Jami Iles patch with only minor changes on the
commit message and checkpatch errors and warnings. This patch was originally
sent in this message:

http://lists.infradead.org/pipermail/linux-mtd/2011-May/035334.html

The second patch is also based on Jamie Iles' patch to add a MMIO version of
the Denali NAND driver. I converted to be DT based.

I think there were comments to make it fully DT, but since I don't have a
PCI-base hardware to test this, I don't want to break it. I can only test the 
DT version on the HW that I have access to.

.../devicetree/bindings/mtd/denali-nand.txt        |   23 +++
 drivers/mtd/nand/Kconfig                           |   20 ++-
 drivers/mtd/nand/Makefile                          |    2 +
 drivers/mtd/nand/denali.c                          |  160 ++++---------------
 drivers/mtd/nand/denali.h                          |    5 +
 drivers/mtd/nand/denali_dt.c                       |  167 ++++++++++++++++++++
 drivers/mtd/nand/denali_pci.c                      |  144 +++++++++++++++++
 7 files changed, 386 insertions(+), 135 deletions(-)


Thanks,
Dinh
