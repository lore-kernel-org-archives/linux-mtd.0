Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKxPZ-0007E3-SN
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 16:07:10 +0000
Message-ID: <496624A4.3050808@grandegger.com>
Date: Thu, 08 Jan 2009 17:07:00 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] CFI: remove major/minor version check for command set 0x0002
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NOR Flash memory K8P2815UQB from Samsung uses the major version
number '0', which seems to be unusual but not illegal, IIUC. This
patch removes the major-minor version check to get this Flash memory
supported as well.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   10 ----------
 1 file changed, 10 deletions(-)

Index: linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.6.orig/drivers/mtd/chips/cfi_cmdset_0002.c
+++ linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -363,16 +363,6 @@ struct mtd_info *cfi_cmdset_0002(struct 
 			return NULL;
 		}
 
-		if (extp->MajorVersion != '1' ||
-		    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
-			printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
-			       "version %c.%c.\n",  extp->MajorVersion,
-			       extp->MinorVersion);
-			kfree(extp);
-			kfree(mtd);
-			return NULL;
-		}
-
 		/* Install our own private info structure */
 		cfi->cmdset_priv = extp;
 
