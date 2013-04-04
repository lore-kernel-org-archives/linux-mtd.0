Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UNm7u-00025O-60
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2013 15:30:59 +0000
Message-ID: <1365089540.626.16.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS changes for 3.9-rc6
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 04 Apr 2013 18:32:20 +0300
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

please, pull a single UBIFS fix for v3.9.

The following changes since commit f6161aa153581da4a3867a2d1a7caf4be19b6ec9:

  Linux 3.9-rc2 (2013-03-10 16:54:19 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.9-rc6

for you to fetch changes up to 67e753ca41782913d805ff4a8a2b0f60b26b7915:

  UBIFS: make space fixup work in the remount case (2013-03-14 11:20:22 +0200)

----------------------------------------------------------------
Make the space fixup feature work in the case when the file-system is first
mounted R/O and then remounted R/W.

----------------------------------------------------------------
Artem Bityutskiy (1):
      UBIFS: make space fixup work in the remount case

 fs/ubifs/super.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
