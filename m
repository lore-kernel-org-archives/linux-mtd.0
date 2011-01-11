Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PccU4-0001tq-9Z
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 11:33:52 +0000
Received: by mail-fx0-f49.google.com with SMTP id 19so19231221fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jan 2011 03:33:51 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 5/5] MTD: drop MTD_CONCAT from Kconfig entirely
Date: Tue, 11 Jan 2011 14:33:39 +0300
Message-Id: <1294745619-7142-5-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As there are no more dependencies on MTD_CONCAT or CONFIG_MTD_CONCAT,
drop this entry from Kconfig entirely.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/Kconfig |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 38ca5f2..90f5cf7 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -33,15 +33,6 @@ config MTD_TESTS
 	  should normally be compiled as kernel modules. The modules perform
 	  various checks and verifications when loaded.
 
-config MTD_CONCAT
-	bool
-	default y
-	help
-	  Support for concatenating several MTD devices into a single
-	  (virtual) one. This allows you to have -for example- a JFFS(2)
-	  file system spanning multiple physical flash chips. If unsure,
-	  say 'Y'.
-
 config MTD_PARTITIONS
 	bool "MTD partitioning support"
 	help
-- 
1.7.2.3
