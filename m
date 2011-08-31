Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyqyt-0006VM-86
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:01:51 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 01/10] nandwrite: trivial variable move
Date: Wed, 31 Aug 2011 13:00:30 -0700
Message-ID: <1314820839-7107-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 95baa38..17a717c 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -496,7 +496,7 @@ int main(int argc, char * const argv[])
 			}
 
 			if (!noecc) {
-				int i, start, len;
+				int start, len;
 				struct nand_oobinfo old_oobinfo;
 
 				/* Read the current oob info */
@@ -514,7 +514,7 @@ int main(int argc, char * const argv[])
 				 * such as the layout used by diskonchip.c
 				 */
 				if (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-					int tags_pos = 0, tmp_ofs;
+					int i, tags_pos = 0, tmp_ofs;
 					for (i = 0; old_oobinfo.oobfree[i][1]; i++) {
 						/* Set the reserved bytes to 0xff */
 						start = old_oobinfo.oobfree[i][0];
-- 
1.7.5.4
