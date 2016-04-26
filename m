Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auzKf-0003hP-JR
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 09:31:02 +0000
Received: from nat-ies.mentorg.com ([192.94.31.2]
 helo=SVR-IES-FEM-01.mgc.mentorg.com)
 by relay1.mentorg.com with esmtp
 id 1auzKP-0000s8-Sx from Marian_Rotariu@mentor.com
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 02:30:46 -0700
From: Marian Rotariu <marian_rotariu@mentor.com>
To: <linux-mtd@lists.infradead.org>
CC: Marian Rotariu <marian_rotariu@mentor.com>
Subject: [PATCH 4/4] mtd-utils: remove unnecessary ioctl from mtd_info
Date: Tue, 26 Apr 2016 12:30:24 +0300
Message-ID: <1461663024-12022-5-git-send-email-marian_rotariu@mentor.com>
In-Reply-To: <1461663024-12022-1-git-send-email-marian_rotariu@mentor.com>
References: <1461663024-12022-1-git-send-email-marian_rotariu@mentor.com>
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

Signed-off-by: Marian Rotariu <marian_rotariu@mentor.com>
---
 ubi-utils/mtdinfo.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index a86abd1..25a96eb 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -246,9 +246,7 @@ static void print_region_info(const struct mtd_dev_info *mtd)
 	/*
 	 * If we don't have any region info, just return
 	 *
-	 * FIXME: We can't get region_info (via ioctl) without having the MTD
-	 *        node path. This is a problem for `mtdinfo -a', for example,
-	 *        since it doesn't provide any filepath information.
+	 * FIXME: We still need the filepath for the region map
 	 */
 	if (!args.node || (!args.map && mtd->region_cnt == 0))
 		return;
@@ -267,14 +265,12 @@ static void print_region_info(const struct mtd_dev_info *mtd)
 	if (mtd->region_cnt) {
 		for (r = 0; r < mtd->region_cnt; ++r) {
 			printf("Eraseblock region %i: ", r);
-			if (mtd_regioninfo(fd, r, &reginfo) == 0) {
-				printf(" offset: %#x size: %#x numblocks: %#x\n",
-					reginfo.offset, reginfo.erasesize,
-					reginfo.numblocks);
-				if (args.map)
-					print_region_map(mtd, fd, &reginfo);
-			} else
-				printf(" info is unavailable\n");
+			printf(" offset: %#x size: %#x numblocks: %#x\n",
+					mtd->reginfo[r].offset,
+					mtd->reginfo[r].erasesize,
+					mtd->reginfo[r].numblocks);
+			if (args.map)
+				print_region_map(mtd, fd, &(mtd->reginfo[r]));
 		}
 	} else {
 		reginfo.offset = 0;
-- 
1.9.1
