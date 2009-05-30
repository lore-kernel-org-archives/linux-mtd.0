Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATFv-0001su-TA
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:26:14 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Small colon cleanup
Date: Sat, 30 May 2009 18:41:31 +0100
Message-Id: <1243705298-21814-5-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-4-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
Cc: Nelson Castillo <arhuaco@freaks-unidos.net>,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Nelson Castillo <arhuaco@freaks-unidos.net>

checkpatch would complain with "disable_ecc : 1".

Signed-off-by: Nelson Castillo <arhuaco@freaks-unidos.net>
[ben-linux@fluff.org: subject cleanup]
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c/include/plat/nand.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-s3c/include/plat/nand.h b/arch/arm/plat-s3c/include/plat/nand.h
index f4dcd14..9855467 100644
--- a/arch/arm/plat-s3c/include/plat/nand.h
+++ b/arch/arm/plat-s3c/include/plat/nand.h
@@ -22,7 +22,7 @@
 */
 
 struct s3c2410_nand_set {
-	unsigned int		disable_ecc : 1;
+	unsigned int		disable_ecc:1;
 
 	int			nr_chips;
 	int			nr_partitions;
@@ -39,7 +39,7 @@ struct s3c2410_platform_nand {
 	int	twrph0;	/* active time for nWE/nOE */
 	int	twrph1;	/* time for release CLE/ALE from nWE/nOE inactive */
 
-	unsigned int	ignore_unset_ecc : 1;
+	unsigned int	ignore_unset_ecc:1;
 
 	int			nr_sets;
 	struct s3c2410_nand_set *sets;
-- 
1.5.6.5
