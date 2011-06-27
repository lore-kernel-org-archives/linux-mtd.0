Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGY6-0003IJ-TX
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:47 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 04/10] mtd-utils: update .gitignore files
Date: Mon, 27 Jun 2011 11:27:21 -0700
Message-ID: <1309199247-19248-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
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

First, the top-level Makefile should not tell git to ignore sub-level
.gitignore files.

Second, add simple .gitignores to ignore the executables generated under
the various `tests' subdirectories.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 .gitignore                             |    5 +++++
 tests/checkfs/.gitignore               |    2 ++
 tests/fs-tests/integrity/.gitignore    |    1 +
 tests/fs-tests/simple/.gitignore       |    5 +++++
 tests/fs-tests/stress/atoms/.gitignore |   10 ++++++++++
 tests/fs-tests/utils/.gitignore        |    2 ++
 tests/jittertest/.gitignore            |    2 ++
 7 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 tests/checkfs/.gitignore
 create mode 100644 tests/fs-tests/integrity/.gitignore
 create mode 100644 tests/fs-tests/simple/.gitignore
 create mode 100644 tests/fs-tests/stress/atoms/.gitignore
 create mode 100644 tests/fs-tests/utils/.gitignore
 create mode 100644 tests/jittertest/.gitignore

diff --git a/.gitignore b/.gitignore
index 86aee63..3a56d0d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -48,6 +48,11 @@
 #
 
 #
+# git files that we don't want to ignore even it they are dot-files
+#
+!.gitignore
+
+#
 # Generated include files
 #
 /include/version.h
diff --git a/tests/checkfs/.gitignore b/tests/checkfs/.gitignore
new file mode 100644
index 0000000..52e7b5d
--- /dev/null
+++ b/tests/checkfs/.gitignore
@@ -0,0 +1,2 @@
+/checkfs
+/makefiles
diff --git a/tests/fs-tests/integrity/.gitignore b/tests/fs-tests/integrity/.gitignore
new file mode 100644
index 0000000..2ea8e69
--- /dev/null
+++ b/tests/fs-tests/integrity/.gitignore
@@ -0,0 +1 @@
+/integck
diff --git a/tests/fs-tests/simple/.gitignore b/tests/fs-tests/simple/.gitignore
new file mode 100644
index 0000000..f3ccde4
--- /dev/null
+++ b/tests/fs-tests/simple/.gitignore
@@ -0,0 +1,5 @@
+/ftrunc
+/orph
+/perf
+/test_1
+/test_2
diff --git a/tests/fs-tests/stress/atoms/.gitignore b/tests/fs-tests/stress/atoms/.gitignore
new file mode 100644
index 0000000..67dede0
--- /dev/null
+++ b/tests/fs-tests/stress/atoms/.gitignore
@@ -0,0 +1,10 @@
+/fwrite00
+/gcd_hupper
+/pdfrun
+/rmdir00
+/rndrm00
+/rndrm99
+/rndwrite00
+/stress_1
+/stress_2
+/stress_3
diff --git a/tests/fs-tests/utils/.gitignore b/tests/fs-tests/utils/.gitignore
new file mode 100644
index 0000000..f3cdf5f
--- /dev/null
+++ b/tests/fs-tests/utils/.gitignore
@@ -0,0 +1,2 @@
+/free_space
+/fstest_monitor
diff --git a/tests/jittertest/.gitignore b/tests/jittertest/.gitignore
new file mode 100644
index 0000000..05d4e9e
--- /dev/null
+++ b/tests/jittertest/.gitignore
@@ -0,0 +1,2 @@
+/JitterTest
+/plotJittervsFill
-- 
1.7.0.4
