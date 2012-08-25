Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5BN3-0002Nh-5J
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 08:05:30 +0000
Received: by pbbrq8 with SMTP id rq8so4901617pbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 01:05:28 -0700 (PDT)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH v2] mtd: cmdlinepart: fix the wrong check condition
Date: Sat, 25 Aug 2012 16:06:50 -0400
Message-Id: <1345925210-7500-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The `mtd_id` is set by the name of a mtd device driver.

As a nand controller driver, even we do not set the @name of
the mtd_info{}, the nand_get_flash_type() will set it with
the nand type's name. So the `mtd_id` can never be NULL in this
case.

But as a nor controller driver which may does not call the
nand_get_flash_type(), there is a risk that the `mtd_id` becames NULL.

If the `mtd_id` is NULL, the check condition will be true.
If we accidentally set some partitions in the kernel command line,
just like:
          #gpmi-nand:20m(boot),20m(kernel),1g(rootfs),-(user)

The cmdlinepart may parses out several mtd partitions right now.
This is obviously wrong. We even do not enable the gpmi-nand in
this case.

The patch comes from Artem's suggestion code which is better then mine.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/cmdlinepart.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index fc960a3..216d751 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -322,13 +322,16 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 	struct cmdline_mtd_partition *part;
 	const char *mtd_id = master->name;
 
+	if (!mtd_id)
+		return 0;
+
 	/* parse command line */
 	if (!cmdline_parsed)
 		mtdpart_setup_real(cmdline);
 
 	for(part = partitions; part; part = part->next)
 	{
-		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
+		if (!strcmp(part->mtd_id, mtd_id))
 		{
 			for(i = 0, offset = 0; i < part->num_parts; i++)
 			{
-- 
1.7.4.4
