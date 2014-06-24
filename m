Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzPmY-0003sd-0d
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 12:25:04 +0000
From: Pekon Gupta <pekon@ti.com>
To: Tony Lindgren <tony@atomide.com>
Subject: [PATCH v1 0/3] ARM: dts: am335x-bone: Beaglebone cape DTS
Date: Tue, 24 Jun 2014 17:54:23 +0530
Message-ID: <1403612666-31197-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Jason Kridner <jkridner@gmail.com>, Robert Nelson <robertcnelson@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series adds DTS for following Beaglebone capes:

Memory Cape: http://beagleboardtoys.info/index.php?title=BeagleBone_Memory_Expansion
NAND Cape:   http://beagleboardtoys.info/index.php?title=BeagleBone_4Gb_16-Bit_NAND_Module
NOR Cape:    http://elinux.org/Beagleboardtoys:BeagleBone_128Mb_16-Bit_NOR_Module
LCD4 Cape:   http://elinux.org/CircuitCo:BeagleBone_LCD4

Based on Tree: git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap omap-for-v3.16/dt-v2

Acceptance of cape DTS in mainline is still under discussion [1], so multiple
'Tested-by' would be helpful.
Note: In order to avoid conflicts with existing DTS, device nodes added in these
patches have status="disabled", and need to be "enabled" via u-boot.
DT nodes can be selectively enabled | disabled via u-boot [2]

Example: Below sequence works for NAND cape patch.
---------------
/* load DTB */
u-boot> tftp 0x81000000 am335x-boneblack.dtb
u-boot> fdt addr 0x81000000
/* disable MMC2 node */
u-boot> fdt list /ocp/mmc@481d8000
u-boot> fdt set  /ocp/mmc@481d8000 status \d\i\s\a\b\l\e\d
u-boot> fdt list /ocp/mmc@481d8000 status
/* enable GPMC node */
u-boot> fdt list /ocp/gpmc
u-boot> fdt set  /ocp/gpmc status \o\k\a\y
u-boot> fdt list /ocp/gpmc status
/* enable ELM node */
u-boot> fdt list /ocp/elm
u-boot> fdt set  /ocp/elm status \o\k\a\y
u-boot> fdt list /ocp/elm status
/* boot uImage */
tftp 0x82000000 uImage
bootm 0x82000000 - 0x81000000

Note: "fdt set" command does not accept string literals
as binding values, it internally converts them to string, so
escape sequenced characters were used here..
"okay" == \o\k\a\y
"disabled" == \d\i\s\a\b\l\e\d"
---------------

[1] http://www.spinics.net/lists/linux-omap/msg108505.html 
[2] http://www.denx.de/wiki/view/DULG/UBootCmdFDT


Pekon Gupta (3):
  ARM: dts: am335x-bone: add support for beaglebone NAND cape
  ARM: dts: am335x-bone: add support for beaglebone NOR cape
  ARM: dts: am335x-bone: add support for beaglebone LCD4 cape

 arch/arm/boot/dts/am335x-bone-display-cape.dts | 104 +++++++++++
 arch/arm/boot/dts/am335x-bone-memory-cape.dts  | 249 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-bone.dts              |   2 +
 arch/arm/boot/dts/am335x-boneblack.dts         |   2 +
 4 files changed, 357 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-bone-display-cape.dts
 create mode 100644 arch/arm/boot/dts/am335x-bone-memory-cape.dts

-- 
1.8.5.1.163.gd7aced9
