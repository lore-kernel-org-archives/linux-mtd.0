Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHsds-0005hN-Mn
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 13:33:45 +0000
From: Colin King <colin.king@canonical.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: ensure zero err is returned on successful return
Date: Fri, 16 Dec 2016 13:32:39 +0000
Message-Id: <20161216133239.21547-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

err is no longer being set on a successful return path, causing
a garbage value being returned. Fix this by setting err to zero
for the successful return path.

Found with static analysis by CoverityScan, CID 1389473

Fixes: 7799953b34d18 ("ubifs: Implement encrypt/decrypt for all IO")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ubifs/journal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index a459211..b75f1a6 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1319,6 +1319,7 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	dn->compr_type = cpu_to_le16(compr_type);
 	dn->size = cpu_to_le32(*new_len);
 	*new_len = UBIFS_DATA_NODE_SZ + out_len;
+	err = 0;
 out:
 	kfree(buf);
 	return err;
-- 
2.10.2
