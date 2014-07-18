Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X86EJ-00012L-4V
 for linux-mtd@lists.infradead.org; Fri, 18 Jul 2014 11:21:35 +0000
Message-ID: <1405682471.28207.1.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBI fixes for 3.16-rc6
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Jul 2014 14:21:11 +0300
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

please, pull a couple of UBI fixes.

The following changes since commit a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee:

  Linux 3.16-rc2 (2014-06-21 19:02:54 -1000)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.16-rc6

for you to fetch changes up to 44305ebde243a7cce2c592cc89afe5041d8bf884:

  UBI: fastmap: do not miss bit-flips (2014-07-16 08:32:00 +0300)

----------------------------------------------------------------
Two UBI fastmap-related fixes for v3.16:

1. Fix UBI fastmap support which we broke in 3.16-rc1 by reversing the
   volumes RB-tree sorting criteria.
2. Make sure that we scrub all PEBs where we see bit-flips - we were missing
   some of them when the fastmap feature was enabled.

----------------------------------------------------------------
Brian Norris (1):
      UBI: fastmap: do not miss bit-flips

Heiko Schocher (1):
      UBI: fix the volumes tree sorting criteria

 drivers/mtd/ubi/fastmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
