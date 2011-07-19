Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDlr-0004Sz-U3
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:53 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 06/11] mtd: pcmciamtd: remove custom DEBUG() function
Date: Tue, 19 Jul 2011 10:06:11 -0700
Message-ID: <1311095176-5407-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
References: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't need a custom DEBUG() macro here. Just use the built-in kernel
code with dynamic debugging features.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/maps/pcmciamtd.c |  120 ++++++++++++++++++------------------------
 1 files changed, 52 insertions(+), 68 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index bbe168b..afa9bd8 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -22,22 +22,6 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 
-#ifdef CONFIG_MTD_DEBUG
-static int debug = CONFIG_MTD_DEBUG_VERBOSE;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Set Debug Level 0=quiet, 5=noisy");
-#undef DEBUG
-#define DEBUG(n, format, arg...) \
-	if (n <= debug) {	 \
-		printk(KERN_DEBUG __FILE__ ":%s(): " format "\n", __func__ , ## arg); \
-	}
-
-#else
-#undef DEBUG
-#define DEBUG(n, arg...)
-static const int debug = 0;
-#endif
-
 #define info(format, arg...) printk(KERN_INFO "pcmciamtd: " format "\n" , ## arg)
 
 #define DRIVER_DESC	"PCMCIA Flash memory card driver"
@@ -105,13 +89,13 @@ static caddr_t remap_window(struct map_info *map, unsigned long to)
 	int ret;
 
 	if (!pcmcia_dev_present(dev->p_dev)) {
-		DEBUG(1, "device removed");
+		pr_debug("device removed\n");
 		return 0;
 	}
 
 	offset = to & ~(dev->win_size-1);
 	if (offset != dev->offset) {
-		DEBUG(2, "Remapping window from 0x%8.8x to 0x%8.8x",
+		pr_debug("Remapping window from 0x%8.8x to 0x%8.8x\n",
 		      dev->offset, offset);
 		ret = pcmcia_map_mem_page(dev->p_dev, win, offset);
 		if (ret != 0)
@@ -132,7 +116,7 @@ static map_word pcmcia_read8_remap(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readb(addr);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%02lx", ofs, addr, d.x[0]);
+	pr_debug("ofs = 0x%08lx (%p) data = 0x%02lx\n", ofs, addr, d.x[0]);
 	return d;
 }
 
@@ -147,7 +131,7 @@ static map_word pcmcia_read16_remap(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readw(addr);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%04lx", ofs, addr, d.x[0]);
+	pr_debug("ofs = 0x%08lx (%p) data = 0x%04lx\n", ofs, addr, d.x[0]);
 	return d;
 }
 
@@ -157,7 +141,7 @@ static void pcmcia_copy_from_remap(struct map_info *map, void *to, unsigned long
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
 	unsigned long win_size = dev->win_size;
 
-	DEBUG(3, "to = %p from = %lu len = %zd", to, from, len);
+	pr_debug("to = %p from = %lu len = %zd\n", to, from, len);
 	while(len) {
 		int toread = win_size - (from & (win_size-1));
 		caddr_t addr;
@@ -169,7 +153,7 @@ static void pcmcia_copy_from_remap(struct map_info *map, void *to, unsigned long
 		if(!addr)
 			return;
 
-		DEBUG(4, "memcpy from %p to %p len = %d", addr, to, toread);
+		pr_debug("memcpy from %p to %p len = %d\n", addr, to, toread);
 		memcpy_fromio(to, addr, toread);
 		len -= toread;
 		to += toread;
@@ -185,7 +169,7 @@ static void pcmcia_write8_remap(struct map_info *map, map_word d, unsigned long
 	if(!addr)
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%02lx", adr, addr, d.x[0]);
+	pr_debug("adr = 0x%08lx (%p)  data = 0x%02lx\n", adr, addr, d.x[0]);
 	writeb(d.x[0], addr);
 }
 
@@ -196,7 +180,7 @@ static void pcmcia_write16_remap(struct map_info *map, map_word d, unsigned long
 	if(!addr)
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%04lx", adr, addr, d.x[0]);
+	pr_debug("adr = 0x%08lx (%p)  data = 0x%04lx\n", adr, addr, d.x[0]);
 	writew(d.x[0], addr);
 }
 
@@ -206,7 +190,7 @@ static void pcmcia_copy_to_remap(struct map_info *map, unsigned long to, const v
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
 	unsigned long win_size = dev->win_size;
 
-	DEBUG(3, "to = %lu from = %p len = %zd", to, from, len);
+	pr_debug("to = %lu from = %p len = %zd\n", to, from, len);
 	while(len) {
 		int towrite = win_size - (to & (win_size-1));
 		caddr_t addr;
@@ -218,7 +202,7 @@ static void pcmcia_copy_to_remap(struct map_info *map, unsigned long to, const v
 		if(!addr)
 			return;
 
-		DEBUG(4, "memcpy from %p to %p len = %d", from, addr, towrite);
+		pr_debug("memcpy from %p to %p len = %d\n", from, addr, towrite);
 		memcpy_toio(addr, from, towrite);
 		len -= towrite;
 		to += towrite;
@@ -240,7 +224,7 @@ static map_word pcmcia_read8(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readb(win_base + ofs);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%02lx",
+	pr_debug("ofs = 0x%08lx (%p) data = 0x%02lx\n",
 	      ofs, win_base + ofs, d.x[0]);
 	return d;
 }
@@ -255,7 +239,7 @@ static map_word pcmcia_read16(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readw(win_base + ofs);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%04lx",
+	pr_debug("ofs = 0x%08lx (%p) data = 0x%04lx\n",
 	      ofs, win_base + ofs, d.x[0]);
 	return d;
 }
@@ -268,7 +252,7 @@ static void pcmcia_copy_from(struct map_info *map, void *to, unsigned long from,
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "to = %p from = %lu len = %zd", to, from, len);
+	pr_debug("to = %p from = %lu len = %zd\n", to, from, len);
 	memcpy_fromio(to, win_base + from, len);
 }
 
@@ -280,7 +264,7 @@ static void pcmcia_write8(struct map_info *map, map_word d, unsigned long adr)
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%02lx",
+	pr_debug("adr = 0x%08lx (%p)  data = 0x%02lx\n",
 	      adr, win_base + adr, d.x[0]);
 	writeb(d.x[0], win_base + adr);
 }
@@ -293,7 +277,7 @@ static void pcmcia_write16(struct map_info *map, map_word d, unsigned long adr)
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%04lx",
+	pr_debug("adr = 0x%08lx (%p)  data = 0x%04lx\n",
 	      adr, win_base + adr, d.x[0]);
 	writew(d.x[0], win_base + adr);
 }
@@ -306,7 +290,7 @@ static void pcmcia_copy_to(struct map_info *map, unsigned long to, const void *f
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "to = %lu from = %p len = %zd", to, from, len);
+	pr_debug("to = %lu from = %p len = %zd\n", to, from, len);
 	memcpy_toio(win_base + to, from, len);
 }
 
@@ -316,7 +300,7 @@ static void pcmciamtd_set_vpp(struct map_info *map, int on)
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
 	struct pcmcia_device *link = dev->p_dev;
 
-	DEBUG(2, "dev = %p on = %d vpp = %d\n", dev, on, dev->vpp);
+	pr_debug("dev = %p on = %d vpp = %d\n\n", dev, on, dev->vpp);
 	pcmcia_fixup_vpp(link, on ? dev->vpp : 0);
 }
 
@@ -325,7 +309,7 @@ static void pcmciamtd_release(struct pcmcia_device *link)
 {
 	struct pcmciamtd_dev *dev = link->priv;
 
-	DEBUG(3, "link = 0x%p", link);
+	pr_debug("link = 0x%p\n", link);
 
 	if (link->resource[2]->end) {
 		if(dev->win_base) {
@@ -347,7 +331,7 @@ static int pcmciamtd_cistpl_format(struct pcmcia_device *p_dev,
 	if (!pcmcia_parse_tuple(tuple, &parse)) {
 		cistpl_format_t *t = &parse.format;
 		(void)t; /* Shut up, gcc */
-		DEBUG(2, "Format type: %u, Error Detection: %u, offset = %u, length =%u",
+		pr_debug("Format type: %u, Error Detection: %u, offset = %u, length =%u\n",
 			t->type, t->edc, t->offset, t->length);
 	}
 	return -ENOSPC;
@@ -363,7 +347,7 @@ static int pcmciamtd_cistpl_jedec(struct pcmcia_device *p_dev,
 	if (!pcmcia_parse_tuple(tuple, &parse)) {
 		cistpl_jedec_t *t = &parse.jedec;
 		for (i = 0; i < t->nid; i++)
-			DEBUG(2, "JEDEC: 0x%02x 0x%02x",
+			pr_debug("JEDEC: 0x%02x 0x%02x\n",
 			      t->id[i].mfr, t->id[i].info);
 	}
 	return -ENOSPC;
@@ -382,14 +366,14 @@ static int pcmciamtd_cistpl_device(struct pcmcia_device *p_dev,
 	if (pcmcia_parse_tuple(tuple, &parse))
 		return -EINVAL;
 
-	DEBUG(2, "Common memory:");
+	pr_debug("Common memory:\n");
 	dev->pcmcia_map.size = t->dev[0].size;
 	/* from here on: DEBUG only */
 	for (i = 0; i < t->ndev; i++) {
-		DEBUG(2, "Region %d, type = %u", i, t->dev[i].type);
-		DEBUG(2, "Region %d, wp = %u", i, t->dev[i].wp);
-		DEBUG(2, "Region %d, speed = %u ns", i, t->dev[i].speed);
-		DEBUG(2, "Region %d, size = %u bytes", i, t->dev[i].size);
+		pr_debug("Region %d, type = %u\n", i, t->dev[i].type);
+		pr_debug("Region %d, wp = %u\n", i, t->dev[i].wp);
+		pr_debug("Region %d, speed = %u ns\n", i, t->dev[i].speed);
+		pr_debug("Region %d, size = %u bytes\n", i, t->dev[i].size);
 	}
 	return 0;
 }
@@ -409,12 +393,12 @@ static int pcmciamtd_cistpl_geo(struct pcmcia_device *p_dev,
 	dev->pcmcia_map.bankwidth = t->geo[0].buswidth;
 	/* from here on: DEBUG only */
 	for (i = 0; i < t->ngeo; i++) {
-		DEBUG(2, "region: %d bankwidth = %u", i, t->geo[i].buswidth);
-		DEBUG(2, "region: %d erase_block = %u", i, t->geo[i].erase_block);
-		DEBUG(2, "region: %d read_block = %u", i, t->geo[i].read_block);
-		DEBUG(2, "region: %d write_block = %u", i, t->geo[i].write_block);
-		DEBUG(2, "region: %d partition = %u", i, t->geo[i].partition);
-		DEBUG(2, "region: %d interleave = %u", i, t->geo[i].interleave);
+		pr_debug("region: %d bankwidth = %u\n", i, t->geo[i].buswidth);
+		pr_debug("region: %d erase_block = %u\n", i, t->geo[i].erase_block);
+		pr_debug("region: %d read_block = %u\n", i, t->geo[i].read_block);
+		pr_debug("region: %d write_block = %u\n", i, t->geo[i].write_block);
+		pr_debug("region: %d partition = %u\n", i, t->geo[i].partition);
+		pr_debug("region: %d interleave = %u\n", i, t->geo[i].interleave);
 	}
 	return 0;
 }
@@ -432,7 +416,7 @@ static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *p_dev
 			if (p_dev->prod_id[i])
 				strcat(dev->mtd_name, p_dev->prod_id[i]);
 		}
-		DEBUG(2, "Found name: %s", dev->mtd_name);
+		pr_debug("Found name: %s\n", dev->mtd_name);
 	}
 
 #ifdef CONFIG_MTD_DEBUG
@@ -450,12 +434,12 @@ static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *p_dev
 
 	if(force_size) {
 		dev->pcmcia_map.size = force_size << 20;
-		DEBUG(2, "size forced to %dM", force_size);
+		pr_debug("size forced to %dM\n", force_size);
 	}
 
 	if(bankwidth) {
 		dev->pcmcia_map.bankwidth = bankwidth;
-		DEBUG(2, "bankwidth forced to %d", bankwidth);
+		pr_debug("bankwidth forced to %d\n", bankwidth);
 	}
 
 	dev->pcmcia_map.name = dev->mtd_name;
@@ -464,7 +448,7 @@ static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *p_dev
 		*new_name = 1;
 	}
 
-	DEBUG(1, "Device: Size: %lu Width:%d Name: %s",
+	pr_debug("Device: Size: %lu Width:%d Name: %s\n",
 	      dev->pcmcia_map.size,
 	      dev->pcmcia_map.bankwidth << 3, dev->mtd_name);
 }
@@ -479,7 +463,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	static char *probes[] = { "jedec_probe", "cfi_probe" };
 	int new_name = 0;
 
-	DEBUG(3, "link=0x%p", link);
+	pr_debug("link=0x%p\n", link);
 
 	card_settings(dev, link, &new_name);
 
@@ -512,11 +496,11 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 
 	do {
 		int ret;
-		DEBUG(2, "requesting window with size = %luKiB memspeed = %d",
+		pr_debug("requesting window with size = %luKiB memspeed = %d\n",
 			(unsigned long) resource_size(link->resource[2]) >> 10,
 			mem_speed);
 		ret = pcmcia_request_window(link, link->resource[2], mem_speed);
-		DEBUG(2, "ret = %d dev->win_size = %d", ret, dev->win_size);
+		pr_debug("ret = %d dev->win_size = %d\n", ret, dev->win_size);
 		if(ret) {
 			j++;
 			link->resource[2]->start = 0;
@@ -524,21 +508,21 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 					force_size << 20 : MAX_PCMCIA_ADDR;
 			link->resource[2]->end >>= j;
 		} else {
-			DEBUG(2, "Got window of size %luKiB", (unsigned long)
+			pr_debug("Got window of size %luKiB\n", (unsigned long)
 				resource_size(link->resource[2]) >> 10);
 			dev->win_size = resource_size(link->resource[2]);
 			break;
 		}
 	} while (link->resource[2]->end >= 0x1000);
 
-	DEBUG(2, "dev->win_size = %d", dev->win_size);
+	pr_debug("dev->win_size = %d\n", dev->win_size);
 
 	if(!dev->win_size) {
 		dev_err(&dev->p_dev->dev, "Cannot allocate memory window\n");
 		pcmciamtd_release(link);
 		return -ENODEV;
 	}
-	DEBUG(1, "Allocated a window of %dKiB", dev->win_size >> 10);
+	pr_debug("Allocated a window of %dKiB\n", dev->win_size >> 10);
 
 	/* Get write protect status */
 	dev->win_base = ioremap(link->resource[2]->start,
@@ -549,7 +533,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 		pcmciamtd_release(link);
 		return -ENODEV;
 	}
-	DEBUG(1, "mapped window dev = %p @ %pR, base = %p",
+	pr_debug("mapped window dev = %p @ %pR, base = %p\n",
 	      dev, link->resource[2], dev->win_base);
 
 	dev->offset = 0;
@@ -564,7 +548,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	}
 
 	link->config_index = 0;
-	DEBUG(2, "Setting Configuration");
+	pr_debug("Setting Configuration\n");
 	ret = pcmcia_enable_device(link);
 	if (ret != 0) {
 		if (dev->win_base) {
@@ -580,17 +564,17 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 		mtd = do_map_probe("map_rom", &dev->pcmcia_map);
 	} else {
 		for(i = 0; i < ARRAY_SIZE(probes); i++) {
-			DEBUG(1, "Trying %s", probes[i]);
+			pr_debug("Trying %s\n", probes[i]);
 			mtd = do_map_probe(probes[i], &dev->pcmcia_map);
 			if(mtd)
 				break;
 
-			DEBUG(1, "FAILED: %s", probes[i]);
+			pr_debug("FAILED: %s\n", probes[i]);
 		}
 	}
 
 	if(!mtd) {
-		DEBUG(1, "Can not find an MTD");
+		pr_debug("Can not find an MTD\n");
 		pcmciamtd_release(link);
 		return -ENODEV;
 	}
@@ -617,7 +601,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	/* If the memory found is fits completely into the mapped PCMCIA window,
 	   use the faster non-remapping read/write functions */
 	if(mtd->size <= dev->win_size) {
-		DEBUG(1, "Using non remapping memory functions");
+		pr_debug("Using non remapping memory functions\n");
 		dev->pcmcia_map.map_priv_2 = (unsigned long)dev->win_base;
 		if (dev->pcmcia_map.bankwidth == 1) {
 			dev->pcmcia_map.read = pcmcia_read8;
@@ -645,7 +629,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 
 static int pcmciamtd_suspend(struct pcmcia_device *dev)
 {
-	DEBUG(2, "EVENT_PM_RESUME");
+	pr_debug("EVENT_PM_RESUME\n");
 
 	/* get_lock(link); */
 
@@ -654,7 +638,7 @@ static int pcmciamtd_suspend(struct pcmcia_device *dev)
 
 static int pcmciamtd_resume(struct pcmcia_device *dev)
 {
-	DEBUG(2, "EVENT_PM_SUSPEND");
+	pr_debug("EVENT_PM_SUSPEND\n");
 
 	/* free_lock(link); */
 
@@ -666,7 +650,7 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
 {
 	struct pcmciamtd_dev *dev = link->priv;
 
-	DEBUG(3, "link=0x%p", link);
+	pr_debug("link=0x%p\n", link);
 
 	if(dev->mtd_info) {
 		mtd_device_unregister(dev->mtd_info);
@@ -686,7 +670,7 @@ static int pcmciamtd_probe(struct pcmcia_device *link)
 	/* Create new memory card device */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev) return -ENOMEM;
-	DEBUG(1, "dev=0x%p", dev);
+	pr_debug("dev=0x%p\n", dev);
 
 	dev->p_dev = link;
 	link->priv = dev;
@@ -755,7 +739,7 @@ static int __init init_pcmciamtd(void)
 
 static void __exit exit_pcmciamtd(void)
 {
-	DEBUG(1, DRIVER_DESC " unloading");
+	pr_debug(DRIVER_DESC " unloading");
 	pcmcia_unregister_driver(&pcmciamtd_driver);
 }
 
-- 
1.7.0.4
