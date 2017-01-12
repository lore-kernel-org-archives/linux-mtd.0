Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cRcdI-0006ER-NB
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 10:29:31 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, mac@mcrowe.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 1/3] nandwrite: add stricter sanity checking for blockalign
Date: Thu, 12 Jan 2017 11:28:26 +0100
Message-Id: <20170112102828.13124-2-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170112102828.13124-1-david.oberhollenzer@sigma-star.at>
References: <20170112102828.13124-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes sure that a virtual erase block is always
composed of a postivie number of erase blocks (i.e. 1 or more)
and enforces the block alignment to be a power of two as
suggested by the help text and assumed throughout the program.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 nand-utils/nandwrite.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index 9602a6e..998c68c 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -191,9 +191,13 @@ static void process_options(int argc, char * const argv[])
 		errmsg_die("Can't specify negative device offset with option"
 				" -s: %lld", mtdoffset);
 
-	if (blockalign < 0)
-		errmsg_die("Can't specify negative blockalign with option -b:"
-				" %d", blockalign);
+	if (blockalign <= 0)
+		errmsg_die("Can't specify negative or zero blockalign with "
+				"option -b: %d", blockalign);
+
+	if (!is_power_of_2(blockalign))
+		errmsg_die("Can't specify a non-power-of-two blockalign with "
+				"option -b: %d", blockalign);
 
 	if (autoplace && noecc)
 		errmsg_die("Autoplacement and no-ECC are mutually exclusive");
-- 
2.10.2
