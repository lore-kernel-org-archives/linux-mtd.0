Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JfGNX-0004gv-Dr
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 15:20:28 +0000
Subject: [PATCH] ubi_create_gluebi: Initialize static volumes with
	vol->used_bytes
From: Jan Altenberg <jan.altenberg@linutronix.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 28 Mar 2008 16:13:53 +0100
Message-Id: <1206717233.5461.31.camel@jan-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I came across a problem which seems to be present since:

commit 941dfb07ed91451b1c58626a0d258dfdf468b593
UBI: set correct gluebi device size

ubi_create_gluebi() leaves mtd->size = 0 for static volumes. So even
existing static volumes are initialized with a size of 0.
See attached patch (applies on top of latest git).

Signed-off-by: Jan Altenberg <jan.altenberg@linutronix.de>

---
 drivers/mtd/ubi/gluebi.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/mtd/ubi/gluebi.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/gluebi.c
+++ linux-2.6/drivers/mtd/ubi/gluebi.c
@@ -291,11 +291,12 @@ int ubi_create_gluebi(struct ubi_device 
 	/*
 	 * In case of dynamic volume, MTD device size is just volume size. In
 	 * case of a static volume the size is equivalent to the amount of data
-	 * bytes, which is zero at this moment and will be changed after volume
-	 * update.
+	 * bytes.
 	 */
 	if (vol->vol_type == UBI_DYNAMIC_VOLUME)
 		mtd->size = vol->usable_leb_size * vol->reserved_pebs;
+	else
+		mtd->size = vol->used_bytes;
 
 	if (add_mtd_device(mtd)) {
 		ubi_err("cannot not add MTD device\n");
