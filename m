Received: from ti-out-0910.google.com ([209.85.142.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWm6q-0003OZ-Bb
	for linux-mtd@lists.infradead.org; Sat, 23 Aug 2008 05:56:24 +0000
Received: by ti-out-0910.google.com with SMTP id a21so453687tia.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 22:56:22 -0700 (PDT)
Date: Sat, 23 Aug 2008 13:56:21 +0800
From: Huang Weiyi <weiyi.huang@gmail.com>
To: dwmw2@infradead.org
Subject: [MTD] remove unused #include <version.h>
Message-Id: <20080823132247.1280.WEIYI.HUANG@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver(s) below do not use LINUX_VERSION_CODE nor KERNEL_VERSION.
  drivers/mtd/nand/au1550nd.c

This patch removes the said #include <version.h>.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 761946e..92c334f 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -16,7 +16,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/version.h>
 #include <asm/io.h>

 #include <asm/mach-au1x00/au1xxx.h>
