Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WC1f6-0008Ev-Ey
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2014 06:45:13 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 2/5] mtd: nand: add fields for JEDEC in nand_chip
Date: Sat, 8 Feb 2014 14:03:58 +0800
Message-ID: <1391839441-21006-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1391839441-21006-1-git-send-email-b32955@freescale.com>
References: <1391839441-21006-1-git-send-email-b32955@freescale.com>
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
 include/linux/mtd/nand.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 588f8a4..9686390 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -664,7 +664,11 @@ struct nand_chip {
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
