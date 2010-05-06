Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9yA1-0004AR-D5
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 10:18:30 +0000
Message-ID: <4BE29771.4050800@renesas.com>
Date: Thu, 06 May 2010 19:18:25 +0900
From: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
Subject: A few cleanups against Linus' master (v2)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: shinya.kuribayashi.px@renesas.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Noticed and fixed while learning UBI subsystems.  As for comment fixes
> a double-check by native speaker would be appricated.
> 
> p.s. UBI fixes can be squashed into one at your option, thanks.

v2:
- Incorporate s/EV/EC/ typo fix, too
- Drop 'mtd: Remove empty mtd/mtdbdi.c and mtd/internal.h files'


Shinya Kuribayashi (2):
      UBI: Fix s/then/than/ typos
      UBI: Misc comment fixes

 drivers/mtd/ubi/Kconfig |    2 +-
 drivers/mtd/ubi/io.c    |    6 +++---
 drivers/mtd/ubi/kapi.c  |    6 +++---
 drivers/mtd/ubi/scan.c  |    4 ++--
 drivers/mtd/ubi/vtbl.c  |    4 ++--
 drivers/mtd/ubi/wl.c    |    2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)
