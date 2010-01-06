Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSdhP-0000UU-W4
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 21:45:56 +0000
Received: by fxm22 with SMTP id 22so20325031fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 13:45:51 -0800 (PST)
Subject: [PATCH 2/9] MTD: create lockless versions of {get,put}_mtd_device
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
In-Reply-To: <1262814216.14552.22.camel@maxim-laptop>
References: <1262814216.14552.22.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 23:45:48 +0200
Message-ID: <1262814348.14552.24.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 10333e0ed6dc7b176f2dfce04f08572f9e1b04ce Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Tue, 5 Jan 2010 22:29:31 +0200
Subject: [PATCH 2/9] MTD: create lockless versions of {get,put}_mtd_device

This will be used to resolve deadlock in block translation layer
---
 drivers/mtd/mtdcore.c   |   55 +++++++++++++++++++++++++++-------------------
 include/linux/mtd/mtd.h |    3 +-
 2 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 738e329..e9daf87 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -454,27 +454,30 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
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
-	}
+	if (!ret || (err = __get_mtd_device(ret)))
+		ret = ERR_PTR(err);
 
-	ret->usecount++;
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
+		if ((err = mtd->get_device(mtd))) {
+			module_put(mtd->owner);
+			return err;
+		}
+	}
+	mtd->usecount++;
+	return 0;
 }
 
 /**
@@ -525,18 +528,22 @@ out_unlock:
 
 void put_mtd_device(struct mtd_info *mtd)
 {
-	int c;
-
 	mutex_lock(&mtd_table_mutex);
-	c = --mtd->usecount;
-	if (mtd->put_device)
-		mtd->put_device(mtd);
+	__put_mtd_device(mtd);
 	mutex_unlock(&mtd_table_mutex);
-	BUG_ON(c < 0);
 
 	module_put(mtd->owner);
 }
 
+void __put_mtd_device(struct mtd_info *mtd)
+{
+	--mtd->usecount;
+	BUG_ON(mtd->usecount < 0);
+
+	if (mtd->put_device)
+		mtd->put_device(mtd);
+}
+
 /* default_mtd_writev - default mtd writev method for MTD devices that
  *			don't implement their own
  */
@@ -570,7 +577,9 @@ EXPORT_SYMBOL_GPL(add_mtd_device);
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
