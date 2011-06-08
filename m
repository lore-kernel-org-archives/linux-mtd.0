Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULGX-0007Bz-3U
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:05:58 +0000
Received: by wwb39 with SMTP id 39so531325wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:05:54 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/43] mtd: add new API for handling MTD registration
Date: Wed,  8 Jun 2011 20:05:10 +0400
Message-Id: <1307549152-7085-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lots (nearly all) mtd drivers contain nearly the similar code that
calls parse_mtd_partitions, provides some platform-default values, if
parsing fails, and registers  mtd device.

This is an aim to provide single implementation of this scenario:
mtd_device_parse_register() which will handle all this parsing and
defaults.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdcore.c   |   60 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |    5 ++++
 2 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c510aff..a0b41e3 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -452,6 +452,66 @@ int mtd_device_register(struct mtd_info *master,
 EXPORT_SYMBOL_GPL(mtd_device_register);
 
 /**
+ * mtd_device_parse_register - parse partitions and register an MTD device.
+ *
+ * @mtd: the MTD device to register
+ * @types: the list of MTD partition probes to try, see
+ *		'parse_mtd_partitions()' for more information
+ * @origin: start address of MTD device, %0 unless you are sure you need this.
+ * @parts: fallback partition information to register, if parsing fails;
+ *		only valid if %nr_parts > %0
+ * @nr_parts: the number of partitions in parts, if zero then the full
+ *		MTD device is registered if no partition info is found
+ *
+ * This function aggregates MTD partitions parsing (done by
+ * 'parse_mtd_partitions()') and MTD device and partitions registering. It
+ * basically follows the most common pattern found in many MTD drivers:
+ *
+ * * It first tries to probe partitions on MTD device @mtd using parsers
+ *   specified in @types (if @types is %NULL, then the default list of
+ *   parsers is used, see 'parse_mtd_partitions()' for more information).
+ * * If none are found this functions tries to fallback to information
+ *   specified in @parts/@nr_parts.
+ * * If any parititioning info was found, this function registers
+ *   the found partitions.
+ * * If no partitions were found this function just registers the MTD
+ *   device @mtd and exits.
+ *
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
+ */
+int mtd_device_parse_register(struct mtd_info *mtd,
+			      const char **types,
+			      unsigned long origin,
+			      const struct mtd_partition *parts,
+			      int nr_parts)
+{
+	int err;
+	struct mtd_partition *real_parts;
+
+	err = parse_mtd_partitions(mtd, types, &real_parts, origin);
+	if (err <= 0 && nr_parts) {
+		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
+				GFP_KERNEL);
+		err = nr_parts;
+		if (!parts)
+			err = -ENOMEM;
+	}
+
+	if (err > 0) {
+		err = add_mtd_partitions(mtd, real_parts, err);
+		kfree(real_parts);
+	} else if (err == 0) {
+		err = add_mtd_device(mtd);
+		if (err == 1)
+			err = -ENODEV;
+	}
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtd_device_parse_register);
+
+/**
  * mtd_device_unregister - unregister an existing MTD device.
  *
  * @master: the MTD device to unregister.  This will unregister both the master
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 2541fb8..d28a241 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -327,6 +327,11 @@ struct mtd_partition;
 extern int mtd_device_register(struct mtd_info *master,
 			       const struct mtd_partition *parts,
 			       int nr_parts);
+extern int mtd_device_parse_register(struct mtd_info *mtd,
+			      const char **part_probe_types,
+			      unsigned long origin,
+			      const struct mtd_partition *defparts,
+			      int defnr_parts);
 extern int mtd_device_unregister(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
-- 
1.7.4.4
