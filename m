Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiYZS-0007zl-OD
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 12:17:53 -0400
Received: by ug-out-1314.google.com with SMTP id m2so996008uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Apr 2007 09:17:49 -0700 (PDT)
Message-ID: <463616A2.5010706@gmail.com>
Date: Mon, 30 Apr 2007 20:17:38 +0400
From: Vitaly Wool <vitalywool@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [patch/resend] add cmd_ctrl field to platform_nand_chip
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch introduces cmd_ctrl field to the platform_nand_chip structure,
in order to enable supplying platform-specific ALE/CLE/nCE controlling
function.

 include/linux/mtd/nand.h |    4 ++++
 1 files changed, 4 insertions(+)

Signed-off-by: Vitaly Wool <vitalywool@gmail.com>

Index: linux-2.6/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/nand.h
+++ linux-2.6/include/linux/mtd/nand.h
@@ -577,6 +577,8 @@ struct platform_nand_chip {
  * @hwcontrol:        platform specific hardware control structure
  * @dev_ready:        platform specific function to read ready/busy pin
  * @select_chip:    platform specific chip select function
+ * @cmd_ctrl:        platform specific function for controlling
+ *            ALE/CLE/nCE. Also used to write command and address
  * @priv:        private data to transport driver specific settings
  *
  * All fields are optional and depend on the hardware driver requirements
@@ -585,6 +587,8 @@ struct platform_nand_ctrl {
     void        (*hwcontrol)(struct mtd_info *mtd, int cmd);
     int        (*dev_ready)(struct mtd_info *mtd);
     void        (*select_chip)(struct mtd_info *mtd, int chip);
+    void        (*cmd_ctrl)(struct mtd_info *mtd, int dat,
+                    unsigned int ctrl);
     void        *priv;
 };
 
