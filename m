Received: from mail-db3on0088.outbound.protection.outlook.com ([157.55.234.88]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGYow-00084y-Bt
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 21:39:27 +0000
From: Han Xu <han.xu@nxp.com>
To: <han.xu@nxp.com>, <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <robh+dt@kernel.org>,
 <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/6] support gpmi on i.MX6UL/7D and HW bitflip on i.MX6QP/7D
Date: Fri, 24 Jun 2016 16:40:05 -0500
Message-ID: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add support for gpmi nand on i.MX6UL and i.MX7D, document the related
properties in DT and add the HW bitflip detection and correction for
i.MX6QP and i.MX7D.

v1 ---> v2:
fix several indent and open parenthesis issues
drop off the void cast
rebase to latest code and adopt to SW bitflip code
split bitflip and i.MX6QP code

v2 ---> v3:
calculate erased chunks and fix bitflip after loop
add more details for i.MX7 clock name
fix the patch name for documentation

Han Xu (6):
  mtd: nand: gpmi: add GPMI NAND support for i.MX7D
  Documentation: dt: mtd: gpmi: document the clocks and clock-names in
    DT property
  mtd: nand: gpmi: add GPMI NAND support for i.MX6QP
  mtd: nand: gpmi: correct bitflip for erased NAND page
  mtd: nand: gpmi: support NAND on i.MX6UL
  Documentation: dt: mtd: gpmi: document the new supported chip in DT

 .../devicetree/bindings/mtd/gpmi-nand.txt          | 12 ++-
 drivers/mtd/nand/gpmi-nand/bch-regs.h              | 24 ++++--
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              | 15 +++-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 85 +++++++++++++++++++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             | 15 +++-
 5 files changed, 127 insertions(+), 24 deletions(-)

-- 
1.9.1
