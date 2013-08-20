Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBf1X-0002FM-Mi
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 06:02:37 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH for mtd-utils 2/4] mtd: mtd-abi: add a helper to detect the
 nand type
Date: Tue, 20 Aug 2013 13:58:35 +0800
Message-ID: <1376978317-28010-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1376978317-28010-1-git-send-email-b32955@freescale.com>
References: <1376978317-28010-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The helper is for user applications, and it is just a copy of
the kernel helper: mtd_type_is_nand();

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/mtd/mtd-abi.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 4de167b..bcd7496 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -274,4 +274,9 @@ enum mtd_file_modes {
 	MTD_FILE_MODE_RAW,
 };
 
+static inline int mtd_type_is_nand_user(const struct mtd_info_user *mtd)
+{
+	return mtd->type == MTD_NANDFLASH || mtd->type == MTD_MLCNANDFLASH;
+}
+
 #endif /* __MTD_ABI_H__ */
-- 
1.7.1
