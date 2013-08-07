Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6xwP-000662-UY
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 07:13:54 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR500I55G2351C0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 16:13:33 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 3/7] mtd: nandsim: Staticize local symbols
Date: Wed, 07 Aug 2013 16:13:32 +0900
Message-id: <004201ce933d$a0019730$e004c590$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Akinobu Mita' <akinobu.mita@gmail.com>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These local symbols are used only in this file.
Fix the following sparse warnings:

drivers/mtd/nand/nandsim.c:1436:5: warning: symbol 'do_read_error' was not declared. Should it be static?
drivers/mtd/nand/nandsim.c:1448:6: warning: symbol 'do_bit_flips' was not declared. Should it be static?

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/nandsim.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 9e04de0..bdc1d15 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1433,7 +1433,7 @@ static inline u_char *NS_PAGE_BYTE_OFF(struct nandsim *ns)
 	return NS_GET_PAGE(ns)->byte + ns->regs.column + ns->regs.off;
 }
 
-int do_read_error(struct nandsim *ns, int num)
+static int do_read_error(struct nandsim *ns, int num)
 {
 	unsigned int page_no = ns->regs.row;
 
@@ -1445,7 +1445,7 @@ int do_read_error(struct nandsim *ns, int num)
 	return 0;
 }
 
-void do_bit_flips(struct nandsim *ns, int num)
+static void do_bit_flips(struct nandsim *ns, int num)
 {
 	if (bitflips && prandom_u32() < (1 << 22)) {
 		int flips = 1;
-- 
1.7.10.4
