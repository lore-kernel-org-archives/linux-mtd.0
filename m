Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAuSM-0007Gw-9S
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 08:37:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 4/6] ubifs: Add assert to dent_key_init()
Date: Wed, 17 May 2017 10:36:47 +0200
Message-Id: <20170517083649.25135-4-richard@nod.at>
In-Reply-To: <20170517083649.25135-1-richard@nod.at>
References: <20170517083649.25135-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...to make sure that we don't use it for double hashed lookups
instead of dent_key_init_hash().

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/key.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index 7547be512db2..b1f7c0caa3ac 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -162,6 +162,7 @@ static inline void dent_key_init(const struct ubifs_info *c,
 	uint32_t hash = c->key_hash(fname_name(nm), fname_len(nm));
 
 	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
+	ubifs_assert(!nm->hash && !nm->minor_hash);
 	key->u32[0] = inum;
 	key->u32[1] = hash | (UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS);
 }
-- 
2.12.0
