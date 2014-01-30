Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8r13-0004Uw-8C
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 12:46:46 +0000
Message-ID: <1391085977.28238.32.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS changes for 3.14-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jan 2014 14:46:17 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit 802eee95bde72fd0cd0f3a5b2098375a487d1eda:

  Linux 3.13-rc6 (2013-12-29 16:01:33 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.14-rc1

for you to fetch changes up to 2c7ca5cc3624e05a5235f70039adce30725972d6:

  UBI: avoid program operation on NOR flash after erasure interrupted (2014-01-09 18:25:38 +0200)

----------------------------------------------------------------
* Improve the NOR erasure quirk - now it tries to do as little writes as
  possible, because the eraseblock may be in an "unstable" state and write
  operation sometimes causes NOR chip lock-ups.
* Both UBI and UBIFS changes are now maintainer in one single tree, because the
  amount of changes dropped significantly.

----------------------------------------------------------------
Artem Bityutskiy (1):
      MAINTAINERS: keep UBI and UBIFS stuff in the same tree

Julia Lawall (1):
      UBI: fix error return code

Qi Wang 王起 (qiwang) (1):
      UBI: avoid program operation on NOR flash after erasure interrupted

 MAINTAINERS              |  2 +-
 drivers/mtd/ubi/attach.c |  4 +++-
 drivers/mtd/ubi/build.c  |  4 +++-
 drivers/mtd/ubi/io.c     | 54 ++++++++++++++++++++++--------------------------------
 4 files changed, 29 insertions(+), 35 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
