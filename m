Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJpAu-00072b-Oc
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 12:02:49 +0000
Subject: [RFC PATCH 1/3]] Add mtd panic_write function pointer
From: Richard Purdie <rpurdie@rpsys.net>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 29 Jan 2008 11:59:24 +0000
Message-Id: <1201607964.5017.48.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTDs are well suited for logging critical data and the mtdoops driver
allows kernel panics/oops to be written to flash in a blackbox flight
recorder fashion allowing better debugging and analysis of crashes.

Any kernel oops in user context can be easily handled since the kernel
continues as normal and any queued mtd writes are scheduled. Any kernel
oops in interrupt context results in a panic and the delayed writes will
not be scheduled however. The existing mtd->write function cannot be
called in interrupt context so these messages can never be written to
flash.

This patch adds a panic_write function pointer that drivers can
optionally implement which can be called in interrupt context. It is
only intended to be called when its known the kernel is about to panic
and we need to write to succeed. Since the kernel is not going to be
running for much longer, this function can break locks and delay to
ensure the write succeeds (but not sleep).

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>

---
 drivers/mtd/mtdpart.c   |   17 +++++++++++++++++
 include/linux/mtd/mtd.h |    2 ++
 2 files changed, 19 insertions(+)

Index: kernel-hacking/drivers/mtd/mtdpart.c
===================================================================
--- kernel-hacking.orig/drivers/mtd/mtdpart.c	2007-08-11 10:23:37.000000000 +0100
+++ kernel-hacking/drivers/mtd/mtdpart.c	2008-01-29 10:50:51.000000000 +0000
@@ -151,6 +151,20 @@ static int part_write (struct mtd_info *
 				    len, retlen, buf);
 }
 
+static int part_panic_write (struct mtd_info *mtd, loff_t to, size_t len,
+			size_t *retlen, const u_char *buf)
+{
+	struct mtd_part *part = PART(mtd);
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+	if (to >= mtd->size)
+		len = 0;
+	else if (to + len > mtd->size)
+		len = mtd->size - to;
+	return part->master->panic_write (part->master, to + part->offset,
+				    len, retlen, buf);
+}
+
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
 			 struct mtd_oob_ops *ops)
 {
@@ -352,6 +366,9 @@ int add_mtd_partitions(struct mtd_info *
 		slave->mtd.read = part_read;
 		slave->mtd.write = part_write;
 
+		if (master->panic_write)
+			slave->mtd.panic_write = part_panic_write;
+
 		if(master->point && master->unpoint){
 			slave->mtd.point = part_point;
 			slave->mtd.unpoint = part_unpoint;
Index: kernel-hacking/include/linux/mtd/mtd.h
===================================================================
--- kernel-hacking.orig/include/linux/mtd/mtd.h	2007-10-15 13:25:38.000000000 +0100
+++ kernel-hacking/include/linux/mtd/mtd.h	2008-01-29 10:50:51.000000000 +0000
@@ -152,6 +152,8 @@ struct mtd_info {
 	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
+	int (*panic_write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
+
 	int (*read_oob) (struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops);
 	int (*write_oob) (struct mtd_info *mtd, loff_t to,
