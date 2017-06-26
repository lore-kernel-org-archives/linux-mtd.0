Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPSWQ-00065q-Md
 for linux-mtd@lists.infradead.org; Mon, 26 Jun 2017 11:49:40 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: Set double hash cookie also for RENAME_EXCHANGE
Date: Mon, 26 Jun 2017 13:49:04 +0200
Message-Id: <20170626114905.20112-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We developed RENAME_EXCHANGE and UBIFS_FLG_DOUBLE_HASH more or less in
parallel and this case was forgotten. :-(

Cc: stable@vger.kernel.org
Fixes: d63d61c16972 ("ubifs: Implement UBIFS_FLG_DOUBLE_HASH")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 294519b98874..b4bfc29f3bec 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -984,6 +984,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	dent1->nlen = cpu_to_le16(fname_len(snd_nm));
 	memcpy(dent1->name, fname_name(snd_nm), fname_len(snd_nm));
 	dent1->name[fname_len(snd_nm)] = '\0';
+	set_dent_cookie(c, dent1);
 	zero_dent_node_unused(dent1);
 	ubifs_prep_grp_node(c, dent1, dlen1, 0);
 
@@ -996,6 +997,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	dent2->nlen = cpu_to_le16(fname_len(fst_nm));
 	memcpy(dent2->name, fname_name(fst_nm), fname_len(fst_nm));
 	dent2->name[fname_len(fst_nm)] = '\0';
+	set_dent_cookie(c, dent2);
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
 
-- 
2.12.3
