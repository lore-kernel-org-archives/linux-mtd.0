Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TYlCI-0007Dt-Jc
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2012 22:12:40 +0000
Received: by mail-pb0-f49.google.com with SMTP id un15so644969pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2012 14:12:34 -0800 (PST)
From: Josh Radel <jradel@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/1] mtd: ofpart: Replicate mtd cmdline "lk" option with
 device tree "lock" property
Date: Wed, 14 Nov 2012 14:11:32 -0800
Message-Id: <1352931092-8916-1-git-send-email-jradel@gmail.com>
Cc: linux-mtd@lists.infradead.org, Josh Radel <jradel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd partition command line parser already supports a "lk" option to mask
MTD_POWERUP_LOCK. This extends that same functionality to device tree
partition specifications.

Signed-off-by: Josh Radel <jradel@gmail.com>
---
 drivers/mtd/ofpart.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index d9127e2..dbd3aa5 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -71,7 +71,10 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		(*pparts)[i].name = (char *)partname;
 
 		if (of_get_property(pp, "read-only", &len))
-			(*pparts)[i].mask_flags = MTD_WRITEABLE;
+			(*pparts)[i].mask_flags |= MTD_WRITEABLE;
+
+		if (of_get_property(pp, "lock", &len))
+			(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
 
 		i++;
 	}
-- 
1.7.9.5
