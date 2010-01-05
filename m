Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSBCH-00046e-P0
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 15:19:54 +0000
Subject: [PATCH 1/6] mtd: Introduce and use iteration macro for reading the
	MTD device table
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 05 Jan 2010 15:19:46 +0000
Message-Id: <1262704786.2837.5.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/mtd_blkdevs.c |   10 ++++----
 drivers/mtd/mtdcore.c     |   54 ++++++++++++++++++++------------------------
 drivers/mtd/mtdcore.h     |   15 ++++++++++++
 3 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index c82e09b..85a52b3 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -335,7 +335,8 @@ static struct mtd_notifier blktrans_notifier = {
 
 int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 {
-	int ret, i;
+	struct mtd_info *mtd;
+	int ret;
 
 	/* Register the notifier if/when the first device type is
 	   registered, to prevent the link/init ordering from fucking
@@ -389,10 +390,9 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	INIT_LIST_HEAD(&tr->devs);
 	list_add(&tr->list, &blktrans_majors);
 
-	for (i=0; i<MAX_MTD_DEVICES; i++) {
-		if (mtd_table[i] && mtd_table[i]->type != MTD_ABSENT)
-			tr->add_mtd(tr, mtd_table[i]);
-	}
+	mtd_for_each_device(mtd)
+		if (mtd->type != MTD_ABSENT)
+			tr->add_mtd(tr, mtd);
 
 	mutex_unlock(&mtd_table_mutex);
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c356c0a..402d417 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -381,7 +381,7 @@ int del_mtd_device (struct mtd_info *mtd)
 
 void register_mtd_user (struct mtd_notifier *new)
 {
-	int i;
+	struct mtd_info *mtd;
 
 	mutex_lock(&mtd_table_mutex);
 
@@ -389,9 +389,8 @@ void register_mtd_user (struct mtd_notifier *new)
 
  	__module_get(THIS_MODULE);
 
-	for (i=0; i< MAX_MTD_DEVICES; i++)
-		if (mtd_table[i])
-			new->add(mtd_table[i]);
+	mtd_for_each_device(mtd)
+		new->add(mtd);
 
 	mutex_unlock(&mtd_table_mutex);
 }
@@ -408,15 +407,14 @@ void register_mtd_user (struct mtd_notifier *new)
 
 int unregister_mtd_user (struct mtd_notifier *old)
 {
-	int i;
+	struct mtd_info *mtd;
 
 	mutex_lock(&mtd_table_mutex);
 
 	module_put(THIS_MODULE);
 
-	for (i=0; i< MAX_MTD_DEVICES; i++)
-		if (mtd_table[i])
-			old->remove(mtd_table[i]);
+	mtd_for_each_device(mtd)
+		old->remove(mtd);
 
 	list_del(&old->list);
 	mutex_unlock(&mtd_table_mutex);
@@ -438,15 +436,18 @@ int unregister_mtd_user (struct mtd_notifier *old)
 
 struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 {
-	struct mtd_info *ret = NULL;
-	int i, err = -ENODEV;
+	struct mtd_info *ret = NULL, *other;
+	int err = -ENODEV;
 
 	mutex_lock(&mtd_table_mutex);
 
 	if (num == -1) {
-		for (i=0; i< MAX_MTD_DEVICES; i++)
-			if (mtd_table[i] == mtd)
-				ret = mtd_table[i];
+		mtd_for_each_device(other) {
+			if (other == mtd) {
+				ret = mtd;
+				break;
+			}
+		}
 	} else if (num >= 0 && num < MAX_MTD_DEVICES) {
 		ret = mtd_table[num];
 		if (mtd && mtd != ret)
@@ -487,14 +488,14 @@ out_unlock:
 
 struct mtd_info *get_mtd_device_nm(const char *name)
 {
-	int i, err = -ENODEV;
-	struct mtd_info *mtd = NULL;
+	int err = -ENODEV;
+	struct mtd_info *mtd = NULL, *other;
 
 	mutex_lock(&mtd_table_mutex);
 
-	for (i = 0; i < MAX_MTD_DEVICES; i++) {
-		if (mtd_table[i] && !strcmp(name, mtd_table[i]->name)) {
-			mtd = mtd_table[i];
+	mtd_for_each_device(other) {
+		if (!strcmp(name, other->name)) {
+			mtd = other;
 			break;
 		}
 	}
@@ -581,14 +582,9 @@ EXPORT_SYMBOL_GPL(default_mtd_writev);
 
 static struct proc_dir_entry *proc_mtd;
 
-static inline int mtd_proc_info (char *buf, int i)
+static inline int mtd_proc_info(char *buf, struct mtd_info *this)
 {
-	struct mtd_info *this = mtd_table[i];
-
-	if (!this)
-		return 0;
-
-	return sprintf(buf, "mtd%d: %8.8llx %8.8x \"%s\"\n", i,
+	return sprintf(buf, "mtd%d: %8.8llx %8.8x \"%s\"\n", this->index,
 		       (unsigned long long)this->size,
 		       this->erasesize, this->name);
 }
@@ -596,15 +592,15 @@ static inline int mtd_proc_info (char *buf, int i)
 static int mtd_read_proc (char *page, char **start, off_t off, int count,
 			  int *eof, void *data_unused)
 {
-	int len, l, i;
+	struct mtd_info *mtd;
+	int len, l;
         off_t   begin = 0;
 
 	mutex_lock(&mtd_table_mutex);
 
 	len = sprintf(page, "dev:    size   erasesize  name\n");
-        for (i=0; i< MAX_MTD_DEVICES; i++) {
-
-                l = mtd_proc_info(page + len, i);
+	mtd_for_each_device(mtd) {
+		l = mtd_proc_info(page + len, mtd);
                 len += l;
                 if (len+begin > off+count)
                         goto done;
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index a33251f..e2f93a3 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -9,3 +9,18 @@
 
 extern struct mutex mtd_table_mutex;
 extern struct mtd_info *mtd_table[MAX_MTD_DEVICES];
+
+static inline struct mtd_info *__mtd_next_device(int i)
+{
+	while (i < MAX_MTD_DEVICES) {
+		if (mtd_table[i])
+			return mtd_table[i];
+		i++;
+	}
+	return NULL;
+}
+
+#define mtd_for_each_device(mtd)			\
+	for ((mtd) = __mtd_next_device(0);		\
+	     (mtd) != NULL;				\
+	     (mtd) = __mtd_next_device(mtd->index + 1))
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
