Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScYeG-0001cs-BW
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 09:04:57 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Subject: [PATCH 1/4] UBIFS: correction to Joels' patch
Date: Thu,  7 Jun 2012 12:06:05 +0300
Message-Id: <1339059968-25753-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <alpine.DEB.2.00.1206062052140.31834@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1206062052140.31834@eristoteles.iwoars.net>
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

This is a nit-pick, and yes, I am paranoid, but in UBIFS we try to put
variables of the same type together when declaring them. Here is the correction
- please, take this into account in later patches.

Thanks!

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/sb.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index c1665ca..d4328bd 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -81,8 +81,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	union ubifs_key key;
 	int err, tmp, jnl_lebs, log_lebs, max_buds, main_lebs, main_first;
 	int lpt_lebs, lpt_first, orph_lebs, big_lpt, ino_waste, sup_flags = 0;
-	int min_leb_cnt = UBIFS_MIN_LEB_CNT;
-	int ksa_lebs = 0, ksa_first;
+	int min_leb_cnt = UBIFS_MIN_LEB_CNT, ksa_lebs = 0, ksa_first;
 	long long tmp64, main_bytes;
 	__le64 tmp_le64;
 
@@ -370,9 +369,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 {
 	long long max_bytes;
-	int err = 1, min_leb_cnt;
-	int max_ksa_leb_cnt;
-	int min_ksa_leb_cnt;
+	int err = 1, min_leb_cnt, max_ksa_leb_cnt, min_ksa_leb_cnt;
 
 	if (!c->key_hash) {
 		err = 2;
-- 
1.7.10
