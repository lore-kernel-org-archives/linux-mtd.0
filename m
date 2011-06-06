Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvD-000737-CS
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:32 +0000
Received: by wwb39 with SMTP id 39so2799709wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:28 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/32] mtd: intel_vr_nor don't specify default parsing options
Date: Mon,  6 Jun 2011 13:15:55 +0400
Message-Id: <1307351782-7456-5-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
this in every driver, instead pass NULL to force parse_mtd_partitions
to use default.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/intel_vr_nor.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index d2f47be..fd612c7 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -72,11 +72,10 @@ static void __devexit vr_nor_destroy_partitions(struct vr_nor_mtd *p)
 static int __devinit vr_nor_init_partitions(struct vr_nor_mtd *p)
 {
 	struct mtd_partition *parts;
-	static const char *part_probes[] = { "cmdlinepart", NULL };
 
 	/* register the flash bank */
 	/* partition the flash bank */
-	p->nr_parts = parse_mtd_partitions(p->info, part_probes, &parts, 0);
+	p->nr_parts = parse_mtd_partitions(p->info, NULL, &parts, 0);
 	return mtd_device_register(p->info, parts, p->nr_parts);
 }
 
-- 
1.7.4.4
