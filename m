Received: from tango.tkos.co.il ([62.219.50.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5EYI-0004Lp-1Y
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2010 09:20:16 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nanddump: fix initialization of bad blocks oob data buffer
Date: Mon, 11 Oct 2010 11:19:38 +0200
Message-Id: <0870ac8ab250ec91dceb2cc461fe82c0d7995bc8.1286788714.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When dumping oob data of a bad block, initialize oobbuf with 0xff, instead of
readbuf.  This avoids bogus oob data on output.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 nanddump.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 3589931..0fdf736 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -452,7 +452,7 @@ int main(int argc, char * const argv[])
 			continue;
 
 		if (badblock) {
-			memset (readbuf, 0xff, meminfo.oobsize);
+			memset (oobbuf, 0xff, meminfo.oobsize);
 		} else {
 			/* Read OOB data and exit on failure */
 			oob.start = ofs;
-- 
1.7.1
