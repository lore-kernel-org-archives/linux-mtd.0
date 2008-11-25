Received: from smtp.movial.fi ([62.236.91.34])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1L4n79-000504-Iv
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:24 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 07/20] [MTD] Make h720x_mtd_init function static
Date: Tue, 25 Nov 2008 02:54:58 +0200
Message-Id: <1227574511-23879-8-git-send-email-dmitri.vorobiev@movial.fi>
In-Reply-To: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
References: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function h720x_mtd_init is not used outside of the file
drivers/mtd/maps/h720x-flash.c and can therefore become static.
This patch adds the necessary keyword.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/h720x-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/h720x-flash.c b/drivers/mtd/maps/h720x-flash.c
index 3b959fa..72c724f 100644
--- a/drivers/mtd/maps/h720x-flash.c
+++ b/drivers/mtd/maps/h720x-flash.c
@@ -65,7 +65,7 @@ static const char *probes[] = { "cmdlinepart", NULL };
 /*
  * Initialize FLASH support
  */
-int __init h720x_mtd_init(void)
+static int __init h720x_mtd_init(void)
 {
 
 	char	*part_type = NULL;
-- 
1.5.3
