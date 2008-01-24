Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JI2zG-000441-F9
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 14:23:32 +0000
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-mx09.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m0OENjZB026646
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2008 08:24:25 -0600
Message-ID: <47989DC8.5090201@nokia.com>
Date: Thu, 24 Jan 2008 16:16:40 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [OneNAND] Do not release chip twice
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 7adb82278aba483c2211e25e0927bdaa8c8a4363 Mon Sep 17 00:00:00 2001
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Thu, 24 Jan 2008 12:48:37 +0200
Subject: [MTD] [OneNAND] Do not release chip twice

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 1b0b320..92768ea 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1435,9 +1435,6 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 		buf += thislen;
 	}
 
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	ops->retlen = written;
 
 	return ret;
-- 
1.4.4.2
