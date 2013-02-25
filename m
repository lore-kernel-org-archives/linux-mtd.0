Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U9uPG-0005em-KG
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2013 09:31:35 +0000
Message-ID: <1361784714.2974.3.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS changes for 3.9-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 25 Feb 2013 11:31:54 +0200
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

please pull UBIFS changes for 3.9-rc1.

The following changes since commit 9931faca02c604c22335f5a935a501bb2ace6e20:

  Linux 3.8-rc3 (2013-01-09 18:59:55 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.9-rc1

for you to fetch changes up to 8afd500cb52a5d00bab4525dd5a560d199f979b9:

  UBIFS: fix double free of ubifs_orphan objects (2013-02-04 12:31:48 +0200)

----------------------------------------------------------------
I's been quite silent and we have only a couple of bug-fixes for the orphans
handling code plus one cosmetic change.

----------------------------------------------------------------
Adam Thomas (2):
      UBIFS: fix use of freed ubifs_orphan objects
      UBIFS: fix double free of ubifs_orphan objects

Akinobu Mita (1):
      UBIFS: rename random32() to prandom_u32()

 fs/ubifs/debug.c      |    8 ++++----
 fs/ubifs/lpt_commit.c |   14 +++++++-------
 fs/ubifs/orphan.c     |   12 ++++++++++--
 fs/ubifs/tnc_commit.c |    2 +-
 fs/ubifs/ubifs.h      |    6 +++++-
 5 files changed, 27 insertions(+), 15 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
