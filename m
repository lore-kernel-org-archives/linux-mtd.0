Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJ5uE-00020G-2Y
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 20:51:07 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS updates for 4.5
Message-ID: <5695671D.1070306@nod.at>
Date: Tue, 12 Jan 2016 21:50:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

the following changes since commit 168309855a7d1e16db751e9c647119fe2d2dc878:

  Linux 4.4-rc8 (2016-01-03 15:15:37 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.5-rc1

for you to fetch changes up to 4fdd1d51ad5d059548c6539ac9d281f74d24bcbe:

  ubifs: Use XATTR_*_PREFIX_LEN (2016-01-10 12:33:47 +0100)

----------------------------------------------------------------
This pull request contains three changes, two cleanups and one UBI
wear leveling improvement by Sebastian Siewior.

----------------------------------------------------------------
Dongsheng Yang (1):
      UBIFS: add a comment in key.h for unused parameter

Richard Weinberger (1):
      ubifs: Use XATTR_*_PREFIX_LEN

Sebastian Siewior (1):
      mtd: ubi: wl: avoid erasing a PEB which is empty

 drivers/mtd/ubi/wl.c | 21 ++++++++++++++++++---
 fs/ubifs/key.h       |  6 ++++++
 fs/ubifs/xattr.c     |  4 ++--
 3 files changed, 26 insertions(+), 5 deletions(-)
