Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ft65R-0001uD-No
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2018 07:00:55 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Remove empty file.h
Date: Fri, 24 Aug 2018 08:59:05 +0200
Message-Id: <20180824065905.30492-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This empty file sneaked into the tree by mistake.
Remove it.

Fixes: 6eb61d587f45 ("ubifs: Pass struct ubifs_info to ubifs_assert()")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/file.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 fs/ubifs/file.h

diff --git a/fs/ubifs/file.h b/fs/ubifs/file.h
deleted file mode 100644
index e69de29bb2d1..000000000000
-- 
2.18.0
