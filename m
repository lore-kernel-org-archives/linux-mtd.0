Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OG5aI-0001RC-Gs
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 07:26:56 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd: physmap: allow maps to be read-only mapped
Date: Sun, 23 May 2010 03:30:24 -0400
Message-Id: <1274599824-17530-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
References: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dev@uclinux.org, Bernd Schmidt <bernds_cb1@t-online.de>,
	David Howells <dhowells@redhat.com>, Paul Mundt <lethal@linux-sh.org>,
	Greg Ungerer <gerg@uclinux.org>, uclinux-dist-devel@blackfin.uclinux.org,
	David McCullough <davidm@snapgear.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bernd Schmidt <bernds_cb1@t-online.de>

Recent changes have made nommu.c more careful about checking device
capabilities before attempting to create a direct mapping.  This means
that the physmap driver has to mark its mtd devices as ro-mappable if
we want to support XIP on flash.

Signed-off-by: Bernd Schmidt <bernds_cb1@t-online.de>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
Note: this does semi-undo recent changes that punted the prototypes for
      these common mtd_bdi's ...

 drivers/mtd/maps/physmap.c |    2 ++
 drivers/mtd/mtdcore.c      |    4 ++++
 include/linux/mtd/mtdbdi.h |   17 +++++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 include/linux/mtd/mtdbdi.h

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 370da18..be2dbc2 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -19,6 +19,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/mtd/concat.h>
+#include <linux/mtd/mtdbdi.h>
 #include <linux/io.h>
 
 #define MAX_RESOURCES		4
@@ -165,6 +166,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 		}
 		if (info->mtd[i]->get_unmapped_area == NULL)
 			info->mtd[i]->get_unmapped_area = physmap_unmapped_area;
+		info->mtd[i]->backing_dev_info = &mtd_bdi_ro_mappable;
 		info->mtd[i]->owner = THIS_MODULE;
 		info->mtd[i]->dev.parent = &dev->dev;
 	}
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index a1b8b70..0995819 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -24,6 +24,7 @@
 #include <linux/gfp.h>
 
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/mtdbdi.h>
 
 #include "mtdcore.h"
 /*
@@ -33,6 +34,7 @@
 struct backing_dev_info mtd_bdi_unmappable = {
 	.capabilities	= BDI_CAP_MAP_COPY,
 };
+EXPORT_SYMBOL(mtd_bdi_unmappable);
 
 /*
  * backing device capabilities for R/O mappable devices (such as ROM)
@@ -43,6 +45,7 @@ struct backing_dev_info mtd_bdi_ro_mappable = {
 	.capabilities	= (BDI_CAP_MAP_COPY | BDI_CAP_MAP_DIRECT |
 			   BDI_CAP_EXEC_MAP | BDI_CAP_READ_MAP),
 };
+EXPORT_SYMBOL(mtd_bdi_ro_mappable);
 
 /*
  * backing device capabilities for writable mappable devices (such as RAM)
@@ -54,6 +57,7 @@ struct backing_dev_info mtd_bdi_rw_mappable = {
 			   BDI_CAP_EXEC_MAP | BDI_CAP_READ_MAP |
 			   BDI_CAP_WRITE_MAP),
 };
+EXPORT_SYMBOL(mtd_bdi_rw_mappable);
 
 static int mtd_cls_suspend(struct device *dev, pm_message_t state);
 static int mtd_cls_resume(struct device *dev);
diff --git a/include/linux/mtd/mtdbdi.h b/include/linux/mtd/mtdbdi.h
new file mode 100644
index 0000000..ec0dd7e
--- /dev/null
+++ b/include/linux/mtd/mtdbdi.h
@@ -0,0 +1,17 @@
+/* Internal MTD definitions
+ *
+ * Copyright © 2006 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+/*
+ * mtdcore.c
+ */
+extern struct backing_dev_info mtd_bdi_unmappable;
+extern struct backing_dev_info mtd_bdi_ro_mappable;
+extern struct backing_dev_info mtd_bdi_rw_mappable;
-- 
1.7.1
