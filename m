Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P0OIC-00083R-Ap
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 00:43:37 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Mon, 27 Sep 2010 17:22:04 -0700
Subject: [PATCH] mtd-utils: Use $(CURDIR) in place of $(PWD)
Message-Id: <90498d8ec2a6b99c34b3bc61cf5e6444@localhost>
To: <dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

$(PWD) comes from the shell and may cause unexpected side effects when
using "make -C".

$(CURDIR) is defined internally by GNU make.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 Makefile  |    2 +-
 common.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 93661cb..7ab9743 100644
--- a/Makefile
+++ b/Makefile
@@ -33,7 +33,7 @@ clean::
 	-rm -f $(SYMLINKS)
 ifneq ($(BUILDDIR)/.git,)
 ifneq ($(BUILDDIR),.)
-ifneq ($(BUILDDIR),$(PWD))
+ifneq ($(BUILDDIR),$(CURDIR))
 	rm -rf $(BUILDDIR)
 endif
 endif
diff --git a/common.mk b/common.mk
index be785b4..0444ad9 100644
--- a/common.mk
+++ b/common.mk
@@ -26,10 +26,10 @@ INCLUDEDIR=$(PREFIX)/include
 
 ifndef BUILDDIR
 ifeq ($(origin CROSS),undefined)
-  BUILDDIR := $(PWD)
+  BUILDDIR := $(CURDIR)
 else
 # Remove the trailing slash to make the directory name
-  BUILDDIR := $(PWD)/$(CROSS:-=)
+  BUILDDIR := $(CURDIR)/$(CROSS:-=)
 endif
 endif
 override BUILDDIR := $(patsubst %/,%,$(BUILDDIR))
-- 
1.7.0.4
