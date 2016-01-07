Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH0XE-00039a-Vk
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 02:42:45 +0000
Received: by mail-pa0-x235.google.com with SMTP id cy9so246315632pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 18:42:24 -0800 (PST)
Date: Wed, 6 Jan 2016 18:42:21 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] Last MTD fixes for v4.4
Message-ID: <20160107024221.GY109450@google.com>
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

The following changes since commit e488ca9f8d4f62c2dc36bfa5c32f68e7f05ab381:

  doc: dt: mtd: partitions: add compatible property to "partitions" node (2015-12-08 17:10:20 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160106

for you to fetch changes up to a32d5b726ff8cf32bf491522b0ac8ae2545a063e:

  mtd: spi-nor: fix stm_is_locked_sr() parameters (2016-01-05 16:00:41 -0800)

----------------------------------------------------------------
Three last MTD fixes for v4.4. These are all fixes for regressions and bugs
reported mid cycle. Unfortunately, some of them took a bit long to get proper
testing and feedback.

 * Assign the default MTD name earlier in the registration process, so
   partition parsers (like cmdlinepart) see the right name. Without this, some
   systems may come up with unpartitioned flash. This was a v4.4-rc1
   regression.

 * Revert some new Winbond SPI NOR flash unlocking/locking support; new code in
   v4.4 caused regressions on some Spansion flash.

 * Fix mis-typed parameter ordering in SPI NOR unlock function; this bug was
   introduced in v4.4-rc1.

----------------------------------------------------------------
Brian Norris (3):
      mtd: fix cmdlinepart parser, early naming for auto-filled MTD
      mtd: spi-nor: fix Spansion regressions (aliased with Winbond)
      mtd: spi-nor: fix stm_is_locked_sr() parameters

 drivers/mtd/mtdcore.c         | 26 +++++++++++++++++---------
 drivers/mtd/spi-nor/spi-nor.c | 10 ++++------
 include/linux/mtd/spi-nor.h   |  2 +-
 3 files changed, 22 insertions(+), 16 deletions(-)
