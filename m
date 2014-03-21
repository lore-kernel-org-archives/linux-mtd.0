Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR7ZO-0003Ow-17
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 22:05:42 +0000
From: David Mosberger <davidm@egauge.net>
To: linux-mtd@lists.infradead.org
Subject: mtd: nand: fix GET/SET_FEATURES address on 16-bit devices
Date: Fri, 21 Mar 2014 16:05:10 -0600
Message-Id: <1395439510-18860-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-next almost works out of the box for us except that GET_FEATURES
and SET_FEATURES also need byte-addressing.  With the attached patch,
our board boots fine (save for on-die ECC patch, which I'll submit
separately).  The only oddity is that the devices is reported as being
SLC, when it's most definitely not:

nand: 512MiB, SLC, page size: 2048, OOB size: 64

   --david



GET_FEATURES and SET_FEATURES also need byte-addressing on 16-bit devices.

Signed-off-by: David Mosberger <davidm@egauge.net>

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 0747fef..29a23bb 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -925,7 +929,16 @@ static inline bool nand_is_slc(struct nand_chip *chip)
  */
 static inline int nand_opcode_8bits(unsigned int command)
 {
-	return command == NAND_CMD_READID || command == NAND_CMD_PARAM;
+	switch (command) {
+	case NAND_CMD_READID:
+	case NAND_CMD_PARAM:
+	case NAND_CMD_GET_FEATURES:
+	case NAND_CMD_SET_FEATURES:
+		return 1;
+	default:
+		break;
+	}
+	return 0;
 }
 
 /* return the supported JEDEC features. */
