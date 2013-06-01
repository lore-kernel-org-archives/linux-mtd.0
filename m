Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uig4k-0001eK-5u
 for linux-mtd@lists.infradead.org; Sat, 01 Jun 2013 07:18:07 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNP0066RDLDT2B0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Sat, 01 Jun 2013 16:17:37 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: mtdswap: replace strict_strtoul() with kstrtoul()
Date: Sat, 01 Jun 2013 16:17:37 +0900
Message-id: <000c01ce5e98$18483b70$48d8b250$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The usage of strict_strtoul() is not preferred, because
strict_strtoul() is obsolete. Thus, kstrtoul() should be
used.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/mtdswap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index c92f0f6..8b33b26 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1425,7 +1425,7 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		return;
 
 	while ((this_opt = strsep(&parts, ",")) != NULL) {
-		if (strict_strtoul(this_opt, 0, &part) < 0)
+		if (kstrtoul(this_opt, 0, &part) < 0)
 			return;
 
 		if (mtd->index == part)
-- 
1.7.10.4
