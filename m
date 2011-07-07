Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qewt4-0006Rm-38
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 22:17:34 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 1/3] Makefile: fix "version.h" build for
 cross-compiling
Date: Thu, 7 Jul 2011 15:16:17 -0700
Message-ID: <1310076977-13593-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <CAN8TOE_hS9BXyQZzh+MaUou3i_=nGK78Bx8FiiDWYg6Xe44=4A@mail.gmail.com>
References: <CAN8TOE_hS9BXyQZzh+MaUou3i_=nGK78Bx8FiiDWYg6Xe44=4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When using "make CROSS=mipsel-linux-", I get the following errors:

/bin/sh: /home/norris/git/mtd-utils/mipsel-linux/include/version.h.tmp: No such file or directory
make: *** [/home/norris/git/mtd-utils/mipsel-linux/include/version.h.tmp] Error 1

Fix (suggested by Mike Frysinger): create the directory if it doesn't
exist. Also, $(CC) needs to be able to find the generated header in
$(BUILDDIR)/include.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index afbe201..1f3e270 100644
--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@
 
 VERSION = 1.4.5
 
-CPPFLAGS += -I./include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
+CPPFLAGS += -I./include -I$(BUILDDIR)/include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
 
 ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
@@ -71,6 +71,7 @@ cscope:
 $(BUILDDIR)/include/version.h: $(BUILDDIR)/include/version.h.tmp
 	$(Q)cmp -s $@ $@.tmp && rm -f $@.tmp || mv $@.tmp $@
 $(BUILDDIR)/include/version.h.tmp:
+	${Q}mkdir -p $(dir $@)
 	$(Q)echo '#define VERSION "$(VERSION)"' > $@
 
 #
-- 
1.7.0.4
