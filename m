Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYk0-0007nG-A6
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:48 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/10] mtd-utils: nandwrite: Comment, style fixups
Date: Wed, 3 Nov 2010 01:27:19 -0700
Message-ID: <1288772847-8120-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, Jehan Bing <jehan@orb.com>,
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

Comment on "blockalign" default value is incorrect; it only defaults
to a 1x multiplier of the actual block size. Perhaps this is a relic
of early NAND where all block sizes were 16KB?

Reformatted a multi-line comment.

Changed separete "if" statements to a combined "if-else-if" since they
were logically combinable. Should have no effect on results with minor
effect on efficiency.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index b0c4366..3fbfca9 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -120,7 +120,7 @@ static bool		forcelegacy = false;
 static bool		noecc = false;
 static bool		noskipbad = false;
 static bool		pad = false;
-static int		blockalign = 1; /* default to using 16K block size */
+static int		blockalign = 1; /* default to using actual block size */
 
 static void process_options(int argc, char * const argv[])
 {
@@ -483,8 +483,7 @@ int main(int argc, char * const argv[])
 				if ((ret = ioctl(fd, MEMGETBADBLOCK, &offs)) < 0) {
 					perror("ioctl(MEMGETBADBLOCK)");
 					goto closeall;
-				}
-				if (ret == 1) {
+				} else if (ret == 1) {
 					baderaseblock = true;
 					if (!quiet)
 						fprintf(stderr, "Bad block at %x, %u block(s) "
@@ -520,9 +519,11 @@ int main(int argc, char * const argv[])
 
 			/* No padding needed - we are done */
 			if (tinycnt == 0) {
-				// For standard input, set the imglen to 0 to signal
-				// the end of the "file". For non standard input, leave
-				// it as-is to detect an early EOF
+				/*
+				 * For standard input, set imglen to 0 to signal
+				 * the end of the "file". For nonstandard input,
+				 * leave it as-is to detect an early EOF.
+				 */
 				if (ifd == STDIN_FILENO) {
 					imglen = 0;
 				}
-- 
1.7.0.4
