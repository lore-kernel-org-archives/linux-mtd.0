Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=tx2outboundpool.messaging.microsoft.com)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBecF-0008UA-10
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 05:36:28 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH append fix] mtd: mtd-abi: add a helper to detect the nand type
Date: Tue, 20 Aug 2013 13:32:04 +0800
Message-ID: <1376976724-19071-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1376902777-24583-1-git-send-email-b32955@freescale.com>
References: <1376902777-24583-1-git-send-email-b32955@freescale.com>
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
If use the `bool`, we may meet the compiler error in the mtd-utils.

So change the return type from bool to int.

---
 include/uapi/mtd/mtd-abi.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 16a9406..66c2b0c 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -275,4 +275,9 @@ enum mtd_file_modes {
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
