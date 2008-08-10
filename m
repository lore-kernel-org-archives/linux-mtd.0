Received: from ti-out-0910.google.com ([209.85.142.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KS8Ru-0002g0-L4
	for linux-mtd@lists.infradead.org; Sun, 10 Aug 2008 10:47:00 +0000
Received: by ti-out-0910.google.com with SMTP id a21so795604tia.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Aug 2008 03:46:53 -0700 (PDT)
Date: Sun, 10 Aug 2008 18:46:50 +0800
From: Huang Weiyi <weiyi.huang@gmail.com>
To: dedekind@infradead.org,
 ext-adrian.hunter@nokia.com
Subject: drivers/mtd/nand/nandsim.c: remove duplicated #include
Message-Id: <20080810140306.43E4.WEIYI.HUANG@gmail.com>
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

Removed duplicated include <asm/div64.h> in 
drivers/mtd/nand/nandsim.c.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 556e813..ae7c577 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -38,7 +38,6 @@
 #include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/random.h>
-#include <asm/div64.h>

 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
