From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 12 Feb 2003 22:45:59 -0700
Subject: Q: MTD and NIC Roms...
Message-ID: <m3znp0zqaw.fsf@lnxi.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Currently I have a patch to eepro100.c that adds an MTD map driver so
the onboard rom can be written.  Making code like etherboot easier to
flash etc. 

This works by default except when everything is compiled into the
kernel.  In the latter case the map driver fails because NIC are
initialized before the mtd subsystem.  This can be handled be
modifying the link order of the kernel in 2.4. but that is not
a pretty situation.

I am currently looking for ideas on ways to cleanly get this code
into the kernel, and I am looking for ideas.  The map driver is
part of the eepro100 driver because it needs to share a lock or
multiple accesses to the same part of the chip by other parts of the
driver may cause problems.  Though looking at my code I cannot see it
now.

Anyway here is the diff with respect to the eepro100.c in 2.4.17,
suggestions on how to do this cleanly are welcome.

I think I might even have the bandwidth right now to do something
about it.

Eric


diff -uNrX linux-exclude-files linux-2.4.17-mtd/drivers/net/eepro100.c linux-2.4.17.eb-mtd2/drivers/net/eepro100.c
--- linux-2.4.17-mtd/drivers/net/eepro100.c	Fri Dec 21 10:41:54 2001
+++ linux-2.4.17.eb-mtd2/drivers/net/eepro100.c	Wed Jan  9 10:31:29 2002
@@ -116,6 +116,11 @@
 #include <linux/ethtool.h>
 #include <linux/delay.h>
 
+#ifdef CONFIG_MTD
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#endif
+
 MODULE_AUTHOR("Maintainer: Andrey V. Savochkin <saw@saw.sw.com.sg>");
 MODULE_DESCRIPTION("Intel i82557/i82558/i82559 PCI EtherExpressPro driver");
 MODULE_LICENSE("GPL");
@@ -286,7 +291,8 @@
 
 */
 
-static int speedo_found1(struct pci_dev *pdev, long ioaddr, int fnd_cnt, int acpi_idle_state);
+static int speedo_found1(struct pci_dev *pdev, long ioaddr, 
+	unsigned long romio_addr, int fnd_cnt, int acpi_idle_state);
 
 enum pci_flags_bit {
 	PCI_USES_IO=1, PCI_USES_MEM=2, PCI_USES_MASTER=4,
@@ -383,6 +389,10 @@
 	PortReset=0, PortSelfTest=1, PortPartialReset=2, PortDump=3,
 };
 
+enum SCBflash_states {
+	FlashDisable=2, FlashEnable=1,
+};
+
 /* The Speedo3 Rx and Tx frame/buffer descriptors. */
 struct descriptor {			    /* A generic descriptor. */
 	s32 cmd_status;				/* All command and status fields. */
@@ -502,6 +512,10 @@
 #ifdef CONFIG_PM
 	u32 pm_state[16];
 #endif
+#ifdef CONFIG_MTD
+	struct map_info map;
+	struct mtd_info *mtd;
+#endif
 };
 
 /* The parameters for a CmdConfigure operation.
@@ -556,6 +570,14 @@
 static void set_rx_mode(struct net_device *dev);
 static void speedo_show_state(struct net_device *dev);
 
+#ifdef CONFIG_MTD
+static u8 eepro100rom_read8(struct map_info *map, unsigned long ofs);
+static void eepro100rom_copy_from(struct map_info *map, void *to, 
+	unsigned long from, ssize_t len);
+static void eepro100rom_write8(struct map_info *map, u8 data, unsigned long ofs);
+static void eepro100rom_copy_to(struct map_info *map, unsigned long to, 	
+	const void *from, ssize_t len);
+#endif
 

 
 #ifdef honor_default_port
@@ -568,7 +590,7 @@
 static int __devinit eepro100_init_one (struct pci_dev *pdev,
 		const struct pci_device_id *ent)
 {
-	unsigned long ioaddr;
+	unsigned long ioaddr, romio_addr = 0;
 	int irq;
 	int acpi_idle_state = 0, pm;
 	static int cards_found /* = 0 */;
@@ -595,8 +617,8 @@
 		printk("Found Intel i82557 PCI Speedo at I/O %#lx, IRQ %d.\n",
 			   ioaddr, irq);
 #else
-	ioaddr = (unsigned long)ioremap(pci_resource_start(pdev, 0),
-									pci_resource_len(pdev, 0));
+	ioaddr = (unsigned long)ioremap(pci_resource_start(pdev, 0), 
+		pci_resource_len(pdev, 0));
 	if (!ioaddr) {
 		printk (KERN_ERR "eepro100: cannot remap MMIO region %lx @ %lx\n",
 				pci_resource_len(pdev, 0), pci_resource_start(pdev, 0));
@@ -607,6 +629,24 @@
 			   pci_resource_start(pdev, 0), irq);
 #endif
 
+#ifdef CONFIG_MTD
+	if (pci_resource_start(pdev, 2) == 0) {
+		pci_assign_resource(pdev, 2);
+	}
+	if ((pci_resource_start(pdev, 2) != 0) &&
+		(request_mem_region(
+			pci_resource_start(pdev, 2),
+			pci_resource_len(pdev, 2), 
+			"eepro100") != 0)) {
+		romio_addr = (unsigned long)ioremap(
+			pci_resource_start(pdev, 2),
+			pci_resource_len(pdev, 2));
+		printk(KERN_INFO "eepro100 Boot ROM enabled at 0x%08lx mapped at 0x%08lx\n", 
+			pci_resource_start(pdev, 2),
+			romio_addr);
+	}
+#endif
+
 	/* save power state b4 pci_enable_device overwrites it */
 	pm = pci_find_capability(pdev, PCI_CAP_ID_PM);
 	if (pm) {
@@ -616,18 +656,20 @@
 	}
 
 	if (pci_enable_device(pdev))
-		goto err_out_free_mmio_region;
+		goto err_out_iounmap;
 
 	pci_set_master(pdev);
 
-	if (speedo_found1(pdev, ioaddr, cards_found, acpi_idle_state) == 0)
+	if (speedo_found1(pdev, ioaddr, romio_addr, cards_found, acpi_idle_state) == 0)
 		cards_found++;
 	else
 		goto err_out_iounmap;
 
 	return 0;
 
-err_out_iounmap: ;
+err_out_iounmap: 
+	if (romio_addr) 
+		iounmap((void *)romio_addr);
 #ifndef USE_IO
 	iounmap ((void *)ioaddr);
 #endif
@@ -640,7 +682,7 @@
 }
 
 static int speedo_found1(struct pci_dev *pdev,
-		long ioaddr, int card_idx, int acpi_idle_state)
+	long ioaddr, unsigned long romio_addr, int card_idx, int acpi_idle_state)
 {
 	struct net_device *dev;
 	struct speedo_private *sp;
@@ -846,6 +888,34 @@
 	dev->set_multicast_list = &set_rx_mode;
 	dev->do_ioctl = &speedo_ioctl;
 
+#ifdef CONFIG_MTD
+	/* Enable Writes to the flash chpi */
+	outw(FlashEnable, ioaddr + SCBflash);
+
+	/* Now setup the data structures */
+	sp->map.name = "eepro100 rom";
+	sp->map.size = pci_resource_len(pdev, 2);
+	sp->map.buswidth = 1;
+	sp->map.read8 = eepro100rom_read8;
+	sp->map.copy_from = eepro100rom_copy_from;
+	sp->map.write8 = eepro100rom_write8;
+	sp->map.copy_to = eepro100rom_copy_to;
+	sp->map.map_priv_1 = romio_addr;
+	sp->mtd = 0;
+	if (romio_addr) {
+		sp->mtd = do_map_probe("jedec_probe", &sp->map);
+		if (!sp->mtd) {
+			sp->mtd = do_map_probe("map_rom", &sp->map);
+		}
+		if (sp->mtd) {
+			sp->mtd->module = THIS_MODULE;
+			add_mtd_device(sp->mtd);
+			printk(KERN_INFO "eepro100: found flash boot rom\n");
+		}
+	} else {
+		printk(KERN_NOTICE "eepro100: No boot rom address??\n");
+	}
+#endif /* CONFIG_MTD */
 	return 0;
 }
 

@@ -1834,7 +1904,7 @@
 	if (speedo_debug > 3)
 		speedo_show_state(dev);
 
-    /* Free all the skbuffs in the Rx and Tx queues. */
+	/* Free all the skbuffs in the Rx and Tx queues. */
 	for (i = 0; i < RX_RING_SIZE; i++) {
 		struct sk_buff *skb = sp->rx_skbuff[i];
 		sp->rx_skbuff[i] = 0;
@@ -2192,6 +2262,29 @@
 	sp->rx_mode = new_rx_mode;
 }
 

+#ifdef CONFIG_MTD
+static u8 eepro100rom_read8(struct map_info *map, unsigned long ofs)
+{
+	return readb(map->map_priv_1 + ofs);
+}
+
+static void eepro100rom_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+{
+	memcpy_fromio(to, map->map_priv_1 + from, len);
+}
+
+static void eepro100rom_write8(struct map_info *map, u8 data, unsigned long ofs)
+{
+	writeb(data, map->map_priv_1 + ofs);
+}
+
+static void eepro100rom_copy_to(struct map_info *map, unsigned long to, 
+	const void *from, ssize_t len)
+{
+	memcpy_toio(map->map_priv_1 + to, from, len);
+}
+#endif
+

 #ifdef CONFIG_PM
 static int eepro100_suspend(struct pci_dev *pdev, u32 state)
 {
@@ -2243,11 +2336,27 @@
 {
 	struct net_device *dev = pci_get_drvdata (pdev);
 	struct speedo_private *sp = (struct speedo_private *)dev->priv;
+	long ioaddr = dev->base_addr;
 	
 	unregister_netdev(dev);
 
+#ifdef CONFIG_MTD
+	if (sp->mtd) {
+		del_mtd_device(sp->mtd);
+		map_destroy(sp->mtd);
+		sp->mtd = 0;
+	}
+	/* Disable writes to the flash chip */
+	outw(FlashDisable, ioaddr + SCBflash);
+	release_mem_region(
+		pci_resource_start(pdev, 2), pci_resource_len(pdev, 2));
+	iounmap((void *)sp->map.map_priv_1);
+#endif 
+
+
 	release_region(pci_resource_start(pdev, 1), pci_resource_len(pdev, 1));
 	release_mem_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
+
 
 #ifndef USE_IO
 	iounmap((char *)dev->base_addr);
