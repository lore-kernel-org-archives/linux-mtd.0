Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OTXqe-0007sK-IS
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 10:15:25 +0000
Received: by fg-out-1718.google.com with SMTP id e12so687600fga.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jun 2010 03:15:24 -0700 (PDT)
From: Kulikov Vasiliy <segooon@gmail.com>
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: [PATCH 07/25] r852: remove casts from void*
Date: Tue, 29 Jun 2010 14:15:20 +0400
Message-Id: <1277806521-30942-1-git-send-email-segooon@gmail.com>
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
 drivers/mtd/nand/r852.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index c0a9835..43f0366 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -380,7 +380,7 @@ void r852_cmdctl(struct mtd_info *mtd, int dat, unsigned int ctrl)
  */
 int r852_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	struct r852_device *dev = (struct r852_device *)chip->priv;
+	struct r852_device *dev = chip->priv;
 
 	unsigned long timeout;
 	int status;
-- 
1.7.0.4
