Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7Dl7-00057x-U5
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 20:53:43 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: flash_erase: Fix output of offsets
Date: Sat, 16 Oct 2010 13:54:05 -0700
Message-ID: <1287262445-19654-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Need to use unsigned arithmetic and a 64-bit cast in order to
calculate and output the correct offset for eraseblocks at large
offsets. Signed integer arithmetic does not produce the correct
result "uint64_t" result, so for offsets over 2GB we get
messages like:

	Erasing 512 Kibyte @ ffffffff83180000 -- 4308642136 % complete.

Note that this error was not affecting proper erasure; it just
produced incorrect status messages.

Also, we should not add an extra eraseblock for the final status
message; this gives misleading output when, for example, the
following statement is executed:

	$ flash_erase /dev/mtd0 0 1
	Erasing 512 Kibyte @ 80000 -- 100 % complete

We aren't erasing at offset 0x80000; it should display offset 0.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_erase.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/flash_erase.c b/flash_erase.c
index 8929054..1a7b52e 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -93,7 +93,8 @@ int main(int argc, char *argv[])
 {
 	libmtd_t mtd_desc;
 	struct mtd_dev_info mtd;
-	int fd, clmpos = 0, clmlen = 8, eb, eb_start, eb_cnt;
+	int fd, clmpos = 0, clmlen = 8;
+	unsigned int eb, eb_start, eb_cnt;
 	int isNAND;
 	int error = 0;
 	uint64_t offset = 0;
@@ -232,7 +233,7 @@ int main(int argc, char *argv[])
 		eb_cnt = (mtd.size / mtd.eb_size) - eb_start;
 
 	for (eb = eb_start; eb < eb_start + eb_cnt; eb++) {
-		offset = eb * mtd.eb_size;
+		offset = (uint64_t)eb * mtd.eb_size;
 
 		if (!noskipbad) {
 			int ret = mtd_is_bad(&mtd, fd, eb);
@@ -285,7 +286,6 @@ int main(int argc, char *argv[])
 		}
 		verbose(!quiet, " Cleanmarker written at %"PRIx64, offset);
 	}
-	offset += mtd.eb_size;
 	show_progress(&mtd, offset, eb, eb_start, eb_cnt);
 	bareverbose(!quiet, "\n");
 
-- 
1.7.0.4
