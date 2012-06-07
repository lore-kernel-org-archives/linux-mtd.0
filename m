Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScYeG-0001ct-BU
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 09:04:57 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Subject: [PATCH 2/4] UBIFS: another correction to joel's patch
Date: Thu,  7 Jun 2012 12:06:06 +0300
Message-Id: <1339059968-25753-2-git-send-email-dedekind1@gmail.com>
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

Fix the following GCC warning identified by aiaiai:
+fs/ubifs/sb.c: In function 'create_default_filesystem':
+fs/ubifs/sb.c:85:20: warning: variable 'ksa_first' set but not used [-Wunused-but-set-variable]

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/sb.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index d4328bd..7b6adc0 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -81,7 +81,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	union ubifs_key key;
 	int err, tmp, jnl_lebs, log_lebs, max_buds, main_lebs, main_first;
 	int lpt_lebs, lpt_first, orph_lebs, big_lpt, ino_waste, sup_flags = 0;
-	int min_leb_cnt = UBIFS_MIN_LEB_CNT, ksa_lebs = 0, ksa_first;
+	int min_leb_cnt = UBIFS_MIN_LEB_CNT, ksa_lebs = 0;
 	long long tmp64, main_bytes;
 	__le64 tmp_le64;
 
@@ -168,7 +168,6 @@ static int create_default_filesystem(struct ubifs_info *c)
 		lpt_first + lpt_lebs - 1);
 
 	main_first = c->leb_cnt - main_lebs;
-	ksa_first = c->leb_cnt - main_lebs - ksa_lebs;
 
 	/* Create default superblock */
 	tmp = ALIGN(UBIFS_SB_NODE_SZ, c->min_io_size);
-- 
1.7.10
