Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JI2zs-00045R-JH
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 14:24:10 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m0OENod0028482
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2008 16:24:02 +0200
Message-ID: <47989DF3.5010408@nokia.com>
Date: Thu, 24 Jan 2008 16:17:23 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [OneNAND] fix call to onenand_verify when writing
	subpages
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

>From cd14c5e65c47a827da3950022d06502bdf719d3c Mon Sep 17 00:00:00 2001
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Mon, 21 Jan 2008 17:13:07 +0200
Subject: [MTD] [OneNAND] fix call to onenand_verify when writing subpages

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 92768ea..c2bf4ae 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1419,7 +1419,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 		}
 
 		/* Only check verify write turn on */
-		ret = onenand_verify(mtd, (u_char *) wbuf, to, thislen);
+		ret = onenand_verify(mtd, buf, to, thislen);
 		if (ret) {
 			printk(KERN_ERR "onenand_write_ops_nolock: verify failed %d\n", ret);
 			break;
-- 
1.4.4.2
