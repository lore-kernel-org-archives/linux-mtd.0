Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmzqT-0000iz-TW
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 06:17:46 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so1084017pbb.5
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 23:17:25 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/6] mtd: nand: r852: correct write_buf loop bounds
Date: Tue, 20 May 2014 23:17:03 -0700
Message-Id: <1400653023-25757-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
References: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The two loops in r852_write_buf() are designed to handle 4-byte-aligned
and then 1-byte-aligned portions, respectively. However, there are two
issues:

(1) The first loop will only terminate if 'len' is a multiple of 4
(2) The second loop will never terminate if it runs at least once

Rewrite these loops as they were probably intended. Compile tested only.

Issues pointed out by Coverity Scan.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/r852.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 325930db3f04..baea83f4dea8 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -245,7 +245,7 @@ static void r852_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	}
 
 	/* write DWORD chinks - faster */
-	while (len) {
+	while (len >= 4) {
 		reg = buf[0] | buf[1] << 8 | buf[2] << 16 | buf[3] << 24;
 		r852_write_reg_dword(dev, R852_DATALINE, reg);
 		buf += 4;
@@ -254,8 +254,10 @@ static void r852_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	}
 
 	/* write rest */
-	while (len)
+	while (len > 0) {
 		r852_write_reg(dev, R852_DATALINE, *buf++);
+		len--;
+	}
 }
 
 /*
-- 
1.7.9.5
