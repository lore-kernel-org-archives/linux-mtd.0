Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zylmo-0007le-Tj
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 19:19:27 +0000
Received: by wmww144 with SMTP id w144so40551985wmw.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 11:19:05 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/3] mtd: m25p80: handle failed spi_write in m25p80_erase
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Message-ID: <564B7D87.5090804@gmail.com>
Date: Tue, 17 Nov 2015 20:18:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Handle the case that spi_write fails.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 634b0c4..f10daa8 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -171,9 +171,7 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
 	flash->command[0] = nor->erase_opcode;
 	m25p_addr2cmd(nor, offset, flash->command);
 
-	spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
-
-	return 0;
+	return spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
 }
 
 /*
-- 
2.6.2
