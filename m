Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148Nrd-0001WD-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 14:35:37 +0000
Received: from [195.224.55.237] (helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 148Nrc-0001W7-00
	for mtd@infradead.org; Tue, 19 Dec 2000 14:35:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: eauth@softsys.co.at
Cc: mtd@infradead.org
Subject: Return of ifdefs in cfi_probe.c
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 19 Dec 2000 14:34:28 +0000
Message-ID: <3041.977236468@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


The use of weak symbols was intended to render the ifdefs which you 
restored unnecessary. Are you sure it didn't work right in 2.0 the way I 
left it?

--- cfi_probe.c	2000/12/18 00:03:26	1.30
+++ cfi_probe.c	2000/12/18 16:14:51	1.31
@@ -1,7 +1,7 @@
 /* 
    Common Flash Interface probe code.
    (C) 2000 Red Hat. GPL'd.
-   $Id: cfi_probe.c,v 1.30 2000/12/18 00:03:26 dwmw2 Exp $
+   $Id: cfi_probe.c,v 1.31 2000/12/18 16:14:51 eauth Exp $
 */
 
 #include <linux/config.h>
@@ -741,21 +741,23 @@
 		return;
 
 	switch(type){
+#ifdef CONFIG_MTD_CFI_INTELEXT
 	case 0x0001:
 		probe_function = cfi_cmdset_0001;
 		break;
-
+#endif
+#ifdef CONFIG_MTD_CFI_AMDSTD 
 	case 0x0002:
 		probe_function = cfi_cmdset_0002;
 		break;
+#endif

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
