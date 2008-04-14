Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlIQa-0004Iz-CT
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 06:44:32 +0000
Message-ID: <4802FC2B.4090501@nokia.com>
Date: Mon, 14 Apr 2008 09:39:39 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] [MTD] [OneNAND] Allow for controller errors when reading
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

A power loss while writing can result in a page
becoming unreadable.  When the device is mounted
again, reading that page gives controller errors.
Upper level software like JFFS2 treat -EIO as fatal,
refusing to mount at all.  That means it is necessary
to treat the error as an ECC error to allow recovery.
Note that typically in this case, the eraseblock can
still be erased and rewritten i.e. it has not become
a bad block.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 15a62db..4171635 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -329,6 +329,21 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n", ctrl);
 		if (ctrl & ONENAND_CTRL_LOCK)
 			printk(KERN_ERR "onenand_wait: it's locked error.\n");
+		if (state == FL_READING) {
+			/*
+			 * A power loss while writing can result in a page
+			 * becoming unreadable.  When the device is mounted
+			 * again, reading that page gives controller errors.
+			 * Upper level software like JFFS2 treat -EIO as fatal,
+			 * refusing to mount at all.  That means it is necessary
+			 * to treat the error as an ECC error to allow recovery.
+			 * Note that typically in this case, the eraseblock can
+			 * still be erased and rewritten i.e. it has not become
+			 * a bad block.
+			 */
+			mtd->ecc_stats.failed++;
+			return -EBADMSG;
+		}
 		return -EIO;
 	}
 
-- 
1.5.2.5
