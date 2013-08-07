Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6y1a-0006IA-9d
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 07:19:14 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR5002EMGB5O0A0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 16:18:53 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 7/7] mtd: nand: mxc_nand: mark 'const' properly
Date: Wed, 07 Aug 2013 16:18:52 +0900
Message-id: <004701ce933e$5eea6c80$1cbf4580$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 'Artem Bityutskiy' <dedekind1@gmail.com>, Jingoo Han <jg1.han@samsung.com>,
 Roman Schneider <schneider@at.festo.com>, linux-mtd@lists.infradead.org,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The values pointed by the pointer are used as read-only.
Also, mtd_device_parse_register() uses 'part_probes[]' as
the second argument which is defined as 'const char * const *types'.
Thus, the 'const' should be moved to be after the '*'.

drivers/mtd/nand/mxc_nand.c:269:25: warning: duplicate const

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 0581bd3..1677d89 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -266,7 +266,7 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k = {
 	}
 };
 
-static const char const *part_probes[] = {
+static const char * const part_probes[] = {
 	"cmdlinepart", "RedBoot", "ofpart", NULL };
 
 static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
-- 
1.7.10.4
