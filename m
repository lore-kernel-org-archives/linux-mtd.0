Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6WZk-0006ml-Jd
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 15:43:04 +0100
Received: from ivoti.terra.com.br ([200.176.3.20])
	by phoenix.infradead.org with esmtp (Exim 4.22)
	id 1A6WYq-0005K9-Sl
	for linux-mtd@lists.infradead.org; Mon, 06 Oct 2003 15:42:09 +0100
Message-ID: <3F81800A.5000500@terra.com.br>
Date: Mon, 06 Oct 2003 11:45:30 -0300
From: Felipe W Damasio <felipewd@terra.com.br>
MIME-Version: 1.0
To: dwmw2@redhat.com
Content-Type: multipart/mixed;
 boundary="------------060200040907000704090502"
cc: linux-mtd@lists.infradead.org
cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] Memory leak in mtd/chips/cfi_cmdset_0020
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060200040907000704090502
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

	Hi David,

	Patch against 2.6.0-test6.

	- Frees a previous allocated kmalloced variable before returning NULL;

	Found by smatch.

	Please consider applying,

Felipe

--------------060200040907000704090502
Content-Type: text/plain;
 name="cfi_cmdset_0020-leak.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cfi_cmdset_0020-leak.patch"

--- linux-2.6.0-test6/drivers/mtd/chips/cfi_cmdset_0020.c.orig	2003-10-06 11:37:31.000000000 -0300
+++ linux-2.6.0-test6/drivers/mtd/chips/cfi_cmdset_0020.c	2003-10-06 11:37:50.000000000 -0300
@@ -208,6 +208,7 @@
 	if (!mtd->eraseregions) { 
 		printk(KERN_ERR "Failed to allocate memory for MTD erase region info\n");
 		kfree(cfi->cmdset_priv);
+		kfree(mtd);
 		return NULL;
 	}
 	

--------------060200040907000704090502--
