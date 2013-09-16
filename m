Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLTG7-0003Nz-CM
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2013 07:30:12 +0000
Message-ID: <1379316587.17490.56.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS changes for 3.12-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Sep 2013 10:29:47 +0300
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

very few changes. I'll start using a single UBI/UBIFS tree instead
of 2 trees from now on. So in the future you'll get 1 small pull
request instead of 2 tiny ones.

The following changes since commit d4e4ab86bcba5a72779c43dc1459f71fea3d89c8:

  Linux 3.11-rc5 (2013-08-11 18:04:20 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.12-rc1

for you to fetch changes up to c23e9b75ccd0edba81a506c7d97e0af626489256:

  UBIFS: remove invalid warn msg with tst_recovery enabled (2013-08-16 16:42:08 +0300)

----------------------------------------------------------------
Just one patch which fixes the power-cut recovery testing mode.

----------------------------------------------------------------
Mats Kärrman (1):
      UBIFS: remove invalid warn msg with tst_recovery enabled

 fs/ubifs/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
