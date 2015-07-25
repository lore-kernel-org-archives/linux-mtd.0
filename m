Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZInxu-00018M-OQ
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 01:09:27 +0000
Received: by pdbbh15 with SMTP id bh15so21050661pdb.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 18:09:05 -0700 (PDT)
Date: Fri, 24 Jul 2015 18:09:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [GIT PULL] MTD updates for 4.2-rc4
Message-ID: <20150725010902.GO8876@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20150724

for you to fetch changes up to 5f867db63473f32cce1b868e281ebd42a41f8fad:

  mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict (2015-07-07 13:03:25 -0700)

----------------------------------------------------------------
MTD updates for 4.2-rc4:

Two trivial updates. I meant to send these much earlier, but I've been
preoccupied.

* Add MAINTAINERS entry for diskonchip g3 driver

* Fix an overlooked conflict in bitfield value assignments

The latter update is a bit overdue, but there's no reason to wait any longer.

----------------------------------------------------------------
Robert Jarzmik (1):
      MAINTAINERS: mtd: docg3: add docg3 maintainer

Scott Wood (1):
      mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict

 MAINTAINERS              |  6 ++++++
 include/linux/mtd/nand.h | 10 +++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)
