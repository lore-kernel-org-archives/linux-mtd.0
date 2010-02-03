Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcX1o-0005xM-Mp
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 04:39:53 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o134dlq4029324
	for <linux-mtd@lists.infradead.org>;
	Tue, 2 Feb 2010 20:39:47 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] Fix the bug of writing a yaffs2 image to NAND
Date: Wed,  3 Feb 2010 12:45:52 +0800
Message-Id: <1265172354-26682-4-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1265172354-26682-3-git-send-email-stanley.miao@windriver.com>
References: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
	<1265172354-26682-2-git-send-email-stanley.miao@windriver.com>
	<1265172354-26682-3-git-send-email-stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The tool mkyaffs2image doesn't know the oob layout of a NAND flash, so it
puts the yaffs2 tags at the offset 0 of oob area. When nandwrite writes the
image into NAND flash, it should put the yaffs2 tags at the right position
according to the NAND oob layout.

Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
---
 nandwrite.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index c66ab54..35f1e4d 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -429,6 +429,8 @@ int main(int argc, char * const argv[])
 
 		if (writeoob) {
 			int i, start, len;
+			int tags_pos = 0;
+
 			oobreadbuf = writebuf + meminfo.writesize;
 
 			// Read more data for the OOB from the input if there isn't enough in the buffer
@@ -470,8 +472,8 @@ int main(int argc, char * const argv[])
 				start = ecclayout.oobfree[i].offset;
 				len = ecclayout.oobfree[i].length;
 				memcpy(oobbuf + start,
-						oobreadbuf + start,
-						len);
+						oobreadbuf + tags_pos, len);
+				tags_pos += len;
 			}
 			/* Write OOB data first, as ecc will be placed in there*/
 			oob.start = mtdoffset;
-- 
1.5.4.3
