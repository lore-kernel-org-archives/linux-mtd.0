Received: from smtp7.wanadoo.fr ([193.252.22.24])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CyX16-00079G-Cm
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 10:11:06 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0703.wanadoo.fr (SMTP Server) with ESMTP id 4FEA01000095
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 Feb 2005 16:10:45 +0100 (CET)
Received: from vodka.iomeda.fr (ARouen-106-1-34-221.w81-48.abo.wanadoo.fr
	[81.48.71.221])
	by mwinf0703.wanadoo.fr (SMTP Server) with ESMTP id E33E1100009E
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 Feb 2005 16:10:44 +0100 (CET)
Received: from rhum.iomeda.fr ([192.168.0.24] ident=mail)
	by vodka.iomeda.fr with esmtp (Exim 4.34) id 1CyX0l-0005fj-UK
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 16:10:44 +0100
Date: Tue, 8 Feb 2005 16:10:45 +0100
From: Christophe Lucas <c.lucas@ifrance.com>
To: kernel-janitors@lists.osdl.org
Message-ID: <20050208151045.GQ31996@rhum.iomeda.fr>
Mime-Version: 1.0
Content-Disposition: inline
Sender: Christophe Lucas <c.lucas@ifrance.com>
Content-Type: multipart/mixed; boundary="ceuyUbi+oA5bUa/n"
Cc: linux-mtd@lists.infradead.org
Subject: drivers/mtd/maps/*: convert to pci_register_driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ceuyUbi+oA5bUa/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--ceuyUbi+oA5bUa/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_mtd_maps.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/amd76xrom.c linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/amd76xrom.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c	2005-02-07 09:39:28.000000000 +0100
@@ -314,7 +314,7 @@ static int __init init_amd76xrom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&amd76xrom_driver);
+	return pci_register_driver(&amd76xrom_driver);
 #endif
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/ich2rom.c linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/ich2rom.c	2004-12-24 22:35:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c	2005-02-07 09:39:28.000000000 +0100
@@ -299,7 +299,7 @@ int __init init_ich2rom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&ich2rom_driver);
+	return pci_register_driver(&ich2rom_driver);
 #endif
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/ichxrom.c linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/ichxrom.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c	2005-02-07 09:39:28.000000000 +0100
@@ -366,7 +366,7 @@ static int __init init_ichxrom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&ichxrom_driver);
+	return pci_register_driver(&ichxrom_driver);
 #endif
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/pci.c linux-2.6.11-rc3/drivers/mtd/maps/pci.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/pci.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/pci.c	2005-02-07 09:39:28.000000000 +0100
@@ -370,7 +370,7 @@ static struct pci_driver mtd_pci_driver 
 
 static int __init mtd_pci_maps_init(void)
 {
-	return pci_module_init(&mtd_pci_driver);
+	return pci_register_driver(&mtd_pci_driver);
 }
 
 static void __exit mtd_pci_maps_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/scb2_flash.c linux-2.6.11-rc3/drivers/mtd/maps/scb2_flash.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/scb2_flash.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/scb2_flash.c	2005-02-07 09:39:28.000000000 +0100
@@ -238,7 +238,7 @@ static struct pci_driver scb2_flash_driv
 static int __init
 scb2_flash_init(void)
 {
-	return pci_module_init(&scb2_flash_driver);
+	return pci_register_driver(&scb2_flash_driver);
 }
 
 static void __exit

--ceuyUbi+oA5bUa/n--
