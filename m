Received: from tango.tkos.co.il ([62.219.50.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5a9x-0007HX-Km
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 08:24:34 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] nanddump: always check the first erase block
Date: Tue, 12 Oct 2010 10:23:55 +0200
Message-Id: <c0bf28b432c6f1e6e5ed634ff64afcf46762503a.1286871735.git.baruch@tkos.co.il>
In-Reply-To: <50168b5d486e28a9d7f7685537710e05242c4f12.1286871735.git.baruch@tkos.co.il>
References: <50168b5d486e28a9d7f7685537710e05242c4f12.1286871735.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check the first block even when start_addr is not eraseblock aligned.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 nanddump.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index d6d1352..9267a1c 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -283,7 +283,7 @@ int main(int argc, char * const argv[])
 	struct mtd_oob_buf oob = {0, 16, oobbuf};
 	mtd_info_t meminfo;
 	char pretty_buf[PRETTY_BUF_LEN];
-	int oobinfochanged = 0 ;
+	int oobinfochanged = 0, firstblock = 1;
 	struct nand_oobinfo old_oobinfo;
 	struct mtd_ecc_stats stat1, stat2;
 	bool eccstats = false;
@@ -405,8 +405,10 @@ int main(int argc, char * const argv[])
 		// new eraseblock , check for bad block
 		if (noskipbad) {
 			badblock = 0;
-		} else if (blockstart != (ofs & (~meminfo.erasesize + 1))) {
+		} else if (blockstart != (ofs & (~meminfo.erasesize + 1)) ||
+				firstblock) {
 			blockstart = ofs & (~meminfo.erasesize + 1);
+			firstblock = 0;
 			if ((badblock = ioctl(fd, MEMGETBADBLOCK, &blockstart)) < 0) {
 				perror("ioctl(MEMGETBADBLOCK)");
 				goto closeall;
-- 
1.7.1
