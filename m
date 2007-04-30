Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiYbd-000899-2f
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 12:20:07 -0400
Received: by ug-out-1314.google.com with SMTP id m2so996316uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Apr 2007 09:20:03 -0700 (PDT)
Message-ID: <46361729.5050504@gmail.com>
Date: Mon, 30 Apr 2007 20:19:53 +0400
From: Vitaly Wool <vitalywool@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [patch/resend] nand: add containing structure for NAND platform data
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

In order to make it more convenient to pass platform-specific NAND stuff
to a generic driver which is hopefully to come out next, I've introduced
a container structure for chip-specific and controller-specific data.
I'd expect that use cases in platform code will be like

struct platform_nand_data nand_data = {
	...
};

struct platform_device nand_device = {
	...
	.dev = {
		.platform_data = &nand_data,
		...
	},
};

So, please find the patch below.

 include/linux/mtd/nand.h |   10 ++++++++++
 1 files changed, 10 insertions(+)

Index: linux-2.6/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/nand.h
+++ linux-2.6/include/linux/mtd/nand.h
@@ -592,6 +592,16 @@ struct platform_nand_ctrl {
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
