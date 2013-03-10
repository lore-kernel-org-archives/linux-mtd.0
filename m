Received: from mail-da0-x229.google.com ([2607:f8b0:400e:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEbpE-0005b4-9X
 for linux-mtd@lists.infradead.org; Sun, 10 Mar 2013 08:41:48 +0000
Received: by mail-da0-f41.google.com with SMTP id j17so498388dan.28
 for <linux-mtd@lists.infradead.org>; Sun, 10 Mar 2013 00:41:46 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] mtd: m25p80: correct EN4B/EX4B comment
Date: Sun, 10 Mar 2013 00:41:16 -0800
Message-Id: <1362904877-20144-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5ff14ee..6aafdc1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -59,7 +59,7 @@
 #define	OPCODE_WRDI		0x04	/* Write disable */
 #define	OPCODE_AAI_WP		0xad	/* Auto address increment word program */
 
-/* Used for Macronix flashes only. */
+/* Used for Macronix and Winbond flashes. */
 #define	OPCODE_EN4B		0xb7	/* Enter 4-byte mode */
 #define	OPCODE_EX4B		0xe9	/* Exit 4-byte mode */
 
-- 
1.8.1.5
