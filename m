Received: from delta.superhosting.bg ([91.196.124.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NkeE6-0001sq-Ey
	for linux-mtd@lists.infradead.org; Thu, 25 Feb 2010 13:58:06 +0000
Received: from 87-126-155-26.btc-net.bg ([87.126.155.26] helo=[192.168.1.2])
	by delta.superhosting.bg with esmtpsa (SSLv3:AES256-SHA:256)
	(Exim 4.69) (envelope-from <radoslav.kolev@rnd.bg>)
	id 1NkeE2-0001MM-NB
	for linux-mtd@lists.infradead.org; Thu, 25 Feb 2010 15:57:58 +0200
Subject: [PATCH] [MTD] nandtest.c: fix --keep argument
From: Radoslav Kolev <radoslav.kolev@rnd.bg>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 25 Feb 2010 15:58:10 +0200
Message-Id: <1267106290.8549.91.camel@rado-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] nandtest.c: fix --keep argument

When called with the --keep argument nandtest is supposed to restore the
original content after testing, but currently it doesn't. The patch
below fixes the problem.

Signed-off-by: Radoslav Kolev <radoslav.kolev@rnd.bg>

--- mtd-utils/nandtest.c	2010-02-25 11:44:59.000000000 +0200
+++ mtd-utils-patched/nandtest.c	2010-02-25 15:48:48.000000000 +0200
@@ -259,7 +259,7 @@
 				printf("\r%08x: reading... ", (unsigned)test_ofs);
 				fflush(stdout);
 
-				len = pread(fd, rbuf, meminfo.erasesize, test_ofs);
+				len = pread(fd, kbuf, meminfo.erasesize, test_ofs);
 				if (len < meminfo.erasesize) {
 					printf("\n");
 					if (len)
