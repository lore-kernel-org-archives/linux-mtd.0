Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDlq-0004Sb-6K
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:49 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 07/11] mtd: remove CONFIG_MTD_DEBUG
Date: Tue, 19 Jul 2011 10:06:12 -0700
Message-ID: <1311095176-5407-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
References: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/Kconfig     |   13 -------------
 include/linux/mtd/mtd.h |   23 -----------------------
 2 files changed, 0 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index cc02e21..4925aa9 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -12,19 +12,6 @@ menuconfig MTD
 
 if MTD
 
-config MTD_DEBUG
-	bool "Debugging"
-	help
-	  This turns on low-level debugging for the entire MTD sub-system.
-	  Normally, you should say 'N'.
-
-config MTD_DEBUG_VERBOSE
-	int "Debugging verbosity (0 = quiet, 3 = noisy)"
-	depends on MTD_DEBUG
-	default "0"
-	help
-	  Determines the verbosity level of the MTD debugging messages.
-
 config MTD_TESTS
 	tristate "MTD tests support"
 	depends on m
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 62d56f9..68ea229 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -360,27 +360,4 @@ void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
 
 void mtd_erase_callback(struct erase_info *instr);
 
-/*
- * Debugging macro and defines
- */
-#define MTD_DEBUG_LEVEL0	(0)	/* Quiet   */
-#define MTD_DEBUG_LEVEL1	(1)	/* Audible */
-#define MTD_DEBUG_LEVEL2	(2)	/* Loud    */
-#define MTD_DEBUG_LEVEL3	(3)	/* Noisy   */
-
-#ifdef CONFIG_MTD_DEBUG
-#define DEBUG(n, args...)				\
-	do {						\
-		if (n <= CONFIG_MTD_DEBUG_VERBOSE)	\
-			printk(KERN_INFO args);		\
-	} while(0)
-#else /* CONFIG_MTD_DEBUG */
-#define DEBUG(n, args...)				\
-	do {						\
-		if (0)					\
-			printk(KERN_INFO args);		\
-	} while(0)
-
-#endif /* CONFIG_MTD_DEBUG */
-
 #endif /* __MTD_MTD_H__ */
-- 
1.7.0.4
