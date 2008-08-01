Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOqNI-00083w-O5
	for linux-mtd@lists.infradead.org; Fri, 01 Aug 2008 08:52:37 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m718qIUd020544
	for <linux-mtd@lists.infradead.org>; Fri, 1 Aug 2008 11:52:33 +0300
Message-ID: <4892CF09.2020807@nokia.com>
Date: Fri, 01 Aug 2008 11:53:29 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [OneNAND] Add defines for HF and sync write
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


Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 include/linux/mtd/onenand_regs.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index d1b310c..0c6bbe2 100644
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -152,6 +152,8 @@
 #define ONENAND_SYS_CFG1_INT		(1 << 6)
 #define ONENAND_SYS_CFG1_IOBE		(1 << 5)
 #define ONENAND_SYS_CFG1_RDY_CONF	(1 << 4)
+#define ONENAND_SYS_CFG1_HF		(1 << 2)
+#define ONENAND_SYS_CFG1_SYNC_WRITE	(1 << 1)
 
 /*
  * Controller Status Register F240h (R)
-- 
1.5.4.3
