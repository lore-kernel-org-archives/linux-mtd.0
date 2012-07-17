Received: from smtp2-v.fe.bosch.de ([139.15.237.6])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sr86b-00055P-PL
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2012 13:46:26 +0000
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.30])
 by imta23.fe.bosch.de (Postfix) with ESMTP id E2FB428C0200
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2012 15:46:14 +0200 (CEST)
Received: from localhost (vsgw3.fe.internet.bosch.com [10.4.98.16])
 by vsmta14.fe.internet.bosch.com (Postfix) with SMTP id CAED91B40218
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2012 15:46:14 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD: devices: Add support for serial flash STM/Micron N25Q032
Date: Tue, 17 Jul 2012 15:45:53 +0200
Message-ID: <1342532753-26915-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: David Woodhouse <dwmw2@infradead.org>,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Knut Wohlrab <knut.wohlrab@de.bosch.com>

Signed-off-by: Knut Wohlrab <knut.wohlrab@de.bosch.com>
CC: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1924d24..ea0c97a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -695,6 +695,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "m25p32",  INFO(0x202016,  0,  64 * 1024,  64, 0) },
 	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128, 0) },
 	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64, 0) },
+	{ "n25q032", INFO(0x20ba16,  0,  64 * 1024,  64, 0) },
 
 	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },
 	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4, 0) },
-- 
1.7.0.4
