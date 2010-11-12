Received: from mail.perches.com ([173.55.12.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PH1K3-00063o-Pp
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2010 21:38:20 +0000
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>
Subject: [PATCH 07/14] drivers/mtd/maps: Use printf extension %pR for struct
	resource
Date: Fri, 12 Nov 2010 13:37:57 -0800
Message-Id: <5f4704a88f6e5bf55f19b4e6d8c7abce6ea20f71.1289597644.git.joe@perches.com>
In-Reply-To: <cover.1289597644.git.joe@perches.com>
References: <cover.1289597644.git.joe@perches.com>
Cc: Jim Cromie <jim.cromie@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using %pR standardizes the struct resource output.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/mtd/maps/amd76xrom.c       |    7 ++-----
 drivers/mtd/maps/ck804xrom.c       |    7 ++-----
 drivers/mtd/maps/esb2rom.c         |    9 +++------
 drivers/mtd/maps/ichxrom.c         |    9 +++------
 drivers/mtd/maps/physmap_of.c      |    4 +---
 drivers/mtd/maps/scx200_docflash.c |    5 ++---
 6 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/maps/amd76xrom.c b/drivers/mtd/maps/amd76xrom.c
index 19fe92d..77d64ce 100644
--- a/drivers/mtd/maps/amd76xrom.c
+++ b/drivers/mtd/maps/amd76xrom.c
@@ -149,11 +149,8 @@ static int __devinit amd76xrom_init_one (struct pci_dev *pdev,
 	if (request_resource(&iomem_resource, &window->rsrc)) {
 		window->rsrc.parent = NULL;
 		printk(KERN_ERR MOD_NAME
-			" %s(): Unable to register resource"
-			" 0x%.16llx-0x%.16llx - kernel bug?\n",
-			__func__,
-			(unsigned long long)window->rsrc.start,
-			(unsigned long long)window->rsrc.end);
+		       " %s(): Unable to register resource %pR - kernel bug?\n",
+		       __func__, &window->rsrc);
 	}
 
 
diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index ddb462b..5fdb7b2 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -178,11 +178,8 @@ static int __devinit ck804xrom_init_one (struct pci_dev *pdev,
 	if (request_resource(&iomem_resource, &window->rsrc)) {
 		window->rsrc.parent = NULL;
 		printk(KERN_ERR MOD_NAME
-			" %s(): Unable to register resource"
-			" 0x%.016llx-0x%.016llx - kernel bug?\n",
-			__func__,
-			(unsigned long long)window->rsrc.start,
-			(unsigned long long)window->rsrc.end);
+		       " %s(): Unable to register resource %pR - kernel bug?\n",
+			__func__, &window->rsrc);
 	}
 
 
diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index d12c93d..4feb750 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -242,12 +242,9 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 	window->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 	if (request_resource(&iomem_resource, &window->rsrc)) {
 		window->rsrc.parent = NULL;
-		printk(KERN_DEBUG MOD_NAME
-			": %s(): Unable to register resource"
-			" 0x%.08llx-0x%.08llx - kernel bug?\n",
-			__func__,
-			(unsigned long long)window->rsrc.start,
-			(unsigned long long)window->rsrc.end);
+		printk(KERN_DEBUG MOD_NAME ": "
+		       "%s(): Unable to register resource %pR - kernel bug?\n",
+			__func__, &window->rsrc);
 	}
 
 	/* Map the firmware hub into my address space. */
diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
index f102bf2..1337a41 100644
--- a/drivers/mtd/maps/ichxrom.c
+++ b/drivers/mtd/maps/ichxrom.c
@@ -175,12 +175,9 @@ static int __devinit ichxrom_init_one (struct pci_dev *pdev,
 	window->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 	if (request_resource(&iomem_resource, &window->rsrc)) {
 		window->rsrc.parent = NULL;
-		printk(KERN_DEBUG MOD_NAME
-			": %s(): Unable to register resource"
-			" 0x%.16llx-0x%.16llx - kernel bug?\n",
-			__func__,
-			(unsigned long long)window->rsrc.start,
-			(unsigned long long)window->rsrc.end);
+		printk(KERN_DEBUG MOD_NAME ": "
+		       "%s(): Unable to register resource %pR - kernel bug?\n",
+		       __func__, &window->rsrc);
 	}
 
 	/* Map the firmware hub into my address space. */
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 9861814..8506578 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -274,9 +274,7 @@ static int __devinit of_flash_probe(struct platform_device *dev,
 			continue;
 		}
 
-		dev_dbg(&dev->dev, "of_flash device: %.8llx-%.8llx\n",
-			(unsigned long long)res.start,
-			(unsigned long long)res.end);
+		dev_dbg(&dev->dev, "of_flash device: %pR\n", &res);
 
 		err = -EBUSY;
 		res_size = resource_size(&res);
diff --git a/drivers/mtd/maps/scx200_docflash.c b/drivers/mtd/maps/scx200_docflash.c
index b5391eb..027e628 100644
--- a/drivers/mtd/maps/scx200_docflash.c
+++ b/drivers/mtd/maps/scx200_docflash.c
@@ -166,9 +166,8 @@ static int __init init_scx200_docflash(void)
 		outl(pmr, scx200_cb_base + SCx200_PMR);
 	}
 
-       	printk(KERN_INFO NAME ": DOCCS mapped at 0x%llx-0x%llx, width %d\n",
-			(unsigned long long)docmem.start,
-			(unsigned long long)docmem.end, width);
+	printk(KERN_INFO NAME ": DOCCS mapped at %pR, width %d\n",
+	       &docmem, width);
 
 	scx200_docflash_map.size = size;
 	if (width == 8)
-- 
1.7.3.1.g432b3.dirty
