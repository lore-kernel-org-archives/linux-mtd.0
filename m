Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzFFW-0002iD-MF
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 00:38:00 +0000
Received: by mail-ie0-f169.google.com with SMTP id e14so16728610iej.14
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 16:37:36 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 5/5] mtd: nand: use __packed shorthand
Date: Fri,  3 Jan 2014 16:37:08 -0800
Message-Id: <1388795828-24808-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To be consistent with the rest of include/linux/mtd/nand.h, we should
use the __packed shorthand instead of __attribute__((packed)).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
No change since v1

 include/linux/mtd/nand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e3621aba1417..2413bac095ae 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -292,7 +292,7 @@ struct nand_onfi_params {
 	u8 vendor[88];
 
 	__le16 crc;
-} __attribute__((packed));
+} __packed;
 
 #define ONFI_CRC_BASE	0x4F4E
 
-- 
1.8.3.2
