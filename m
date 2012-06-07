Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScYeG-0001cu-BU
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 09:04:57 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Subject: [PATCH 3/4] UBIFS: improvement to Joel's patch
Date: Thu,  7 Jun 2012 12:06:07 +0300
Message-Id: <1339059968-25753-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1339059968-25753-1-git-send-email-dedekind1@gmail.com>
References: <alpine.DEB.2.00.1206062052140.31834@eristoteles.iwoars.net>
 <1339059968-25753-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Introduce a 'calc_ksa_lebs()' helper. It is very simple now, but we
will put more calculations there. The code is cleaner this way.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/sb.c |   19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 7b6adc0..91c78e7 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -64,6 +64,19 @@
 #define DEFAULT_TIME_GRAN 1000000000
 
 /**
+ * min_ksa_lebs - calculate the minimum amount of LEBs required for KSA.
+ * @c: UBIFS file-system description object
+ * @leb_cnt: total amount of LEBs on the UBI volume to calculate for
+ *
+ * This is a helper function which calculates and returns the amount of LEBs
+ * required for the KSA area if the underlying UBI volume has @leb_cnt LEBs.
+ */
+static int calc_ksa_lebs(struct ubifs_info *c, int leb_cnt)
+{
+	return (leb_cnt * UBIFS_CRYPTO_KEYSIZE) >> UBIFS_BLOCK_SHIFT;
+}
+
+/**
  * create_default_filesystem - format empty UBI volume.
  * @c: UBIFS file-system description object
  *
@@ -110,8 +123,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 		 * LEBS * LEB_SIZE / DATANODE_SIZE / KEYS_PER_KSA_LEB, because
 		 * KEYS_PER_KSA_LEB = LEB_SIZE / KEY_SIZE.
 		 */
-		ksa_lebs = (c->leb_cnt * UBIFS_CRYPTO_KEYSIZE)
-			>> UBIFS_BLOCK_SHIFT;
+		ksa_lebs = calc_ksa_lebs(c->leb_cnt);
 		ksa_lebs += ksa_lebs >> UBIFS_KSA_LEBS_SCALE_SHIFT;
 		ksa_lebs += UBIFS_KSA_ADD_LEBS;
 		min_leb_cnt += ksa_lebs;
@@ -484,8 +496,7 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 		goto failed;
 	}
 
-	min_ksa_leb_cnt = (c->leb_cnt * UBIFS_CRYPTO_KEYSIZE)
-			  >> UBIFS_BLOCK_SHIFT;
+	min_ksa_leb_cnt = calc_ksa_lebs(c->leb_cnt);
 	max_ksa_leb_cnt = min_ksa_leb_cnt << 1;
 	min_ksa_leb_cnt += UBIFS_KSA_ADD_LEBS;
 	max_ksa_leb_cnt += UBIFS_KSA_ADD_LEBS;
-- 
1.7.10
