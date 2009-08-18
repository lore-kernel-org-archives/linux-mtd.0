From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] driver/Makefile: Initialize "mtd" and "spi" before "net"
Date: Tue, 18 Aug 2009 12:34:04 -0400
Message-Id: <1250613244-25447-1-git-send-email-sudhakar.raj@ti.com>
Cc: david-b@pacbell.net, davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On TI's da850/omap-l138 EVM, MAC address is stored in SPI flash.

This patch changes the initialization sequence of the drivers
by moving mtd and spi ahead of net in drivers/Makefile thereby
enabling da850/omap-l138 ethernet driver to read the MAC address
while booting.

Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
---
 drivers/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index bc4205d..2a1d41f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -42,6 +42,8 @@ obj-y				+= macintosh/
 obj-$(CONFIG_IDE)		+= ide/
 obj-$(CONFIG_SCSI)		+= scsi/
 obj-$(CONFIG_ATA)		+= ata/
+obj-$(CONFIG_MTD)		+= mtd/
+obj-$(CONFIG_SPI)		+= spi/
 obj-y				+= net/
 obj-$(CONFIG_ATM)		+= atm/
 obj-$(CONFIG_FUSION)		+= message/
@@ -50,8 +52,6 @@ obj-y				+= ieee1394/
 obj-$(CONFIG_UIO)		+= uio/
 obj-y				+= cdrom/
 obj-y				+= auxdisplay/
-obj-$(CONFIG_MTD)		+= mtd/
-obj-$(CONFIG_SPI)		+= spi/
 obj-$(CONFIG_PCCARD)		+= pcmcia/
 obj-$(CONFIG_DIO)		+= dio/
 obj-$(CONFIG_SBUS)		+= sbus/
-- 
1.5.6
