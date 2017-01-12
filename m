Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cRcdI-0006Fz-O1
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 10:29:32 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, mac@mcrowe.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/3] nandwrite: replace erase loop with mtd_erase_multi
Date: Thu, 12 Jan 2017 11:28:27 +0100
Message-Id: <20170112102828.13124-3-david.oberhollenzer@sigma-star.at>
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

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 nand-utils/nandwrite.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index 998c68c..22c741d 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -540,7 +540,6 @@ int main(int argc, char * const argv[])
 		}
 
 		if (ret) {
-			long long i;
 			if (errno != EIO) {
 				sys_errmsg("%s: MTD write failure", mtd_device);
 				goto closeall;
@@ -551,13 +550,13 @@ int main(int argc, char * const argv[])
 
 			fprintf(stderr, "Erasing failed write from %#08llx to %#08llx\n",
 				blockstart, blockstart + ebsize_aligned - 1);
-			for (i = blockstart; i < blockstart + ebsize_aligned; i += mtd.eb_size) {
-				if (mtd_erase(mtd_desc, &mtd, fd, i / mtd.eb_size)) {
-					int errno_tmp = errno;
-					sys_errmsg("%s: MTD Erase failure", mtd_device);
-					if (errno_tmp != EIO)
-						goto closeall;
-				}
+
+			if (mtd_erase_multi(mtd_desc, &mtd, fd,
+					blockstart / mtd.eb_size, blockalign)) {
+				int errno_tmp = errno;
+				sys_errmsg("%s: MTD Erase failure", mtd_device);
+				if (errno_tmp != EIO)
+					goto closeall;
 			}
 
 			if (markbad) {
-- 
2.10.2
