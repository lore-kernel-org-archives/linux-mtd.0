Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnzeM-000501-TE
 for linux-mtd@lists.infradead.org; Sat, 24 May 2014 00:17:23 +0000
From: Stephen Boyd <sboyd@codeaurora.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging/mt29f_spinand: Terminate of match table
Date: Fri, 23 May 2014 17:16:53 -0700
Message-Id: <1400890613-5704-5-git-send-email-sboyd@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Mona Anonuevo <manonuevo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Failure to terminate this match table can lead to boot failures
depending on where the compiler places the match table.

Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Mona Anonuevo <manonuevo@micron.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 51dbc13e757f..5a40925680ac 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -924,6 +924,7 @@ static int spinand_remove(struct spi_device *spi)
 
 static const struct of_device_id spinand_dt[] = {
 	{ .compatible = "spinand,mt29f", },
+	{}
 };
 
 /*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
