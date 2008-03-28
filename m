Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf5l9-0004Uk-8z
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 04:00:07 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Jf5l7-0001NR-2A
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 23:00:05 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jf5l2-0007V8-CQ
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 15:00:00 +1100
Date: Fri, 28 Mar 2008 15:00:00 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] plat_nand: set mtd->name
Message-ID: <20080328040000.GA28384@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch sets mtd->name to the platform bus ID in the plat_nand
driver, so that you can specify partitions readily with mtdparts=.

Currently it relies on nand_base filling in the name from the device,
which results in names like "NAND 256MiB 3,3V 8-bit", that you can't
use with cmdlineparts.

Signed-off-by: Hamish Moffatt <hamish@cloud.net.au>
--
BTW, most of the NAND drivers appear to use a fixed name, which makes it 
hard to use them with mtdparts= if you had multiple devices.

--- drivers/mtd/nand/plat_nand.c	(revision 4106)
+++ drivers/mtd/nand/plat_nand.c	(working copy)
@@ -54,6 +54,7 @@
 	data->chip.priv = &data;
 	data->mtd.priv = &data->chip;
 	data->mtd.owner = THIS_MODULE;
+	data->mtd.name = pdev->dev.bus_id;
 
 	data->chip.IO_ADDR_R = data->io_base;
 	data->chip.IO_ADDR_W = data->io_base;

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
