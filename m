Received: from ftp.linux-mips.org ([194.74.144.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ID2Ap-00029t-0d
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 13:58:24 -0400
Received: from localhost.localdomain ([127.0.0.1]:49867 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20022739AbXGWR4U (ORCPT <rfc822;linux-mtd@lists.infradead.org>);
	Mon, 23 Jul 2007 18:56:20 +0100
Date: Mon, 23 Jul 2007 18:56:19 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [MTD] Fix C jewel
Message-ID: <20070723175618.GA32262@linux-mips.org>
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

No idea why gcc doesn't barf on a "##else".

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index b96ac8e..5f895b3 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -86,7 +86,7 @@ static unsigned long __initdata doc_locations[] = {
         0xff000000,
 #elif defined(CONFIG_MOMENCO_OCELOT_G)
         0xff000000,
-##else
+#else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
 	0xffffffff };
