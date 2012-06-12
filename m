Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeX1A-0002D8-8q
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 19:44:45 +0000
Received: by ghbf11 with SMTP id f11so4132100ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2012 12:44:43 -0700 (PDT)
From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: m25p80: Add support for n25q064
Date: Tue, 12 Jun 2012 16:44:26 -0300
Message-Id: <1339530266-23625-1-git-send-email-aletes.xgr@gmail.com>
Cc: Alexandre Pereira da Silva <a.pereira@daruma.com.br>,
 Alexandre Pereira da Silva <aletes.xgr@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alexandre Pereira da Silva <a.pereira@daruma.com.br>

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5d0d68c..5967219 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -646,6 +646,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
 	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
 	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
+	{ "n25q064",  INFO(0x20ba17, 0, 64 * 1024, 128, 0) },
 
 	/* Macronix */
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
-- 
1.7.10
