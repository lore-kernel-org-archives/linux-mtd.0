Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TyPqV-0005pK-VI
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 16:40:13 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org
Subject: [PATCH 1/6] mtd: bcm47xxsflash: write number of written bytes
Date: Thu, 24 Jan 2013 17:39:54 +0100
Message-Id: <1359045599-1305-2-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1359045599-1305-1-git-send-email-hauke@hauke-m.de>
References: <1359045599-1305-1-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The callback assumes the number of read bytes is written to retlen.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/devices/bcm47xxsflash.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 8fe1a09..61a45cb 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -23,6 +23,7 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	memcpy_fromio(buf, (void __iomem *)KSEG0ADDR(b47s->window + from),
 		      len);
+	*retlen = len;
 
 	return len;
 }
-- 
1.7.10.4
