Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKbT8-0001EN-1g
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 16:41:22 +0000
Received: by wf-out-1314.google.com with SMTP id 28so10155932wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 08:41:21 -0800 (PST)
Sender: Bryan Wu <cooloney.lkml@gmail.com>
From: Bryan Wu <cooloney@kernel.org>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Blackfin NFC Driver: mark bf5xx_nand_add_partition() as
	__devinit
Date: Thu,  8 Jan 2009 00:41:58 +0800
Message-Id: <1231346519-28603-3-git-send-email-cooloney@kernel.org>
In-Reply-To: <1231346519-28603-1-git-send-email-cooloney@kernel.org>
References: <1231346519-28603-1-git-send-email-cooloney@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

the bf5xx_nand_add_partition() func is only called by __devinit
functions, so put it into the __devinit section as well

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 5c6056e..520314d 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -630,7 +630,7 @@ static int bf5xx_nand_hw_init(struct bf5xx_nand_info *info)
 /*
  * Device management interface
  */
-static int bf5xx_nand_add_partition(struct bf5xx_nand_info *info)
+static int __devinit bf5xx_nand_add_partition(struct bf5xx_nand_info *info)
 {
 	struct mtd_info *mtd = &info->mtd;
 
-- 
1.5.6
