Received: from mail-db9lp0253.outbound.messaging.microsoft.com
 ([213.199.154.253] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwQFw-0003NS-F4
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 05:46:45 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 2/5] mtd: nand: add fields for JEDEC in nand_chip
Date: Fri, 27 Dec 2013 13:14:43 +0800
Message-ID: <1388121286-32620-3-git-send-email-b32955@freescale.com>
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

Add the jedec_version field, and add a anonymous union which
contains the nand_onfi_params and nand_jedec_params.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3dd27e8..13ae489 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -641,7 +641,11 @@ struct nand_chip {
 	int badblockbits;
 
 	int onfi_version;
-	struct nand_onfi_params	onfi_params;
+	int jedec_version;
+	union {
+		struct nand_onfi_params	onfi_params;
+		struct nand_jedec_params jedec_params;
+	};
 
 	flstate_t state;
 
-- 
1.7.2.rc3
