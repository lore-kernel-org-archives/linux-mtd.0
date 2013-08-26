Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDtJJ-0001ec-PY
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2013 09:42:11 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 05/10] mtd: add more comment for
 MTD_NANDFLASH/MTD_MLCNANDFLASH
Date: Mon, 26 Aug 2013 17:36:43 +0800
Message-ID: <1377509808-29363-6-git-send-email-b32955@freescale.com>
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

In current code, the MTD_NANDFLASH is used to represent both the SLC and
MLC. It is confusing to us.

By adding an explicit comment about these two macros, this patch makes it
clear that:
	MTD_NANDFLASH    : stands for SLC nand,
	MTD_MLCNANDFLASH : stands for MLC nand(including TLC).

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/uapi/mtd/mtd-abi.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 36eace0..16a9406 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -94,10 +94,10 @@ struct mtd_write_req {
 #define MTD_RAM			1
 #define MTD_ROM			2
 #define MTD_NORFLASH		3
-#define MTD_NANDFLASH		4
+#define MTD_NANDFLASH		4	/* stand for SLC nand */
 #define MTD_DATAFLASH		6
 #define MTD_UBIVOLUME		7
-#define MTD_MLCNANDFLASH	8
+#define MTD_MLCNANDFLASH	8	/* stand for MLC nand(including TLC) */
 
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
-- 
1.7.1
