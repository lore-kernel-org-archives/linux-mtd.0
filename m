Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xvn52-0003ND-Ks
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 13:01:28 +0000
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
To: Andrew Bresticker <abrestic@chromium.org>, Ionela Voinescu
 <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>, Brian
 Norris <computersforpeace@gmail.com>, <bpqw@micron.com>,
 <arnaud.mouiche@invoxia.com>, <frankliu@micron.com>
Subject: [PATCH 2/6] mtd: nand: Add JEDEC manufacturer ID for Gigadevice
Date: Tue, 2 Dec 2014 09:58:52 -0300
Message-ID: <1417525136-25731-3-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds Gigadevice to the list of manufacturer ID and name strings.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/mtd/nand/nand_ids.c | 1 +
 include/linux/mtd/nand.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index fbde8910..437196e 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -178,6 +178,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_EON, "Eon"},
 	{NAND_MFR_SANDISK, "SanDisk"},
 	{NAND_MFR_INTEL, "Intel"},
+	{NAND_MFR_GIGADEVICE, "Gigadevice"},
 	{0x0, "Unknown"}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e4d451e..a36fff1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -723,6 +723,7 @@ struct nand_chip {
 #define NAND_MFR_EON		0x92
 #define NAND_MFR_SANDISK	0x45
 #define NAND_MFR_INTEL		0x89
+#define NAND_MFR_GIGADEVICE	0xc8
 
 /* The maximum expected count of bytes in the NAND ID sequence */
 #define NAND_MAX_ID_LEN 8
-- 
2.1.0
