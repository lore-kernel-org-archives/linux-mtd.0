From: jerj@coplanar.net (Jeremy Jackson)
Date: 06 Mar 2003 15:20:53 -0500
Subject: Q: MTD and NIC Roms...
In-Reply-To: <m3znp0zqaw.fsf@lnxi.com>
References: <m3znp0zqaw.fsf@lnxi.com>
Message-ID: <1046982052.3713.6.camel@contact.skynet.coplanar.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-SlNl+AU9ngP78MtCnq3w
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2003-02-13 at 00:45, Eric W. Biederman wrote:
> Currently I have a patch to eepro100.c that adds an MTD map driver so
> the onboard rom can be written.  Making code like etherboot easier to
> flash etc. 
> 

> Anyway here is the diff with respect to the eepro100.c in 2.4.17,
> suggestions on how to do this cleanly are welcome.

Here it is diffed against 2.4.19.  I removed the local variable ioaddr
in eepro100_remove_one() because it caused a compile warning when
CONFIG_MTD was not set.

Did you have any mtd chip drivers to use with it?  I'm looking at
devbios now to port it's NOR flash chip drivers.

Regards,

Jeremy
-- 
Jeremy Jackson <jerj@coplanar.net>

--=-SlNl+AU9ngP78MtCnq3w
Content-Disposition: attachment; filename=mtd_eepro_2.4.19.diff
Content-Type: text/plain; name=mtd_eepro_2.4.19.diff; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- linux-2.4.19/drivers/net/eepro100.c.orig	2002-08-02 20:39:44.000000000 -0400
+++ linux-2.4.19/drivers/net/eepro100.c	2003-03-06 13:44:15.000000000 -0500
@@ -114,6 +114,12 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/ethtool.h>
+#include <linux/delay.h>
+
+#ifdef CONFIG_MTD
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#endif
 
 MODULE_AUTHOR("Maintainer: Andrey V. Savochkin <saw@saw.sw.com.sg>");
 MODULE_DESCRIPTION("Intel i82557/i82558/i82559 PCI EtherExpressPro driver");
@@ -278,7 +284,8 @@
 
 */
 
-static int speedo_found1(struct pci_dev *pdev, long ioaddr, int fnd_cnt, int acpi_idle_state);
+static int speedo_found1(struct pci_dev *pdev, long ioaddr, 
+	unsigned long romio_addr, int fnd_cnt, int acpi_idle_state);
 
 enum pci_flags_bit {
 	PCI_USES_IO=1, PCI_USES_MEM=2, PCI_USES_MASTER=4,
@@ -375,6 +382,10 @@
 	PortReset=0, PortSelfTest=1, PortPartialReset=2, PortDump=3,
 };
 
+enum SCBflash_states {
+	FlashDisable=2, FlashEnable=1,
+};
+
 /* The Speedo3 Rx and Tx frame/buffer descriptors. */
 struct descriptor {			    /* A generic descriptor. */
 	s32 cmd_status;				/* All command and status fields. */
@@ -494,6 +505,10 @@
 #ifdef CONFIG_PM
 	u32 pm_state[16];
 #endif
+#ifdef CONFIG_MTD
+	struct map_info map;
+	struct mtd_info *mtd;
+#endif
 };
 
 /* The parameters for a CmdConfigure operation.
@@ -546,6 +561,14 @@
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
@@ -558,7 +581,7 @@
 static int __devinit eepro100_init_one (struct pci_dev *pdev,
 		const struct pci_device_id *ent)
 {
-	unsigned long ioaddr;
+	unsigned long ioaddr, romio_addr = 0;
 	int irq;
 	int acpi_idle_state = 0, pm;
 	static int cards_found /* = 0 */;
@@ -598,8 +621,8 @@
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
@@ -610,15 +633,34 @@
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
@@ -631,7 +673,7 @@
 }
 
 static int __devinit speedo_found1(struct pci_dev *pdev,
-		long ioaddr, int card_idx, int acpi_idle_state)
+		long ioaddr, unsigned long romio_addr, int card_idx, int acpi_idle_state)
 {
 	struct net_device *dev;
 	struct speedo_private *sp;
@@ -842,6 +884,34 @@
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
 

@@ -2197,6 +2267,29 @@
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
@@ -2255,6 +2348,20 @@
 	
 	unregister_netdev(dev);
 
+#ifdef CONFIG_MTD
+	if (sp->mtd) {
+		del_mtd_device(sp->mtd);
+		map_destroy(sp->mtd);
+		sp->mtd = 0;
+	}
+	/* Disable writes to the flash chip */
+	outw(FlashDisable, dev->base_addr + SCBflash);
+	release_mem_region(
+		pci_resource_start(pdev, 2), pci_resource_len(pdev, 2));
+	iounmap((void *)sp->map.map_priv_1);
+#endif 
+
+
 	release_region(pci_resource_start(pdev, 1), pci_resource_len(pdev, 1));
 	release_mem_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 

--=-SlNl+AU9ngP78MtCnq3w--
