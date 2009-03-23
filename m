Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Llsqb-0001p4-VP
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 22:42:35 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] flash_eraseall: only add cleanmarkers on known flashtypes
Date: Mon, 23 Mar 2009 23:42:17 +0100
Message-Id: <1237848138-18157-3-git-send-email-sebastian@breakpoint.cc>
In-Reply-To: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- data flash and an UBI flash do not use clean markers. Do not create
  them, even if the users says so.
- don't generate clean markers on unknown media/new media. Theoreticly
  nobody should use jffs2 on new media anyway :)

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 flash_eraseall.c |   25 ++++++++++++++++++++++---
 1 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index 3da56ee..0a4010e 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -60,12 +60,25 @@ static int clmlen = 8;
 
 static int prepare_clean_marker(mtd_info_t *meminfo)
 {
+	struct nand_oobinfo oobinfo;
+
 	cleanmarker.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 	cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
-	if (meminfo->type != MTD_NANDFLASH)
+
+	switch (meminfo->type) {
+	case MTD_ROM:
+	case MTD_RAM:
+	case MTD_NORFLASH:
 		cleanmarker.totlen = cpu_to_je32(sizeof(struct jffs2_unknown_node));
-	else {
-		struct nand_oobinfo oobinfo;
+		break;
+
+	case MTD_DATAFLASH:
+	case MTD_UBIVOLUME:
+		fprintf(stderr, "JFFS2 layout not supported on this flash.\n");
+		return -1;
+		break;
+
+	case MTD_NANDFLASH:
 
 		if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
 			fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n",
@@ -103,6 +116,12 @@ static int prepare_clean_marker(mtd_info_t *meminfo)
 			}
 		}
 		cleanmarker.totlen = cpu_to_je32(8);
+		break;
+	default:
+		fprintf(stderr, "Unknown flash type, just erasing\n");
+		return -1;
+		break;
+
 	}
 	cleanmarker.hdr_crc = cpu_to_je32(crc32(0, &cleanmarker,
 				sizeof(struct jffs2_unknown_node) - 4));
-- 
1.6.0.6
