Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TcWbm-0002KC-CB
 for linux-mtd@lists.infradead.org; Sun, 25 Nov 2012 07:26:31 +0000
Received: by mail-da0-f49.google.com with SMTP id v40so3260281dad.36
 for <linux-mtd@lists.infradead.org>; Sat, 24 Nov 2012 23:26:24 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi-tests: fix pthreads linking
Date: Sat, 24 Nov 2012 23:26:09 -0800
Message-Id: <1353828369-14493-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Technically, '-l' linker options should be included only after the
objects which must link to the library. So when we include '-lpthread'
in the LDFLAGS variable, it gets placed too early (i.e., before the
io_paral.o object), and so the pthread linkage never occurs. The
following error probably only shows up with linkers that don't link
pthreads by default.

$ make tests V=1
...
gcc -I../../ubi-utils//include -I ../../include -lpthread -Wall -Wextra -Wwrite-strings -Wno-sign-compare -ffunction-sections -fdata-sections -Wl,--gc-sections   -g -o /home/norris/git/mtd-utils/tests/ubi-tests/io_paral /home/norris/git/mtd-utils/tests/ubi-tests/io_paral.o /home/norris/git/mtd-utils/tests/ubi-tests/helpers.o libubi.a
/home/norris/git/mtd-utils/tests/ubi-tests/io_paral.o: In function `main':
/home/norris/git/mtd-utils/tests/ubi-tests/io_paral.c:287: undefined reference to `pthread_create'
/home/norris/git/mtd-utils/tests/ubi-tests/io_paral.c:295: undefined reference to `pthread_create'
/home/norris/git/mtd-utils/tests/ubi-tests/io_paral.c:303: undefined reference to `pthread_join'
collect2: ld returned 1 exit status
make[2]: *** [/home/norris/git/mtd-utils/tests/ubi-tests/io_paral] Error 1
...

$ ld --version
GNU ld (GNU Binutils for Ubuntu) 2.22
...
$ gcc --version
gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3
...

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 tests/ubi-tests/Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/ubi-tests/Makefile b/tests/ubi-tests/Makefile
index ace0120..c434a6f 100644
--- a/tests/ubi-tests/Makefile
+++ b/tests/ubi-tests/Makefile
@@ -8,7 +8,8 @@ LIBS = libubi
 TARGETS=io_update volrefcnt integ io_paral io_read io_basic \
           mkvol_basic mkvol_bad mkvol_paral rsvol
 
-CFLAGS += -I$(LIBUBI_HEADER_PATH) -I $(KERNELHDR) -lpthread
+CFLAGS += -I$(LIBUBI_HEADER_PATH) -I $(KERNELHDR)
+LDLIBS += -lpthread
 
 include ../../common.mk
 
-- 
1.7.9.5
