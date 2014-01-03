Received: from mail-db9lp0249.outbound.messaging.microsoft.com
 ([213.199.154.249] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz0KP-0001fO-Hu
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 08:42:02 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 0/3] mtd: nand: support more Hynix nands
Date: Fri, 3 Jan 2014 16:08:35 +0800
Message-ID: <1388736518-5934-1-git-send-email-b32955@freescale.com>
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

This patch set adds the support for more Hynix nands.

(1) H27UBG8T2CTR uses a different rule for its ID data, we have to add a new
    parsing code for it. The new rule is triggerd when the Device ID is 0xd7 and
    the process technology is <= 20nm.

(2) Add the H27UCG8T2B support.    
    The H27UCG8T2B is (16K + 1280), it use the legacy parsing rule. But needs
    a small change.


v2 -- > v3:
	[1] use the new parsing rule if the Device ID is 0xd7 and the process
	    technology is <=20 nm.
	[2] add the H27UCG8T2B support.    

Huang Shijie (3):
  mtd: nand: add a helper to parse the Hynix nand
  mtd: nand: add new parsing rule for Hynix's H27UBG8T2CTR
  mtd: nand: add support for H27UCG8T2B(16K + 1280)

 drivers/mtd/nand/nand_base.c |  140 ++++++++++++++++++++++++++++++------------
 1 files changed, 101 insertions(+), 39 deletions(-)

-- 
1.7.2.rc3
