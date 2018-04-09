From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <david.oberhollenzer@sigma-star.at>, <boris.brezillon@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 2/2] misc-utils: flash_erase: Fix Jffs2 type flash erase
 problem
Date: Mon, 9 Apr 2018 11:10:10 +0800
Message-ID: <1523243410-65424-3-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1523243410-65424-1-git-send-email-xiaolei.li@mediatek.com>
References: <1523243410-65424-1-git-send-email-xiaolei.li@mediatek.com>
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

Currently, Jffs2 clean marker is not written actually, because the oob
write length is set to 0 when do mtd_write().

So, get OOB available size at first, and set the correct clean marker
length, then program clean marker to free OOB area.

Fixes: d7e86124d55b ("mtd-utils: Support jffs2 flash-erase for large OOB (>32b)")
Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 misc-utils/flash_erase.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index 0c9449f..e7a00ae 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -92,7 +92,7 @@ int main(int argc, char *argv[])
 {
 	libmtd_t mtd_desc;
 	struct mtd_dev_info mtd;
-	int fd;
+	int fd, cmlen = 8;
 	unsigned long long start;
 	unsigned int eb, eb_start, eb_cnt;
 	bool isNAND;
@@ -190,10 +190,11 @@ int main(int argc, char *argv[])
 	if (jffs2) {
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
 		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
-		if (!isNAND)
+		if (!isNAND) {
 			cleanmarker.totlen = cpu_to_je32(sizeof(cleanmarker));
-		else {
+		} else {
 			cleanmarker.totlen = cpu_to_je32(8);
+			cmlen = min(mtd.oobavail, 8);
 		}
 		cleanmarker.hdr_crc = cpu_to_je32(mtd_crc32(0, &cleanmarker, sizeof(cleanmarker) - 4));
 	}
@@ -242,7 +243,7 @@ int main(int argc, char *argv[])
 
 		/* write cleanmarker */
 		if (isNAND) {
-			if (mtd_write(mtd_desc, &mtd, fd, eb, 0, NULL, 0, &cleanmarker, 0,
+			if (mtd_write(mtd_desc, &mtd, fd, eb, 0, NULL, 0, &cleanmarker, cmlen,
 					MTD_OPS_AUTO_OOB) != 0) {
 				sys_errmsg("%s: MTD writeoob failure", mtd_device);
 				continue;
-- 
1.9.1
