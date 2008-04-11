Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkH9Z-00037w-An
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 11:10:45 +0000
Message-ID: <47FF45EB.5070806@nokia.com>
Date: Fri, 11 Apr 2008 14:05:15 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCHJ] [MTD] [OneNAND] Allow for controller errors when reading
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Controller errors while reading can be caused by
corruption caused by a previous powerloss. Because
upper level software like JFFS2 treat -EIO as fatal,
it is necessary to treat the error as an ECC error.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 15a62db..daf1965 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -329,6 +329,16 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n", ctrl);
 		if (ctrl & ONENAND_CTRL_LOCK)
 			printk(KERN_ERR "onenand_wait: it's locked error.\n");
+		if (state == FL_READING) {
+			/*
+			 * Controller errors while reading can be caused by
+			 * corruption caused by a previous powerloss. Because
+			 * upper level software like JFFS2 treat -EIO as fatal,
+			 * it is necessary to treat the error as an ECC error.
+			 */
+			mtd->ecc_stats.failed++;
+			return -EBADMSG;
+		}
 		return -EIO;
 	}
 
-- 
1.5.2.5
