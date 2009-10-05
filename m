Received: from smtp.gentoo.org ([140.211.166.183])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MuutW-0007iY-AY
	for linux-mtd@lists.infradead.org; Mon, 05 Oct 2009 21:15:03 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/3] misc mtd patches for 2.6.32
Date: Mon,  5 Oct 2009 17:14:46 -0400
Message-Id: <1254777289-32109-1-git-send-email-vapier@gentoo.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David picked up the rest of my patches, but here's some that didn't make
it into his merge for 2.6.32.  The SST isn't critical, but it'd be nice
to have.  The gpio-addr-flash ones fix build errors in randconfig setups
as reported by some people due to missing depends/incomplete includes.

These can also be found in my 'for-mtd' branch in my Blackfin repo:
	git://git.kernel.org/pub/scm/linux/kernel/git/vapier/blackfin.git for-mtd

Graf Yang (1):
  mtd: m25p80: disable SST software protection bits by default

Mike Frysinger (2):
  mtd/maps: gpio-addr-flash: pull in linux/ headers rather than asm/
  mtd/maps: gpio-addr-flash: depend on GPIO arch support

 drivers/mtd/devices/m25p80.c       |    7 ++++---
 drivers/mtd/maps/Kconfig           |    1 +
 drivers/mtd/maps/gpio-addr-flash.c |    5 ++---
 3 files changed, 7 insertions(+), 6 deletions(-)
