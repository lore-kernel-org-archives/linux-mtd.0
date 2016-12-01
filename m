Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnz-00036Q-0a
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:16 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 15/24] ubifs: Relax checks in ubifs_validate_entry()
Date: Thu,  1 Dec 2016 22:21:02 +0100
Message-Id: <1480627271-10441-16-git-send-email-richard@nod.at>
In-Reply-To: <1480627271-10441-1-git-send-email-richard@nod.at>
References: <1480627271-10441-1-git-send-email-richard@nod.at>
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
index fb0f44cd1e28..026e853d31a7 100644
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
