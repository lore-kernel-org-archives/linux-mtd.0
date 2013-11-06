Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve4DP-0001nT-18
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 14:36:15 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>
Subject: [PATCHv3 0/2] m25p80: QUAD read support + cleanup.
Date: Wed, 6 Nov 2013 20:05:33 +0530
Message-ID: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, Sourav Poddar <sourav.poddar@ti.com>,
 linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patch series does the following:
1. Cleanup the m25p80 driver to convert bool check for
   read into an enum. This will help adding more read 
   commands into the driver easily.

2. Add quad read support for spansion and macronix flash devices.

Sourav Poddar (2):
  drivers: mtd: m25p80: convert "bool" read type into an enum
  drivers: mtd: m25p80: Add quad read support.

 drivers/mtd/devices/m25p80.c |  220 ++++++++++++++++++++++++++++++++++++++----
 1 files changed, 202 insertions(+), 18 deletions(-)
