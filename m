From: Dmitry Artamonow <mad_soft@inbox.ru>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: maps/sa1100: fix section mismatch
Date: Fri,  9 Oct 2009 12:18:49 +0400
Message-Id: <1255076329-15065-1-git-send-email-mad_soft@inbox.ru>
Cc: Russell King <linux@arm.linux.org.uk>, Nicolas Pitre <nico@fluxnic.net>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	=?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit f0b1e589 changed sa1100_mtd_probe from __init to __devinit,
but missed to correct sa1100_setup_mtd definition accordingly, which
causes following warning:

WARNING: vmlinux.o(.devinit.text+0xf4): Section mismatch in reference from
 the function sa1100_mtd_probe() to the function .init.text:sa1100_setup_mtd()
The function __devinit sa1100_mtd_probe() references
a function __init sa1100_setup_mtd().
If sa1100_setup_mtd is only used by sa1100_mtd_probe then
annotate sa1100_setup_mtd with a matching annotation.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 drivers/mtd/maps/sa1100-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index fdb97f3..b1cf17b 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -248,7 +248,7 @@ static void sa1100_destroy(struct sa_info *info, struct flash_platform_data *pla
 		plat->exit();
 }
 
-static struct sa_info *__init
+static struct sa_info *__devinit
 sa1100_setup_mtd(struct platform_device *pdev, struct flash_platform_data *plat)
 {
 	struct sa_info *info;
-- 
1.6.3.4
