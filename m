Received: from nf-out-0910.google.com ([64.233.182.190])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GZeYZ-0006kJ-HP
	for linux-mtd@lists.infradead.org; Mon, 16 Oct 2006 22:19:56 -0400
Received: by nf-out-0910.google.com with SMTP id l37so122628nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Oct 2006 19:19:48 -0700 (PDT)
Message-ID: <625fc13d0610161919l415a6e89m4b46115b60d7cf35@mail.gmail.com>
Date: Mon, 16 Oct 2006 21:19:48 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: Remove unneeded header includes
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove #includes that aren't needed in various files

Signed-off-by: Josh Boyer <jwboyer@gmail.com>
---
 drivers/mtd/ubi/account.c |    1 -
 drivers/mtd/ubi/alloc.c   |    1 -
 drivers/mtd/ubi/badeb.c   |    1 -
 drivers/mtd/ubi/build.c   |    4 ----
 drivers/mtd/ubi/cdev.c    |    1 -
 drivers/mtd/ubi/dtbl.c    |    2 --
 drivers/mtd/ubi/eba.c     |    3 ---
 drivers/mtd/ubi/ivol.c    |    3 ---
 drivers/mtd/ubi/uif.c     |    2 --
 drivers/mtd/ubi/volmgmt.c |    3 ---
 drivers/mtd/ubi/vtbl.c    |    1 -
 drivers/mtd/ubi/wl.c      |    2 --
 12 files changed, 0 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/ubi/account.c b/drivers/mtd/ubi/account.c
index 8b5bafc..40954b2 100644
--- a/drivers/mtd/ubi/account.c
+++ b/drivers/mtd/ubi/account.c
@@ -25,7 +25,6 @@ #include <linux/err.h>
 #include <linux/types.h>
 #include <mtd/ubi-header.h>
 #include "ubi.h"
-#include "vtbl.h"
 #include "ivol.h"
 #include "account.h"
 #include "scan.h"
diff --git a/drivers/mtd/ubi/alloc.c b/drivers/mtd/ubi/alloc.c
index 0db8c95..a59a5ce 100644
--- a/drivers/mtd/ubi/alloc.c
+++ b/drivers/mtd/ubi/alloc.c
@@ -25,7 +25,6 @@ #include <mtd/ubi-header.h>
 #include "ubi.h"
 #include "alloc.h"
 #include "io.h"
-#include "background.h"
 #include "wl.h"
 #include "debug.h"
 #include "eba.h"
diff --git a/drivers/mtd/ubi/badeb.c b/drivers/mtd/ubi/badeb.c
index 00c3b2a..3f28d79 100644
--- a/drivers/mtd/ubi/badeb.c
+++ b/drivers/mtd/ubi/badeb.c
@@ -25,7 +25,6 @@ #include "ubi.h"
 #include "alloc.h"
 #include "badeb.h"
 #include "debug.h"
-#include "io.h"
 #include "eba.h"
 #include "account.h"
 #include "wl.h"
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 5549daa..550d922 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -22,13 +22,9 @@ #include <linux/init.h>
 #include <linux/types.h>
 #include <mtd/ubi-header.h>
 #include "ubi.h"
-#include "alloc.h"
-#include "io.h"
 #include "wl.h"
 #include "volmgmt.h"
 #include "account.h"
-#include "background.h"
-#include "vtbl.h"
 #include "eba.h"
 #include "build.h"
 #include "uif.h"
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 32cd9ec..a48dafa 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -39,7 +39,6 @@ #include "account.h"
 #include "debug.h"
 #include "alloc.h"
 #include "vtbl.h"
-#include "io.h"
 #include "dtbl.h"
 #include "volmgmt.h"
 #include "misc.h"
diff --git a/drivers/mtd/ubi/dtbl.c b/drivers/mtd/ubi/dtbl.c
index bc07c86..b503a18 100644
--- a/drivers/mtd/ubi/dtbl.c
+++ b/drivers/mtd/ubi/dtbl.c
@@ -25,8 +25,6 @@ #include "ubi.h"
 #include "dtbl.h"
 #include "alloc.h"
 #include "scan.h"
-#include "vtbl.h"
-#include "io.h"
 #include "ivol.h"
 #include "account.h"
 #include "debug.h"
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 47f3083..dbfde0a 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -30,13 +30,10 @@ #include "ubi.h"
 #include "alloc.h"
 #include "eba.h"
 #include "badeb.h"
-#include "io.h"
 #include "wl.h"
 #include "volmgmt.h"
-#include "vtbl.h"
 #include "ivol.h"
 #include "account.h"
-#include "background.h"
 #include "scan.h"
 #include "misc.h"
 #include "debug.h"
diff --git a/drivers/mtd/ubi/ivol.c b/drivers/mtd/ubi/ivol.c
index cf22931..0da25fd 100644
--- a/drivers/mtd/ubi/ivol.c
+++ b/drivers/mtd/ubi/ivol.c
@@ -23,11 +23,8 @@ #include <linux/err.h>
 #include <linux/types.h>
 #include <mtd/ubi-header.h>
 #include "ubi.h"
-#include "scan.h"
 #include "debug.h"
 #include "alloc.h"
-#include "vtbl.h"
-#include "dtbl.h"
 #include "io.h"
 #include "ivol.h"
 #include "account.h"
diff --git a/drivers/mtd/ubi/uif.c b/drivers/mtd/ubi/uif.c
index b18c05b..b841aad 100644
--- a/drivers/mtd/ubi/uif.c
+++ b/drivers/mtd/ubi/uif.c
@@ -32,7 +32,6 @@ #include "ubi.h"
 #include "misc.h"
 #include "sysfs.h"
 #include "upd.h"
-#include "wl.h"
 #include "uif.h"
 #include "cdev.h"
 #include "alloc.h"
@@ -40,7 +39,6 @@ #include "debug.h"
 #include "vtbl.h"
 #include "dtbl.h"
 #include "volmgmt.h"
-#include "io.h"
 #include "eba.h"
 #include "account.h"

diff --git a/drivers/mtd/ubi/volmgmt.c b/drivers/mtd/ubi/volmgmt.c
index 37fa58e..465bc4a 100644
--- a/drivers/mtd/ubi/volmgmt.c
+++ b/drivers/mtd/ubi/volmgmt.c
@@ -25,12 +25,9 @@ #include <linux/err.h>
 #include <linux/mutex.h>
 #include "ubi.h"
 #include "alloc.h"
-#include "io.h"
 #include "wl.h"
 #include "upd.h"
 #include "volmgmt.h"
-#include "vtbl.h"
-#include "dtbl.h"
 #include "ivol.h"
 #include "misc.h"
 #include "eba.h"
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 2b40a57..92a8dd7 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -28,7 +28,6 @@ #include <mtd/ubi-header.h>
 #include "ubi.h"
 #include "alloc.h"
 #include "wl.h"
-#include "io.h"
 #include "vtbl.h"
 #include "ivol.h"
 #include "eba.h"
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 6c6e016..95f3247 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -31,10 +31,8 @@ #include "ubi.h"
 #include "alloc.h"
 #include "wl.h"
 #include "badeb.h"
-#include "io.h"
 #include "account.h"
 #include "eba.h"
-#include "background.h"
 #include "scan.h"
 #include "misc.h"
 #include "debug.h"
-- 
1.4.2.3
