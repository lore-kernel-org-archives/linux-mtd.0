Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NdBAK-00072d-H8
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 23:31:21 +0000
Received: by fxm28 with SMTP id 28so3537590fxm.20
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Feb 2010 15:31:15 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 01/17] MTD: create lockless versions of {get,
	put}_mtd_device This will be used to resolve deadlock in block
	translation layer.
Date: Fri,  5 Feb 2010 01:30:41 +0200
Message-Id: <1265326257-4446-2-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1265326257-4446-1-git-send-email-maximlevitsky@gmail.com>
References: <1265326257-4446-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These functions can be used as long as we don't need access to global mtd table, but have
a pointer to the mtd device.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtdcore.c   |   60 ++++++++++++++++++++++++++++++----------------
 include/linux/mtd/mtd.h |    3 +-
 2 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c356c0a..3bdb7e8 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -453,27 +453,38 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 			ret = NULL;
 	}
 
-	if (!ret)
-		goto out_unlock;
-
-	if (!try_module_get(ret->owner))
-		goto out_unlock;
-
-	if (ret->get_device) {
-		err = ret->get_device(ret);
-		if (err)
-			goto out_put;
+	if (!ret) {
+		ret = ERR_PTR(err);
+		goto out;
 	}
 
-	ret->usecount++;
+	err = __get_mtd_device(ret);
+	if (err)
+		ret = ERR_PTR(err);
+out:
 	mutex_unlock(&mtd_table_mutex);
 	return ret;
+}
 
-out_put:
-	module_put(ret->owner);
-out_unlock:
-	mutex_unlock(&mtd_table_mutex);
-	return ERR_PTR(err);
+
+int __get_mtd_device(struct mtd_info *mtd)
+{
+	int err;
+
+	if (!try_module_get(mtd->owner))
+		return -ENODEV;
+
+	if (mtd->get_device) {
+
+		err = mtd->get_device(mtd);
+
+		if (err) {
+			module_put(mtd->owner);
+			return err;
+		}
+	}
+	mtd->usecount++;
+	return 0;
 }
 
 /**
@@ -524,14 +535,19 @@ out_unlock:
 
 void put_mtd_device(struct mtd_info *mtd)
 {
-	int c;
-
 	mutex_lock(&mtd_table_mutex);
-	c = --mtd->usecount;
+	__put_mtd_device(mtd);
+	mutex_unlock(&mtd_table_mutex);
+
+}
+
+void __put_mtd_device(struct mtd_info *mtd)
+{
+	--mtd->usecount;
+	BUG_ON(mtd->usecount < 0);
+
 	if (mtd->put_device)
 		mtd->put_device(mtd);
-	mutex_unlock(&mtd_table_mutex);
-	BUG_ON(c < 0);
 
 	module_put(mtd->owner);
 }
@@ -569,7 +585,9 @@ EXPORT_SYMBOL_GPL(add_mtd_device);
 EXPORT_SYMBOL_GPL(del_mtd_device);
 EXPORT_SYMBOL_GPL(get_mtd_device);
 EXPORT_SYMBOL_GPL(get_mtd_device_nm);
+EXPORT_SYMBOL_GPL(__get_mtd_device);
 EXPORT_SYMBOL_GPL(put_mtd_device);
+EXPORT_SYMBOL_GPL(__put_mtd_device);
 EXPORT_SYMBOL_GPL(register_mtd_user);
 EXPORT_SYMBOL_GPL(unregister_mtd_user);
 EXPORT_SYMBOL_GPL(default_mtd_writev);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0f32a9b..662d747 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -290,8 +290,9 @@ extern int add_mtd_device(struct mtd_info *mtd);
 extern int del_mtd_device (struct mtd_info *mtd);
 
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
+extern int __get_mtd_device(struct mtd_info *mtd);
+extern void __put_mtd_device(struct mtd_info *mtd);
 extern struct mtd_info *get_mtd_device_nm(const char *name);
-
 extern void put_mtd_device(struct mtd_info *mtd);
 
 
-- 
1.6.3.3
