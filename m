Received: from mail-db9lp0253.outbound.messaging.microsoft.com
 ([213.199.154.253] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwQFy-0003NS-03
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 05:46:48 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 3/5] mtd: nand: add a helper to get the supported features for
 JEDEC
Date: Fri, 27 Dec 2013 13:14:44 +0800
Message-ID: <1388121286-32620-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1388121286-32620-1-git-send-email-b32955@freescale.com>
References: <1388121286-32620-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a helper to get the supported features for JEDEC compliant nand.
Also add a macro JEDEC_FEATURE_16_BIT_BUS.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 13ae489..26b7f2b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -334,6 +334,9 @@ struct jedec_ecc_info {
 	u8 reserved[2];
 } __packed;
 
+/* JEDEC features */
+#define JEDEC_FEATURE_16_BIT_BUS	(1 << 0)
+
 struct nand_jedec_params {
 	/* rev info and features block */
 	/* 'J' 'E' 'S' 'D'  */
@@ -885,4 +888,10 @@ static inline bool nand_is_slc(struct nand_chip *chip)
 {
 	return chip->bits_per_cell == 1;
 }
+
+static inline int jedec_feature(struct nand_chip *chip)
+{
+	return chip->jedec_version ? le16_to_cpu(chip->jedec_params.features)
+		: 0;
+}
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.7.2.rc3
