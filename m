Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bceC1-0007sJ-Gh
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 19:50:35 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS fixes for 4.8-rc4
Message-ID: <fdbae72c-e9da-4bee-2452-11ae3e1ea28a@nod.at>
Date: Wed, 24 Aug 2016 21:49:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 7a1dcf6adaa7cc4b8cd93a3883267497a77b1051:

  Merge tag 'usercopy-v4.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux (2016-08-23 14:32:38 -0400)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.8-rc4

for you to fetch changes up to 17ce1eb0b64eb27d4f9180daae7495fa022c7b0d:

  ubifs: Fix xattr generic handler usage (2016-08-23 23:02:52 +0200)

----------------------------------------------------------------
This pull requests contains fixes for two issues in UBI and UBIFS:
1. Wrong UBIFS assertion.
2. A UBIFS xattr regression.

----------------------------------------------------------------
Richard Weinberger (1):
      ubifs: Fix xattr generic handler usage

Vincent Stehlé (1):
      ubifs: Fix assertion in layout_in_gaps()

 fs/ubifs/tnc_commit.c | 2 +-
 fs/ubifs/xattr.c      | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)
