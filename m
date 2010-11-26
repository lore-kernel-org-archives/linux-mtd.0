Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PM1A1-0006ei-Ds
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 16:28:41 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: Fix section mismatch on sst25l
Date: Fri, 26 Nov 2010 14:31:44 -0200
Message-ID: <1290789104-1097-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dwmw2@infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Building the kernel with 'make CONFIG_DEBUG_SECTION_MISMATCH=y´

resulted in:

WARNING: vmlinux.o(.data+0x15938): Section mismatch in reference from
the variable sst25l_driver to the function .init.text:sst25l_probe()
The variable sst25l_driver references
the function __init sst25l_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

Fix the section mismatch.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Changes since v1:
- also mark sst25l_match_device as __devinit

 drivers/mtd/devices/sst25l.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 684247a..c163e61 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -335,7 +335,7 @@ out:
 	return ret;
 }
 
-static struct flash_info *__init sst25l_match_device(struct spi_device *spi)
+static struct flash_info *__devinit sst25l_match_device(struct spi_device *spi)
 {
 	struct flash_info *flash_info = NULL;
 	struct spi_message m;
@@ -375,7 +375,7 @@ static struct flash_info *__init sst25l_match_device(struct spi_device *spi)
 	return flash_info;
 }
 
-static int __init sst25l_probe(struct spi_device *spi)
+static int __devinit sst25l_probe(struct spi_device *spi)
 {
 	struct flash_info *flash_info;
 	struct sst25l_flash *flash;
-- 
1.6.0.4
