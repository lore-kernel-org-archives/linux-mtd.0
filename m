Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Naxv8-0007kV-PD
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 20:58:33 +0000
Subject: [PATCHv3 4/9] mtd: Remove unnecessary comparisons with MAX_MTD_DEVICES
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain
Date: Fri, 29 Jan 2010 20:58:23 +0000
Message-Id: <1264798703.2785.32.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MAX_MTD_DEVICES is about to be removed.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/devices/pmc551.c |    4 ++--
 drivers/mtd/mtdchar.c        |    3 ---
 drivers/mtd/mtdoops.c        |    5 -----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index d2fd550..fc8ea0a 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -668,7 +668,7 @@ static int __init init_pmc551(void)
 {
 	struct pci_dev *PCI_Device = NULL;
 	struct mypriv *priv;
-	int count, found = 0;
+	int found = 0;
 	struct mtd_info *mtd;
 	u32 length = 0;
 
@@ -695,7 +695,7 @@ static int __init init_pmc551(void)
 	/*
 	 * PCU-bus chipset probe.
 	 */
-	for (count = 0; count < MAX_MTD_DEVICES; count++) {
+	for (;;) {
 
 		if ((PCI_Device = pci_get_device(PCI_VENDOR_ID_V3_SEMI,
 						  PCI_DEVICE_ID_V3_SEMI_V370PDC,
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 5b081cb..04fd7e5 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -67,9 +67,6 @@ static int mtd_open(struct inode *inode, struct file *file)
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MTD_open\n");
 
-	if (devnum >= MAX_MTD_DEVICES)
-		return -ENODEV;
-
 	/* You can't open the RO devices RW */
 	if ((file->f_mode & FMODE_WRITE) && (minor & 1))
 		return -EACCES;
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 92e12df..328313c 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -429,11 +429,6 @@ static int __init mtdoops_init(void)
 	mtd_index = simple_strtoul(mtddev, &endp, 0);
 	if (*endp == '\0')
 		cxt->mtd_index = mtd_index;
-	if (cxt->mtd_index > MAX_MTD_DEVICES) {
-		printk(KERN_ERR "mtdoops: invalid mtd device number (%u) given\n",
-				mtd_index);
-		return -EINVAL;
-	}
 
 	cxt->oops_buf = vmalloc(record_size);
 	if (!cxt->oops_buf) {
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
