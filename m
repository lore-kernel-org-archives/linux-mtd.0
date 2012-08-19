Received: from oproxy8-pub.bluehost.com ([69.89.22.20])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2tac-00007F-OL
 for linux-mtd@lists.infradead.org; Sun, 19 Aug 2012 00:42:03 +0000
Message-ID: <5030363F.3010505@xenotime.net>
Date: Sat, 18 Aug 2012 17:41:35 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: fix kernel-doc warning in include/linux/mtd/nand.h
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix kernel-doc warning in <linux/mtd/nand.h>:

Warning(include/linux/mtd/nand.h:659): No description found for parameter 'read_byte'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	David Woodhouse <dwmw2@infradead.org>
Cc:	linux-mtd@lists.infradead.org
---
 include/linux/mtd/nand.h |    1 +
 1 file changed, 1 insertion(+)

--- lnx-36-rc2.orig/include/linux/mtd/nand.h
+++ lnx-36-rc2/include/linux/mtd/nand.h
@@ -641,6 +641,7 @@ struct platform_device;
  *			ALE/CLE/nCE. Also used to write command and address
  * @write_buf:		platform specific function for write buffer
  * @read_buf:		platform specific function for read buffer
+ * @read_byte:		platform specific function to read one byte from chip
  * @priv:		private data to transport driver specific settings
  *
  * All fields are optional and depend on the hardware driver requirements
