Received: from host.globalsecureserver.com ([209.239.37.116])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AxaSf-0001Zu-QL
	for linux-mtd@lists.infradead.org; Sun, 29 Feb 2004 23:35:05 +0000
Received: from softplc.com (dpc69194025.direcpc.com [69.19.4.25])
	i1TNYxUu007281
	for <linux-mtd@lists.infradead.org>; Sun, 29 Feb 2004 18:35:01 -0500
Message-ID: <40427594.4030602@softplc.com>
Date: Sun, 29 Feb 2004 17:28:20 -0600
From: DHollenbeck <dick@softplc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [PATCH] util/nftl_format  util/nftldump
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

RE: most recent snapshot, while trying to make util/nftl* utilities:

The util/Makefile had the subject utilities commented out.

Uncommenting created compile time errors.

A simple fix is the attached patch to nftl.h,

--- mtdold/include/linux/mtd/nftl.h    2003-05-23 06:25:02.000000000 -0500
+++ mtd/include/linux/mtd/nftl.h    2004-02-29 17:07:47.000000000 -0600
@@ -9,5 +9,8 @@

 #include <linux/mtd/mtd.h>
+
+#if defined(__KERNEL__)
 #include <linux/mtd/blktrans.h>
+#endif

 /* Block Control Information */


Dick Hollenbeck
