Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIbYG-0000ze-Fn
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 15:40:03 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: replay: fix high stack usage
Date: Fri,  2 Nov 2018 16:39:24 +0100
Message-Id: <20181102153932.1750967-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Having two shash descriptors on the stack cause a very significant kernel
stack usage that can cross the warning threshold:

fs/ubifs/replay.c: In function 'authenticate_sleb':
fs/ubifs/replay.c:633:1: error: the frame size of 1144 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

Normally, gcc optimizes the out, but with CONFIG_CC_OPTIMIZE_FOR_DEBUGGING,
it does not. Splitting the two stack allocations into separate functions
means that they will use the same memory again. In normal configurations
(optimizing for size or performance), those should get inlined and we get
the same behavior as before.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/replay.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 75f961c4c044..a08c5b7030ea 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -533,6 +533,28 @@ static int is_last_bud(struct ubifs_info *c, struct ubifs_bud *bud)
 	return data == 0xFFFFFFFF;
 }
 
+/* authenticate_sleb_hash and authenticate_sleb_hmac are split out for stack usage */
+static int authenticate_sleb_hash(struct ubifs_info *c, struct shash_desc *log_hash, u8 *hash)
+{
+	SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
+
+	hash_desc->tfm = c->hash_tfm;
+	hash_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	ubifs_shash_copy_state(c, log_hash, hash_desc);
+	return crypto_shash_final(hash_desc, hash);
+}
+
+static int authenticate_sleb_hmac(struct ubifs_info *c, u8 *hash, u8 *hmac)
+{
+	SHASH_DESC_ON_STACK(hmac_desc, c->hmac_tfm);
+
+	hmac_desc->tfm = c->hmac_tfm;
+	hmac_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	return crypto_shash_digest(hmac_desc, hash, c->hash_len, hmac);
+}
+
 /**
  * authenticate_sleb - authenticate one scan LEB
  * @c: UBIFS file-system description object
@@ -574,21 +596,12 @@ static int authenticate_sleb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 
 		if (snod->type == UBIFS_AUTH_NODE) {
 			struct ubifs_auth_node *auth = snod->node;
-			SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
-			SHASH_DESC_ON_STACK(hmac_desc, c->hmac_tfm);
-
-			hash_desc->tfm = c->hash_tfm;
-			hash_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
 
-			ubifs_shash_copy_state(c, log_hash, hash_desc);
-			err = crypto_shash_final(hash_desc, hash);
+			err = authenticate_sleb_hash(c, log_hash, hash);
 			if (err)
 				goto out;
 
-			hmac_desc->tfm = c->hmac_tfm;
-			hmac_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
-			err = crypto_shash_digest(hmac_desc, hash, c->hash_len,
-						  hmac);
+			err = authenticate_sleb_hmac(c, hash, hmac);
 			if (err)
 				goto out;
 
-- 
2.18.0
