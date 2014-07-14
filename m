Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6jfO-0005YQ-PS
 for linux-mtd@lists.infradead.org; Mon, 14 Jul 2014 17:03:56 +0000
Received: by mail-pa0-f42.google.com with SMTP id lf10so1764379pab.1
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2014 10:03:32 -0700 (PDT)
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: computersforpeace@gmail.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH RFC] mtd: Write and erase error counters in sysfs
Date: Mon, 14 Jul 2014 10:03:25 -0700
Message-Id: <1405357405-32244-1-git-send-email-dehrenberg@chromium.org>
Cc: olofj@chromium.org, gwendal@chromium.org,
 Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds error counters for write and erase errors in sysfs.
Unlike previous counters, they are not visible through an ioctl,
since that would require introducing a new ioctl and sysfs is the
preferred interface for exposing new data.

The data is maintained in an analogous manner to the ecc_stats struct.
Unfortunately, for the erase, I had to store the previous count of
erase errors; I put this in struct erase_info, but if you have
suggestions for a better place (in the partition?) I'd be happy to
adjust the code.

The intention for these new variables is to better be able to monitor
failures in an automated way across a large deployed fleet of flash
devices, as well as to observe failures in any integration test which
is difficult to pick apart.

These new statistics, like the per-partition ECC corrected and failure
counts, are subject to a race condition where multiple operations
against the same or multiple partitions are issued in parallel could
lead to double-counting. Fixing the race would involve some major
changes (either in interfaces or locking) so I'd like to leave that
for a later patch.

Tested with nandsim and torturetest as follows:

localhost ~ # modprobe nandsim weakpages=500
localhost ~ # modprobe mtd_torturetest dev=0
modprobe: ERROR: could not insert 'mtd_torturetest': Input/output error
localhost ~ # cat /sys/class/mtd/mtd0/write_errors
1
localhost ~ # cat /sys/class/mtd/mtd0/erase_errors
0
localhost ~ #  modprobe -r mtd_torturetest
localhost ~ #  modprobe -r nandsim
localhost ~ # modprobe nandsim weakblocks=8
localhost ~ # modprobe mtd_torturetest dev=0
modprobe: ERROR: could not insert 'mtd_torturetest': Invalid argument
localhost ~ #  cat /sys/class/mtd/mtd0/erase_errors
1
localhost ~ #  cat /sys/class/mtd/mtd0/write_errors
0

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-mtd | 20 +++++++++
 drivers/mtd/mtdcore.c                     | 24 +++++++++++
 drivers/mtd/mtdpart.c                     | 70 +++++++++++++++++++++++++++----
 drivers/mtd/nand/nand_base.c              |  5 ++-
 include/linux/mtd/mtd.h                   | 13 ++++++
 5 files changed, 122 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 1399bb2..9cb9fa6 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -184,3 +184,23 @@ Description:
 
 		It will always be a non-negative integer.  In the case of
 		devices lacking any ECC capability, it is 0.
+
+What:		/sys/class/mtd/mtdX/write_errors
+Date:		June 2014
+KernelVersion:	3.17
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The number of failures to write operations reported by the
+		device. Typically, the failures are associated with
+		the device's failure to set a bit from '1' to '0'.
+		It will always be a non-negative integer.
+
+What:		/sys/class/mtd/mtdX/erase_errors
+Date:		June 2014
+KernelVersion:	3.17
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The number of failures to erase operations reported by the
+		device. Typically, the failures are associated with
+		the device's failure to set a bit from '0' to '1'.
+		It will always be a non-negative integer.
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d201fee..1960e28 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -298,6 +298,28 @@ static ssize_t mtd_ecc_step_size_show(struct device *dev,
 }
 static DEVICE_ATTR(ecc_step_size, S_IRUGO, mtd_ecc_step_size_show, NULL);
 
+static ssize_t mtd_write_errors_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%u\n",
+			mtd->error_stats.write_errors);
+
+}
+static DEVICE_ATTR(write_errors, S_IRUGO, mtd_write_errors_show, NULL);
+
+static ssize_t mtd_erase_errors_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%u\n",
+			mtd->error_stats.erase_errors);
+
+}
+static DEVICE_ATTR(erase_errors, S_IRUGO, mtd_erase_errors_show, NULL);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -311,6 +333,8 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_ecc_strength.attr,
 	&dev_attr_ecc_step_size.attr,
 	&dev_attr_bitflip_threshold.attr,
+	&dev_attr_write_errors.attr,
+	&dev_attr_erase_errors.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(mtd);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1ca9aec..42b97da 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -174,40 +174,79 @@ static int part_get_fact_prot_info(struct mtd_info *mtd, size_t len,
 						 buf);
 }
 
+static void part_update_write_errors(struct mtd_info *mtd, u32 write_errors)
+{
+	struct mtd_part *part = PART(mtd);
+
+	mtd->error_stats.write_errors +=
+		part->master->error_stats.write_errors - write_errors;
+}
+
+static void part_update_erase_errors(struct mtd_info *mtd, u32 erase_errors)
+{
+	struct mtd_part *part = PART(mtd);
+
+	mtd->error_stats.erase_errors +=
+		part->master->error_stats.erase_errors - erase_errors;
+}
+
 static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
+	int res;
 	struct mtd_part *part = PART(mtd);
-	return part->master->_write(part->master, to + part->offset, len,
-				    retlen, buf);
+	unsigned write_errors = part->master->error_stats.write_errors;
+
+	res = part->master->_write(part->master, to + part->offset, len,
+				   retlen, buf);
+	if (mtd_is_failed(res))
+		part_update_write_errors(mtd, write_errors);
+	return res;
 }
 
 static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
+	int res;
 	struct mtd_part *part = PART(mtd);
-	return part->master->_panic_write(part->master, to + part->offset, len,
-					  retlen, buf);
+	unsigned write_errors = part->master->error_stats.write_errors;
+
+	res = part->master->_panic_write(part->master, to + part->offset, len,
+					 retlen, buf);
+	if (mtd_is_failed(res))
+		part_update_write_errors(mtd, write_errors);
+	return res;
 }
 
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
 		struct mtd_oob_ops *ops)
 {
+	int res;
 	struct mtd_part *part = PART(mtd);
+	unsigned write_errors = part->master->error_stats.write_errors;
 
 	if (to >= mtd->size)
 		return -EINVAL;
 	if (ops->datbuf && to + ops->len > mtd->size)
 		return -EINVAL;
-	return part->master->_write_oob(part->master, to + part->offset, ops);
+	res = part->master->_write_oob(part->master, to + part->offset, ops);
+	if (mtd_is_failed(res))
+		part_update_write_errors(mtd, write_errors);
+	return res;
 }
 
 static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
+	int res;
 	struct mtd_part *part = PART(mtd);
-	return part->master->_write_user_prot_reg(part->master, from, len,
-						  retlen, buf);
+	unsigned write_errors = part->master->error_stats.write_errors;
+
+	res = part->master->_write_user_prot_reg(part->master, from, len,
+						 retlen, buf);
+	if (mtd_is_failed(res))
+		part_update_write_errors(mtd, write_errors);
+	return res;
 }
 
 static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
@@ -220,9 +259,15 @@ static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		unsigned long count, loff_t to, size_t *retlen)
 {
+	int res;
 	struct mtd_part *part = PART(mtd);
-	return part->master->_writev(part->master, vecs, count,
-				     to + part->offset, retlen);
+	unsigned write_errors = part->master->error_stats.write_errors;
+
+	res = part->master->_writev(part->master, vecs, count,
+				    to + part->offset, retlen);
+	if (mtd_is_failed(res))
+		part_update_write_errors(mtd, write_errors);
+	return res;
 }
 
 static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
@@ -230,12 +275,16 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 	struct mtd_part *part = PART(mtd);
 	int ret;
 
+	instr->initial_erase_errors = part->master->error_stats.erase_errors;
 	instr->addr += part->offset;
 	ret = part->master->_erase(part->master, instr);
 	if (ret) {
 		if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
 			instr->fail_addr -= part->offset;
 		instr->addr -= part->offset;
+		if (mtd_is_failed(ret))
+			part_update_erase_errors(mtd,
+				instr->initial_erase_errors);
 	}
 	return ret;
 }
@@ -248,6 +297,9 @@ void mtd_erase_callback(struct erase_info *instr)
 		if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
 			instr->fail_addr -= part->offset;
 		instr->addr -= part->offset;
+		if (instr->state & MTD_ERASE_FAILED)
+			part_update_erase_errors(instr->mtd,
+				instr->initial_erase_errors);
 	}
 	if (instr->callback)
 		instr->callback(instr);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 41167e9..90a41d4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2422,8 +2422,10 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		ret = chip->write_page(mtd, chip, column, bytes, wbuf,
 					oob_required, page, cached,
 					(ops->mode == MTD_OPS_RAW));
-		if (ret)
+		if (ret) {
+			mtd->error_stats.write_errors++;
 			break;
+		}
 
 		writelen -= bytes;
 		if (!writelen)
@@ -2748,6 +2750,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 
 		/* See if block erase succeeded */
 		if (status & NAND_STATUS_FAIL) {
+			mtd->error_stats.erase_errors++;
 			pr_debug("%s: failed erase, page 0x%08x\n",
 					__func__, page);
 			instr->state = MTD_ERASE_FAILED;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a1b0b4c..86dd959 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -54,6 +54,7 @@ struct erase_info {
 	void (*callback) (struct erase_info *self);
 	u_long priv;
 	u_char state;
+	unsigned initial_erase_errors;
 	struct erase_info *next;
 };
 
@@ -109,6 +110,12 @@ struct nand_ecclayout {
 	struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES_LARGE];
 };
 
+/* Counts of errors for sysfs reporting */
+struct mtd_error_sysfs_stats {
+	__u32 write_errors;
+	__u32 erase_errors;
+};
+
 struct module;	/* only needed for owner field in mtd_info */
 
 struct mtd_info {
@@ -242,6 +249,8 @@ struct mtd_info {
 
 	/* ECC status information */
 	struct mtd_ecc_stats ecc_stats;
+	/* Error statistics */
+	struct mtd_error_sysfs_stats error_stats;
 	/* Subpage shift (NAND) */
 	int subpage_sft;
 
@@ -402,6 +411,10 @@ static inline int mtd_is_eccerr(int err) {
 	return err == -EBADMSG;
 }
 
+static inline int mtd_is_failed(int err) {
+	return err == -EIO;
+}
+
 static inline int mtd_is_bitflip_or_eccerr(int err) {
 	return mtd_is_bitflip(err) || mtd_is_eccerr(err);
 }
-- 
2.0.0.526.g5318336
