Received: from localhost ([127.0.0.1])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IvH6j-00063L-Sq
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 18:49:01 +0000
Date: Thu, 22 Nov 2007 18:49:01 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Add P3x support with CFI 1.5 
Message-ID: <Pine.LNX.4.64.0711221841320.22964@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is the second post of the patch enabling support of P3x silicon with CFI 1.5. As I know there are _many_ people currently using P3x with CFI 1.5. The patch is trivial. It has been verified - it does not affect other silicon. Could you please acknowledge and commit the patch? 

diff -uNr a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c       2007-08-10 01:28:15.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c       2007-08-15 15:27:52.000000000 +0400
@@ -276,7 +276,7 @@
                return NULL;
 
        if (extp->MajorVersion != '1' ||
-           (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
+           (extp->MinorVersion < '0' || extp->MinorVersion > '5')) {
                printk(KERN_ERR "  Unknown Intel/Sharp Extended Query "
                       "version %c.%c.\n",  extp->MajorVersion,
                       extp->MinorVersion);

Thanks,
Alexey
