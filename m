Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d9VPp-0002og-L9
 for linux-mtd@lists.infradead.org; Sat, 13 May 2017 11:41:00 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS updates for 4.12-rc1
Message-ID: <a5efc5a5-4970-260c-db6a-505e2647c784@nod.at>
Date: Sat, 13 May 2017 13:40:30 +0200
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

The following changes since commit a351e9b9fc24e982ec2f0e76379a49826036da12:

  Linux 4.11 (2017-04-30 19:47:48 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.12-rc1

for you to fetch changes up to 7bccd12d27b7e358823feb5429731b8ee698b173:

  ubi: Add debugfs file for tracking PEB state (2017-05-08 20:49:02 +0200)

----------------------------------------------------------------
This pull request contains updates for both UBI and UBIFS:
- New config option CONFIG_UBIFS_FS_SECURITY
- Minor improvements
- Random fixes

----------------------------------------------------------------
Andy Shevchenko (2):
      ubi: Fix section mismatch
      ubi: Make mtd parameter readable

Ben Shelton (1):
      ubi: Add debugfs file for tracking PEB state

Colin Ian King (1):
      ubifs: Fix cut and paste error on sb type comparisons

Hyunchul Lee (1):
      ubifs: Add CONFIG_UBIFS_FS_SECURITY to disable/enable security labels

Rabin Vincent (1):
      ubi: fastmap: Fix slab corruption

Rock Lee (1):
      ubifs: Fix a typo in comment of ioctl2ubifs & ubifs2ioctl

Stefan Agner (1):
      ubifs: Remove unnecessary assignment

 drivers/mtd/ubi/build.c   |  10 ++--
 drivers/mtd/ubi/debug.c   | 126 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/ubi/fastmap.c |  33 ++++++++++--
 fs/ubifs/Kconfig          |  13 +++++
 fs/ubifs/debug.c          |   4 +-
 fs/ubifs/ioctl.c          |   6 +--
 fs/ubifs/recovery.c       |   1 -
 fs/ubifs/ubifs.h          |  14 +++++-
 fs/ubifs/xattr.c          |   6 +++
 9 files changed, 195 insertions(+), 18 deletions(-)
