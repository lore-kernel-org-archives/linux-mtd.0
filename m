From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Mon, 25 Oct 2010 21:54:47 +0300
Subject: [PATCH] mtd-utils: fix make install
Message-ID: <mailman.2.1288033431.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Commit 96a4f76f2e9dad7fdbd6fd7740de44bc90d5769e broke 'make install'.
Before that commit, $DESTDIR was undefined, so  ${DESTDIR}/${SBINDIR}
was /usr/sbin, and after the commit $DESTDIR became /usr/local, so
${DESTDIR}/${SBINDIR} became /usr/local//usr/sbin, which is wrong.

Fix this by making $DESTDIR become the distination directory of installing,
i.e. 'DESTDIR ?= /usr' and making SBINDIR become just 'sbin'.

While we are on it, fix $MANDIR similarly, and remove $PREFIX and
$EXEC_PREFIX variables, which become unneeded.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Reported-by: Charles Manning <manningc2@actrix.gen.nz>
---
 common.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/common.mk b/common.mk
index a55c548..2e4452f 100644
--- a/common.mk
+++ b/common.mk
@@ -20,12 +20,9 @@ ifneq ($(WITHOUT_LARGEFILE), 1)
   CPPFLAGS += -D_FILE_OFFSET_BITS=64
 endif
 
-DESTDIR ?= /usr/local
-PREFIX=/usr
-EXEC_PREFIX=$(PREFIX)
-SBINDIR=$(EXEC_PREFIX)/sbin
-MANDIR=$(PREFIX)/share/man
-INCLUDEDIR=$(PREFIX)/include
+DESTDIR ?= /usr
+SBINDIR=sbin
+MANDIR=share/man
 
 ifndef BUILDDIR
 ifeq ($(origin CROSS),undefined)
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (???????????????? ??????????)
