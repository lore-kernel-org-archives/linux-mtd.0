Received: from ti-out-0910.google.com ([209.85.142.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2mvB-0005Xr-B7
	for linux-mtd@lists.infradead.org; Wed, 19 Nov 2008 13:16:41 +0000
Received: by ti-out-0910.google.com with SMTP id a21so2271159tia.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Nov 2008 05:16:40 -0800 (PST)
From: Qinghuang Feng <qhfeng.kernel@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 4/4] drivers/mtd/ftl.c: mark {__init|__exit} for {init|exit}
	functions
Date: Wed, 19 Nov 2008 21:16:33 +0800
Message-ID: <492411b7.0c636e0a.1c92.ffffe107@mx.google.com>
Cc: Mike, linux-kernel@vger.kernel.org, David, linux-mtd@lists.infradead.org,
	Mike Lavender <mike@steroidmicros.com>, Rapoport <mike@compulab.co.il>,
	Hinds <dahinds@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Qinghuang Feng <qhfeng.kernel@gmail.com>
---
diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 9bf581c..c3bbf38 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1099,7 +1099,7 @@ static struct mtd_blktrans_ops ftl_tr = {
 	.owner		= THIS_MODULE,
 };
 
-static int init_ftl(void)
+static int __init init_ftl(void)
 {
 	return register_mtd_blktrans(&ftl_tr);
 }
