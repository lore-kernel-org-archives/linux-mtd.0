Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PGQt3-00050b-VW
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2010 06:43:58 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 10/10] mtd-utils: nandwrite: type consistency
Date: Wed, 10 Nov 2010 22:39:14 -0800
Message-ID: <1289457554-24155-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <AANLkTimUr8Dvmz7=Owk9dEgWt7hdTFFT+NDXczWd9DfV@mail.gmail.com>
References: <AANLkTimUr8Dvmz7=Owk9dEgWt7hdTFFT+NDXczWd9DfV@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
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

Change type off "offs" for type consistency of 64-bit data types. The
"loff_t" type is no longer needed for the MEMGETBADBLOCK ioctl since
it isn't called dirently anymore - this is handled by mtd_is_bad().

Also change an accompanying printf().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 00e7c28..bbe69b0 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -261,7 +261,7 @@ int main(int argc, char * const argv[])
 	bool baderaseblock = false;
 	long long blockstart = -1;
 	struct mtd_dev_info mtd;
-	loff_t offs;
+	long long offs;
 	int ret;
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
@@ -494,9 +494,9 @@ int main(int argc, char * const argv[])
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
