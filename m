Received: from mtxmxout1.matrox.com ([138.11.2.91])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TRptx-0003zp-K2
 for linux-mtd@lists.infradead.org; Fri, 26 Oct 2012 19:49:07 +0000
Date: Fri, 26 Oct 2012 15:34:10 -0400
From: Christopher Harvey <charvey@matrox.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH v2] 16 bit NAND fix, request for testers
Message-ID: <20121026193410.GA21474@harvey-pc.matrox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

just a small patch to access GPMC NAND registers with 16 bits when the
NAND is in 16 bit mode. I tested this on a 2.6.37 kernel, and noticed
it was still unpatched in the latest kernel. I don't have the hardware
setup or defconfigs to test this patch out, and even if I did I don't
have the logic analyzer setup to completely reproduce it on other
hardware with the latest kernel. It would be nice to get a tested-by
on this patch.

(CC'd mtd list this time)

Thanks.


Christopher Harvey (1):
  mtd: omap: nand: Remove 0xFF's that prefixed 16bit NAND commands

 drivers/mtd/nand/omap2.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

-- 
1.7.8.6
