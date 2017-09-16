Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtIJv-00012m-Eq
 for linux-mtd@lists.infradead.org; Sat, 16 Sep 2017 19:00:06 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBI updates for 4.14-rc1
Date: Sat, 16 Sep 2017 20:59:57 +0200
Message-ID: <1573378.SEVV3x3t27@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 569dbb88e80deb68974ef6fdd6a13edb9d686261:

  Linux 4.13 (2017-09-03 13:56:17 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.14-rc1

for you to fetch changes up to 89b68cd926633ff0df1e1a0ae29fcd80f68bdd96:

  UBI: Fix two typos in comments (2017-09-13 22:05:30 +0200)

=2D---------------------------------------------------------------
This pull request contains updates for UBI:
=2D Minor improvements

=2D---------------------------------------------------------------
Ben Dooks (3):
      ubi: pr_err() strings should end with newlines
      ubi: pr_err() strings should end with newlines
      ubi: pr_err() strings should end with newlines

Colin Ian King (1):
      ubi: fastmap: fix spelling mistake: "invalidiate" -> "invalidate"

Uwe Kleine-K=F6nig (1):
      UBI: Fix two typos in comments

 drivers/mtd/ubi/block.c     |  6 +++---
 drivers/mtd/ubi/build.c     | 20 ++++++++++----------
 drivers/mtd/ubi/fastmap.c   |  2 +-
 drivers/mtd/ubi/ubi-media.h |  4 ++--
 4 files changed, 16 insertions(+), 16 deletions(-)
