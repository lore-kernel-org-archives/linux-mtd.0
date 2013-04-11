Received: from mail-pa0-f54.google.com ([209.85.220.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQCyP-0001Ap-Sn
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 08:35:16 +0000
Received: by mail-pa0-f54.google.com with SMTP id fa11so787265pad.27
 for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2013 01:35:12 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/3] mtd: m25p80: correct EN4B/EX4B comment
Date: Thu, 11 Apr 2013 01:34:58 -0700
Message-Id: <1365669299-6830-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1365669299-6830-1-git-send-email-computersforpeace@gmail.com>
References: <1365669299-6830-1-git-send-email-computersforpeace@gmail.com>
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
v2: no change

 drivers/mtd/devices/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 74bf3ae..94b9b32 100644
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
1.8.2
