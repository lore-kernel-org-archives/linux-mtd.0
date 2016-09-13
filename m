Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjoZJ-0007CB-RZ
 for linux-mtd@lists.infradead.org; Tue, 13 Sep 2016 14:20:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, richard@nod.at, dedekind1@gmail.com,
 adrian.hunter@intel.com
Subject: [PATCH 0/4] ubifs: Add overlayfs support
Date: Tue, 13 Sep 2016 16:18:54 +0200
Message-Id: <1473776338-18816-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To support overlayfs in a proper way a filesystem has to offer support
for DT_CHR, RENAME_WHITEOUT and RENAME_EXCHANGE.
While UBIFS supports DT_CHR it lacks support for RENAME_WHITEOUT and
RENAME_EXCHANGE. This patch series implement the missing bits.
RENAME_WHITEOUT itself depends on O_TMPFILE, therefore O_TMPFILE is now
also supported.

Richard Weinberger (4):
  ubifs: Implement O_TMPFILE
  ubifs: Implement RENAME_WHITEOUT
  ubifs: Implement RENAME_EXCHANGE
  ubifs: Use move variable in ubifs_rename()

 fs/ubifs/dir.c     | 231 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 fs/ubifs/journal.c | 188 +++++++++++++++++++++++++++++++++++++++----
 fs/ubifs/ubifs.h   |   7 +-
 3 files changed, 392 insertions(+), 34 deletions(-)

-- 
2.7.3
