Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5KZO-0003P5-3A
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 12:32:16 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 20 Dec 2007 16:23:12 +0200
Message-Id: <20071220142312.30834.90645.sendpatchset@golum>
In-Reply-To: <20071220142251.30834.86791.sendpatchset@golum>
References: <20071220142251.30834.86791.sendpatchset@golum>
Subject: [PATCH v2 4/6] UBI: UBI: remove data_offset
Cc: Frank Haverkamp <haver@vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 09610a4ca122838a1292ec919ac2d05cf499a140 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 19 Dec 2007 21:43:32 +0200
Subject: [PATCH] UBI: remove data_offset

'data_offset' parameter does not really make sense and it is not
needed. Get rid of it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |   42 +++++++++++++++---------------------------
 drivers/mtd/ubi/ubi.h   |    3 +--
 2 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8f6aef6..5045588 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -49,13 +49,11 @@
  * struct mtd_dev_param - MTD device parameter description data structure.
  * @name: MTD device name or number string
  * @vid_hdr_offs: VID header offset
- * @data_offs: data offset
  */
 struct mtd_dev_param
 {
 	char name[MTD_PARAM_LEN_MAX];
 	int vid_hdr_offs;
-	int data_offs;
 };
 
 /* Numbers of elements set in the @mtd_dev_param array */
@@ -513,7 +511,7 @@ static int io_init(struct ubi_device *ubi)
 		return -EINVAL;
 	}
 
-	if (ubi->vid_hdr_offset < 0 || ubi->leb_start < ubi->vid_hdr_offset)
+	if (ubi->vid_hdr_offset < 0)
 		return -EINVAL;
 
 	/*
@@ -563,10 +561,8 @@ static int io_init(struct ubi_device *ubi)
 	}
 
 	/* Similar for the data offset */
-	if (ubi->leb_start == 0) {
-		ubi->leb_start = ubi->vid_hdr_offset + ubi->vid_hdr_alsize;
-		ubi->leb_start = ALIGN(ubi->leb_start, ubi->min_io_size);
-	}
+	ubi->leb_start = ubi->vid_hdr_offset + ubi->vid_hdr_alsize;
+	ubi->leb_start = ALIGN(ubi->leb_start, ubi->min_io_size);
 
 	dbg_msg("vid_hdr_offset   %d", ubi->vid_hdr_offset);
 	dbg_msg("vid_hdr_aloffset %d", ubi->vid_hdr_aloffset);
@@ -627,7 +623,6 @@ static int io_init(struct ubi_device *ubi)
  * ubi_attach_mtd_dev - attach an MTD device.
  * @mtd_dev: MTD device description object
  * @vid_hdr_offset: VID header offset
- * @data_offset: data offset
  *
  * This function attaches an MTD device to UBI. It first treats @mtd_dev as the
  * MTD device name, and tries to open it by this name. If it is unable to open,
@@ -638,8 +633,7 @@ static int io_init(struct ubi_device *ubi)
  * Note, the invocations of this function has to be serialized by the
  * @ubi_devices_mutex.
  */
-int ubi_attach_mtd_dev(struct mtd_info *mtd, int vid_hdr_offset,
-		       int data_offset)
+int ubi_attach_mtd_dev(struct mtd_info *mtd, int vid_hdr_offset)
 {
 	struct ubi_device *ubi;
 	int i, err;
@@ -675,10 +669,9 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int vid_hdr_offset,
 	ubi->mtd = mtd;
 	ubi->ubi_num = i;
 	ubi->vid_hdr_offset = vid_hdr_offset;
-	ubi->leb_start = data_offset;
 
-	dbg_msg("attaching mtd%d to ubi%d: VID header offset %d data offset %d",
-		mtd->index, ubi->ubi_num, vid_hdr_offset, data_offset);
+	dbg_msg("attaching mtd%d to ubi%d: VID header offset %d",
+		mtd->index, ubi->ubi_num, vid_hdr_offset);
 
 	err = io_init(ubi);
 	if (err)
@@ -957,7 +950,7 @@ static int __init ubi_init(void)
 		}
 
 		mutex_lock(&ubi_devices_mutex);
-		err = ubi_attach_mtd_dev(mtd, p->vid_hdr_offs, p->data_offs);
+		err = ubi_attach_mtd_dev(mtd, p->vid_hdr_offs);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			put_mtd_device(mtd);
@@ -1111,13 +1104,9 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 
 	if (tokens[1])
 		p->vid_hdr_offs = bytes_str_to_int(tokens[1]);
-	if (tokens[2])
-		p->data_offs = bytes_str_to_int(tokens[2]);
 
 	if (p->vid_hdr_offs < 0)
 		return p->vid_hdr_offs;
-	if (p->data_offs < 0)
-		return p->data_offs;
 
 	mtd_devs += 1;
 	return 0;
@@ -1125,16 +1114,15 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 
 module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
 MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
-		      "mtd=<name|num>[,<vid_hdr_offs>,<data_offs>]. "
+		      "mtd=<name|num>[,<vid_hdr_offs>].\n"
 		      "Multiple \"mtd\" parameters may be specified.\n"
-		      "MTD devices may be specified by their number or name. "
-		      "Optional \"vid_hdr_offs\" and \"data_offs\" parameters "
-		      "specify UBI VID header position and data starting "
-		      "position to be used by UBI.\n"
-		      "Example: mtd=content,1984,2048 mtd=4 - attach MTD device"
-		      "with name content using VID header offset 1984 and data "
-		      "start 2048, and MTD device number 4 using default "
-		      "offsets");
+		      "MTD devices may be specified by their number or name.\n"
+		      "Optional \"vid_hdr_offs\" parameter specifies UBI VID "
+		      "header position and data starting position to be used "
+		      "by UBI.\n"
+		      "Example: mtd=content,1984 mtd=4 - attach MTD device"
+		      "with name \"content\" using VID header offset 1984, and "
+		      "MTD device number 4 with default VID header offset.");
 
 MODULE_VERSION(__stringify(UBI_VERSION));
 MODULE_DESCRIPTION("UBI - Unsorted Block Images");
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 25ff15a..4c3607e 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -483,8 +483,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 			 struct ubi_vid_hdr *vid_hdr);
 
 /* build.c */
-int ubi_attach_mtd_dev(struct mtd_info *mtd, int vid_hdr_offset,
-		       int data_offset);
+int ubi_attach_mtd_dev(struct mtd_info *mtd, int vid_hdr_offset);
 int ubi_detach_mtd_dev(int ubi_num, int anyway);
 struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);
-- 
1.5.3.4
