Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq79L-0000hG-CO
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 20:09:53 +0000
Received: by mail-ob0-f177.google.com with SMTP id va2so4217732obc.8
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 12:09:30 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 4/4] mtd: nand: use __packed shorthand
Date: Mon,  9 Dec 2013 12:09:13 -0800
Message-Id: <1386619753-27613-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
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
v1 -> v2: no change

 include/linux/mtd/nand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6e579e90955e..32213a5a6705 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -292,7 +292,7 @@ struct nand_onfi_params {
 	u8 vendor[88];
 
 	__le16 crc;
-} __attribute__((packed));
+} __packed;
 
 #define ONFI_CRC_BASE	0x4F4E
 
-- 
1.8.5
