Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIdZy-0004mC-R0
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 12:27:15 +0000
Message-ID: <1393417609.3412.156.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS changes for 3.14-rc5
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2014 14:26:49 +0200
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

The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:

  Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.14-rc5

for you to fetch changes up to 5547fec74a566e1f5e00a937b9a367f7c6a94a8b:

  UBI: fix some use after free bugs (2014-02-04 09:44:30 +0200)

----------------------------------------------------------------
Just a single fix for the UBI module unload path which makes sure we do not
touch freed memory.

----------------------------------------------------------------
Dan Carpenter (1):
      UBI: fix some use after free bugs

 drivers/mtd/ubi/fastmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
