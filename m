Received: from nm6.bullet.mail.ac4.yahoo.com ([98.139.52.203])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PGw6W-0006qt-I0
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2010 16:04:00 +0000
Message-ID: <843351.91050.qm@web51004.mail.re2.yahoo.com>
Date: Fri, 12 Nov 2010 08:03:54 -0800 (PST)
From: Fabio Estevam <fabioestevam@yahoo.com>
Subject: [PATCH] mtd: Fix section mismatch on sst25l
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Building the kernel with 'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy=B4

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
 drivers/mtd/devices/sst25l.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 684247a..925b1a9 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -375,7 +375,7 @@ static struct flash_info *__init sst25l_match_device(st=
ruct spi_device *spi)
 =09return flash_info;
 }
=20
-static int __init sst25l_probe(struct spi_device *spi)
+static int __devinit sst25l_probe(struct spi_device *spi)
 {
 =09struct flash_info *flash_info;
 =09struct sst25l_flash *flash;
--=20
1.6.0.4=0A=0A=0A      
