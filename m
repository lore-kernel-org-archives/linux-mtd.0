Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXquk-0001TQ-Bg
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 13:52:44 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	David Gstir <david@sigma-star.at>
Subject: [PATCH 2/3] ubi: tests: Support up to 65k NAND page size
Date: Mon, 22 Feb 2016 14:52:04 +0100
Message-Id: <1456149125-24067-2-git-send-email-david@sigma-star.at>
In-Reply-To: <1456149125-24067-1-git-send-email-david@sigma-star.at>
References: <1456149125-24067-1-git-send-email-david@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

io_read and io_update of mtd-utils support NAND with 4k page size only.
Increase that to support up to 65k page size.

Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: David Gstir <david@sigma-star.at>
---
 tests/ubi-tests/helpers.h   |  2 +-
 tests/ubi-tests/io_read.c   |  6 +++---
 tests/ubi-tests/io_update.c | 22 +++++++++++-----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/ubi-tests/helpers.h b/tests/ubi-tests/helpers.h
index d7d6d9c..4533f4b 100644
--- a/tests/ubi-tests/helpers.h
+++ b/tests/ubi-tests/helpers.h
@@ -32,7 +32,7 @@ extern "C" {
 
 #define UBI_VOLUME_PATTERN "/dev/ubi%d_%d"
 #define MIN_AVAIL_EBS 5
-#define PAGE_SIZE 4096
+#define MAX_NAND_PAGE_SIZE 65536
 
 #define errorm(fmt, ...) ({                                                    \
 	__errorm(PROGRAM_NAME, __FUNCTION__, __LINE__, fmt, ##__VA_ARGS__);    \
diff --git a/tests/ubi-tests/io_read.c b/tests/ubi-tests/io_read.c
index 386291e..f48db67 100644
--- a/tests/ubi-tests/io_read.c
+++ b/tests/ubi-tests/io_read.c
@@ -41,7 +41,7 @@ static int fd;
 /* Data lengthes to test, @io - minimal I/O unit size, @s - eraseblock size */
 #define LENGTHES(io, s)                                                        \
 	{1, (io), (io)+1, 2*(io), 3*(io)-1, 3*(io),                            \
-	 PAGE_SIZE-1, PAGE_SIZE-(io), 2*PAGE_SIZE, 2*PAGE_SIZE-(io),           \
+	 MAX_NAND_PAGE_SIZE-1, MAX_NAND_PAGE_SIZE-(io), 2*MAX_NAND_PAGE_SIZE, 2*MAX_NAND_PAGE_SIZE-(io),           \
 	 (s)/2-1, (s)/2, (s)/2+1, (s)-1, (s), (s)+1, 2*(s)-(io), 2*(s),        \
 	 2*(s)+(io), 3*(s), 3*(s)+(io)};
 
@@ -51,9 +51,9 @@ static int fd;
  */
 #define OFFSETS(io, s, sz)                                                     \
 	{0, (io)-1, (io), (io)+1, 2*(io)-1, 2*(io), 3*(io)-1, 3*(io),          \
-	 PAGE_SIZE-1, PAGE_SIZE-(io), 2*PAGE_SIZE, 2*PAGE_SIZE-(io),           \
+	 MAX_NAND_PAGE_SIZE-1, MAX_NAND_PAGE_SIZE-(io), 2*MAX_NAND_PAGE_SIZE, 2*MAX_NAND_PAGE_SIZE-(io),           \
 	 (s)/2-1, (s)/2, (s)/2+1, (s)-1, (s), (s)+1, 2*(s)-(io), 2*(s),        \
-	 2*(s)+(io), 3*(s), (sz)-(s)-1, (sz)-(io)-1, (sz)-PAGE_SIZE-1};
+	 2*(s)+(io), 3*(s), (sz)-(s)-1, (sz)-(io)-1, (sz)-MAX_NAND_PAGE_SIZE-1};
 
 /**
  * test_static - test static volume-specific features.
diff --git a/tests/ubi-tests/io_update.c b/tests/ubi-tests/io_update.c
index 2e9969e..7040e6a 100644
--- a/tests/ubi-tests/io_update.c
+++ b/tests/ubi-tests/io_update.c
@@ -44,22 +44,22 @@ const char *node;
 	{512},                       \
 	{666},                       \
 	{2048},                      \
-	{(io), (io), PAGE_SIZE},     \
-	{(io)+1, (io)+1, PAGE_SIZE}, \
-	{PAGE_SIZE},                 \
-	{PAGE_SIZE-1},               \
-	{PAGE_SIZE+(io)},            \
+	{(io), (io), MAX_NAND_PAGE_SIZE},     \
+	{(io)+1, (io)+1, MAX_NAND_PAGE_SIZE}, \
+	{MAX_NAND_PAGE_SIZE},                 \
+	{MAX_NAND_PAGE_SIZE-1},               \
+	{MAX_NAND_PAGE_SIZE+(io)},            \
 	{(s)},                       \
 	{(s)-1},                     \
 	{(s)+1},                     \
 	{(io), (s)+1},               \
-	{(s)+(io), PAGE_SIZE},       \
-	{2*(s), PAGE_SIZE},          \
-	{PAGE_SIZE, 2*(s), 1},       \
-	{PAGE_SIZE, 2*(s)},          \
+	{(s)+(io), MAX_NAND_PAGE_SIZE},       \
+	{2*(s), MAX_NAND_PAGE_SIZE},          \
+	{MAX_NAND_PAGE_SIZE, 2*(s), 1},       \
+	{MAX_NAND_PAGE_SIZE, 2*(s)},          \
 	{2*(s)-1, 2*(s)-1},          \
-	{3*(s), PAGE_SIZE + 1},      \
-	{1, PAGE_SIZE},              \
+	{3*(s), MAX_NAND_PAGE_SIZE + 1},      \
+	{1, MAX_NAND_PAGE_SIZE},              \
 	{(io), (s)}                  \
 }
 
-- 
2.1.4
