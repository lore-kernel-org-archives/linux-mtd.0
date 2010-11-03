Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYk0-0007nJ-AB
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:45 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/10] mtd-utils: nanddump: type consistency
Date: Wed, 3 Nov 2010 01:27:26 -0700
Message-ID: <1288772847-8120-9-git-send-email-computersforpeace@gmail.com>
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

Change type off "offs" for type consistency of 64-bit data types.
Also change an accompanying printf().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 364acdf..a28f7fb 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -262,7 +262,7 @@ int main(int argc, char * const argv[])
 	long long blockstart = -1;
 	struct mtd_dev_info mtd;
 	struct mtd_oob_buf oob;
-	loff_t offs;
+	long long offs;
 	int ret;
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
@@ -492,9 +492,9 @@ int main(int argc, char * const argv[])
 				} else if (ret == 1) {
 					baderaseblock = true;
 					if (!quiet)
-						fprintf(stderr, "Bad block at %x, %u block(s) "
+						fprintf(stderr, "Bad block at %llx, %u block(s) "
 								"from %llx will be skipped\n",
-								(int) offs, blockalign, blockstart);
+								offs, blockalign, blockstart);
 				}
 
 				if (baderaseblock) {
-- 
1.7.0.4
