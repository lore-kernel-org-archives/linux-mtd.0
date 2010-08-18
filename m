Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OllES-0007X6-U9
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 16:11:18 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/inftl.h: Fix spacing errors
Date: Wed, 18 Aug 2010 09:10:58 -0700
Message-ID: <1282147858-5105-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replaced some spaces with tabs to fit CodingStyle guidelines

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 include/linux/mtd/inftl.h |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mtd/inftl.h b/include/linux/mtd/inftl.h
index 64ee53c..02cd5f9 100644
--- a/include/linux/mtd/inftl.h
+++ b/include/linux/mtd/inftl.h
@@ -37,14 +37,14 @@ struct INFTLrecord {
 	__u16 firstEUN;
 	__u16 lastEUN;
 	__u16 numfreeEUNs;
-	__u16 LastFreeEUN; 		/* To speed up finding a free EUN */
+	__u16 LastFreeEUN;		/* To speed up finding a free EUN */
 	int head,sect,cyl;
-	__u16 *PUtable;	 		/* Physical Unit Table  */
-	__u16 *VUtable; 		/* Virtual Unit Table */
-        unsigned int nb_blocks;		/* number of physical blocks */
-        unsigned int nb_boot_blocks;	/* number of blocks used by the bios */
-        struct erase_info instr;
-        struct nand_ecclayout oobinfo;
+	__u16 *PUtable;			/* Physical Unit Table */
+	__u16 *VUtable;			/* Virtual Unit Table */
+	unsigned int nb_blocks;		/* number of physical blocks */
+	unsigned int nb_boot_blocks;	/* number of blocks used by the bios */
+	struct erase_info instr;
+	struct nand_ecclayout oobinfo;
 };
 
 int INFTL_mount(struct INFTLrecord *s);
-- 
1.7.0.4
