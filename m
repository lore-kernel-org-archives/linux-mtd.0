Received: from ey-out-1920.google.com ([74.125.78.145])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9kOQ-0006dO-Ud
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 17:59:39 +0000
Received: by ey-out-1920.google.com with SMTP id 4so503722eyg.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Dec 2008 09:59:38 -0800 (PST)
Subject: [PATCH] [UBI] 2/4 UBI volume notifications - MTD emulation
From: dmitry pervushin <dpervushin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 08 Dec 2008 20:59:30 +0300
Message-Id: <1228759170.7622.32.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: dmitry pervushin <dimka@embeddedalley.com>
---
 drivers/mtd/ubi/Kconfig  |    2 +-
 drivers/mtd/ubi/Makefile |    2 +-
 drivers/mtd/ubi/gluebi.c |  222 ++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 188 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..a6d5a14 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -49,7 +49,7 @@ config MTD_UBI_BEB_RESERVE
 	  reserved. Leave the default value if unsure.
 
 config MTD_UBI_GLUEBI
-	bool "Emulate MTD devices"
+	tristate "Emulate MTD devices"
 	default n
 	depends on MTD_UBI
 	help
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index dd834e0..c9302a5 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -4,4 +4,4 @@ ubi-y += vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o scan.o
 ubi-y += misc.o
 
 ubi-$(CONFIG_MTD_UBI_DEBUG) += debug.o
-ubi-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
+obj-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 6dd4f5e..cecc0fe 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -31,6 +31,38 @@
 #include <asm/div64.h>
 #include "ubi.h"
 
+struct ubi_gluebi_volume {
+	struct mtd_info gluebi_mtd;
+	int gluebi_refcount;
+	struct ubi_volume_desc *gluebi_desc;
+	const char *vol_id;
+	int ubi_num;
+	struct list_head list;
+};
+
+static LIST_HEAD(ubi_gluebi_mtds);
+
+static inline void ubi_gluebi_add(struct ubi_gluebi_volume *vol)
+{
+	list_add_tail(&vol->list, &ubi_gluebi_mtds);
+}
+
+static inline void ubi_gluebi_del(struct ubi_gluebi_volume *vol)
+{
+	list_del(&vol->list);
+}
+
+static struct ubi_gluebi_volume *ubi_gluebi_find(int ubi_num, const char *id)
+{
+	struct ubi_gluebi_volume *pos;
+
+	list_for_each_entry(pos, &ubi_gluebi_mtds, list)
+		if (pos->ubi_num == ubi_num &&
+			((!pos->vol_id && !id) || !strcmp(pos->vol_id, id)))
+			return pos;
+	return NULL;
+}
+
 /**
  * gluebi_get_device - get MTD device reference.
  * @mtd: the MTD device description object
@@ -41,9 +73,13 @@
  */
 static int gluebi_get_device(struct mtd_info *mtd)
 {
-	struct ubi_volume *vol;
+	struct ubi_gluebi_volume *vol;
+	int ubi_mode = UBI_READWRITE;
+
+	if (!(mtd->flags & MTD_WRITEABLE))
+		ubi_mode = UBI_READONLY;
 
-	vol = container_of(mtd, struct ubi_volume, gluebi_mtd);
+	vol = container_of(mtd, struct ubi_gluebi_volume, gluebi_mtd);
 
 	/*
 	 * We do not introduce locks for gluebi reference count because the
@@ -66,8 +102,8 @@ static int gluebi_get_device(struct mtd_info *mtd)
 	 * This is the first reference to this UBI volume via the MTD device
 	 * interface. Open the corresponding volume in read-write mode.
 	 */
-	vol->gluebi_desc = ubi_open_volume(vol->ubi->ubi_num, vol->vol_id,
-					   UBI_READWRITE);
+	vol->gluebi_desc = ubi_open_volume_nm(vol->ubi_num, vol->vol_id,
+					ubi_mode);
 	if (IS_ERR(vol->gluebi_desc))
 		return PTR_ERR(vol->gluebi_desc);
 	vol->gluebi_refcount += 1;
@@ -83,9 +119,9 @@ static int gluebi_get_device(struct mtd_info *mtd)
  */
 static void gluebi_put_device(struct mtd_info *mtd)
 {
-	struct ubi_volume *vol;
+	struct ubi_gluebi_volume *vol;
 
-	vol = container_of(mtd, struct ubi_volume, gluebi_mtd);
+	vol = container_of(mtd, struct ubi_gluebi_volume, gluebi_mtd);
 	vol->gluebi_refcount -= 1;
 	ubi_assert(vol->gluebi_refcount >= 0);
 	if (vol->gluebi_refcount == 0)
@@ -107,8 +143,7 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 		       size_t *retlen, unsigned char *buf)
 {
 	int err = 0, lnum, offs, total_read;
-	struct ubi_volume *vol;
-	struct ubi_device *ubi;
+	struct ubi_gluebi_volume *vol;
 	uint64_t tmp = from;
 
 	dbg_gen("read %zd bytes from offset %lld", len, from);
@@ -116,8 +151,7 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (len < 0 || from < 0 || from + len > mtd->size)
 		return -EINVAL;
 
-	vol = container_of(mtd, struct ubi_volume, gluebi_mtd);
-	ubi = vol->ubi;
+	vol = container_of(mtd, struct ubi_gluebi_volume, gluebi_mtd);
 
 	offs = do_div(tmp, mtd->erasesize);
 	lnum = tmp;
@@ -129,7 +163,7 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 		if (to_read > total_read)
 			to_read = total_read;
 
-		err = ubi_eba_read_leb(ubi, vol, lnum, buf, offs, to_read, 0);
+		err = ubi_read(vol->gluebi_desc, lnum, buf, offs, to_read);
 		if (err)
 			break;
 
@@ -158,19 +192,17 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 		       size_t *retlen, const u_char *buf)
 {
 	int err = 0, lnum, offs, total_written;
-	struct ubi_volume *vol;
-	struct ubi_device *ubi;
 	uint64_t tmp = to;
+	struct ubi_gluebi_volume *vol;
 
 	dbg_gen("write %zd bytes to offset %lld", len, to);
 
 	if (len < 0 || to < 0 || len + to > mtd->size)
 		return -EINVAL;
 
-	vol = container_of(mtd, struct ubi_volume, gluebi_mtd);
-	ubi = vol->ubi;
+	vol = container_of(mtd, struct ubi_gluebi_volume, gluebi_mtd);
 
-	if (ubi->ro_mode)
+	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 
 	offs = do_div(tmp, mtd->erasesize);
@@ -186,8 +218,7 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (to_write > total_written)
 			to_write = total_written;
 
-		err = ubi_eba_write_leb(ubi, vol, lnum, buf, offs, to_write,
-					UBI_UNKNOWN);
+		err = ubi_write(vol->gluebi_desc, lnum, buf, offs, to_write);
 		if (err)
 			break;
 
@@ -212,8 +243,7 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	int err, i, lnum, count;
-	struct ubi_volume *vol;
-	struct ubi_device *ubi;
+	struct ubi_gluebi_volume *vol;
 
 	dbg_gen("erase %llu bytes at offset %llu", (unsigned long long)instr->len,
 		 (unsigned long long)instr->addr);
@@ -230,23 +260,24 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 	lnum = mtd_div_by_eb(instr->addr, mtd);
 	count = mtd_div_by_eb(instr->len, mtd);
 
-	vol = container_of(mtd, struct ubi_volume, gluebi_mtd);
-	ubi = vol->ubi;
+	vol = container_of(mtd, struct ubi_gluebi_volume, gluebi_mtd);
 
-	if (ubi->ro_mode)
+	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 
-	for (i = 0; i < count; i++) {
-		err = ubi_eba_unmap_leb(ubi, vol, lnum + i);
+	for (i = 0; i < count - 1; i++) {
+		err = ubi_leb_unmap(vol->gluebi_desc, lnum + i);
 		if (err)
 			goto out_err;
 	}
-
 	/*
 	 * MTD erase operations are synchronous, so we have to make sure the
 	 * physical eraseblock is wiped out.
+	 *
+	 * Thus, perform leb_erase instead of leb_unmap operation - leb_erase
+	 * will wait for the end of operations
 	 */
-	err = ubi_wl_flush(ubi);
+	err = ubi_leb_erase(vol->gluebi_desc, lnum + i);
 	if (err)
 		goto out_err;
 
@@ -269,13 +300,26 @@ out_err:
  * corresponding fake MTD device. Returns zero in case of success and a
  * negative error code in case of failure.
  */
-int ubi_create_gluebi(struct ubi_device *ubi, struct ubi_volume *vol)
+int ubi_create_gluebi(struct ubi_device_info *ubi, struct ubi_volume_info *vol)
 {
-	struct mtd_info *mtd = &vol->gluebi_mtd;
+	struct ubi_gluebi_volume *v;
+	struct mtd_info *mtd;
+
+	v = kzalloc(sizeof(*v), GFP_KERNEL);
+	if (!v) {
+		ubi_err("Cannot allocate ubi_gluebi_vol");
+		return -ENOMEM;
+	}
+
+	mtd = &v->gluebi_mtd;
 
 	mtd->name = kmemdup(vol->name, vol->name_len + 1, GFP_KERNEL);
-	if (!mtd->name)
+	if (!mtd->name) {
+		ubi_err("Cannot allocte mtd->name");
+		kfree(v);
 		return -ENOMEM;
+	}
+	v->vol_id = mtd->name;
 
 	mtd->type = MTD_UBIVOLUME;
 	if (!ubi->ro_mode)
@@ -295,16 +339,19 @@ int ubi_create_gluebi(struct ubi_device *ubi, struct ubi_volume *vol)
 	 * bytes.
 	 */
 	if (vol->vol_type == UBI_DYNAMIC_VOLUME)
-		mtd->size = (long long)vol->usable_leb_size * vol->reserved_pebs;
+		mtd->size = (long long)vol->usable_leb_size * vol->size;
 	else
 		mtd->size = vol->used_bytes;
 
 	if (add_mtd_device(mtd)) {
 		ubi_err("cannot not add MTD device");
 		kfree(mtd->name);
+		kfree(v);
 		return -ENFILE;
 	}
 
+	ubi_gluebi_add(v);
+
 	dbg_gen("added mtd%d (\"%s\"), size %llu, EB size %u",
 		mtd->index, mtd->name, (unsigned long long)mtd->size, mtd->erasesize);
 	return 0;
@@ -318,16 +365,24 @@ int ubi_create_gluebi(struct ubi_device *ubi, struct ubi_volume *vol)
  * corresponding fake MTD device. Returns zero in case of success and a
  * negative error code in case of failure.
  */
-int ubi_destroy_gluebi(struct ubi_volume *vol)
+int ubi_destroy_gluebi(int ubi_num, const char *name)
 {
 	int err;
-	struct mtd_info *mtd = &vol->gluebi_mtd;
+	struct ubi_gluebi_volume *vol;
+	struct mtd_info *mtd;
 
+	vol = ubi_gluebi_find(ubi_num, name);
+	if (!vol)
+		return -ENOENT;
+
+	mtd = &vol->gluebi_mtd;
 	dbg_gen("remove mtd%d", mtd->index);
 	err = del_mtd_device(mtd);
 	if (err)
 		return err;
 	kfree(mtd->name);
+	ubi_gluebi_del(vol);
+	kfree(vol);
 	return 0;
 }
 
@@ -340,10 +395,105 @@ int ubi_destroy_gluebi(struct ubi_volume *vol)
  * volume is static. This is needed because static volumes cannot be read past
  * data they contain.
  */
-void ubi_gluebi_updated(struct ubi_volume *vol)
+void ubi_gluebi_updated(struct ubi_volume_info *vol)
 {
-	struct mtd_info *mtd = &vol->gluebi_mtd;
+	struct ubi_gluebi_volume *gluebi_vol;
+
+	gluebi_vol = ubi_gluebi_find(vol->ubi_num, vol->name);
+	if (!vol)
+		return /* -ENOENT */;
 
 	if (vol->vol_type == UBI_STATIC_VOLUME)
-		mtd->size = vol->used_bytes;
+		gluebi_vol->gluebi_mtd.size = vol->used_bytes;
+}
+
+void ubi_gluebi_setname(int ubi, const char *old, const char *new)
+{
+	struct ubi_gluebi_volume *gluebi_vol;
+	const char *newname;
+
+	gluebi_vol = ubi_gluebi_find(ubi, old);
+	if (!gluebi_vol)
+		return;
+
+	if (new) {
+		newname = kstrdup(new, GFP_KERNEL);
+		kfree(gluebi_vol->gluebi_mtd.name);
+		gluebi_vol->gluebi_mtd.name = newname;
+	} else
+		newname = new;
+
+	gluebi_vol->vol_id = newname;
+}
+
+static int ubi_gluebi_openvol(int ubi_device, const char *volume_name,
+		struct ubi_volume_desc **vol, struct ubi_volume_info *vi)
+{
+	BUG_ON(!vol || !vi);
+	*vol = ubi_open_volume_nm(ubi_device, volume_name,
+			UBI_READONLY);
+	if (IS_ERR(vol)) {
+		dbg_gen("ubi_open_volume_nm error %ld\n", PTR_ERR(vol));
+		return PTR_ERR(vol);
+	}
+	ubi_get_volume_info(*vol, vi);
+	return 0;
 }
+
+static int ubi_gluebi_notify(struct notifier_block *nb,
+		unsigned long l, void *ns_ptr)
+{
+	struct ubi_device_info di;
+	struct ubi_volume_info vi;
+	struct ubi_volume_desc *vol = NULL;
+	struct ubi_volume_notification *ns = ns_ptr;
+
+	switch ((enum ubi_volume_notification_type)l) {
+	case UBI_VOLUME_ADDED:
+		if (ubi_gluebi_openvol(ns->ubi_device, ns->volume_name,
+				&vol, &vi))
+			goto out;
+		ubi_get_device_info(ns->ubi_device, &di);
+		ubi_create_gluebi(&di, &vi);
+		break;
+	case UBI_VOLUME_DELETED:
+		ubi_destroy_gluebi(ns->ubi_device, ns->volume_name);
+		break;
+	case UBI_VOLUME_CHANGED:
+		if (ubi_gluebi_openvol(ns->ubi_device, ns->volume_name,
+				&vol, &vi))
+			goto out;
+		ubi_gluebi_updated(&vi);
+		break;
+	case UBI_VOLUME_RENAMING:
+		ubi_gluebi_setname(ns->ubi_device, ns->volume_name, NULL);
+		break;
+	case UBI_VOLUME_RENAMED:
+		ubi_gluebi_setname(ns->ubi_device, NULL, ns->volume_name);
+		break;
+	}
+
+	if (vol)
+		ubi_close_volume(vol);
+
+out:
+	return NOTIFY_OK;
+}
+
+static struct notifier_block ubi_gluebi_notifier = {
+	.notifier_call	= ubi_gluebi_notify,
+};
+
+int __init ubi_gluebi_init(void)
+{
+	return ubi_register_volume_notifier(&ubi_gluebi_notifier, 0);
+}
+
+void __exit ubi_gluebi_exit(void)
+{
+	ubi_unregister_volume_notifier(&ubi_gluebi_notifier);
+}
+
+module_init(ubi_gluebi_init);
+module_exit(ubi_gluebi_exit);
+MODULE_LICENSE("GPL");
-- 
1.5.6
