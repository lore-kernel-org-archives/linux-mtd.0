Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLTGm-0003QG-7X
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2013 07:30:52 +0000
Message-ID: <1379316610.17490.58.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBI changes for 3.12-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Sep 2013 10:30:10 +0300
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

very few changes. I'll start using a single UBI/UBIFS tree instead
of 2 trees from now on. So in the future you'll get 1 small pull
request instead of 2 tiny ones.

The following changes since commit b36f4be3de1b123d8601de062e7dbfc904f305fb:

  Linux 3.11-rc6 (2013-08-18 14:36:53 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubi.git tags/upstream-3.12-rc1

for you to fetch changes up to 8930fa500f55215f0211db9b78255e727ac3f282:

  UBI: Fix invalidate_fastmap() (2013-08-20 17:53:25 +0300)

----------------------------------------------------------------
Just a single fastmap fix plus a regression fix.

----------------------------------------------------------------
Richard Weinberger (2):
      UBI: Fix PEB leak in wear_leveling_worker()
      UBI: Fix invalidate_fastmap()

 drivers/mtd/ubi/fastmap.c | 5 +----
 drivers/mtd/ubi/wl.c      | 3 +++
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
