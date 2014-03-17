Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPZlk-0006w9-RN
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 15:48:05 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 0/4] pxa3xx-nand: Allow to specify an ECC scheme through DT
Date: Mon, 17 Mar 2014 12:47:03 -0300
Message-Id: <1395071227-31909-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Simon Guinot <sguinot@lacie.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that we have agreed on the ECC devicetree binding, here's a patchset
that makes pxa3xx-nand driver use it.

This work is required on platforms where the flash device reports a required
ECC strength, but that are capable of handling a stronger one. Simon Guinot
reported a situation where the vendor provided a bootloader configured with
a stronger than required ECC scheme. Without this patches, such a situation
would require a hack to make the driver use a specific ECC scheme.

(Simon: it would be great if you can confirm this allows you to remove any hacks).

The first two patches clean the pxa_ecc_init(), preparing for the real
work to be done.

The third patch makes use of the ECC strength and ECC step size parameters.
To ensure full backward compatibility, the patch *tries* to use DT-specified
ECC parameters, falling back to using the ONFI-specified settings if the
former are missing.

Also, we use the ONFI 'datasheet' ECC strength requirement, to ensure the
DT-specified ECC strength is strong enough to meet the requirement.

Finally, the last patch updates the documentation binding, with the supported
ECC parameters.

Tested on Marvell's Armada 370 RD and also Compulab's CM-X300 (PXA3xx SoC),
which is a non-DT platform. Based on today's l2-mtd.git.

Ezequiel Garcia (4):
  mtd: nand: pxa3xx: Normalize ECC strength for ECC scheme selection
  mtd: nand: pxa3xx: Clean pxa_ecc_init() error handling
  mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding
  mtd: nand: pxa3xx: Add supported ECC strength and step size to the DT
    binding

 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |  8 +++
 drivers/mtd/nand/pxa3xx_nand.c                     | 78 +++++++++++++---------
 include/linux/platform_data/mtd-nand-pxa3xx.h      |  3 +
 3 files changed, 59 insertions(+), 30 deletions(-)

-- 
1.9.0
