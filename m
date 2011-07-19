Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjIzU-0000vn-76
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 22:42:13 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 10/10] mtd-www: ignore generated HTML files in git
Date: Tue, 19 Jul 2011 15:40:47 -0700
Message-ID: <1311115247-20636-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
References: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 .gitignore           |    1 +
 doc/.gitignore       |    1 +
 faq/.gitignore       |    1 +
 misc/.gitignore      |    1 +
 nand-data/.gitignore |    1 +
 5 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore
 create mode 100644 doc/.gitignore
 create mode 100644 faq/.gitignore
 create mode 100644 misc/.gitignore
 create mode 100644 nand-data/.gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..9b61c8c
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1 @@
+/*.html
diff --git a/doc/.gitignore b/doc/.gitignore
new file mode 100644
index 0000000..9b61c8c
--- /dev/null
+++ b/doc/.gitignore
@@ -0,0 +1 @@
+/*.html
diff --git a/faq/.gitignore b/faq/.gitignore
new file mode 100644
index 0000000..9b61c8c
--- /dev/null
+++ b/faq/.gitignore
@@ -0,0 +1 @@
+/*.html
diff --git a/misc/.gitignore b/misc/.gitignore
new file mode 100644
index 0000000..9b61c8c
--- /dev/null
+++ b/misc/.gitignore
@@ -0,0 +1 @@
+/*.html
diff --git a/nand-data/.gitignore b/nand-data/.gitignore
new file mode 100644
index 0000000..9b61c8c
--- /dev/null
+++ b/nand-data/.gitignore
@@ -0,0 +1 @@
+/*.html
-- 
1.7.0.4
