Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13cp3c-0003YN-00
	for mtd-list@infradead.org; Sat, 23 Sep 2000 14:09:32 +0100
Received: from fep01.swip.net ([130.244.199.129] helo=fep01-svc.swip.net)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13cp3a-0003YH-00
	for mtd@infradead.org; Sat, 23 Sep 2000 14:09:31 +0100
Received: from win95 ([130.244.212.181]) by fep01-svc.swip.net
          (InterMail vM.5.01.01.01 201-252-104) with SMTP
          id <20000923130859.HCBL16761.fep01-svc.swip.net@win95>
          for <mtd@infradead.org>; Sat, 23 Sep 2000 15:08:59 +0200
From: "Bjorn Eriksson" <mdeans@algonet.se>
To: <mtd@infradead.org>
Subject: Update: pmc551.c doesn't compile w/ egcs-2.91.66
Date: Sat, 23 Sep 2000 15:09:12 +0200
Message-ID: <003c01c0255f$77da7420$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <000f01c00c73$bcdac480$0800a8c0@win95.inteloop.se>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


>  FYI: I can't get my egcs-2.91.66 to compile pmc551.c w/o adding
> either -O1 (or -O0) or -g. I have no idea why, it just stops right
> before the last 'defined but unreferenced static'-warning.

 The egcs-2.91.66 optimiser gets confused in pmc551.c:init_pmc551() if PCI
support is disabled in the kernel config. Patch:

--- mtd/kernel/pmc551.c 2000/07/14 07:53:31     1.8
+++ mtd/kernel/pmc551.c 2000/09/23 13:08:24
@@ -73,6 +73,10 @@
 #include <stdarg.h>
 #include <linux/pci.h>

+#ifndef CONFIG_PCI
+#error Enable PCI in your kernel config
+#endif
+
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/pmc551.h>
 #include <linux/mtd/compatmac.h>


//Björnen.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
