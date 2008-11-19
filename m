Received: from ti-out-0910.google.com ([209.85.142.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2mv5-0005Xr-R1
	for linux-mtd@lists.infradead.org; Wed, 19 Nov 2008 13:16:36 +0000
Received: by ti-out-0910.google.com with SMTP id a21so2271159tia.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Nov 2008 05:16:35 -0800 (PST)
From: Qinghuang Feng <qhfeng.kernel@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/4] drivers/mtd/devices/m25p80.c: mark {__init|__exit} for
	{init|exit} functions
Date: Wed, 19 Nov 2008 21:16:27 +0800
Message-ID: <492411b2.02066e0a.135c.4dde@mx.google.com>
Cc: Mike, linux-kernel@vger.kernel.org, David, linux-mtd@lists.infradead.org,
	Mike Lavender <mike@steroidmicros.com>, Rapoport <mike@compulab.co.il>,
	Hinds <dahinds@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Qinghuang Feng <qhfeng.kernel@gmail.com>
---
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 76a7675..ff6a80e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -768,13 +768,13 @@ static struct spi_driver m25p80_driver = {
 };
 
 
-static int m25p80_init(void)
+static int __init m25p80_init(void)
 {
 	return spi_register_driver(&m25p80_driver);
 }
 
 
-static void m25p80_exit(void)
+static void __exit m25p80_exit(void)
 {
 	spi_unregister_driver(&m25p80_driver);
 }
