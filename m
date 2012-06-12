Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeWzi-000215-88
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 19:43:15 +0000
Received: by yenr9 with SMTP id r9so4138783yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2012 12:43:12 -0700 (PDT)
From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: m25p80: Add support for m25pe20
Date: Tue, 12 Jun 2012 16:42:40 -0300
Message-Id: <1339530160-23579-1-git-send-email-aletes.xgr@gmail.com>
Cc: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5967219..53c77bf 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -715,6 +715,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16, 0) },
 	{ "m45pe16", INFO(0x204015,  0, 64 * 1024,   32, 0) },
 
+	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4,       0) },
 	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
 	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
 
-- 
1.7.10
