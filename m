Received: from py-out-1112.google.com ([64.233.166.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW2zV-00069A-AU
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 05:45:49 +0000
Received: by py-out-1112.google.com with SMTP id a73so1275171pye.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 22:45:49 -0700 (PDT)
Message-ID: <48AD011A.30505@gmail.com>
Date: Wed, 20 Aug 2008 22:46:02 -0700
From: Jared Hulbert <jaredeh@gmail.com>
MIME-Version: 1.0
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM,
	cotte@de.ibm.com, nickpiggin@yahoo.com.au
Subject: [PATCH 09/10] AXFS: axfs_uml.c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Reply-To: jaredeh@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UML specific code for working with iomem 'devices'.  UML is handy for testing.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
diff --git a/fs/axfs/axfs_uml.c b/fs/axfs/axfs_uml.c
new file mode 100644
index 0000000..7d479a0
--- /dev/null
+++ b/fs/axfs/axfs_uml.c
@@ -0,0 +1,47 @@
+/*
+ * Advanced XIP File System for Linux - AXFS
+ *   Readonly, compressed, and XIP filesystem for Linux systems big and small
+ *
+ * Copyright(c) 2008 Numonyx
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * Authors:
+ *  Jared Hulbert <jaredeh@gmail.com>
+ *
+ * Project url: http://axfs.sourceforge.net
+ *
+ * axfs_uml.c -
+ *   Allows axfs to a UML kernels find_iomem() interface as an XIP device or
+ *   dummy functions if this is not a UML build.
+ */
+
+#include <linux/axfs.h>
+#ifdef CONFIG_UML
+#include <mem_user.h>
+int axfs_get_uml_address(char *iomem, unsigned long *address,
+			 unsigned long *length)
+{
+	*address = find_iomem(iomem, length);
+	if (!(*address)) {
+		printk(KERN_DEBUG "axfs: find_iomem() failed\n");
+		return -EINVAL;
+	}
+
+	if (*length < PAGE_SIZE) {
+		printk(KERN_DEBUG
+		       "axfs: iomem() too small, must be at least %li Bytes\n",
+		       PAGE_SIZE);
+		return -EINVAL;
+	}
+	return 0;
+}
+#else
+int axfs_get_uml_address(char *iomem, unsigned long *address,
+			 unsigned long *length)
+{
+	return 0;
+}
+#endif /* CONFIG_UML */
