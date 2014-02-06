Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBIBP-0003SH-2h
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 06:11:31 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0K00FBX96L65D0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 15:11:09 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
In-reply-to: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
Subject: [PATCH 3/8] mtd: pmc551: Remove unnecessary OOM messages
Date: Thu, 06 Feb 2014 15:11:09 +0900
Message-id: <000501cf2302$3a3c4990$aeb4dcb0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/pmc551.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 0c51b98..f02603e 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -725,16 +725,11 @@ static int __init init_pmc551(void)
 		}
 
 		mtd = kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
-		if (!mtd) {
-			printk(KERN_NOTICE "pmc551: Cannot allocate new MTD "
-				"device.\n");
+		if (!mtd)
 			break;
-		}
 
 		priv = kzalloc(sizeof(struct mypriv), GFP_KERNEL);
 		if (!priv) {
-			printk(KERN_NOTICE "pmc551: Cannot allocate new MTD "
-				"device.\n");
 			kfree(mtd);
 			break;
 		}
-- 
1.7.10.4
