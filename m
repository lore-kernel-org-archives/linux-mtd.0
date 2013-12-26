Received: from mail-pb0-f43.google.com ([209.85.160.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw4Kw-00050k-Ue
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 06:22:27 +0000
Received: by mail-pb0-f43.google.com with SMTP id rq2so7870397pbb.16
 for <linux-mtd@lists.infradead.org>; Wed, 25 Dec 2013 22:22:04 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: onenand: Trivial cleanup in samsung.h
Date: Thu, 26 Dec 2013 11:48:34 +0530
Message-Id: <1388038714-10032-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, kyungmin.park@samsung.com,
 computersforpeace@gmail.com, trivial@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 93115b7fa8f4 ("mtd: onenand/samsung: make regs-onenand.h file local")
moved the file to the current location but forgot to remove the pointer to
its previous location. Clean it up.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/onenand/samsung.h |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.h b/drivers/mtd/onenand/samsung.h
index c4a80e67e438..9016dc0136a8 100644
--- a/drivers/mtd/onenand/samsung.h
+++ b/drivers/mtd/onenand/samsung.h
@@ -1,6 +1,4 @@
 /*
- * linux/arch/arm/plat-s3c/include/plat/regs-onenand.h
- *
  *  Copyright (C) 2008-2010 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
-- 
1.7.9.5
