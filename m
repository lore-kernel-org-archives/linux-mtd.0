Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgDA6-0003qQ-DP
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 12:33:43 +0000
Message-ID: <1384259597.15824.136.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBI changes for 3.13-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 12 Nov 2013 14:33:17 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

The following changes since commit b36f4be3de1b123d8601de062e7dbfc904f305fb:

  Linux 3.11-rc6 (2013-08-18 14:36:53 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubi.git tags/upstream-3.13-rc1

for you to fetch changes up to ae0d146955665411a6d4cea5e0893429cfc52807:

  UBI: Add some asserts to ubi_attach_fastmap() (2013-10-03 19:42:51 +0300)

----------------------------------------------------------------
A bunch of fixes for the fastmap feature, which is still new and rather
experimental. It looks like it starts getting more users. No significant
changes for the "classical" non-fastmap UBI.

----------------------------------------------------------------
Richard Genoud (2):
      UBI: fastmap: fix backward compatibility with image_seq
      UBI: simplify image sequence test

Richard Weinberger (7):
      UBI: Fix PEB leak in wear_leveling_worker()
      UBI: Fix invalidate_fastmap()
      UBI: fix refill_wl_user_pool()
      UBI: Fix error path in scan_pool()
      UBI: Call scan_all() with correct offset in error case
      UBI: Fix memory leak in ubi_attach_fastmap() error path
      UBI: Add some asserts to ubi_attach_fastmap()

 drivers/mtd/ubi/attach.c  | 11 ++++++-----
 drivers/mtd/ubi/fastmap.c | 46 ++++++++++++++++++++++++++++++++++++++--------
 drivers/mtd/ubi/wl.c      |  7 +++----
 3 files changed, 47 insertions(+), 17 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
