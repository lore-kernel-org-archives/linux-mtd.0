Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oll6a-0004uX-1g
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 16:03:12 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd-utils: spelling error
Date: Wed, 18 Aug 2010 09:01:44 -0700
Message-ID: <1282147305-4640-1-git-send-email-norris@broadcom.com>
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

"fileds" is "fields"

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 tests/jittertest/plotJittervsFill.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/jittertest/plotJittervsFill.c b/tests/jittertest/plotJittervsFill.c
index f8a5660..9f6c7b3 100644
--- a/tests/jittertest/plotJittervsFill.c
+++ b/tests/jittertest/plotJittervsFill.c
@@ -223,7 +223,7 @@ int main(
                                junkStr1, &junkInt1, &junkInt2, &junkInt3, &dfPercent);
             if(converted < 5)
             {
-                printf("Line %i contains \"%%\", but expected fileds not found. Skipping.\n", lineNo);
+                printf("Line %i contains \"%%\", but expected fields not found. Skipping.\n", lineNo);
             }else
             {
                 /* Now print out the saved jitter values (in col2) with this dfPercent value as the col1. */
@@ -258,7 +258,7 @@ int main(
         converted = sscanf(lineBuf, "%f %s %f %s\n", &junkFloat1, junkStr1, &jitter_ms, junkStr2);
         if(converted < 4)
         {
-            printf("Line %i contains \"ms\", but expected fileds not found. Converted %i, Skipping.",
+            printf("Line %i contains \"ms\", but expected fields not found. Converted %i, Skipping.",
                    lineNo, converted);
             printf("1=%i, 2=%s.\n", junkInt1, junkStr1);
             continue; /* not our jitter line*/
-- 
1.7.0.4
