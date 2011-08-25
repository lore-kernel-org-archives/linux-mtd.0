Received: from ns.mm-sol.com ([213.240.235.226] helo=extserv.mm-sol.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwZzp-0002vY-Pp
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 13:29:26 +0000
From: Stanimir Varbanov <svarbanov@mm-sol.com>
To: spi-devel-general@lists.sourceforge.net,
	linux-mtd@lists.infradead.org
Subject: [PATCH/RFC 0/2] Add power supply switch in platform data
Date: Thu, 25 Aug 2011 16:29:10 +0300
Message-Id: <cover.1314278151.git.svarbanov@mm-sol.com>
Cc: grant.likely@secretlab.ca, Stanimir Varbanov <svarbanov@mm-sol.com>,
	artem.bityutskiy@intel.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here are two patches that add a power method in flash platform data
for chips power control. The first patch adding this function and
the second use it in m25p driver.

Comments are welcome !

Stanimir Varbanov (2):
  spi: flash: Add power method into flash platform data
  mtd: m25p80: Call a platform power method in the driver

 drivers/mtd/devices/m25p80.c |   41 +++++++++++++++++++++++++++++++++++++----
 include/linux/spi/flash.h    |    4 ++++
 2 files changed, 41 insertions(+), 4 deletions(-)

-- 
1.7.4.1
