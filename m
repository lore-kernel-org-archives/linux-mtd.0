Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSZE-0003dD-IS
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:09:14 +0000
Received: by mail-yi0-f49.google.com with SMTP id 13so2669541yic.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:09:12 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 09/10] nandwrite: refactor "old_oobinfo" code
Date: Fri, 19 Aug 2011 10:07:55 -0700
Message-Id: <1313773676-12879-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move variable within conditional and remove duplicated code.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 078e2ff..e782aeb 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -497,7 +497,6 @@ int main(int argc, char * const argv[])
 
 			if (!noecc) {
 				int i, start, len;
-				int tags_pos = 0;
 				struct nand_oobinfo old_oobinfo;
 
 				/* Read the current oob info */
@@ -515,16 +514,13 @@ int main(int argc, char * const argv[])
 				 * such as the layout used by diskonchip.c
 				 */
 				if (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+					int tags_pos = 0, tmp_ofs;
 					for (i = 0; old_oobinfo.oobfree[i][1]; i++) {
 						/* Set the reserved bytes to 0xff */
 						start = old_oobinfo.oobfree[i][0];
 						len = old_oobinfo.oobfree[i][1];
-						if (rawoob)
-							memcpy(oobbuf + start,
-									oobreadbuf + start, len);
-						else
-							memcpy(oobbuf + start,
-									oobreadbuf + tags_pos, len);
+						tmp_ofs = rawoob ? start : tags_pos;
+						memcpy(oobbuf + start, oobreadbuf + tmp_ofs, len);
 						tags_pos += len;
 					}
 				} else {
-- 
1.7.6
