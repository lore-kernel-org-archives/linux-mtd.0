Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2nFy-0004hX-8D
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2012 17:56:18 +0000
Received: by pbbrq8 with SMTP id rq8so5326707pbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 18 Aug 2012 10:56:15 -0700 (PDT)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: cmdlinepart: fix the wrong check condition
Date: Sun, 19 Aug 2012 01:57:29 -0400
Message-Id: <1345355849-8992-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the mtd_id is NULL, the check condition will be true.
So the cmdlinepart may parses out several mtd partitions.
This is obviously wrong.

Just fix it.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/cmdlinepart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index fc960a3..330b25f 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -328,7 +328,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 
 	for(part = partitions; part; part = part->next)
 	{
-		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
+		if (mtd_id && (!strcmp(part->mtd_id, mtd_id)))
 		{
 			for(i = 0, offset = 0; i < part->num_parts; i++)
 			{
-- 
1.7.4.4
