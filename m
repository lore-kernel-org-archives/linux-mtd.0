Received: from mail-pd0-f169.google.com ([209.85.192.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VxWQi-000152-4T
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2013 06:34:24 +0000
Received: by mail-pd0-f169.google.com with SMTP id v10so11074338pde.28
 for <linux-mtd@lists.infradead.org>; Sun, 29 Dec 2013 22:33:57 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: omap2: Cleanup header files
Date: Mon, 30 Dec 2013 12:00:20 +0530
Message-Id: <1388385021-1881-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, computersforpeace@gmail.com, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 2203747c9771 ("ARM: omap: move platform_data definitions")
moved the files to the current location but forgot to remove the pointer
to its previous location. Clean it up.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 include/linux/platform_data/mtd-nand-omap2.h    |    2 --
 include/linux/platform_data/mtd-onenand-omap2.h |    2 --
 2 files changed, 4 deletions(-)

diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux/platform_data/mtd-nand-omap2.h
index 4da5bfa2147f..3e9dd6676b97 100644
--- a/include/linux/platform_data/mtd-nand-omap2.h
+++ b/include/linux/platform_data/mtd-nand-omap2.h
@@ -1,6 +1,4 @@
 /*
- * arch/arm/plat-omap/include/mach/nand.h
- *
  * Copyright (C) 2006 Micron Technology Inc.
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/include/linux/platform_data/mtd-onenand-omap2.h b/include/linux/platform_data/mtd-onenand-omap2.h
index e9a9fb188f97..56ff0e6f5ad1 100644
--- a/include/linux/platform_data/mtd-onenand-omap2.h
+++ b/include/linux/platform_data/mtd-onenand-omap2.h
@@ -1,6 +1,4 @@
 /*
- * arch/arm/plat-omap/include/mach/onenand.h
- *
  * Copyright (C) 2006 Nokia Corporation
  * Author: Juha Yrjola
  *
-- 
1.7.9.5
