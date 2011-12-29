Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFh-0004RG-4D
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:23 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 27/27] mtd: move mtd->{get,put}_device functions up
Date: Thu, 29 Dec 2011 11:27:31 +0200
Message-Id: <1325150851-2805-28-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
References: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Move the 'get_device()' and 'put_device()' functions up within
'struct mtd_info' to make them be close to other functions.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/mtd.h |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 64aa54f..8ae37e9 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -214,6 +214,12 @@ struct mtd_info {
 	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*suspend) (struct mtd_info *mtd);
 	void (*resume) (struct mtd_info *mtd);
+	/*
+	 * If the driver is something smart, like UBI, it may need to maintain
+	 * its own reference counting. The below functions are only for driver.
+	 */
+	int (*get_device) (struct mtd_info *mtd);
+	void (*put_device) (struct mtd_info *mtd);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -232,13 +238,6 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	int usecount;
-
-	/* If the driver is something smart, like UBI, it may need to maintain
-	 * its own reference counting. The below functions are only for driver.
-	 * The driver may register its callbacks. These callbacks are not
-	 * supposed to be called by MTD users */
-	int (*get_device) (struct mtd_info *mtd);
-	void (*put_device) (struct mtd_info *mtd);
 };
 
 /*
-- 
1.7.7.4
