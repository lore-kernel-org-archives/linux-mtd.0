Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYk0-0007nH-AD
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:48 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/10] mtd-utils: nandwrite: Use 64-bit offset
Date: Wed, 3 Nov 2010 01:27:23 -0700
Message-ID: <1288772847-8120-6-git-send-email-computersforpeace@gmail.com>
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

To support large NAND devices, we need 64-bit data types for
write offsets. This patch makes data type changes along with
their corresponding printf() formats and the input conversion
(i.e., use "strtoll()" instead of "strol()").

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index d05d257..b362c29 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -109,7 +109,7 @@ static void display_version(void)
 
 static const char	*standard_input = "-";
 static const char	*mtd_device, *img;
-static int		mtdoffset = 0;
+static long long	mtdoffset = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
 static bool		rawoob = false;
@@ -201,7 +201,7 @@ static void process_options(int argc, char * const argv[])
 				writeoob = true;
 				break;
 			case 's':
-				mtdoffset = strtol(optarg, NULL, 0);
+				mtdoffset = strtoll(optarg, NULL, 0);
 				break;
 			case 'b':
 				blockalign = atoi(optarg);
@@ -213,7 +213,7 @@ static void process_options(int argc, char * const argv[])
 	}
 
 	if (mtdoffset < 0) {
-		fprintf(stderr, "Can't specify a negative device offset `%d'\n",
+		fprintf(stderr, "Can't specify a negative device offset `%lld'\n",
 				mtdoffset);
 		exit(EXIT_FAILURE);
 	}
@@ -259,7 +259,7 @@ int main(int argc, char * const argv[])
 	int ifd = -1;
 	int imglen = 0, pagelen;
 	bool baderaseblock = false;
-	int blockstart = -1;
+	long long blockstart = -1;
 	struct mtd_dev_info mtd;
 	struct mtd_oob_buf oob;
 	loff_t offs;
@@ -480,7 +480,7 @@ int main(int argc, char * const argv[])
 
 			baderaseblock = false;
 			if (!quiet)
-				fprintf(stdout, "Writing data to block %d at offset 0x%x\n",
+				fprintf(stdout, "Writing data to block %lld at offset 0x%llx\n",
 						 blockstart / ebsize_aligned, blockstart);
 
 			/* Check all the blocks in an erase block for bad blocks */
@@ -494,7 +494,7 @@ int main(int argc, char * const argv[])
 					baderaseblock = true;
 					if (!quiet)
 						fprintf(stderr, "Bad block at %x, %u block(s) "
-								"from %x will be skipped\n",
+								"from %llx will be skipped\n",
 								(int) offs, blockalign, blockstart);
 				}
 
-- 
1.7.0.4
