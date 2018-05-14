Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI8h9-0002C7-8B
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:19:22 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/6] ubifs: Some simple fixes
Date: Mon, 14 May 2018 10:18:13 +0200
Message-Id: <20180514081819.20921-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Having looked at UBIFS more closely recently I collected some spelling
fixes, fixes for wrong comments and a removal for an unused variable.

Sascha

Sascha Hauer (6):
  ubifs: remove set but never used variable
  ubifs: journal: Remove wrong comment
  ubifs: Spelling fix someting -> something
  ubifs: log: Some spelling fixes
  ubifs: gc: Fix typo
  ubifs: lpt: Fix wrong pnode number range in comment

 fs/ubifs/gc.c         | 2 +-
 fs/ubifs/journal.c    | 5 ++---
 fs/ubifs/log.c        | 6 +++---
 fs/ubifs/lpt_commit.c | 2 +-
 fs/ubifs/replay.c     | 5 +----
 fs/ubifs/ubifs.h      | 2 --
 6 files changed, 8 insertions(+), 14 deletions(-)

-- 
2.17.0
