From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH for v3.15 0/2] ARM: mvebu Specificy ECC scheme for A375/385
 boards
Date: Sat, 24 May 2014 11:17:08 -0300
Message-Id: <1400941030-2123-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Last minute fixes, which help prevent any inconsistencies between the ECC
scheme expected by the bootloader, and the one expected by the kernel.

Until now, the kernel was using the ONFI-provided "datasheet ECC requirement",
and assume the bootloader did the same thing. However, this is not the case
for these boards, where the vendor provided a bootloader with an ECC strength
that's weaker than the required.

After the introduction of the NAND ECC devicetree binding, and its support
in the pxa3xx-nand driver, we can set these values and expect them to work.

I hope it's not too late for v3.15 already.

Ezequiel Garcia (2):
  ARM: dts: Specify the NAND ECC scheme explicitly on Armada 375 DB
    board
  ARM: dts: Specify the NAND ECC scheme explicitly on Armada 385 DB
    board

 arch/arm/boot/dts/armada-375-db.dts | 2 ++
 arch/arm/boot/dts/armada-385-db.dts | 2 ++
 2 files changed, 4 insertions(+)

-- 
1.9.1
