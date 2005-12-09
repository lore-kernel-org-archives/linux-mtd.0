Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EkkZk-0002Jb-GF
	for linux-mtd@lists.infradead.org; Fri, 09 Dec 2005 10:54:28 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id E324E4733B
	for <linux-mtd@lists.infradead.org>;
	Fri,  9 Dec 2005 18:53:49 +0300 (MSK)
Message-ID: <4399A88D.7080303@yandex.ru>
Date: Fri, 09 Dec 2005 18:53:49 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
References: <4399A6D5.9050304@yandex.ru>
In-Reply-To: <4399A6D5.9050304@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] MTD + 2.6.13/2.6.14 OOPS in class_device_create() fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> As 2.6.15 is not yet out and 2.6.14 is still used, I offer the attached 
> hotfix for now.
Pardon, here is the hotfix.

==================================================================
diff --exclude=CVS -auNr mtd-cvs/drivers/mtd/mtdchar.c 
mtd-fix/drivers/mtd/mtdchar.c
--- mtd-cvs/drivers/mtd/mtdchar.c       2005-12-09 18:36:24.000000000 +0300
+++ mtd-fix/drivers/mtd/mtdchar.c       2005-12-09 18:34:43.000000000 +0300
@@ -21,15 +21,28 @@

  static struct class *mtd_class;

+/*
+ * In 2.6.13 and 2.6.14 kernels class_device_create() had different 
prototype.
+ * No idea how to fix it in compatmac.h, so this is a hotfix. Must go 
sometime.
+ */
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,15) && \
+    LINUX_VERSION_CODE > KERNEL_VERSION(2,6,12)
+#define mtd_class_device_create(cls, parent, devt, device, fmt, num) \
+               class_device_create(cls, devt, device, fmt, num)
+#else
+#define mtd_class_device_create(cls, parent, devt, device, fmt, num) \
+               class_device_create(cls, parent, devt, device, fmt, num)
+#endif
+
  static void mtd_notify_add(struct mtd_info* mtd)
  {
         if (!mtd)
                 return;

-       class_device_create(mtd_class, NULL, MKDEV(MTD_CHAR_MAJOR, 
mtd->index*2),
+       mtd_class_device_create(mtd_class, NULL, MKDEV(MTD_CHAR_MAJOR, 
mtd->index*2),
                             NULL, "mtd%d", mtd->index);

-       class_device_create(mtd_class, NULL,
+       mtd_class_device_create(mtd_class, NULL,
                             MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
                             NULL, "mtd%dro", mtd->index);
  }
==================================================================

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
