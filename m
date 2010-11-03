Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PDb0S-0000d9-A5
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 10:55:54 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 1/3] mtd: onenand: add option and variable for cache program
	feature
Date: Wed,  3 Nov 2010 12:55:19 +0200
Message-Id: <1288781721-31771-2-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A new option is added for cache program feature. A new variable
ongoing is introduced for onenand_chip to handle the multi-command
cache program operation.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 include/linux/mtd/onenand.h |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 0c8815b..6da3fe3 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -137,6 +137,14 @@ struct onenand_chip {
 	void			*bbm;
 
 	void			*priv;
+
+	/*
+	 * Shows that the current operation is composed
+	 * of sequence of commands. For example, cache program.
+	 * Such command status OnGo bit is checked at the end of
+	 * sequence.
+	 */
+	unsigned int		ongoing;
 };
 
 /*
@@ -171,6 +179,9 @@ struct onenand_chip {
 #define ONENAND_IS_2PLANE(this)			(0)
 #endif
 
+#define ONENAND_IS_CACHE_PROGRAM(this)					\
+	(this->options & ONENAND_HAS_CACHE_PROGRAM)
+
 /* Check byte access in OneNAND */
 #define ONENAND_CHECK_BYTE_ACCESS(addr)		(addr & 0x1)
 
@@ -181,6 +192,7 @@ struct onenand_chip {
 #define ONENAND_HAS_UNLOCK_ALL		(0x0002)
 #define ONENAND_HAS_2PLANE		(0x0004)
 #define ONENAND_HAS_4KB_PAGE		(0x0008)
+#define ONENAND_HAS_CACHE_PROGRAM	(0x0010)
 #define ONENAND_SKIP_UNLOCK_CHECK	(0x0100)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
-- 
1.7.0.4
