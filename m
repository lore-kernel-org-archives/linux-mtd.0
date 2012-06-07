Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScYeH-0001cs-Kp
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 09:04:58 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Subject: [PATCH 4/4] UBIFS: add TOTOs for Joel
Date: Thu,  7 Jun 2012 12:06:08 +0300
Message-Id: <1339059968-25753-4-git-send-email-dedekind1@gmail.com>
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

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/sb.c    |   17 +++++++++++++++++
 fs/ubifs/ubifs.h |    6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 91c78e7..20eec40 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -73,6 +73,23 @@
  */
 static int calc_ksa_lebs(struct ubifs_info *c, int leb_cnt)
 {
+	/* TODO: I do not think this is correct. The data node size varies from
+	 * UBIFS_DATA_NODE_SZ to UBIFS_MAX_DATA_NODE_SZ. Indeed, I can fill my
+	 * file-system with millions of files with size of 1 byte. But you
+	 * assume that data nodes are 4KiB in size, which is wrong. Remember
+	 * that we compress the data? Or I misunderstoos something?
+	 *
+	 * Or even worse, if I have a huge file containing only 1's or anything
+	 * else which perfectly well compresses, and I fill all space with this
+	 * file, then we'll end up with huge amount of tiny data nodes, and
+	 * you'll need one key per data node.
+	 *
+	 * So, the most pessimistic thing is to assume the minimum data node
+	 * size of UBIFS_DATA_NODE_SZ, right? */
+
+	/* TODO: note, the leb_cnt * UBIFS_CRYPTO_KEYSIZE part may easily
+	 * overflow because it will be done as 32-bit multiplication with a
+	 * 32-bit result. So this is not really correct */
 	return (leb_cnt * UBIFS_CRYPTO_KEYSIZE) >> UBIFS_BLOCK_SHIFT;
 }
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index f34ab84..2b43107 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -167,11 +167,17 @@
 /*
  * Constant number of KSA LEBS to add to computed value, ensuring two plus a
  * checkpoint LEB.
+ *
+ * TODO: please, improve the comment to make it easier to understand why you
+ * need 3 extra LEBs. Also the checkpoint LEB is something new to me.
  */
 #define UBIFS_KSA_ADD_LEBS 3
 /*
  * KSA LEBS is 1.125 * the computed min to allow unused keys when the drive is
  * full. This shift is used to compute 0.125 * LEBS.
+ *
+ * TODO: looks like blach magic. Could the comment be improved to make this
+ * easy to understand why we need unused keys?
  */
 #define UBIFS_KSA_LEBS_SCALE_SHIFT 3
 
-- 
1.7.10
