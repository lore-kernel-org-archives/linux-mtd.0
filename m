Received: from coderock.org ([193.77.147.115] helo=trashy.coderock.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D7tHV-0005JP-37
	for linux-mtd@lists.infradead.org; Sun, 06 Mar 2005 05:46:42 -0500
To: dwmw2@infradead.org
From: domen@coderock.org
Date: Sun, 06 Mar 2005 11:46:26 +0100
Message-Id: <20050306104627.13DB31F203@trashy.coderock.org>
Cc: c.lucas@ifrance.com, linux-mtd@lists.infradead.org, domen@coderock.org
Subject: [patch 1/1] drivers/mtd/maps/*: convert to pci_register_driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
Signed-off-by: Domen Puncer <domen@coderock.org>
---


 kj-domen/drivers/mtd/maps/amd76xrom.c  |    2 +-
 kj-domen/drivers/mtd/maps/ich2rom.c    |    2 +-
 kj-domen/drivers/mtd/maps/ichxrom.c    |    2 +-
 kj-domen/drivers/mtd/maps/pci.c        |    2 +-
 kj-domen/drivers/mtd/maps/scb2_flash.c |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff -puN drivers/mtd/maps/amd76xrom.c~pci_register_driver-drivers_mtd_maps drivers/mtd/maps/amd76xrom.c
--- kj/drivers/mtd/maps/amd76xrom.c~pci_register_driver-drivers_mtd_maps	2005-03-05 16:12:31.000000000 +0100
+++ kj-domen/drivers/mtd/maps/amd76xrom.c	2005-03-05 16:12:31.000000000 +0100
@@ -314,7 +314,7 @@ static int __init init_amd76xrom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&amd76xrom_driver);
+	return pci_register_driver(&amd76xrom_driver);
 #endif
 }
 
diff -puN drivers/mtd/maps/ich2rom.c~pci_register_driver-drivers_mtd_maps drivers/mtd/maps/ich2rom.c
--- kj/drivers/mtd/maps/ich2rom.c~pci_register_driver-drivers_mtd_maps	2005-03-05 16:12:31.000000000 +0100
+++ kj-domen/drivers/mtd/maps/ich2rom.c	2005-03-05 16:12:31.000000000 +0100
@@ -299,7 +299,7 @@ int __init init_ich2rom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&ich2rom_driver);
+	return pci_register_driver(&ich2rom_driver);
 #endif
 }
 
diff -puN drivers/mtd/maps/ichxrom.c~pci_register_driver-drivers_mtd_maps drivers/mtd/maps/ichxrom.c
--- kj/drivers/mtd/maps/ichxrom.c~pci_register_driver-drivers_mtd_maps	2005-03-05 16:12:31.000000000 +0100
+++ kj-domen/drivers/mtd/maps/ichxrom.c	2005-03-05 16:12:31.000000000 +0100
@@ -366,7 +366,7 @@ static int __init init_ichxrom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&ichxrom_driver);
+	return pci_register_driver(&ichxrom_driver);
 #endif
 }
 
diff -puN drivers/mtd/maps/pci.c~pci_register_driver-drivers_mtd_maps drivers/mtd/maps/pci.c
--- kj/drivers/mtd/maps/pci.c~pci_register_driver-drivers_mtd_maps	2005-03-05 16:12:31.000000000 +0100
+++ kj-domen/drivers/mtd/maps/pci.c	2005-03-05 16:12:31.000000000 +0100
@@ -370,7 +370,7 @@ static struct pci_driver mtd_pci_driver 
 
 static int __init mtd_pci_maps_init(void)
 {
-	return pci_module_init(&mtd_pci_driver);
+	return pci_register_driver(&mtd_pci_driver);
 }
 
 static void __exit mtd_pci_maps_exit(void)
diff -puN drivers/mtd/maps/scb2_flash.c~pci_register_driver-drivers_mtd_maps drivers/mtd/maps/scb2_flash.c
--- kj/drivers/mtd/maps/scb2_flash.c~pci_register_driver-drivers_mtd_maps	2005-03-05 16:12:31.000000000 +0100
+++ kj-domen/drivers/mtd/maps/scb2_flash.c	2005-03-05 16:12:31.000000000 +0100
@@ -238,7 +238,7 @@ static struct pci_driver scb2_flash_driv
 static int __init
 scb2_flash_init(void)
 {
-	return pci_module_init(&scb2_flash_driver);
+	return pci_register_driver(&scb2_flash_driver);
 }
 
 static void __exit
_
