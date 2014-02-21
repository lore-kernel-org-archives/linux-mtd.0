Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGjWc-0003aG-Gu
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 06:23:55 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 3/5] mtd: nand: add a helper to get the supported features
 for JEDEC
Date: Fri, 21 Feb 2014 13:39:39 +0800
Message-ID: <1392961181-20693-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1392961181-20693-1-git-send-email-b32955@freescale.com>
References: <1392961181-20693-1-git-send-email-b32955@freescale.com>
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

Acked-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index f9af756..afd1cf9b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -350,6 +350,9 @@ struct jedec_ecc_info {
 	u8 reserved[2];
 } __packed;
 
+/* JEDEC features */
+#define JEDEC_FEATURE_16_BIT_BUS	(1 << 0)
+
 struct nand_jedec_params {
 	/* rev info and features block */
 	/* 'J' 'E' 'S' 'D'  */
@@ -925,4 +928,10 @@ static inline int nand_opcode_8bits(unsigned int command)
 	return command == NAND_CMD_READID;
 }
 
+/* return the supported JEDEC features. */
+static inline int jedec_feature(struct nand_chip *chip)
+{
+	return chip->jedec_version ? le16_to_cpu(chip->jedec_params.features)
+		: 0;
+}
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.7.2.rc3
