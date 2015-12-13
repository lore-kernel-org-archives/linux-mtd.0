Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FLg-0003z8-J4
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:42:39 +0000
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
From: Simon Arlott <simon@fire.lp0.eu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH linux-next v4 00/11] mtd: bcm63xxpart: Add NAND partitioning
 support
Message-ID: <566DF43B.5010400@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:42:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The BCM963xx NAND flash boards have a different handling of the
partition layout from the NOR flash boards. For NAND there are offsets
for the partitions in nvram. Both types of boards use the same CFE
bootloader, nvram format and image tag in their rootfs partitions.

This patch series:
1-4:  Creates separate header files for bcm963xx_nvram and bcm_tag structures
5:    Updates the bcm_tag field image_sequence
6:    Removes the dependency on mach-bcm63xx from the bcm63xxpart parser
7:    Removes unused mach-bcm63xx nvram function
8-10: Cleanup and move NOR flash layout to a separate function
11:   Add NAND flash layout support

Patches 1-2 tested on BCM63XX with a BCM963168 (NAND) board.
Patches 3-11 compile tested on BCM63XX.
Patches 6-11 tested on BMIPS with a BCM963168 (NAND) board.
---
v4: Move struct bcm_tag to include/linux/.

    Modify bcm63xx parser to read nvram from NOR flash and handle the
    NAND flash layout in the same parser.

v3: Fix includes/type names, add comments explaining the nvram struct.

    Use COMPILE_TEST.

    Ensure that strings read from flash are null terminated and validate
    bcm_tag integer values (this also moves reporting of rootfs sequence
    numbers to later on).

v2: Use external struct bcm963xx_nvram definition for bcm963268part.

    Removed support for the nand partition number field, it's not a
    standard Broadcom field (was added by MitraStar Technology Corp.).

-- 
Simon Arlott
