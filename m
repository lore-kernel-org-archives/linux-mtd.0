Received: from mail-db8lp0189.outbound.messaging.microsoft.com
 ([213.199.154.189] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHY9J-0008VQ-Gv
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 11:22:43 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 08/11] mtd: add a new field for ecc info in the
 nand_flash_dev{}
Date: Mon, 18 Mar 2013 19:18:51 +0800
Message-ID: <1363605534-24776-9-git-send-email-b32955@freescale.com>
In-Reply-To: <1363605534-24776-1-git-send-email-b32955@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the @ecc_info in the nand_flash_dev{}.
The lower 16 bits are used to store the ECC bits, while the upper 16 bits
are used to store the ECC data chunk size.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 2c5a2e0..2837bc6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -633,6 +633,11 @@ struct nand_chip {
  * @options: stores various chip bit options
  * @id_len: The valid length of the @id.
  * @oobsize: OOB size
+ * @ecc_info: The ECC information.
+ *            lower 16 bits: store the ECC bits.
+ *            upper 16 bits: store the ECC data chunk size.
+ *            For example, the "4bit ECC for each 512Byte" can be set with
+ *            ECC_INFO(4, 512) macro.
  */
 struct nand_flash_dev {
 	char *name;
@@ -649,6 +654,11 @@ struct nand_flash_dev {
 	unsigned int options;
 	uint16_t id_len;
 	uint16_t oobsize;
+
+#define ECC_INFO(strength, size)	(((strength) << 16) | (size))
+#define ECC_STRENGTH(x)			(((x) >> 16) & 0xffff)
+#define ECC_SIZE(x)			((x) & 0xffff)
+	uint32_t ecc_info;
 };
 
 /**
-- 
1.7.1
