Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VvjWD-0002yC-Ad
 for linux-mtd@lists.infradead.org; Wed, 25 Dec 2013 08:08:42 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2 0/2] mtd: nand: parse the Hynix nand which uses <26nm
 technology
Date: Wed, 25 Dec 2013 15:37:17 +0800
Message-ID: <1387957039-12575-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With this patch set, we can parse out the Hynix nand which uses <26nm
technology.

v1 --> v2:
	[1] do not parse the ECC info anymore.
	[2] split out a function to parse the Hynix MLC nand whose ID length is
	    6 bytes.

Huang Shijie (2):
  mtd: nand: add a helper to parse the Hynix nand
  mtd: nand: parse the Hynix nand which uses <26nm technology

 drivers/mtd/nand/nand_base.c |  130 +++++++++++++++++++++++++++++-------------
 1 files changed, 91 insertions(+), 39 deletions(-)

-- 
1.7.2.rc3
