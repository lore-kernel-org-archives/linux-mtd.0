Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1InumI-0007u2-0u
	for linux-mtd@lists.infradead.org; Fri, 02 Nov 2007 07:33:36 -0400
Message-ID: <472B0A3C.4010103@nokia.com>
Date: Fri, 02 Nov 2007 13:30:04 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When an ECC error occurs, the read should be completed
anyway before returning -EBADMSG.  Returning -EBADMSG
straight away is incorrect.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   21 +++++++++++++++------
 1 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index dd28355..616747c 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -855,6 +855,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
  			ret = this->wait(mtd, FL_READING);
  			onenand_update_bufferram(mtd, from, !ret);
+			if (ret == -EBADMSG)
+				ret = 0;
  		}
  	}
 
@@ -913,6 +915,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
  		/* Now wait for load */
  		ret = this->wait(mtd, FL_READING);
  		onenand_update_bufferram(mtd, from, !ret);
+		if (ret == -EBADMSG)
+			ret = 0;
  	}
 
 	/*
@@ -944,6 +948,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 			struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this = mtd->priv;
+	struct mtd_ecc_stats stats;
 	int read = 0, thislen, column, oobsize;
 	size_t len = ops->ooblen;
 	mtd_oob_mode_t mode = ops->mode;
@@ -977,6 +982,8 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 		return -EINVAL;
 	}
 
+	stats = mtd->ecc_stats;
+
 	while (read < len) {
 		cond_resched();
 
@@ -988,18 +995,16 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 		onenand_update_bufferram(mtd, from, 0);
 
 		ret = this->wait(mtd, FL_READING);
-		/* First copy data and check return value for ECC handling */
+		if (ret && ret != -EBADMSG) {
+			printk(KERN_ERR "onenand_read_oob_nolock: read failed = 0x%x\n", ret);
+			break;
+		}
 
 		if (mode == MTD_OOB_AUTO)
 			onenand_transfer_auto_oob(mtd, buf, column, thislen);
 		else
 			this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
 
-		if (ret) {
-			printk(KERN_ERR "onenand_read_oob_nolock: read failed = 0x%x\n", ret);
-			break;
-		}
-
 		read += thislen;
 
 		if (read == len)
@@ -1016,6 +1021,10 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 	}
 
 	ops->oobretlen = read;
+
+	if (mtd->ecc_stats.failed - stats.failed)
+		return -EBADMSG;
+
 	return ret;
 }
 
-- 
1.4.4.2
