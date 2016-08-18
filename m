Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baRLH-00029B-UN
 for linux-mtd@lists.infradead.org; Thu, 18 Aug 2016 17:43:00 +0000
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
 by Forcepoint Email with ESMTPS id 37873E9916DD0
 for <linux-mtd@lists.infradead.org>; Thu, 18 Aug 2016 18:42:24 +0100 (IST)
From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
To: <linux-mtd@lists.infradead.org>
CC: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Subject: [PATCH mtd-utils 1/1] fs-tests: integrity: don't include header
 <bits/stdio_lim.h>
Date: Thu, 18 Aug 2016 23:11:30 +0530
Message-ID: <1471542090-5010-1-git-send-email-rahul.bedarkar@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In commit ca7a5eda221d("integck.c: Fix buffer overflow in save_file")
we started including header <bits/stdio_lim.h>.

But with musl C library, we get following build error

  integck.c:37:28: fatal error: bits/stdio_lim.h: No such file or directory
   #include <bits/stdio_lim.h>
                              ^
  compilation terminated.
  make[2]: *** [integck] Error 1

Header <bits/stdio_lim.h> is not available in musl C library. However
<stdio.h> has all definition that <bits/stdio_lim.h> supposed to be
providing. Moreover <bits/stdio_lim.h> shouldn't be included directly
instead we should be using <stdio.h>.

Since we already include <stdio.h> and in case of uClibc or glibc
<bits/stdio_lim.h> gets included internally, we can safely remove it.

This build issue is found by Buildroot autobuilder
http://autobuild.buildroot.net/results/175/1754861457af520480cc34d7d2d0edff2868ff66/

Fixes: ca7a5eda221d("integck.c: Fix buffer overflow in save_file")
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 tests/fs-tests/integrity/integck.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 8badd1f..c6319fb 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -32,7 +32,6 @@
 #include <assert.h>
 #include <mntent.h>
 #include <execinfo.h>
-#include <bits/stdio_lim.h>
 #include <sys/mman.h>
 #include <sys/vfs.h>
 #include <sys/mount.h>
-- 
2.6.2
