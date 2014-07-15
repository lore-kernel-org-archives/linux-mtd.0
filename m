Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7AIN-0007JO-QI
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 21:29:56 +0000
From: Kamal Mostafa <kamal@canonical.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Subject: [3.13.y.z extended stable] Patch "staging/mt29f_spinand: Terminate of
 match table" has been added to staging queue
Date: Tue, 15 Jul 2014 14:29:19 -0700
Message-Id: <1405459759-8622-1-git-send-email-kamal@canonical.com>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kamal Mostafa <kamal@canonical.com>, kernel-team@lists.ubuntu.com,
 linux-mtd@lists.infradead.org, Mona Anonuevo <manonuevo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a note to let you know that I have just added a patch titled

    staging/mt29f_spinand: Terminate of match table

to the linux-3.13.y-queue branch of the 3.13.y.z extended stable tree 
which can be found at:

 http://kernel.ubuntu.com/git?p=ubuntu/linux.git;a=shortlog;h=refs/heads/linux-3.13.y-queue

This patch is scheduled to be released in version 3.13.11.5.

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.13.y.z tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Kamal

------

>From a152e47d8af95e54e14648ac2e1b2db3b14f28c4 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <sboyd@codeaurora.org>
Date: Fri, 23 May 2014 17:16:53 -0700
Subject: staging/mt29f_spinand: Terminate of match table

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
