Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6Fm2-00034T-RI
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 06:59:43 +0000
From: John Crispin <blogic@openwrt.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] MTD: missing comment in nand.h
Date: Tue, 28 Aug 2012 08:57:43 +0200
Message-Id: <1346137063-20903-1-git-send-email-blogic@openwrt.org>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, linux-mtd@lists.infradead.org,
 John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert reported the following error when generating kernel doc.
> Warning(/home/rpjday/k/git//include/linux/mtd/nand.h:659): No  description found for parameter 'read_byte'

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: Robert P. J. Day <rpjday@crashcourse.ca>
---
 include/linux/mtd/nand.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 57977c6..5654bbe 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -641,6 +641,7 @@ struct platform_device;
  *			ALE/CLE/nCE. Also used to write command and address
  * @write_buf:		platform specific function for write buffer
  * @read_buf:		platform specific function for read buffer
+ * @read_byte:		platform specific function for reading a byte
  * @priv:		private data to transport driver specific settings
  *
  * All fields are optional and depend on the hardware driver requirements
-- 
1.7.9.1
