Received: from ug-out-1314.google.com ([66.249.92.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPgc8-0007g3-Fw
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 16:07:16 +0000
Received: by ug-out-1314.google.com with SMTP id 23so1029510ugr.45
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Feb 2008 08:07:07 -0800 (PST)
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH] cmdlinepart: Missing partition info is not an error
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Feb 2008 17:00:10 +0100
Message-ID: <87lk5nr0j9.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Peter Korsgaard <jacmet@gmail.com>
Cc: sr@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Return 0 partitions instead of -EINVAL on no mtdpart= argument in kernel
cmdline or missing partition info for device.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
Acked-by: Stefan Roese <sr@denx.de>
---
 drivers/mtd/cmdlinepart.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index b44292a..08b82c9 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -308,9 +308,6 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 	struct cmdline_mtd_partition *part;
 	char *mtd_id = master->name;
 
-	if(!cmdline)
-		return -EINVAL;
-
 	/* parse command line */
 	if (!cmdline_parsed)
 		mtdpart_setup_real(cmdline);
@@ -341,7 +338,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 			return part->num_parts;
 		}
 	}
-	return -EINVAL;
+	return 0;
 }
 
 
-- 
debian.1.5.3.7.1-dirty


-- 
Bye, Peter Korsgaard
