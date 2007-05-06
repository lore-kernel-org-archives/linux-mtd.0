Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hki1I-0000WN-9w
	for linux-mtd@lists.infradead.org; Sun, 06 May 2007 10:47:31 -0400
Received: by ug-out-1314.google.com with SMTP id m2so762300uge
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 May 2007 07:47:26 -0700 (PDT)
Message-ID: <463DEA61.2000609@gmail.com>
Date: Sun, 06 May 2007 18:46:57 +0400
From: Vitaly Wool <vitalywool@gmail.com>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: [patch 1/2] platform NAND driver: update header
Content-Type: text/plain; charset=UTF-8; format=flowed
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

This patch extends nand.h in order to enable platform NAND driver.

 include/linux/mtd/nand.h |   16 ++++++++++++++++
 1 files changed, 16 insertions(+)

Signed-off-by: Vitaly Wool <vitalywool@gmail.com>

Index: linux-2.6/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/nand.h
+++ linux-2.6/include/linux/mtd/nand.h
@@ -560,6 +560,7 @@ extern int nand_do_read(struct mtd_info 
  * @chip_delay:		R/B delay value in us
  * @options:		Option flags, e.g. 16bit buswidth
  * @ecclayout:		ecc layout info structure
+ * @part_probe_types:	NULL-terminated array of probe types
  * @priv:		hardware controller specific settings
  */
 struct platform_nand_chip {
@@ -570,6 +571,7 @@ struct platform_nand_chip {
 	struct nand_ecclayout	*ecclayout;
 	int			chip_delay;
 	unsigned int		options;
+	const char		**part_probe_types;
 	void			*priv;
 };
 
@@ -578,6 +580,8 @@ struct platform_nand_chip {
  * @hwcontrol:		platform specific hardware control structure
  * @dev_ready:		platform specific function to read ready/busy pin
  * @select_chip:	platform specific chip select function
+ * @cmd_ctrl:		platform specific function for controlling
+ *			ALE/CLE/nCE. Also used to write command and address
  * @priv:		private data to transport driver specific settings
  *
  * All fields are optional and depend on the hardware driver requirements
@@ -586,9 +590,21 @@ struct platform_nand_ctrl {
 	void		(*hwcontrol)(struct mtd_info *mtd, int cmd);
 	int		(*dev_ready)(struct mtd_info *mtd);
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
+	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
+				    unsigned int ctrl);
 	void		*priv;
 };
 
+/**
+ * struct platform_nand_data - container structure for platform-specific data
+ * @chip:		chip level chip structure
+ * @ctrl:		controller level device structure
+ */
+struct platform_nand_data {
+	struct platform_nand_chip	chip;
+	struct platform_nand_ctrl	ctrl;
+};
+
 /* Some helpers to access the data structures */
 static inline
 struct platform_nand_chip *get_platform_nandchip(struct mtd_info *mtd)
