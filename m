Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULGj-0007CU-NV
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:10 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so630582wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:09 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/43] mtd: intel_vr_nor.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:18 +0400
Message-Id: <1307549152-7085-10-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/intel_vr_nor.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index fd612c7..08c2396 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -44,7 +44,6 @@ struct vr_nor_mtd {
 	void __iomem *csr_base;
 	struct map_info map;
 	struct mtd_info *info;
-	int nr_parts;
 	struct pci_dev *dev;
 };
 
@@ -71,12 +70,9 @@ static void __devexit vr_nor_destroy_partitions(struct vr_nor_mtd *p)
 
 static int __devinit vr_nor_init_partitions(struct vr_nor_mtd *p)
 {
-	struct mtd_partition *parts;
-
 	/* register the flash bank */
 	/* partition the flash bank */
-	p->nr_parts = parse_mtd_partitions(p->info, NULL, &parts, 0);
-	return mtd_device_register(p->info, parts, p->nr_parts);
+	return mtd_device_parse_register(p->info, NULL, 0, NULL, 0);
 }
 
 static void __devexit vr_nor_destroy_mtd_setup(struct vr_nor_mtd *p)
-- 
1.7.4.4
