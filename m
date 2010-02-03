Received: from ey-out-1920.google.com ([74.125.78.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcbO4-0005fX-SR
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 09:19:09 +0000
Received: by ey-out-1920.google.com with SMTP id 4so195672eyg.26
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Feb 2010 01:19:02 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
Subject: [PATCH] mtd-utils: add option to not force largefile support
Date: Wed,  3 Feb 2010 10:18:46 +0100
Message-Id: <1265188726-23746-1-git-send-email-jacmet@sunsite.dk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not all systems have largefile support (E.G. uClibc depending on config),
so unconditionally enforcing largefile breaks the build.

Work around it by adding a WITHOUT_LARGEFILE flag, similar to the existing
WITHOUT_XATTR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 common.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/common.mk b/common.mk
index 5e92b07..d704b44 100644
--- a/common.mk
+++ b/common.mk
@@ -12,7 +12,10 @@ WFLAGS := -Wall \
 	$(call cc-option,-Wwrite-strings) \
 	$(call cc-option,-Wno-sign-compare)
 CFLAGS += $(WFLAGS)
-CPPFLAGS += -D_FILE_OFFSET_BITS=64
+
+ifneq ($(WITHOUT_LARGEFILE), 1)
+  CPPFLAGS += -D_FILE_OFFSET_BITS=64
+endif
 
 DESTDIR ?= /usr/local
 PREFIX=/usr
-- 
1.6.5
