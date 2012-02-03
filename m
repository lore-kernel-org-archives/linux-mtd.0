Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtJNK-0002x4-5b
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 13:40:27 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
 by co202.xi-lite.net (Postfix) with ESMTPS id A3747260327
 for <linux-mtd@lists.infradead.org>; Fri,  3 Feb 2012 14:40:21 +0100 (CET)
Message-ID: <4F2BE3C1.8000104@parrot.com>
Date: Fri, 3 Feb 2012 14:40:17 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: RFC : attach ubi in readonly mode
Content-Type: multipart/mixed; boundary="------------060907000506000502050909"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------060907000506000502050909
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

it could be interesting to attach ubi in read-only mode (for example getting ubi
volume info without altering flash).

A solution to do that could be to add an argument to UBI_IOCATT ioctl.

Another solution should be to have a way to switch MTD_WRITEABLE flags.

What do you think a that ?


PS : attached a proof of concept for solution 1

--------------060907000506000502050909
Content-Type: text/x-diff; name="poc_ubi_attach_ro.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="poc_ubi_attach_ro.diff"

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 13b05cb..56c2249 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -841,6 +841,7 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * @mtd: MTD device description object
  * @ubi_num: number to assign to the new UBI device
  * @vid_hdr_offset: VID header offset
+ * @ro : attach in readonly mode
  *
  * This function attaches MTD device @mtd_dev to UBI and assign @ubi_num number
  * to the newly created UBI device, unless @ubi_num is %UBI_DEV_NUM_AUTO, in
@@ -851,7 +852,7 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * Note, the invocations of this function has to be serialized by the
  * @ubi_devices_mutex.
  */
-int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
+int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset, int ro)
 {
 	struct ubi_device *ubi;
 	int i, err, ref = 0;
@@ -922,6 +923,12 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 
 	ubi_msg("attaching mtd%d to ubi%d", mtd->index, ubi_num);
 
+	if (ro) {
+		ubi_msg("attach in "
+			"read-only mode");
+		ubi->ro_mode = 1;
+	}
+
 	err = io_init(ubi);
 	if (err)
 		goto out_free;
@@ -1209,7 +1216,7 @@ static int __init ubi_init(void)
 
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO,
-					 p->vid_hdr_offs);
+					 p->vid_hdr_offs, 0);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			ubi_err("cannot attach mtd%d", mtd->index);
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 4dfa6b9..9be009f 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1007,7 +1007,7 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		 * 'ubi_attach_mtd_dev()'.
 		 */
 		mutex_lock(&ubi_devices_mutex);
-		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset);
+		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset, req.padding[0]);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index a637f02..aff929f 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -550,7 +550,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 			 struct ubi_vid_hdr *vid_hdr);
 
 /* build.c */
-int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset);
+int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset, int ro);
 int ubi_detach_mtd_dev(int ubi_num, int anyway);
 struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);

--------------060907000506000502050909--
