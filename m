Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OTXqJ-0006k6-6T
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 10:15:04 +0000
Received: by fg-out-1718.google.com with SMTP id l26so454338fgb.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jun 2010 03:15:01 -0700 (PDT)
From: Kulikov Vasiliy <segooon@gmail.com>
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: [PATCH 01/25] r852: remove casts from void*
Date: Tue, 29 Jun 2010 14:14:57 +0400
Message-Id: <1277806498-30738-1-git-send-email-segooon@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/mtd/nand/r852.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 78a4232..c0a9835 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -64,8 +64,8 @@ static inline void r852_write_reg_dword(struct r852_device *dev,
 /* returns pointer to our private structure */
 static inline struct r852_device *r852_get_dev(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
-	return (struct r852_device *)chip->priv;
+	struct nand_chip *chip = mtd->priv;
+	return chip->priv;
 }
 
 
-- 
1.7.0.4
