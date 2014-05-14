Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkdSQ-0007PP-OR
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 17:59:11 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 0/4] pxa3xx-nand: Allow to specify an ECC scheme through DT
Date: Wed, 14 May 2014 14:58:05 -0300
Message-Id: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Simon Guinot <simon.guinot@sequanux.org>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>
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

Addressing Brian's feedback [1], this v3 series improves the ECC strength check,
and moves it to NAND core's code. If the configured ECC strength is weaker
than the minimum strength required by the datasheet, a noisy warning is shown.
This is done in the first patch.

The second patch is a minor cleanup of the pxa_ecc_init().

The third patch makes use of the ECC strength and ECC step size parameters.
To ensure full backward compatibility, the patch *tries* to use DT-specified
ECC parameters, falling back to using the datasheet-specified settings if the
former are missing.

Finally, the last patch updates the documentation binding, with the supported
ECC parameters. We claim to support the following ECC schemes:
 * strength = 1, size = 512 (Hamming strength)
 * strength = 4, size = 512 (BCH-4 strength)
 * strength = 8, size = 512 (BCH-8 strength)

It must be noted that this ECC engine actually provides a stronger
correction capability, which are at least as strong as the above:
 * strength = 1, size = 512 (Hamming strength)
 * strength = 16, size = 2048
 * strength = 16, size = 1024

I've chosen to describe the supported schemes in terms of 512B steps because
it's results in less intrusive changes. Moreover, taking the step size to be
512B seems to be a widespread convention.

[1] http://permalink.gmane.org/gmane.linux.drivers.devicetree/73823

Changes from v2:
  * Improved ECC strength check and moved it to nand_base.c common code,
    and drop the now unneeded normalization.

  * Define the ecc_strength and ecc_step_size as signed integers, as noted
    by Brian Norris.

Changes from v1:
  * Fixed typo in ECC strength normalization calculus.

Ezequiel Garcia (4):
  mtd: nand: Warn the user if the selected ECC strength is too weak
  mtd: nand: pxa3xx: Clean pxa_ecc_init() error handling
  mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding
  mtd: nand: pxa3xx: Add supported ECC strength and step size to the DT
    binding

 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |  8 +++++
 drivers/mtd/nand/nand_base.c                       | 36 ++++++++++++++++++++
 drivers/mtd/nand/pxa3xx_nand.c                     | 38 ++++++++++++++--------
 include/linux/platform_data/mtd-nand-pxa3xx.h      |  3 ++
 4 files changed, 72 insertions(+), 13 deletions(-)

-- 
1.9.1
