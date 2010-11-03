Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDb0D-0000cS-3r
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 10:55:38 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0LBB00CQR2CBOT80@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 19:55:23 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0LBB008GQ2CBED@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 19:55:23 +0900 (KST)
Date: Wed, 03 Nov 2010 19:55:13 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH v2] mtd: OneNAND: Cache Program support on 4KiB pagesize
To: roman.tereshonkov@nokia.com
Message-id: <20101103105513.GA15946@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roman,

How about this patch? Just remove the pseudo command and use real command.
As In case of 2KiB pagesize, it uses the write-while-program so not much write improvement.

Give your opinions.

Thank you,
Kyungmin Park

---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 6b3a875..586ba4b 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1845,7 +1845,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	const u_char *buf = ops->datbuf;
 	const u_char *oob = ops->oobbuf;
 	u_char *oobbuf;
-	int ret = 0;
+	int ret = 0, cmd;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
 		__func__, (unsigned int) to, (int) len);
@@ -1954,7 +1954,26 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			ONENAND_SET_NEXT_BUFFERRAM(this);
 		}
 
-		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
+		this->ongoing = 0;
+
+		/* Default write command */
+		cmd = ONENAND_CMD_PROG;
+
+		/*
+		 * Cache Program support
+		 * Exclude 1st OTP and OTP blocks
+		 */
+		if (ONENAND_IS_CACHE_PROGRAM(this) &&
+		    likely(onenand_block(this, to) != 0) &&
+		    ONENAND_IS_4KB_PAGE(this)) {
+
+			if ((written + thislen) < len) {
+				cmd = ONENAND_CMD_2X_CACHE_PROG;
+				this->ongoing = 1;
+			}
+		}
+
+		this->command(mtd, cmd, to, mtd->writesize);
 
 		/*
 		 * 2 PLANE, MLC, and Flex-OneNAND wait here
@@ -3380,6 +3399,8 @@ static void onenand_check_features(struct mtd_info *mtd)
 		else if (numbufs == 1)
 			this->options |= ONENAND_HAS_4KB_PAGE;
 
+		this->options |= ONENAND_HAS_CACHE_PROGRAM;
+
 	case ONENAND_DEVICE_DENSITY_2Gb:
 		/* 2Gb DDP does not have 2 plane */
 		if (!ONENAND_IS_DDP(this))
@@ -3415,6 +3436,8 @@ static void onenand_check_features(struct mtd_info *mtd)
 		printk(KERN_DEBUG "Chip has 2 plane\n");
 	if (this->options & ONENAND_HAS_4KB_PAGE)
 		printk(KERN_DEBUG "Chip has 4KiB pagesize\n");
+	if (this->options & ONENAND_HAS_CACHE_PROGRAM)
+		printk(KERN_DEBUG "Chip has cache program feature\n");
 }
 
 /**
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 0c8815b..3bb1a91 100644
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
+	unsigned int            ongoing;
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
