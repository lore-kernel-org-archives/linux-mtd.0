Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYTnA-0005B4-HU
	for linux-mtd@lists.infradead.org; Sat, 23 Jan 2010 00:24:01 +0000
Received: by bwz4 with SMTP id 4so1645861bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 16:23:55 -0800 (PST)
Subject: [PATCH 4/8] MTD: create lockless versions of {get,put}_mtd_device
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <1264205925.31827.3.camel@maxim-laptop>
References: <1264205925.31827.3.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 Jan 2010 02:23:52 +0200
Message-ID: <1264206232.31827.8.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From b7c27159b5540b0951f6b030ffca895f34a3b3d3 Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sat, 23 Jan 2010 02:04:44 +0200
Subject: [PATCH 4/8] MTD: create lockless versions of {get,put}_mtd_device

This will be used to resolve deadlock in block translation layer.

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
