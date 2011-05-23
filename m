Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORMn-0002U4-2Y
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:02 +0000
Received: by wwb39 with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:23:59 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/62] mtd: provide of_mtd_parse_partitions for
	!CONFIG_MTD_OF_PARTS
Date: Mon, 23 May 2011 10:22:44 +0100
Message-Id: <1306142623-24952-4-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we don't have OpenFirmware enabled then provide a stub
of_mtd_parse_partitions that returns no partitions so drivers don't need
ifdeffery inside.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 include/linux/mtd/partitions.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 998a6cf..afe32db 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -73,9 +73,18 @@ extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
 struct device;
 struct device_node;
 
+#ifdef CONFIG_MTD_OF_PARTS
 int __devinit of_mtd_parse_partitions(struct device *dev,
                                       struct device_node *node,
                                       struct mtd_partition **pparts);
+#else
+static inline int of_mtd_parse_partitions(struct device *dev,
+					  struct device_node *node,
+					  struct mtd_partition **pparts)
+{
+	return 0;
+}
+#endif
 
 #ifdef CONFIG_MTD_PARTITIONS
 static inline int mtd_has_partitions(void) { return 1; }
-- 
1.7.4.4
