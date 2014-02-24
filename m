Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WI3xi-0004h4-8F
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 22:25:22 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 0/2] Add NAND ECC devicetree binding
Date: Mon, 24 Feb 2014 19:24:47 -0300
Message-Id: <1393280689-24267-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Grant Likely <grant.likely@secretlab.ca>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Third round, fixing a stupid semi-colon miss.

NAND controllers have special ECC modes, raising per-driver ECC mode devicetree
binding. See for instance the binding for OMAP:

 - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
	"sw"		<deprecated> use "ham1" instead
	"hw"		<deprecated> use "ham1" instead
	"hw-romcode"	<deprecated> use "ham1" instead
	"ham1"		1-bit Hamming ecc code
	"bch4"		4-bit BCH ecc code
	"bch8"		8-bit BCH ecc code

Other drivers (such as pxa3xx-nand) have similar requirements, with special
(controller-specific) ECC modes. Instead of adding a possibly different
binding per compatible-string, let's add generic ECC strength and ECC step size.

This properties aim at providing a complete description of the required ECC
correction to let drivers choose the appropriate ECC mode.

Changes from v2:

  * Added a missing semi-colon.

Changes from v1:

  * Improve the binding documentation, as per Brian Norris' suggestions.

  * Added the helper functions.

Ezequiel Garcia (2):
  of_mtd: Add helpers to get ECC strength and ECC step size
  mtd: nand: Add a devicetree binding for ECC strength and ECC step size

 Documentation/devicetree/bindings/mtd/nand.txt | 14 +++++++++++
 drivers/of/of_mtd.c                            | 34 ++++++++++++++++++++++++++
 include/linux/of_mtd.h                         | 12 +++++++++
 3 files changed, 60 insertions(+)

-- 
1.8.1.5
