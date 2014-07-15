Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7AS0-0002wm-M7
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 21:39:53 +0000
From: Kamal Mostafa <kamal@canonical.com>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 kernel-team@lists.ubuntu.com
Subject: [PATCH 3.13 052/198] staging/mt29f_spinand: Terminate of match table
Date: Tue, 15 Jul 2014 14:28:42 -0700
Message-Id: <1405459868-15089-53-git-send-email-kamal@canonical.com>
In-Reply-To: <1405459868-15089-1-git-send-email-kamal@canonical.com>
References: <1405459868-15089-1-git-send-email-kamal@canonical.com>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kamal Mostafa <kamal@canonical.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-mtd@lists.infradead.org, Mona Anonuevo <manonuevo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

3.13.11.5 -stable review patch.  If anyone has any objections, please let me know.

------------------

From: Stephen Boyd <sboyd@codeaurora.org>

commit ffd07de65ef5315053ea16356cd533b7f47c17e9 upstream.

Failure to terminate this match table can lead to boot failures
depending on where the compiler places the match table.

Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Mona Anonuevo <manonuevo@micron.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Kamal Mostafa <kamal@canonical.com>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 51dbc13..5a40925 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -924,6 +924,7 @@ static int spinand_remove(struct spi_device *spi)
 
 static const struct of_device_id spinand_dt[] = {
 	{ .compatible = "spinand,mt29f", },
+	{}
 };
 
 /*
-- 
1.9.1
