Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9ASx-000241-RN
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 05:14:44 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Mon, 3 May 2010 22:10:41 -0700
Subject: [PATCHv2] nanddump: Support 4096+218 and 4096+224 page sizes
Message-Id: <947e853e5d1ba35a67546703267b0fabe59af110@localhost.localdomain>
To: <dwmw2@infradead.org>
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

Tested with Samsung K9GAG08U0D (4096+218).

This fixes three additional problems found after the initial patch
submission:

1) oobbuf was only 128B.  Needs to be 256B now.

2) Random OOB data is output when nanddump hits a bad block, because
the code was initializing readbuf instead.

3) When using "-p", random data is displayed for bytes 218-223 since
the OOB does not end on a 16B boundary.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 nanddump.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 678d684..4c0a094 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -174,8 +174,11 @@ static void process_options (int argc, char * const argv[])
 /*
  * Buffers for reading data from flash
  */
+
+#define NAND_MAX_OOBSIZE 256
+
 static unsigned char readbuf[4096];
-static unsigned char oobbuf[128];
+static unsigned char oobbuf[NAND_MAX_OOBSIZE];
 
 /*
  * Main program
@@ -209,7 +212,9 @@ int main(int argc, char * const argv[])
 	}
 
 	/* Make sure device page sizes are valid */
-	if (!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
+	if (!(meminfo.oobsize == 224 && meminfo.writesize == 4096) &&
+			!(meminfo.oobsize == 218 && meminfo.writesize == 4096) &&
+			!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
 			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
 			!(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
 			!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
@@ -354,9 +359,8 @@ int main(int argc, char * const argv[])
 		if (omitoob)
 			continue;
 
-		if (badblock) {
-			memset (readbuf, 0xff, meminfo.oobsize);
-		} else {
+		memset (oobbuf, 0xff, NAND_MAX_OOBSIZE);
+		if (!badblock) {
 			/* Read OOB data and exit on failure */
 			oob.start = ofs;
 			if (ioctl(fd, MEMREADOOB, &oob) != 0) {
-- 
1.6.3.1
