Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSf-0001Qm-9S
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:36:50 +0000
Received: by wwi18 with SMTP id 18so2387416wwi.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:36:47 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/44] mtd: lart.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:01 +0400
Message-Id: <1307453803-31950-3-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/devices/lart.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 772a0ff..48b513f 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -619,6 +619,10 @@ static struct mtd_partition lart_partitions[] = {
 		.size	= INITRD_LEN,		/* MTDPART_SIZ_FULL */
 	}
 };
+#define NUM_PARTITIONS ARRAY_SIZE(lart_partitions)
+#else
+#define lart_partitions NULL
+#define NUM_PARTITIONS 0
 #endif
 
 static int __init lart_flash_init (void)
@@ -683,23 +687,15 @@ static int __init lart_flash_init (void)
 #endif
 #endif
 
-#ifndef HAVE_PARTITIONS
-   result = mtd_device_register(&mtd, NULL, 0);
-#else
    result = mtd_device_register(&mtd, lart_partitions,
                                 ARRAY_SIZE(lart_partitions));
-#endif
 
    return (result);
 }
 
 static void __exit lart_flash_exit (void)
 {
-#ifndef HAVE_PARTITIONS
    mtd_device_unregister(&mtd);
-#else
-   mtd_device_unregister(&mtd);
-#endif
 }
 
 module_init (lart_flash_init);
-- 
1.7.4.4
