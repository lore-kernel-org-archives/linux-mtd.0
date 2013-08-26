Received: from mail-db8lp0189.outbound.messaging.microsoft.com
 ([213.199.154.189] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDtJU-0001ev-Om
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2013 09:42:24 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 10/10] mtd: mtd-abi: add a helper to detect the nand type
Date: Mon, 26 Aug 2013 17:36:48 +0800
Message-ID: <1377509808-29363-11-git-send-email-b32955@freescale.com>
In-Reply-To: <1377509808-29363-1-git-send-email-b32955@freescale.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
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
