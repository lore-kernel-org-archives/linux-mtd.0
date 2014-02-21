Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGjWc-0003aB-Gn
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 06:23:55 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 2/5] mtd: nand: add fields for JEDEC in nand_chip
Date: Fri, 21 Feb 2014 13:39:38 +0800
Message-ID: <1392961181-20693-3-git-send-email-b32955@freescale.com>
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

Add the jedec_version field, and add an anonymous union which
contains the nand_onfi_params and nand_jedec_params.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 588f8a4..f9af756 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -590,8 +590,12 @@ struct nand_buffers {
  * @subpagesize:	[INTERN] holds the subpagesize
  * @onfi_version:	[INTERN] holds the chip ONFI version (BCD encoded),
  *			non 0 if ONFI supported.
+ * @jedec_version:	[INTERN] holds the chip JEDEC version (BCD encoded),
+ *			non 0 if JEDEC supported.
  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
  *			supported, 0 otherwise.
+ * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
+ *			supported, 0 otherwise.
  * @read_retries:	[INTERN] the number of read retry modes supported
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
@@ -664,7 +668,11 @@ struct nand_chip {
 	int badblockbits;
 
 	int onfi_version;
-	struct nand_onfi_params	onfi_params;
+	int jedec_version;
+	union {
+		struct nand_onfi_params	onfi_params;
+		struct nand_jedec_params jedec_params;
+	};
 
 	int read_retries;
 
-- 
1.7.2.rc3
