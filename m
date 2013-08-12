Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8kwJ-0006yT-25
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 05:45:12 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 08/10] mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
Date: Mon, 12 Aug 2013 13:42:51 +0800
Message-ID: <1376286173-12581-9-git-send-email-b32955@freescale.com>
In-Reply-To: <1376286173-12581-1-git-send-email-b32955@freescale.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
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

The current mtd_type_show() misses the MTD_MLCNANDFLASH case.
This patch adds the case for it.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/mtdcore.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6aa952b..c7cee29 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -157,6 +157,9 @@ static ssize_t mtd_type_show(struct device *dev,
 	case MTD_UBIVOLUME:
 		type = "ubi";
 		break;
+	case MTD_MLCNANDFLASH:
+		type = "MLC nand";
+		break;
 	default:
 		type = "unknown";
 	}
-- 
1.7.1
