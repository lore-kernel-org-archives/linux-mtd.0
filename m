Received: from bay-bridge.veritas.com ([143.127.3.10]
	helo=MTVMIME01.enterprise.veritas.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGHAq-00040E-SU
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2005 08:54:29 -0500
To: greg@kroah.com
From: Amit S. Gud <gud@eth.net>
Date: Tue, 29 Mar 2005 19:29:53 +0530
Message-ID: <ITPXCHFE1572J674Mqb0000209d@itpxchfe1.enterprise.veritas.com>
Cc: linux-mtd@lists.infradead.org, joern@wh.fh-wedel.de, gud@eth.net
Subject: [PATCH 50/91] get rid of pci_find_{device,
	subsys} drivers/mtd/devices/pmc551.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace pci_find_{device,subsys} with pci_get_{device,subsys}.


Signed-off-by: Amit S. Gud <gud@eth.net>

---
--- orig-2.6.12-rc1/drivers/mtd/devices/pmc551.c	2005-03-15 21:01:45.000000000 +0530
+++ work-2.6.12-rc1/drivers/mtd/devices/pmc551.c	2005-03-28 13:28:42.125631824 +0530
@@ -680,10 +680,10 @@ static int __init init_pmc551(void)
          */
         for( count = 0; count < MAX_MTD_DEVICES; count++ ) {
 
-                if ((PCI_Device = pci_find_device(PCI_VENDOR_ID_V3_SEMI,
+                if ((PCI_Device = pci_get_device(PCI_VENDOR_ID_V3_SEMI,
                                                   PCI_DEVICE_ID_V3_SEMI_V370PDC,
 						  PCI_Device ) ) == NULL) {
-                        break;
+			goto dev_put;
                 }
 
                 printk(KERN_NOTICE "pmc551: Found PCI V370PDC at 0x%lX\n",
@@ -699,7 +699,7 @@ static int __init init_pmc551(void)
                  */
                 if((length = fixup_pmc551(PCI_Device)) <= 0) {
                         printk(KERN_NOTICE "pmc551: Cannot init SDRAM\n");
-                        break;
+                        goto dev_put;
                 }
 
 		/*
@@ -716,7 +716,7 @@ static int __init init_pmc551(void)
                 mtd = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
                 if (!mtd) {
                         printk(KERN_NOTICE "pmc551: Cannot allocate new MTD device.\n");
-                        break;
+                        goto dev_put;
                 }
 
                 memset(mtd, 0, sizeof(struct mtd_info));
@@ -725,7 +725,7 @@ static int __init init_pmc551(void)
                 if (!priv) {
                         printk(KERN_NOTICE "pmc551: Cannot allocate new MTD device.\n");
                         kfree(mtd);
-                        break;
+                        goto dev_put;
                 }
                 memset(priv, 0, sizeof(*priv));
                 mtd->priv = priv;
@@ -749,7 +749,7 @@ static int __init init_pmc551(void)
 			printk(KERN_NOTICE "pmc551: Unable to map IO space\n");
                         kfree(mtd->priv);
                         kfree(mtd);
-			break;
+			goto dev_put;
 		}
 
 #ifdef CONFIG_MTD_PMC551_DEBUG
@@ -786,7 +786,7 @@ static int __init init_pmc551(void)
 			iounmap(priv->start);
                         kfree(mtd->priv);
                         kfree(mtd);
-                        break;
+                        goto dev_put;
                 }
                 printk(KERN_NOTICE "Registered pmc551 memory device.\n");
                 printk(KERN_NOTICE "Mapped %dM of memory from 0x%p to 0x%p\n",
@@ -800,8 +800,12 @@ static int __init init_pmc551(void)
 		priv->nextpmc551 = pmc551list;
 		pmc551list = mtd;
 		found++;
+		pci_dev_put(PCI_Device);
         }
 
+  dev_put:
+	pci_dev_put(PCI_Device);
+
         if( !pmc551list ) {
                 printk(KERN_NOTICE "pmc551: not detected\n");
                 return -ENODEV;
