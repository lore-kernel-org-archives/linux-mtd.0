Received: from isilmar-3.linta.de ([188.40.101.200] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCVDN-0003rc-6p
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 10:00:30 +0000
Date: Thu, 13 May 2010 11:57:49 +0200
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [git pull] pcmciamtd fixes
Message-ID: <20100513095749.GA25909@comet.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Alexander Kurz spent quite some time to fix pcmciamtd to not only build
again, but to actually work on some cards he owns. In addition, there are a
few more PCMCIA IDs to report, and Julia Lawall reported and fixed an
use-after-free bug in pcmciamtd. Could you pick up these patches and pull
from 

  git://git.kernel.org/pub/scm/linux/kernel/git/brodo/pcmcia-2.6.git pcmciamtd

please? Alteranatively, I can push these changes (post-2.6.34) upstream via
PCMCIA, if you prefer me to take them.

I'll send the patches to the MTD and PCMCIA lists for a final(?) round of
review.

Thanks & Best,
	Dominik

Alexander Kurz (2):
      pcmciamtd: fixing obvious errors
      pcmciamtd: coding style cleanups

Dominik Brodowski (1):
      pcmciamtd: add another ID

Julia Lawall (1):
      drivers/mtd/maps: Eliminate use after free

 drivers/mtd/maps/Kconfig     |    2 +-
 drivers/mtd/maps/pcmciamtd.c |   80 ++++++++++++++++++++++++------------------
 2 files changed, 47 insertions(+), 35 deletions(-)
