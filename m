Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MA7qI-0006pl-0a
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 19:34:20 +0000
Subject: [PATCH] 3/3 ubi notification API Re: [PATCH] [UBI] [1/3] ubi
	notifications API
From: dmitry pervushin <dpervushin@embeddedalley.com>
To: dedekind@infradead.org
In-Reply-To: <1242661167.3238.10.camel@localhost.localdomain>
References: <1241018978.20184.33.camel@hp.diimka.lan>
	<1242660138.3238.5.camel@localhost.localdomain>
	<1242661167.3238.10.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 29 May 2009 23:27:31 +0400
Message-Id: <1243625251.4067.29.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dpervushin@embeddedalley.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-18 at 18:39 +0300, Artem Bityutskiy wrote:
> On Mon, 2009-05-18 at 18:22 +0300, Artem Bityutskiy wrote:
> > Dmitry,
> > 
> > I've re-work the first patch of yours. I think the locking should
> > be correct now. The commit message shortly list the changes I've
> > done.
> > 
> > I also send the second patch. The only thing I fixed there was
> > the spelling of your name - I made it start with a capital letter.
> > I hope you do not mind.
> > 
> > Please, provide the third patch. You should not try to open an
> > UBI volume from within a notifier, because it won't work. I
> > think you simply did not test your patches before sending.
> > Neither did I. But please, this time, do test the patches.
> > It is very easy to do with nansim.
> > 
> > I'll send the patches as 2 follow-up e-mail for your review.
> 
> I've also created an "experimental" branch in the ubi-2.6.git
> tree for your convenience:
> 
> http://git.infradead.org/ubi-2.6.git?a=shortlog;h=refs/heads/experimental
> git://git.infradead.org/ubi-2.6.git experimental
Sorry for late response; I reviewed your changes, and although
prohibiting of using ubi api from within notifiers does not look very
amazing to me... but it seems that it is the only robust way. The 3rd
patch from the serie is inlined below (tested on the stmp378x board as
well as on nandsim)

The standalone gluebi support that uses UBI notifications.

Signed-off-by: Dmitry Pervushin <dpervushin@embeddedalley.com>

---
 drivers/mtd/ubi/Kconfig  |    2 
 drivers/mtd/ubi/Makefile |    2 
 drivers/mtd/ubi/gluebi.c |  217 +++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 183 insertions(+), 38 deletions(-)

Index: linux-2.6/drivers/mtd/ubi/Kconfig
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/Kconfig
+++ linux-2.6/drivers/mtd/ubi/Kconfig
@@ -49,7 +49,7 @@ config MTD_UBI_BEB_RESERVE
 	  reserved. Leave the default value if unsure.
 
 config MTD_UBI_GLUEBI
-	bool "Emulate MTD devices"
+	tristate "Emulate MTD devices"
 	default n
 	depends on MTD_UBI
 	help
Index: linux-2.6/drivers/mtd/ubi/Makefile
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/Makefile
+++ linux-2.6/drivers/mtd/ubi/Makefile
@@ -4,4 +4,4 @@ ubi-y += vtbl.o vmt.o upd.o build.o cdev
 ubi-y += misc.o
 
 ubi-$(CONFIG_MTD_UBI_DEBUG) += debug.o
-ubi-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
+obj-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
Index: linux-2.6/drivers/mtd/ubi/gluebi.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/gluebi.c
+++ linux-2.6/drivers/mtd/ubi/gluebi.c
@@ -31,6 +31,32 @@
 #include <linux/math64.h>
 #include "ubi.h"
 
+struct ubi_gluebi_volume {
+	struct mtd_info gluebi_mtd;
+	int gluebi_refcount;
+	struct ubi_volume_desc *gluebi_desc;
+	int ubi_num;
+	int vol_id;
+	struct list_head list;
+};
+
+static LIST_HEAD(ubi_gluebi_mtds);
+static DEFINE_SPINLOCK(ubi_gluebi_lock);
+
+static struct ubi_gluebi_volume *ubi_gluebi_find(int ubi_num, int vol_id)
+{
+	struct ubi_gluebi_volume *pos = NULL;
+
+	spin_lock(&ubi_gluebi_lock);
+	list_for_each_entry(pos, &ubi_gluebi_mtds, list)
+		if (pos->ubi_num == ubi_num && pos->vol_id == vol_id) {
+			spin_unlock(&ubi_gluebi_lock);
+			return pos;
+		}
+	spin_unlock(&ubi_gluebi_lock);
+	return NULL;
+}
+
 /**
  * gluebi_get_device - get MTD device reference.
  * @mtd: the MTD device description object
@@ -41,9 +67,13 @@
  */
 static int gluebi_get_device(struct mtd_info *mtd)
 {
-	struct ubi_volume *vol;
+	struct ubi_gluebi_volume *vol;
+	int ubi_mode = UBI_READWRITE;
 
-	vol = container_of(mtd, struct ubi_volume, gluebi_mtd);
+	if (!(mtd->flags & MTD_WRITEABLE))
+		ubi_mode = UBI_READONLY;
+
+	vol = container_of(mtd, struct ubi_gluebi_volume, gluebi_mtd);
 
 	/*
 	 * We do not introduce locks for gluebi reference count because the
@@ -66,8 +96,7 @@ static int gluebi_get_device(struct mtd_
 	 * This is the first reference to this UBI volume via the MTD device
 	 * interface. Open the corresponding volume in read-write mode.
 	 */
-	vol->gluebi_desc = ubi_open_volume(vol->ubi->ubi_num, vol->vol_id,
-					   UBI_READWRITE);
+	vol->gluebi_desc = ubi_open_volume(vol->ubi_num, vol->vol_id, ubi_mode);
 	if (IS_ERR(vol->gluebi_desc))
 		return PTR_ERR(vol->gluebi_desc);
 	vol->gluebi_refcount += 1;
@@ -83,9 +112,9 @@ static int gluebi_get_device(struct mtd_
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
@@ -107,16 +136,14 @@ static int gluebi_read(struct mtd_info *
 		       size_t *retlen, unsigned char *buf)
 {
 	int err = 0, lnum, offs, total_read;
-	struct ubi_volume *vol;
-	struct ubi_device *ubi;
+	struct ubi_gluebi_volume *vol;
 
 	dbg_gen("read %zd bytes from offset %lld", len, from);
 
 	if (len < 0 || from < 0 || from + len > mtd->size)
 		return -EINVAL;
 
-	vol = container_of(mtd, struct ubi_volume, gluebi_mtd);
-	ubi = vol->ubi;
+	vol = container_of(mtd, struct ubi_gluebi_volume, gluebi_mtd);
 
 	lnum = div_u64_rem(from, mtd->erasesize, &offs);
 	total_read = len;
@@ -126,7 +153,7 @@ static int gluebi_read(struct mtd_info *
 		if (to_read > total_read)
 			to_read = total_read;
 
-		err = ubi_eba_read_leb(ubi, vol, lnum, buf, offs, to_read, 0);
+		err = ubi_read(vol->gluebi_desc, lnum, buf, offs, to_read);
 		if (err)
 			break;
 
@@ -155,18 +182,16 @@ static int gluebi_write(struct mtd_info
 		       size_t *retlen, const u_char *buf)
 {
 	int err = 0, lnum, offs, total_written;
-	struct ubi_volume *vol;
-	struct ubi_device *ubi;
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
 
 	lnum = div_u64_rem(to, mtd->erasesize, &offs);
@@ -181,8 +206,7 @@ static int gluebi_write(struct mtd_info
 		if (to_write > total_written)
 			to_write = total_written;
 
-		err = ubi_eba_write_leb(ubi, vol, lnum, buf, offs, to_write,
-					UBI_UNKNOWN);
+		err = ubi_write(vol->gluebi_desc, lnum, buf, offs, to_write);
 		if (err)
 			break;
 
@@ -207,8 +231,7 @@ static int gluebi_write(struct mtd_info
 static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	int err, i, lnum, count;
-	struct ubi_volume *vol;
-	struct ubi_device *ubi;
+	struct ubi_gluebi_volume *vol;
 
 	dbg_gen("erase %llu bytes at offset %llu", (unsigned long long)instr->len,
 		 (unsigned long long)instr->addr);
@@ -225,23 +248,24 @@ static int gluebi_erase(struct mtd_info
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
 
@@ -264,13 +288,28 @@ out_err:
  * corresponding fake MTD device. Returns zero in case of success and a
  * negative error code in case of failure.
  */
-int ubi_create_gluebi(struct ubi_device *ubi, struct ubi_volume *vol)
+static int ubi_create_gluebi(struct ubi_device_info *ubi,
+			     struct ubi_volume_info *vol)
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
+		ubi_err("Cannot allocate mtd->name");
+		kfree(v);
 		return -ENOMEM;
+	}
+
+	v->vol_id = vol->vol_id;
 
 	mtd->type = MTD_UBIVOLUME;
 	if (!ubi->ro_mode)
@@ -290,16 +329,21 @@ int ubi_create_gluebi(struct ubi_device
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
 
+	spin_lock(&ubi_gluebi_lock);
+	list_add_tail(&v->list, &ubi_gluebi_mtds);
+	spin_unlock(&ubi_gluebi_lock);
+
 	dbg_gen("added mtd%d (\"%s\"), size %llu, EB size %u",
 		mtd->index, mtd->name, (unsigned long long)mtd->size, mtd->erasesize);
 	return 0;
@@ -313,16 +357,28 @@ int ubi_create_gluebi(struct ubi_device
  * corresponding fake MTD device. Returns zero in case of success and a
  * negative error code in case of failure.
  */
-int ubi_destroy_gluebi(struct ubi_volume *vol)
+static int ubi_destroy_gluebi(int ubi_num, int ubi_vol_id)
 {
 	int err;
-	struct mtd_info *mtd = &vol->gluebi_mtd;
+	struct ubi_gluebi_volume *vol;
+	struct mtd_info *mtd;
+
+	vol = ubi_gluebi_find(ubi_num, ubi_vol_id);
+	if (!vol)
+		return -ENOENT;
 
+	mtd = &vol->gluebi_mtd;
 	dbg_gen("remove mtd%d", mtd->index);
 	err = del_mtd_device(mtd);
 	if (err)
 		return err;
 	kfree(mtd->name);
+
+	spin_lock(&ubi_gluebi_lock);
+	list_del(&vol->list);
+	spin_unlock(&ubi_gluebi_lock);
+
+	kfree(vol);
 	return 0;
 }
 
@@ -335,10 +391,98 @@ int ubi_destroy_gluebi(struct ubi_volume
  * volume is static. This is needed because static volumes cannot be read past
  * data they contain.
  */
-void ubi_gluebi_updated(struct ubi_volume *vol)
+static void ubi_gluebi_updated(struct ubi_volume_info *vol)
 {
-	struct mtd_info *mtd = &vol->gluebi_mtd;
+	struct ubi_gluebi_volume *gluebi_vol;
+
+	gluebi_vol = ubi_gluebi_find(vol->ubi_num, vol->vol_id);
+	if (!vol)
+		return /* -ENOENT */;
 
 	if (vol->vol_type == UBI_STATIC_VOLUME)
-		mtd->size = vol->used_bytes;
+		gluebi_vol->gluebi_mtd.size = vol->used_bytes;
 }
+
+/**
+ * ubi_gluebi_openvol - open the volume and get volume_info.
+ * @ubi_num: UBI device number
+ * @volume_id: volume id
+ * @vol: volume_desc for new opened volume will be stored here
+ * @vi: volume info will be stored here
+ */
+static int ubi_gluebi_openvol(int ubi_num, int volume_id,
+			      struct ubi_volume_desc **vol,
+			      struct ubi_volume_info *vi)
+{
+	BUG_ON(!vol || !vi);
+	*vol = ubi_open_volume(ubi_num, volume_id,
+			UBI_READONLY);
+	if (IS_ERR(vol)) {
+		dbg_gen("ubi_open_volume error %ld\n", PTR_ERR(vol));
+		return PTR_ERR(vol);
+	}
+	ubi_get_volume_info(*vol, vi);
+	return 0;
+}
+
+/**
+ * ubi_gluebi_notify - notification handler.
+ * @nb: the registered notifier_block
+ * @l: notification type
+ * @ns_ptr: pointer to the &struct ubi_volume_notification
+ */
+static int ubi_gluebi_notify(struct notifier_block *nb,
+			     unsigned long l, void *ns_ptr)
+{
+	struct ubi_device_info di;
+	struct ubi_volume_info vi;
+	struct ubi_volume_desc *vol = NULL;
+	struct ubi_volume_notification *ns = ns_ptr;
+
+	switch (l) {
+	case UBI_VOLUME_ADDED:
+		if (ubi_gluebi_openvol(ns->ubi_num, ns->vol_id,
+				       &vol, &vi))
+			return NOTIFY_OK;
+		ubi_get_device_info(ns->ubi_num, &di);
+		ubi_create_gluebi(&di, &vi);
+		break;
+	case UBI_VOLUME_DELETED:
+		ubi_destroy_gluebi(ns->ubi_num, ns->vol_id);
+		break;
+	case UBI_VOLUME_CHANGED:
+		if (ubi_gluebi_openvol(ns->ubi_num, ns->vol_id,
+				       &vol, &vi))
+			return NOTIFY_OK;
+		ubi_gluebi_updated(&vi);
+		break;
+	case UBI_VOLUME_RENAMED:
+		break;
+	}
+
+	if (vol)
+		ubi_close_volume(vol);
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block ubi_gluebi_notifier = {
+	.notifier_call	= ubi_gluebi_notify,
+};
+
+static int __init ubi_gluebi_init(void)
+{
+	spin_lock_init(&ubi_gluebi_lock);
+	return ubi_register_volume_notifier(&ubi_gluebi_notifier, 0);
+}
+
+static void __exit ubi_gluebi_exit(void)
+{
+	ubi_unregister_volume_notifier(&ubi_gluebi_notifier);
+}
+
+module_init(ubi_gluebi_init);
+module_exit(ubi_gluebi_exit);
+MODULE_DESCRIPTION("MTD emulation layer over UBI volumes");
+MODULE_AUTHOR("Artem Bityutskiy, Joern Engel");
+MODULE_LICENSE("GPL");
