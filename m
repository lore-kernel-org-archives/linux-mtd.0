Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FH-00074f-9J
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:36 +0000
Received: by wyb28 with SMTP id 28so928274wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:33 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 004/104] mtd: drop physmap_configure
Date: Thu,  2 Jun 2011 18:51:14 +0400
Message-Id: <1307026293-8535-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

physmap_configure() and physmap_set_partitions() have no users in kernel.
Out of kernel users should have been converted to regular platform device
long ago. Drop support for this obsolete API.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/Kconfig    |    6 ------
 drivers/mtd/maps/physmap.c  |   15 ---------------
 include/linux/mtd/physmap.h |   17 -----------------
 3 files changed, 0 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 11cc230..46eca3b 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -41,8 +41,6 @@ config MTD_PHYSMAP_START
 	  are mapped on your particular target board. Refer to the
 	  memory map which should hopefully be in the documentation for
 	  your board.
-	  Ignore this option if you use run-time physmap configuration
-	  (i.e., run-time calling physmap_configure()).
 
 config MTD_PHYSMAP_LEN
 	hex "Physical length of flash mapping"
@@ -55,8 +53,6 @@ config MTD_PHYSMAP_LEN
 	  than the total amount of flash present. Refer to the memory
 	  map which should hopefully be in the documentation for your
 	  board.
-	  Ignore this option if you use run-time physmap configuration
-	  (i.e., run-time calling physmap_configure()).
 
 config MTD_PHYSMAP_BANKWIDTH
 	int "Bank width in octets"
@@ -67,8 +63,6 @@ config MTD_PHYSMAP_BANKWIDTH
 	  in octets. For example, if you have a data bus width of 32
 	  bits, you would set the bus width octet value to 4. This is
 	  used internally by the CFI drivers.
-	  Ignore this option if you use run-time physmap configuration
-	  (i.e., run-time calling physmap_configure()).
 
 config MTD_PHYSMAP_OF
 	tristate "Flash device in physical memory map based on OF description"
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index f64cee4..2174d10 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -245,21 +245,6 @@ static struct platform_device physmap_flash = {
 	.num_resources	= 1,
 	.resource	= &physmap_flash_resource,
 };
-
-void physmap_configure(unsigned long addr, unsigned long size,
-		int bankwidth, void (*set_vpp)(struct map_info *, int))
-{
-	physmap_flash_resource.start = addr;
-	physmap_flash_resource.end = addr + size - 1;
-	physmap_flash_data.width = bankwidth;
-	physmap_flash_data.set_vpp = set_vpp;
-}
-
-void physmap_set_partitions(struct mtd_partition *parts, int num_parts)
-{
-	physmap_flash_data.nr_parts = num_parts;
-	physmap_flash_data.parts = parts;
-}
 #endif
 
 static int __init physmap_init(void)
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index d40bfa1..be4ed0d 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -31,21 +31,4 @@ struct physmap_flash_data {
 	struct mtd_partition	*parts;
 };
 
-/*
- * Board needs to specify the exact mapping during their setup time.
- */
-void physmap_configure(unsigned long addr, unsigned long size,
-		int bankwidth, void (*set_vpp)(struct map_info *, int) );
-
-/*
- * Machines that wish to do flash partition may want to call this function in
- * their setup routine.
- *
- *	physmap_set_partitions(mypartitions, num_parts);
- *
- * Note that one can always override this hard-coded partition with
- * command line partition (you need to enable CONFIG_MTD_CMDLINE_PARTS).
- */
-void physmap_set_partitions(struct mtd_partition *parts, int num_parts);
-
 #endif /* __LINUX_MTD_PHYSMAP__ */
-- 
1.7.4.4
