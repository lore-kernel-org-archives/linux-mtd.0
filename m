Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W48J2-0006pV-Jj
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 12:13:49 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <devicetree@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Date: Fri, 17 Jan 2014 09:13:39 -0300
Message-Id: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is our first proposal to address the need for a suitable ECC
devicetree binding.

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
(controller-specific) ECC modes. Instead of adding a possibly different binding
per compatible-string, let's add generic ECC strength and ECC step size.

This properties should describe completely the ECC mode and let drivers choose
the appropriate ECC mode.

Ezequiel Garcia (1):
  mtd: nand: Add a devicetree binding for ECC strength and ECC step size

 Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.8.1.5
