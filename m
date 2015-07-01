Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZA921-0004JW-CT
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 03:49:54 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard.weinberger@gmail.com>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 1/4] mtd-utils: fix the trailing whitespace problems
Date: Wed, 1 Jul 2015 11:44:14 +0800
Message-ID: <1435722257-13218-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 MAKEDEV                        | 2 +-
 fectest.c                      | 3 +--
 tests/ubi-tests/stress-test.sh | 8 ++++----
 ubi-utils/libubi.c             | 2 +-
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/MAKEDEV b/MAKEDEV
index b31e61f..a4141b5 100755
--- a/MAKEDEV
+++ b/MAKEDEV
@@ -38,5 +38,5 @@ for a in `seq 0 16` ; do
 	mknod /dev/mtd$a c 90 `expr $a + $a`
 	mknod /dev/mtdr$a c 90 `expr $a + $a + 1`
 	mknod /dev/mtdblock$a b 31 $a
-done	
+done
 
diff --git a/fectest.c b/fectest.c
index c1fbd52..fd577f3 100644
--- a/fectest.c
+++ b/fectest.c
@@ -11,7 +11,6 @@
 #include <crc32.h>
 
 #define ERASE_SIZE 131072
-//#define PKT_SIZE 1400
 #define NR_PKTS ((ERASE_SIZE + PKT_SIZE - 1) / PKT_SIZE)
 #define DROPS 8
 
@@ -83,7 +82,7 @@ int main(void)
 		fd = open("after", O_WRONLY|O_TRUNC|O_CREAT, 0644);
 		if (fd >= 0)
 			write(fd, pktbuf, ERASE_SIZE);
-		
+
 		exit(1);
 	}
 
diff --git a/tests/ubi-tests/stress-test.sh b/tests/ubi-tests/stress-test.sh
index 50c563a..a150495 100755
--- a/tests/ubi-tests/stress-test.sh
+++ b/tests/ubi-tests/stress-test.sh
@@ -60,12 +60,12 @@ print_params()
 	if [ "$module" = "nandsim" ]; then
 		printf "%s" "page size ${page_size}KiB, VID offset $vid_offs, "
 	fi
-	printf "%s\n" "fastmap $fastmap" 
+	printf "%s\n" "fastmap $fastmap"
 }
 
 # Load mtdram with specified size and PEB size
 # Usage: load_mtdram <flash size> <PEB size>
-# 1. Flash size is specified in MiB 
+# 1. Flash size is specified in MiB
 # 2. PEB size is specified in KiB
 load_mtdram()
 {
@@ -86,7 +86,7 @@ print_separator()
 # Usage: run_test <nandsim|mtdram> <flash size> <PEB size> \
 #                 <Page size> <VID hdr offs> <enable fastmap>
 # 1. Simulator type (nandsim or mtdram)
-# 2. Flash size is specified in MiB 
+# 2. Flash size is specified in MiB
 # 3. PEB size is specified in KiB
 # 4. Page size is specified in bytes (mtdram ingores this)
 # 5. VID header offset (mtdram ingores this)
@@ -98,7 +98,7 @@ run_test()
 	local peb_size="$3";
 	local page_size="$4";
 	local vid_offs="$5"
-	local fastmap="$6";  
+	local fastmap="$6";
 	local fm_supported fm_param mtdnum
 
 	print_separator
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 1e08b7d..97c0434 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -792,7 +792,7 @@ int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
 			req->dev_num = r.ubi_num;
 			/*
 			 * The call succeeded. It means that the kernel ignored
-			 * 'max_beb_per1024' parameter. 
+			 * 'max_beb_per1024' parameter.
 			 */
 			return 1;
 		} else if (errno != EINVAL)
-- 
1.8.4.2
