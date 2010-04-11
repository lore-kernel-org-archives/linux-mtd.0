From: linux@kbdbabel.org (Alexander Kurz)
Date: Sun, 11 Apr 2010 23:07:19 +0200
Subject: [PATCH 2/2] drivers/mtd/maps/pcmciamtd.c: coding style cleanups
Message-ID: <mailman.303.1271087477.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Alexander Kurz <linux@kbdbabel.org>
---
 drivers/mtd/maps/pcmciamtd.c |   55 +++++++++++++++++++++++++----------------
 1 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 2dbe939..0db1ac4 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -40,10 +40,7 @@ MODULE_PARM_DESC(debug, "Set Debug Level 0=quiet, 5=noisy");
 static const int debug = 0;
 #endif
 
-#define err(format, arg...) printk(KERN_ERR "pcmciamtd: " format "\n" , ## arg)
 #define info(format, arg...) printk(KERN_INFO "pcmciamtd: " format "\n" , ## arg)
-#define warn(format, arg...) printk(KERN_WARNING "pcmciamtd: " format "\n" , ## arg)
-
 
 #define DRIVER_DESC	"PCMCIA Flash memory card driver"
 
@@ -100,7 +97,9 @@ module_param(mem_type, int, 0);
 MODULE_PARM_DESC(mem_type, "Set Memory type (0=Flash, 1=RAM, 2=ROM, default=0)");
 
 
-/* read/write{8,16} copy_{from,to} routines with window remapping to access whole card */
+/* read/write{8,16} copy_{from,to} routines with window remapping
+ * to access whole card
+ */
 static caddr_t remap_window(struct map_info *map, unsigned long to)
 {
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
@@ -245,7 +244,8 @@ static map_word pcmcia_read8(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readb(win_base + ofs);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%02lx", ofs, win_base + ofs, d.x[0]);
+	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%02lx",
+	      ofs, win_base + ofs, d.x[0]);
 	return d;
 }
 
@@ -259,7 +259,8 @@ static map_word pcmcia_read16(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readw(win_base + ofs);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%04lx", ofs, win_base + ofs, d.x[0]);
+	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%04lx",
+	      ofs, win_base + ofs, d.x[0]);
 	return d;
 }
 
@@ -283,7 +284,8 @@ static void pcmcia_write8(struct map_info *map, map_word d, unsigned long adr)
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%02lx", adr, win_base + adr, d.x[0]);
+	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%02lx",
+	      adr, win_base + adr, d.x[0]);
 	writeb(d.x[0], win_base + adr);
 }
 
@@ -295,7 +297,8 @@ static void pcmcia_write16(struct map_info *map, map_word d, unsigned long adr)
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%04lx", adr, win_base + adr, d.x[0]);
+	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%04lx",
+	      adr, win_base + adr, d.x[0]);
 	writew(d.x[0], win_base + adr);
 }
 
@@ -376,7 +379,8 @@ static int pcmciamtd_cistpl_jedec(struct pcmcia_device *p_dev,
 	if (!pcmcia_parse_tuple(tuple, &parse)) {
 		cistpl_jedec_t *t = &parse.jedec;
 		for (i = 0; i < t->nid; i++)
-			DEBUG(2, "JEDEC: 0x%02x 0x%02x", t->id[i].mfr, t->id[i].info);
+			DEBUG(2, "JEDEC: 0x%02x 0x%02x",
+			      t->id[i].mfr, t->id[i].info);
 	}
 	return -ENOSPC;
 }
@@ -477,7 +481,8 @@ static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *p_dev
 	}
 
 	DEBUG(1, "Device: Size: %lu Width:%d Name: %s",
-	      dev->pcmcia_map.size, dev->pcmcia_map.bankwidth << 3, dev->mtd_name);
+	      dev->pcmcia_map.size,
+	      dev->pcmcia_map.bankwidth << 3, dev->mtd_name);
 }
 
 
@@ -513,9 +518,11 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	if(setvpp == 1)
 		dev->pcmcia_map.set_vpp = pcmciamtd_set_vpp;
 
-	/* Request a memory window for PCMCIA. Some architeures can map windows upto the maximum
-	   that PCMCIA can support (64MiB) - this is ideal and we aim for a window the size of the
-	   whole card - otherwise we try smaller windows until we succeed */
+	/* Request a memory window for PCMCIA. Some architeures can map windows
+	 * upto the maximum that PCMCIA can support (64MiB) - this is ideal and
+	 * we aim for a window the size of the whole card - otherwise we try
+	 * smaller windows until we succeed
+	 */
 
 	req.Attributes =  WIN_MEMORY_TYPE_CM | WIN_ENABLE;
 	req.Attributes |= (dev->pcmcia_map.bankwidth == 1) ? WIN_DATA_WIDTH_8 : WIN_DATA_WIDTH_16;
@@ -543,7 +550,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	DEBUG(2, "dev->win_size = %d", dev->win_size);
 
 	if(!dev->win_size) {
-		err("Cant allocate memory window");
+		dev_err(&dev->p_dev->dev, "Cannot allocate memory window\n");
 		pcmciamtd_release(link);
 		return -ENODEV;
 	}
@@ -553,7 +560,8 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	DEBUG(2, "window handle = 0x%8.8lx", (unsigned long)link->win);
 	dev->win_base = ioremap(req.Base, req.Size);
 	if(!dev->win_base) {
-		err("ioremap(%lu, %u) failed", req.Base, req.Size);
+		dev_err(&dev->p_dev->dev, "ioremap(%lu, %u) failed\n",
+			req.Base, req.Size);
 		pcmciamtd_release(link);
 		return -ENODEV;
 	}
@@ -600,7 +608,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	}
 
 	if(!mtd) {
-		DEBUG(1, "Cant find an MTD");
+		DEBUG(1, "Can not find an MTD");
 		pcmciamtd_release(link);
 		return -ENODEV;
 	}
@@ -611,8 +619,9 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	if(new_name) {
 		int size = 0;
 		char unit = ' ';
-		/* Since we are using a default name, make it better by adding in the
-		   size */
+		/* Since we are using a default name, make it better by adding
+		 * in the size
+		 */
 		if(mtd->size < 1048576) { /* <1MiB in size, show size in KiB */
 			size = mtd->size >> 10;
 			unit = 'K';
@@ -642,16 +651,17 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	if(add_mtd_device(mtd)) {
 		map_destroy(mtd);
 		dev->mtd_info = NULL;
-		err("Couldnt register MTD device");
+		dev_err(&dev->p_dev->dev,
+			"Could not register the MTD device\n");
 		pcmciamtd_release(link);
 		return -ENODEV;
 	}
 	snprintf(dev->node.dev_name, sizeof(dev->node.dev_name), "mtd%d", mtd->index);
-	info("mtd%d: %s", mtd->index, mtd->name);
+	dev_info(&dev->p_dev->dev, "mtd%d: %s\n", mtd->index, mtd->name);
 	link->dev_node = &dev->node;
 	return 0;
 
-	err("CS Error, exiting");
+	dev_err(&dev->p_dev->dev, "CS Error, exiting\n");
 	pcmciamtd_release(link);
 	return -ENODEV;
 }
@@ -691,7 +701,8 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
 	if(dev->mtd_info) {
 		del_mtd_device(dev->mtd_info);
 		map_destroy(dev->mtd_info);
-		info("mtd%d: Removed", dev->mtd_info->index);
+		dev_info(&dev->p_dev->dev, "mtd%d: Removed\n",
+			 dev->mtd_info->index);
 	}
 
 	pcmciamtd_release(link);
-- 
1.7.0
