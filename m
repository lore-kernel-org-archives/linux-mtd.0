Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cbwH3-0006Av-SW
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 21:29:09 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com,
 david.oberhollenzer@sigma-star.at, Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/4] ubifs: Add assert to dent_key_init()
Date: Thu,  9 Feb 2017 22:28:36 +0100
Message-Id: <20170209212837.14197-3-richard@nod.at>
In-Reply-To: <20170209212837.14197-1-richard@nod.at>
References: <20170209212837.14197-1-richard@nod.at>
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
2.10.2
