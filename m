Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0Yyk-00049b-OZ
 for linux-mtd@lists.infradead.org; Sat, 29 Oct 2016 19:07:44 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS fixes for 4.9-rc3
Message-ID: <f0db8192-0b26-dfc3-95a9-395616c8d848@nod.at>
Date: Sat, 29 Oct 2016 21:07:15 +0200
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

The following changes since commit 14970f204b1993af7459d5bd34aaff38dfee6670:

  Merge branch 'akpm' (patches from Andrew) (2016-10-27 19:58:39 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.9-rc3

for you to fetch changes up to a00052a296e54205cf238c75bd98d17d5d02a6db:

  ubifs: Fix regression in ubifs_readdir() (2016-10-28 14:48:31 +0200)

----------------------------------------------------------------
This pull request contains fixes for issues in both UBI and UBIFS:
- A regression wrt. overlayfs, introduced in -rc2.
- An UBI issue, found by Dan Carpenter's static checker.

----------------------------------------------------------------
Boris Brezillon (1):
      ubi: fastmap: Fix add_vol() return value test in ubi_attach_fastmap()

Richard Weinberger (1):
      ubifs: Fix regression in ubifs_readdir()

 drivers/mtd/ubi/fastmap.c | 10 +++++-----
 fs/ubifs/dir.c            |  8 ++++++++
 2 files changed, 13 insertions(+), 5 deletions(-)
