Received: from dmzraw2.extranet.tce.com ([157.254.234.138])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19mYtb-0006n8-4A
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2003 14:09:03 +0100
Received: from smtprelay.indy.tce.com (ismtprelay.indy.tce.com
	[157.254.96.114])h7CD8K4h003053
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2003 13:08:20 GMT
Received: from smtprelay2.thmulti.com (localhost [127.0.0.1])
	by smtprelay.indy.tce.com (8.9.3/8.9.1) with ESMTP id NAA20731
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2003 13:08:18 GMT
Received: from parexch3.paris.thmulti.com (localhost [127.0.0.1])
	by smtprelay2.thmulti.com (8.9.3/8.9.1) with ESMTP id PAA15031
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Aug 2003 15:08:16 +0200 (MET DST)
Message-ID: <2C1BAF8F8E1DD611862B0002A5D4C3FC01BC05C4@renexch3.rennes.thmulti.com>
From: Fillod Stephane <stephane.fillod@thomson.net>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 12 Aug 2003 15:08:33 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [PATCH] oops in CVS 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here's an obvious patch against current CVS which fixes an oops at
startup of CFI Amd/Fujitsu chips. The same fix was applied by Thomas
yesterday on Intel chips.

BTW, does anyone have done some work on Write Buffer Programming
for CFI Amd/Fujitsu chips? Any advice?


Cheerio,
Stephane

Note to the moderator: what's wrong with my headers to be considered 
as suspicious?


--- mtd/drivers/mtd/chips/cfi_cmdset_0002.c	Wed Jul 23 00:00:05 2003
+++ linux/drivers/mtd/chips/cfi_cmdset_0002.c	Tue Aug 12 14:44:49 2003
@@ -157,6 +157,9 @@
 		if (!extp)
 			return NULL;
 
+		/* Install our own private info structure */
+		cfi->cmdset_priv = extp;	
+
 		cfi_fixup(map, fixup_table);
 
 #ifdef DEBUG_CFI_FEATURES
@@ -185,7 +188,7 @@
 		}
 		/*
 		 * FIXME - These might already be setup (more correctly)
-		 * buy jedec_probe.c.
+		 * by jedec_probe.c.
 		 */
 		switch (cfi->device_type) {
 		case CFI_DEVICETYPE_X8:
@@ -209,9 +212,6 @@
 			printk(KERN_NOTICE "Eep. Unknown cfi_cmdset_0002
device type %d\n", cfi->device_type);
 			return NULL;
 		}
-
-		/* Install our own private info structure */
-		cfi->cmdset_priv = extp;	
 
 	} /* CFI mode */
 
