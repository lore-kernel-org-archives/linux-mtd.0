Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8467-0007vY-5M
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 10:09:32 +0000
Message-ID: <558BD33F.7030808@nod.at>
Date: Thu, 25 Jun 2015 12:09:03 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] UBI/UBIFS updates for 4.2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

the following changes since commit c65b99f046843d2455aa231747b5a07a999a9f3d:

  Linux 4.1-rc6 (2015-05-31 19:01:07 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.2-rc1

for you to fetch changes up to 669d3d123395ce00c7a1c4e3ca0254b2f9ec95d0:

  UBI: Remove unnecessary `\' (2015-06-03 09:41:45 +0200)

----------------------------------------------------------------
This pull request includes the following UBI/UBIFS changes:
* Minor fixes for UBI and UBIFS

----------------------------------------------------------------
Chao Yu (1):
      ubifs: fix to check error code of register_shrinker

Dan Ehrenberg (1):
      UBI: block: Dynamically allocate minor numbers

Takashi Iwai (1):
      UBI: Use static class and attribute groups

shengyong (7):
      UBI: Fastmap: Use max() to get the larger value
      UBI: Fastmap: Remove unnecessary `\'
      UBI: Fastmap: Rename variables to make them meaningful
      UBI: Init vol->reserved_pebs by assignment
      UBI: Fastmap: Do not add vol if it already exists
      UBI: add a helper function for updatting on-flash layout volumes
      UBI: Remove unnecessary `\'

 drivers/mtd/ubi/block.c   |  16 ++++++-
 drivers/mtd/ubi/build.c   | 107 ++++++++++++++++------------------------------
 drivers/mtd/ubi/fastmap.c |  83 +++++++++++++++++++----------------
 drivers/mtd/ubi/ubi.h     |   2 +-
 drivers/mtd/ubi/vmt.c     |  98 ++++++++++--------------------------------
 drivers/mtd/ubi/vtbl.c    |  45 ++++++++++---------
 drivers/mtd/ubi/wl.c      |   2 +-
 fs/ubifs/super.c          |   5 ++-
 8 files changed, 149 insertions(+), 209 deletions(-)
