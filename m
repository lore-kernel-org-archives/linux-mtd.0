Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6xvC-000643-3u
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 07:12:39 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR500DNVG00VLE0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 16:12:14 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 2/7] mtd: impa7: add missing __iomem annotation
Date: Wed, 07 Aug 2013 16:12:14 +0900
Message-id: <004101ce933d$713c7a00$53b56e00$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Dmitry Eremin-Solenikov' <dmitry_eremin@mentor.com>,
 linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added missing __iomem annotation and used NULL instead of 0
in order to fix the following sparse warnings:

drivers/mtd/maps/impa7.c:82:32: warning: Using plain integer as NULL pointer
drivers/mtd/maps/impa7.c:96:34: warning: cast removes address space of expression
drivers/mtd/maps/impa7.c:96:34: warning: incorrect type in argument 1 (different address spaces)
drivers/mtd/maps/impa7.c:96:34:    expected void volatile [noderef] <asn:2>*addr
drivers/mtd/maps/impa7.c:96:34:    got void *<noident>
drivers/mtd/maps/impa7.c:108:34: warning: cast removes address space of expression
drivers/mtd/maps/impa7.c:108:34: warning: incorrect type in argument 1 (different address spaces)
drivers/mtd/maps/impa7.c:108:34:    expected void volatile [noderef] <asn:2>*addr
drivers/mtd/maps/impa7.c:108:34:    got void *<noident>
drivers/mtd/maps/impa7.c:109:45: warning: Using plain integer as NULL pointer

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/maps/impa7.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index 4968674..15bbda0 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -79,7 +79,7 @@ static int __init init_impa7(void)
 		}
 		simple_map_init(&impa7_map[i]);
 
-		impa7_mtd[i] = 0;
+		impa7_mtd[i] = NULL;
 		type = rom_probe_types;
 		for(; !impa7_mtd[i] && *type; type++) {
 			impa7_mtd[i] = do_map_probe(*type, &impa7_map[i]);
@@ -91,9 +91,9 @@ static int __init init_impa7(void)
 			mtd_device_parse_register(impa7_mtd[i], NULL, NULL,
 						  partitions,
 						  ARRAY_SIZE(partitions));
+		} else {
+			iounmap((void __iomem *)impa7_map[i].virt);
 		}
-		else
-			iounmap((void *)impa7_map[i].virt);
 	}
 	return devicesfound == 0 ? -ENXIO : 0;
 }
@@ -105,8 +105,8 @@ static void __exit cleanup_impa7(void)
 		if (impa7_mtd[i]) {
 			mtd_device_unregister(impa7_mtd[i]);
 			map_destroy(impa7_mtd[i]);
-			iounmap((void *)impa7_map[i].virt);
-			impa7_map[i].virt = 0;
+			iounmap((void __iomem *)impa7_map[i].virt);
+			impa7_map[i].virt = NULL;
 		}
 	}
 }
-- 
1.7.10.4
