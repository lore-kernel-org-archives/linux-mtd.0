Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmL-0004mV-UC
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:11 +0000
Received: by mail-ie0-f181.google.com with SMTP id a14so1433016iee.40
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:48 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/12] mtd: dataflash: remove unused field
Date: Wed,  4 Sep 2013 11:25:19 -0700
Message-Id: <1378319126-24473-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: David Brownell <david-b@pacbell.net>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct dataflash's 'partition' field is unused. Just remove it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: David Brownell <david-b@pacbell.net>
---
 drivers/mtd/devices/mtd_dataflash.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 0e8cbfe..1cfbfcf 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -88,8 +88,6 @@ struct dataflash {
 	uint8_t			command[4];
 	char			name[24];
 
-	unsigned		partitioned:1;
-
 	unsigned short		page_offset;	/* offset in flash address */
 	unsigned int		page_size;	/* of bytes per page */
 
-- 
1.8.4
