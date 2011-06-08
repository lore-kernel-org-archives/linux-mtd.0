Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULGc-0007Bz-V8
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:04 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so531325wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:02 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/43] mtd: dc21285.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:14 +0400
Message-Id: <1307549152-7085-6-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/dc21285.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index 7a9e198..f43b365 100644
--- a/drivers/mtd/maps/dc21285.c
+++ b/drivers/mtd/maps/dc21285.c
@@ -145,14 +145,10 @@ static struct map_info dc21285_map = {
 
 
 /* Partition stuff */
-static struct mtd_partition *dc21285_parts;
 static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
 
 static int __init init_dc21285(void)
 {
-
-	int nrparts;
-
 	/* Determine bankwidth */
 	switch (*CSR_SA110_CNTL & (3<<14)) {
 		case SA110_CNTL_ROMWIDTH_8:
@@ -200,8 +196,7 @@ static int __init init_dc21285(void)
 
 	dc21285_mtd->owner = THIS_MODULE;
 
-	nrparts = parse_mtd_partitions(dc21285_mtd, probes, &dc21285_parts, 0);
-	mtd_device_register(dc21285_mtd, dc21285_parts, nrparts);
+	mtd_device_parse_register(dc21285_mtd, probes, 0, NULL, 0);
 
 	if(machine_is_ebsa285()) {
 		/*
@@ -224,8 +219,6 @@ static int __init init_dc21285(void)
 static void __exit cleanup_dc21285(void)
 {
 	mtd_device_unregister(dc21285_mtd);
-	if (dc21285_parts)
-		kfree(dc21285_parts);
 	map_destroy(dc21285_mtd);
 	iounmap(dc21285_map.virt);
 }
-- 
1.7.4.4
