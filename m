Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYjt-0007lM-69
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:37 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/10] mtd-utils: nandwrite: switch "oobsize" for "writesize"
Date: Wed, 3 Nov 2010 01:27:21 -0700
Message-ID: <1288772847-8120-4-git-send-email-computersforpeace@gmail.com>
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

The text of a printf() states that we're printing OOB area, but the
corresponding argument passes writesize. That probably wasn't the intent.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 66a9ef7..a3ac968 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -433,7 +433,7 @@ int main(int argc, char * const argv[])
 	// Check, if length fits into device
 	if (((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
 		fprintf(stderr, "Image %d bytes, NAND page %d bytes, OOB area %u bytes, device size %u bytes\n",
-				imglen, pagelen, meminfo.writesize, meminfo.size);
+				imglen, pagelen, meminfo.oobsize, meminfo.size);
 		perror("Input file does not fit into device");
 		goto closeall;
 	}
-- 
1.7.0.4
