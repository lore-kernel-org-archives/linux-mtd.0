Received: from mail-ee0-x230.google.com ([2a00:1450:4013:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsode-0002pb-By
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 07:00:19 +0000
Received: by mail-ee0-f48.google.com with SMTP id e49so2646334eek.7
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 22:59:52 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com, dwmw2@infradead.org, dedekind1@gmail.com,
 computersforpeace@gmail.com, shijie8@gmail.com
Subject: [PATCH v3] mtd: gpmi: Bitflip support in erased regions
Date: Tue, 17 Dec 2013 07:59:40 +0100
Message-Id: <1387263581-7863-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

This is v3 of my patch which adds support for bitflip detection/correction
in erased regions when using BCH/GPMI nand.

Changes in V3:
 - The fast path in V2 was not entered (my bad, I mixed some boards when
testing) due to using a faulty register offset. The fast path implemention
for correctly reading fully erased blocks is now functional (and properly 
tested). 
 - Also the fast path even become a bit faster since we now break out of
the for loop as soon as we see a properly erased block (instead of briefly
touching all sectors).
 - The ERASE_THRESHOLD aka the number of bitflips in erased regions we 
tolerate is no longer set to ecc_strength but to gf_len/2.
 - Several cosmetic changes.

Main credit to the above goes to Huang Shijie, thanks a lot !

Further comments/feedback welcome, but at this point I don't see any other
open points.

E.


Elie De Brauwer (1):
  mtd: gpmi: Deal with bitflips in erased regions regions

 drivers/mtd/nand/gpmi-nand/bch-regs.h  |    2 ++
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   16 ++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   44 +++++++++++++++++++++++++++++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    1 +
 4 files changed, 60 insertions(+), 3 deletions(-)

-- 
1.7.10.4
