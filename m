Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Psvg0-00037X-UY
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:17:37 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
	<Artem.Bityutskiy@nokia.com>, <linus.walleij@stericsson.com>
Subject: [PATCH resend] fsmc-nand: Add fsmc_nand_set_plat_data in
	linux/mtd/fsmc.h
Date: Fri, 25 Feb 2011 16:47:08 +0530
Message-ID: <8e22b9ab2d4ade0607fe530d818b2a951227de8e.1298632523.git.viresh.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, Viresh Kumar <viresh.kumar@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In most of the cases partitions info, width, etc comes from board files. And
device structure may be defined in machine files, common to all board files.
Thus, we need to set platform data from board file, for which
fsmc_nand_set_plat_data routine is required.

This routine will be used in SPEAr fsmc patches which are sent in a different
patchset.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 include/linux/mtd/fsmc.h |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index 6987995..0cba324 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -160,4 +160,21 @@ extern void __init fsmc_init_board_info(struct platform_device *pdev,
 		struct mtd_partition *partitions, unsigned int nr_partitions,
 		unsigned int width);
 
+/* This function is used to set platform data field of pdev->dev */
+static inline void fsmc_nand_set_plat_data(struct platform_device *pdev,
+		struct mtd_partition *partitions, unsigned int nr_partitions,
+		unsigned int options, unsigned int width)
+{
+	struct fsmc_nand_platform_data *plat_data;
+	plat_data = dev_get_platdata(&pdev->dev);
+
+	if (partitions) {
+		plat_data->partitions = partitions;
+		plat_data->nr_partitions = nr_partitions;
+	}
+
+	plat_data->options = options;
+	plat_data->width = width;
+}
+
 #endif /* __MTD_FSMC_H */
-- 
1.7.2.2
