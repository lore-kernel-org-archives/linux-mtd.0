Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VofPV-0004WG-DW
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 20:20:34 +0000
Received: by mail-qa0-f53.google.com with SMTP id j5so165422qaq.12
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 12:20:12 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] mtd: nand: use __packed shorthand
Date: Thu,  5 Dec 2013 12:20:00 -0800
Message-Id: <1386274800-22013-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1386274800-22013-1-git-send-email-computersforpeace@gmail.com>
References: <1386274800-22013-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
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
