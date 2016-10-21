Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGn-0004X6-9r
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:50:06 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 16/26] ubifs: Relax checks in ubifs_validate_entry()
Date: Fri, 21 Oct 2016 14:48:31 +0200
Message-Id: <1477054121-10198-17-git-send-email-richard@nod.at>
In-Reply-To: <1477054121-10198-1-git-send-email-richard@nod.at>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With encrypted filenames we store raw binary data, doing
string tests is no longer possible.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/replay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 3ca4540130b5..f02adc49425b 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -456,7 +456,7 @@ int ubifs_validate_entry(struct ubifs_info *c,
 	if (le32_to_cpu(dent->ch.len) != nlen + UBIFS_DENT_NODE_SZ + 1 ||
 	    dent->type >= UBIFS_ITYPES_CNT ||
 	    nlen > UBIFS_MAX_NLEN || dent->name[nlen] != 0 ||
-	    strnlen(dent->name, nlen) != nlen ||
+	    (key_type == UBIFS_XENT_KEY && strnlen(dent->name, nlen) != nlen) ||
 	    le64_to_cpu(dent->inum) > MAX_INUM) {
 		ubifs_err(c, "bad %s node", key_type == UBIFS_DENT_KEY ?
 			  "directory entry" : "extended attribute entry");
-- 
2.7.3
