Message-ID: <1355944994.18919.89.camel@shinybook.infradead.org>
Subject: [GIT *] MTD pull for 3.8
From: David Woodhouse <dwmw2@infradead.org>
To: torvalds@linux-foundation.org
Date: Wed, 19 Dec 2012 19:23:14 +0000
Content-Type: multipart/signed; micalg="sha1";
 protocol="application/x-pkcs7-signature";
 boundary="=-VL60HkL++nQvxB+aIC63"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-VL60HkL++nQvxB+aIC63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus, please pull from
	git://git.infradead.org/linux-mtd.git for-linus-20121219

 - Various cleanups especially in NAND tests
 - Add support for NAND flash on BCMA bus
 - DT support for sh_flctl and denali NAND drivers
 - Kill obsolete/superceded drivers (fortunet, nomadik_nand)
 - Fix JFFS2 locking bug in ENOMEM failure path
 - New SPI flash chips, as usual
 - Support writing in 'reliable mode' for DiskOnChip G4
 - Debugfs support in nandsim

There are merge conflicts in four files which are fairly simple to
resolve, so I've left it for you to merge.

Alexander Shiyan (2):
      mtd: gpio-nand: Ability to use driver for configurations without RDY-=
pin
      mtd: Drop FORTUNET support

Alexey Khoroshilov (1):
      jffs2: hold erase_completion_lock on exit

Anton Prins (1):
      mtd: physmap_of: error checking to prevent a NULL pointer dereference

Arnd Bergmann (3):
      mtd: diskonchip: don't warn about ARM architecture
      mtd: diskonchip: use inline functions for DocRead/DocWrite
      mtd: uninitialized variable warning in map.h

Artem Bityutskiy (1):
      mtd: fix a number of checkpatch complaints

Bastian Hecht (3):
      mtd: sh_flctl: Minor cleanups
      mtd: sh_flctl: Add DMA capabilty
      mtd: sh_flctl: Add device tree support

Bill Pemberton (5):
      mtd: remove use of __devexit_p
      mtd: remove use of __devinit
      mtd: remove use of __devinitdata
      mtd: remove use of __devinitconst
      mtd: remove use of __devexit

Brian Norris (2):
      mtd: fsl_elbc_nand: remove unnecessary badblock_pattern
      mtd: nand: typo in nand_id_has_period() comments

Christian Herzig (1):
      mtd: tests/read: initialize buffer for whole next page

Dan Carpenter (1):
      mtg: docg3: potential divide by zero in doc_write_oob()

Dinh Nguyen (2):
      mtd: denali: split the generic driver and PCI layer
      mtd: denali: add a DT driver

Ezequiel Garcia (3):
      mtd: mtd_blkdev: Use a different name for block_device_operations var=
iable
      mtd: mtd_blkdevs: Replace request handler kthread with a workqueue
      mtd: nandsim: Introduce debugfs infrastructure

Harald Nordgard-Hansen (1):
      mtd: fix recovery after failed write-buffer operation in cfi_cmdset_0=
002.c

Huang Shijie (6):
      mtd: use the NAND_STATUS_FAIL to replace the hardcode
      mtd: gpmi: remove unneccessary header
      mtd: cmdlinepart: fix the overflow of big mtd partitions
      mtd: de-select the chip when it is not used
      mtd: remove the de-select chip code in nand_release_device()
      mtd: remove the "chip" parameter in nand_get_device()

Jean-Christophe PLAGNIOL-VILLARD (2):
      mtd: fsmc_nand: pass the ale and cmd resource via resource
      mtd: physmap_of: allow to specify the mtd name for retro compatiblity

Jonas Gorski (5):
      mtd: bcm63xxpart: remove unused variable
      mtd: bcm63xxpart: merge sparelen calculation
      mtd: bcm63xxpart: make fixed part length calculation more generic
      mtd: bcm63xxpart: move the last curpart++ to its correct place
      mtd: bcm63xxpart: use correct printk format for partitions

Josh Radel (1):
      mtd: ofpart: Replicate mtd cmdline "lk" option with device tree "lock=
" property

Josh Wu (1):
      mtd: at91: atmel_nand: return bit flips for the PMECC read_page()

Liming Wang (1):
      mtd: m25p80: modify info for Micron N25Q128

Linus Walleij (3):
      ARM: nomadik: switch over to using the FSMC driver
      mtd: delete nomadik_nand driver
      ARM: nomadik: fixup some FSMC merge problems

Lothar Wa=C3=9Fmann (2):
      mtd: mxc_nand: fix unbalanced clk_disable() in error path
      mtd: mxc_nand: reorder part_probes to let cmdline override other sour=
ces

Luka Perkov (1):
      mtd: use SQUASHFS_MAGIC from uapi/linux/magic.h

Marek Vasut (1):
      mtd: m25p80: Make fast read configurable via DT

Masanari Iida (1):
      mtd: Fix typo mtd/tests

Matthew Leach (1):
      mtd: nand/gpio: use io{read,write}*_rep accessors

Matthieu CASTET (7):
      mtd: m25p80: add support for the windbond w25q256 chip
      mtdoops: don't erase flash at each boot
      mtd: nand_wait: warn if the nand is busy on exit
      mted: nand_wait_ready timeout fix
      mtd: nand: print flash size during detection
      mtd: nand: add NAND_BUSWIDTH_AUTO to autodetect bus width
      mtd: nand: onfi need to be probed in 8 bits mode

Mike Dunn (3):
      mtd: nand/docg4: add support for writing in reliable mode
      mtd: nand/docg4: reserve bb marker area in ecclayout
      mtd: nand/docg4: fix and improve read of factory bbt

Murali Karicheri (1):
      mtd: davinci: add support for parition binding nodes

Nathan Williams (1):
      mtd cs553x_nand: Initialise ecc.strength before nand_scan()

NeilBrown (1):
      mtd: block2mtd: throttle writes by calling balance_dirty_pages_rateli=
mited.

Prabhakar Kushwaha (1):
      mtd: fsl_ifc_nand: wait tWB time, poll R/B before command execution

Rafa=C5=82 Mi=C5=82ecki (9):
      bcma: export PLL reading function
      mtd: prepare place for BCMA NAND flash driver(s)
      mtd: bcm47xxnflash: init NAND on BCM4706
      mtd: bcm47xxnflash: support for NAND_CMD_READID command
      mtd: bcm47xxnflash: implement reading
      mtd: bcm47xxnflash: enable BCM4706 driver
      mtd: bcm47xxnflash: define some magic numbers
      mtd: bcm47xxnflash: support NAND_CMD_STATUS
      mtd: bcm47xxnflash: writing support

Robert P. J. Day (1):
      mtd: Fix kernel-doc content to avoid warning.

Sachin Kamat (2):
      mtd: ofpart: Fix incorrect NULL check in parse_ofoldpart_partitions()
      mtd: s3c2410: Fix potential NULL pointer dereference error

Shmulik Ladkani (1):
      mtd: cmdlinepart: Simplify parse_cmdline_partitions

Srinivas Kandagatla (1):
      mtd: spear_smi: use module_platform_driver macro

Stephen Warren (1):
      mtd: m25p80: add support for the Winbond w25q80bl chip

Vikram Narayanan (10):
      mtd: gpmi-nand: make debug prints more clear
      mtd: tests: mtd_nandbiterrs: replace msg macro with pr_{info,err}
      mtd: tests: mtd_nandecctest: Use pr_fmt macro
      mtd: tests: mtd_pagetest: Replace printk with pr_{info,crit,err}
      mtd: tests: mtd_readtest: Replace printk with pr_{info,err}
      mtd: tests: mtd_stresstest: Replace printk with pr_{info,crit,err}
      mtd: tests: mtd_speedtest: Replace printk with pr_{info,crit,err}
      mtd: tests: mtd_subpagetest: replace printk with pr_{info,crit,err}
      mtd: tests: mtd_torturetest: Replace printk with pr_{info,crit}
      mtd: mtd_oobtest: printk -> pr_{info,err,crit}

Vipin Kumar (4):
      mtd: fsmc_nand: change the type for regs to void __iomem *
      mtd: fsmc_nand: modify the wait to uninterruptible
      mtd: fsmc_nand: use relaxed variants of io accessors
      mtd: nand: Increase the ecc placement locations to 640

Viresh Kumar (1):
      mtd: map: Fix compilation warning

Wolfram Sang (1):
      mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND startup proble=
ms

 .../devicetree/bindings/arm/davinci/nand.txt       |   8 +
 .../devicetree/bindings/mtd/denali-nand.txt        |  23 ++
 .../devicetree/bindings/mtd/flctl-nand.txt         |  49 +++
 .../devicetree/bindings/mtd/fsmc-nand.txt          |  12 +-
 Documentation/devicetree/bindings/mtd/m25p80.txt   |  29 ++
 .../devicetree/bindings/mtd/mtd-physmap.txt        |   3 +
 arch/arm/boot/dts/spear13xx.dtsi                   |  10 +-
 arch/arm/boot/dts/spear300.dtsi                    |   8 +-
 arch/arm/boot/dts/spear310.dtsi                    |   8 +-
 arch/arm/boot/dts/spear320.dtsi                    |   8 +-
 arch/arm/boot/dts/spear600.dtsi                    |   8 +-
 arch/arm/configs/nhk8815_defconfig                 |   2 +-
 arch/arm/mach-nomadik/board-nhk8815.c              |  73 ++--
 arch/arm/mach-nomadik/include/mach/fsmc.h          |  29 --
 arch/arm/mach-u300/core.c                          |  14 +-
 drivers/bcma/driver_chipcommon_pmu.c               |   3 +-
 drivers/clk/clk-nomadik.c                          |   1 +
 drivers/mtd/ar7part.c                              |   7 +-
 drivers/mtd/bcm63xxpart.c                          |  32 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                |  16 +-
 drivers/mtd/cmdlinepart.c                          |  91 ++---
 drivers/mtd/devices/bcm47xxsflash.c                |   4 +-
 drivers/mtd/devices/block2mtd.c                    |   4 +-
 drivers/mtd/devices/docg3.c                        |   2 +-
 drivers/mtd/devices/docprobe.c                     |   2 -
 drivers/mtd/devices/m25p80.c                       |  48 ++-
 drivers/mtd/devices/mtd_dataflash.c                |  14 +-
 drivers/mtd/devices/spear_smi.c                    |  23 +-
 drivers/mtd/devices/sst25l.c                       |  10 +-
 drivers/mtd/maps/Kconfig                           |   7 -
 drivers/mtd/maps/Makefile                          |   1 -
 drivers/mtd/maps/amd76xrom.c                       |   7 +-
 drivers/mtd/maps/autcpu12-nvram.c                  |   6 +-
 drivers/mtd/maps/bfin-async-flash.c                |   9 +-
 drivers/mtd/maps/ck804xrom.c                       |   6 +-
 drivers/mtd/maps/esb2rom.c                         |   6 +-
 drivers/mtd/maps/fortunet.c                        | 277 --------------
 drivers/mtd/maps/gpio-addr-flash.c                 |  12 +-
 drivers/mtd/maps/ichxrom.c                         |   8 +-
 drivers/mtd/maps/intel_vr_nor.c                    |  18 +-
 drivers/mtd/maps/lantiq-flash.c                    |   8 +-
 drivers/mtd/maps/latch-addr-flash.c                |   4 +-
 drivers/mtd/maps/pci.c                             |   6 +-
 drivers/mtd/maps/physmap_of.c                      |  19 +-
 drivers/mtd/maps/pismo.c                           |  18 +-
 drivers/mtd/maps/pxa2xx-flash.c                    |   6 +-
 drivers/mtd/maps/sa1100-flash.c                    |   6 +-
 drivers/mtd/maps/scb2_flash.c                      |   8 +-
 drivers/mtd/maps/sun_uflash.c                      |   6 +-
 drivers/mtd/maps/vmu-flash.c                       |  10 +-
 drivers/mtd/mtd_blkdevs.c                          |  51 +--
 drivers/mtd/mtdoops.c                              |  15 +-
 drivers/mtd/nand/Kconfig                           |  34 +-
 drivers/mtd/nand/Makefile                          |   4 +-
 drivers/mtd/nand/ams-delta.c                       |   6 +-
 drivers/mtd/nand/atmel_nand.c                      |  28 +-
 drivers/mtd/nand/au1550nd.c                        |   8 +-
 drivers/mtd/nand/bcm47xxnflash/Makefile            |   4 +
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h     |  22 ++
 drivers/mtd/nand/bcm47xxnflash/main.c              | 108 ++++++
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c       | 413 +++++++++++++++++=
++++
 drivers/mtd/nand/bf5xx_nand.c                      |   8 +-
 drivers/mtd/nand/cafe_nand.c                       |  12 +-
 drivers/mtd/nand/cs553x_nand.c                     |   3 +-
 drivers/mtd/nand/davinci_nand.c                    |  13 +-
 drivers/mtd/nand/denali.c                          | 162 ++------
 drivers/mtd/nand/denali.h                          |   5 +
 drivers/mtd/nand/denali_dt.c                       | 167 +++++++++
 drivers/mtd/nand/denali_pci.c                      | 144 +++++++
 drivers/mtd/nand/diskonchip.c                      |   2 -
 drivers/mtd/nand/docg4.c                           |  73 +++-
 drivers/mtd/nand/fsl_elbc_nand.c                   |  17 +-
 drivers/mtd/nand/fsl_ifc_nand.c                    |   6 +-
 drivers/mtd/nand/fsl_upm.c                         |   8 +-
 drivers/mtd/nand/fsmc_nand.c                       | 106 +++---
 drivers/mtd/nand/gpio.c                            |  34 +-
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              |  10 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |  41 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |   1 -
 drivers/mtd/nand/jz4740_nand.c                     |  14 +-
 drivers/mtd/nand/lpc32xx_mlc.c                     |   6 +-
 drivers/mtd/nand/lpc32xx_slc.c                     |   6 +-
 drivers/mtd/nand/mpc5121_nfc.c                     |   8 +-
 drivers/mtd/nand/mxc_nand.c                        |  12 +-
 drivers/mtd/nand/nand_base.c                       | 114 +++---
 drivers/mtd/nand/nandsim.c                         | 186 +++++++---
 drivers/mtd/nand/ndfc.c                            |   6 +-
 drivers/mtd/nand/nomadik_nand.c                    | 235 ------------
 drivers/mtd/nand/nuc900_nand.c                     |   6 +-
 drivers/mtd/nand/omap2.c                           |   2 +-
 drivers/mtd/nand/orion_nand.c                      |   4 +-
 drivers/mtd/nand/pasemi_nand.c                     |   4 +-
 drivers/mtd/nand/plat_nand.c                       |   6 +-
 drivers/mtd/nand/s3c2410.c                         |   7 +-
 drivers/mtd/nand/sh_flctl.c                        | 306 +++++++++++++--
 drivers/mtd/nand/sharpsl.c                         |   6 +-
 drivers/mtd/nand/socrates_nand.c                   |   6 +-
 drivers/mtd/ofpart.c                               |   7 +-
 drivers/mtd/onenand/generic.c                      |   6 +-
 drivers/mtd/onenand/omap2.c                        |   6 +-
 drivers/mtd/onenand/samsung.c                      |   4 +-
 drivers/mtd/tests/mtd_nandbiterrs.c                |  73 ++--
 drivers/mtd/tests/mtd_nandecctest.c                |   6 +-
 drivers/mtd/tests/mtd_oobtest.c                    | 171 +++++----
 drivers/mtd/tests/mtd_pagetest.c                   | 152 ++++----
 drivers/mtd/tests/mtd_readtest.c                   |  44 +--
 drivers/mtd/tests/mtd_speedtest.c                  |  88 ++---
 drivers/mtd/tests/mtd_stresstest.c                 |  44 +--
 drivers/mtd/tests/mtd_subpagetest.c                | 124 +++----
 drivers/mtd/tests/mtd_torturetest.c                |  73 ++--
 fs/jffs2/nodemgmt.c                                |   6 +-
 include/linux/bcma/bcma.h                          |   1 +
 include/linux/mtd/blktrans.h                       |   4 +-
 include/linux/mtd/doc2000.h                        |  22 +-
 include/linux/mtd/fsmc.h                           |   3 -
 include/linux/mtd/gpmi-nand.h                      |  68 ----
 include/linux/mtd/map.h                            |   4 +-
 include/linux/mtd/mtd.h                            |   2 +-
 include/linux/mtd/nand.h                           |  11 +-
 include/linux/mtd/sh_flctl.h                       |  14 +-
 include/linux/platform_data/mtd-nomadik-nand.h     |  16 -
 121 files changed, 2543 insertions(+), 1834 deletions(-)

--=20
dwmw2


--=-VL60HkL++nQvxB+aIC63
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIUbjCCBjQw
ggQcoAMCAQICAR4wDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDE1NVoX
DTE3MTAyNDIxMDE1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMcJg8zOLdgasSmkLhOrlr6KMoOMpohBllVHrdRvEg/q6r8jR+EK
75xCGhR8ToREoqe7zM9/UnC6TS2y9UKTpT1v7RSMzR0t6ndl0TWBuUr/UXBhPk+Kmy7bI4yW4urC
+y7P3/1/X7U8ocb8VpH/Clt+4iq7nirMcNh6qJR+xjOhV+VHzQMALuGYn5KZmc1NbJQYclsGkDxD
z2UbFqE2+6vIZoL+jb9x4Pa5gNf1TwSDkOkikZB1xtB4ZqtXThaABSONdfmv/Z1pua3FYxnCFmdr
/+N2JLKutIxMYqQOJebr/f/h5t95m4JgrM3Y/w7YX9d7YAL9jvN4SydHsU6n65cCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBRTcu2SnODaywFc
fH6WNU7y1LhRgjAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBAAqDCH14qywG
XLhjjF6uHLkjd02hcdh9hrw+VUsv+q1eeQWB21jWj3kJ96AUlPCoEGZ/ynJNScWy6QMVQjbbMXlt
UfO4n4bGGdKo3awPWp61tjAFgraLJgDk+DsSvUD6EowjMTNx25GQgyYJ5RPIzKKR9tQW8gGK+2+R
HxkUCTbYFnL6kl8Ch507rUdPPipJ9CgJFws3kDS3gOS5WFMxcjO5DwKfKSETEPrHh7p5shuuNktv
sv6hxHTLhiMKX893gxdT3XLS9OKmCv87vkINQcNEcIIoFWbP9HORz9v3vQwR4e3ksLc2JZOAFK+s
sS5XMEoznzpihEP0PLc4dCBYjbvSD7kxgDwZ+Aj8Q9PkbvE9sIPP7ON0fz095HdThKjiVJe6vofq
+n6b1NBc8XdrQvBmunwxD5nvtTW4vtN6VY7mUCmxsCieuoBJ9OlqmsVWQvifIYf40dJPZkk9YgGT
zWLpXDSfLSplbY2LL9C9U0ptvjcDjefLTvqSFc7tw1sEhF0n/qpA2r0GpvkLRDmcSwVyPvmjFBGq
Up/pNy8ZuPGQmHwFi2/14+xeSUDG2bwnsYJQG2EdJCB6luQ57GEnTA/yKZSTKI8dDQa8Sd3zfXb1
9mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIHFzCCBf+g
AwIBAgIDBCZ6MA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYG
A1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcN
MTIwNTAxMTI1ODI3WhcNMTMwNTAzMTEzNzIwWjBdMRkwFwYDVQQNExA4Y1VOSzUzMTc0ODRYRjk3
MRwwGgYDVQQDDBNkd213MkBpbmZyYWRlYWQub3JnMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZy
YWRlYWQub3JnMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyYe7wo6MrtrB4uIGGbrY
4IifY/Xsq22pSv605yganL0+uyUdd8rCjrYlH6Q/ra5TVJCQFTgzaepkuqPQc79DC/Cxmzm6Qo+s
wLZy868oFsccsVokL2bPAWIPaRXfNPJKkYR1FTWQfZpWJVQmT+sPf1XFUullVBAK+d9RztopyacI
xWoZ/W/Cmv7mseQbttYTtGKJa0btX73nsQRWl6SgErWXo59zg9friCLTy1GXMXJYB8H+PtnuwX0w
MrAvWDdX1ABgIlA17W3FraCn0eW15ZM46eyu0/amGzJZNtemCWF73P7BAijzeV1jNmiJFXdZ0DT0
w+hmtMO9PxdDUyt78QIDAQABo4IDrjCCA6owCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBTkfe5UOr3PcirsjApibyyUEfsyRzAf
BgNVHSMEGDAWgBRTcu2SnODaywFcfH6WNU7y1LhRgjAeBgNVHREEFzAVgRNkd213MkBpbmZyYWRl
YWQub3JnMIICIQYDVR0gBIICGDCCAhQwggIQBgsrBgEEAYG1NwECAjCCAf8wLgYIKwYBBQUHAgEW
Imh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93
d3cuc3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwgfcGCCsGAQUFBwICMIHqMCcWIFN0YXJ0
Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmljYXRlIHdhcyBp
c3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAxIFZhbGlkYXRpb24gcmVxdWlyZW1lbnRzIG9m
IHRoZSBTdGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRlZCBw
dXJwb3NlIGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMuMIGc
BggrBgEFBQcCAjCBjzAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgECGmRM
aWFiaWxpdHkgYW5kIHdhcnJhbnRpZXMgYXJlIGxpbWl0ZWQhIFNlZSBzZWN0aW9uICJMZWdhbCBh
bmQgTGltaXRhdGlvbnMiIG9mIHRoZSBTdGFydENvbSBDQSBwb2xpY3kuMDYGA1UdHwQvMC0wK6Ap
oCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUxLWNybC5jcmwwgY4GCCsGAQUFBwEBBIGB
MH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9zdWIvY2xhc3MxL2NsaWVu
dC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNzbC5jb20vY2VydHMvc3ViLmNsYXNz
MS5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93d3cuc3RhcnRzc2wuY29tLzANBgkq
hkiG9w0BAQUFAAOCAQEAqDU1FKifNtCFJbLnvOi1BLRfk7mut55PMtPSZLJ4/AnG7AjmJnbBI4U5
DELwvVq3mIpwUpGqZUkqkZMEfBPIbfq517UZB3h4iANtqif+ULfTLhg5XgcK5eF8/T6EtX2c3epq
ylARdleCbj/0FwiUDvPlTsA6PIN4SCekjRLgjKERrL3heFz+Hteq1rtMAvMkNuyL0/0ijyyg2y45
NASAl2Afl9SLes/fnoh9nBwzfNQfb6qDYUFpnglfpGrq/0b1NtaOUb2z1SR+H1tKlb8bVJJIdvpu
mEi27kSRIhzk3h30uTfKkKetgy++ouyldxZ7KZ0PuoLQrBy465EoQLosETCCBxcwggX/oAMCAQIC
AwQmejANBgkqhkiG9w0BAQUFADCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0
ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMT
L1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBMB4XDTEyMDUw
MTEyNTgyN1oXDTEzMDUwMzExMzcyMFowXTEZMBcGA1UEDRMQOGNVTks1MzE3NDg0WEY5NzEcMBoG
A1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFk
Lm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMmHu8KOjK7aweLiBhm62OCIn2P1
7KttqUr+tOcoGpy9PrslHXfKwo62JR+kP62uU1SQkBU4M2nqZLqj0HO/QwvwsZs5ukKPrMC2cvOv
KBbHHLFaJC9mzwFiD2kV3zTySpGEdRU1kH2aViVUJk/rD39VxVLpZVQQCvnfUc7aKcmnCMVqGf1v
wpr+5rHkG7bWE7RiiWtG7V+957EEVpekoBK1l6Ofc4PX64gi08tRlzFyWAfB/j7Z7sF9MDKwL1g3
V9QAYCJQNe1txa2gp9HlteWTOOnsrtP2phsyWTbXpglhe9z+wQIo83ldYzZoiRV3WdA09MPoZrTD
vT8XQ1Mre/ECAwEAAaOCA64wggOqMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdJQQWMBQG
CCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQU5H3uVDq9z3Iq7IwKYm8slBH7MkcwHwYDVR0j
BBgwFoAUU3Ltkpzg2ssBXHx+ljVO8tS4UYIwHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiEGA1UdIASCAhgwggIUMIICEAYLKwYBBAGBtTcBAgIwggH/MC4GCCsGAQUFBwIBFiJodHRw
Oi8vd3d3LnN0YXJ0c3NsLmNvbS9wb2xpY3kucGRmMDQGCCsGAQUFBwIBFihodHRwOi8vd3d3LnN0
YXJ0c3NsLmNvbS9pbnRlcm1lZGlhdGUucGRmMIH3BggrBgEFBQcCAjCB6jAnFiBTdGFydENvbSBD
ZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgEBGoG+VGhpcyBjZXJ0aWZpY2F0ZSB3YXMgaXNzdWVk
IGFjY29yZGluZyB0byB0aGUgQ2xhc3MgMSBWYWxpZGF0aW9uIHJlcXVpcmVtZW50cyBvZiB0aGUg
U3RhcnRDb20gQ0EgcG9saWN5LCByZWxpYW5jZSBvbmx5IGZvciB0aGUgaW50ZW5kZWQgcHVycG9z
ZSBpbiBjb21wbGlhbmNlIG9mIHRoZSByZWx5aW5nIHBhcnR5IG9ibGlnYXRpb25zLjCBnAYIKwYB
BQUHAgIwgY8wJxYgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwAwIBAhpkTGlhYmls
aXR5IGFuZCB3YXJyYW50aWVzIGFyZSBsaW1pdGVkISBTZWUgc2VjdGlvbiAiTGVnYWwgYW5kIExp
bWl0YXRpb25zIiBvZiB0aGUgU3RhcnRDb20gQ0EgcG9saWN5LjA2BgNVHR8ELzAtMCugKaAnhiVo
dHRwOi8vY3JsLnN0YXJ0c3NsLmNvbS9jcnR1MS1jcmwuY3JsMIGOBggrBgEFBQcBAQSBgTB/MDkG
CCsGAQUFBzABhi1odHRwOi8vb2NzcC5zdGFydHNzbC5jb20vc3ViL2NsYXNzMS9jbGllbnQvY2Ew
QgYIKwYBBQUHMAKGNmh0dHA6Ly9haWEuc3RhcnRzc2wuY29tL2NlcnRzL3N1Yi5jbGFzczEuY2xp
ZW50LmNhLmNydDAjBgNVHRIEHDAahhhodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS8wDQYJKoZIhvcN
AQEFBQADggEBAKg1NRSonzbQhSWy57zotQS0X5O5rreeTzLT0mSyePwJxuwI5iZ2wSOFOQxC8L1a
t5iKcFKRqmVJKpGTBHwTyG36ude1GQd4eIgDbaon/lC30y4YOV4HCuXhfP0+hLV9nN3qaspQEXZX
gm4/9BcIlA7z5U7AOjyDeEgnpI0S4IyhEay94Xhc/h7Xqta7TALzJDbsi9P9Io8soNsuOTQEgJdg
H5fUi3rP356IfZwcM3zUH2+qg2FBaZ4JX6Rq6v9G9TbWjlG9s9Ukfh9bSpW/G1SSSHb6bphItu5E
kSIc5N4d9Lk3ypCnrYMvvqLspXcWeymdD7qC0KwcuOuRKEC6LBExggNvMIIDawIBATCBlDCBjDEL
MAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdp
dGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFy
eSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMEJnowCQYFKw4DAhoFAKCCAa8wGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTIxMjE5MTkyMzE1WjAjBgkqhkiG9w0BCQQx
FgQU+Z1xMfWNd7DBDmIOQl3qoo9QPK0wgaUGCSsGAQQBgjcQBDGBlzCBlDCBjDELMAkGA1UEBhMC
SUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRp
ZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1l
ZGlhdGUgQ2xpZW50IENBAgMEJnowgacGCyqGSIb3DQEJEAILMYGXoIGUMIGMMQswCQYDVQQGEwJJ
TDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlm
aWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVk
aWF0ZSBDbGllbnQgQ0ECAwQmejANBgkqhkiG9w0BAQEFAASCAQBe4N/1A0kNFd7jemLTuIapyctS
Gh5zsPv3IVzMQ/d8EUP1KFYMxqFQnRQDrxhkZTvAsHp50KKNjWE6jvhdPoNDru4awIdUbbe4gKhd
2q2tnZsB3GHhBmOvYcMJ+iCxA4x4zyqW7r5vPfD5aIFUbape2XQA4P3Xvk3A3O+ItAUbwo0uMuWY
P66EeHA9pZJGthu8x+HF4MLxIQY/vbCUc5in1U0FmlMMQQHDK+6yE3jIQS6BGLzfzNxK9EX5Pz93
1bwTPD/QN1aB86rXKbrSm0xTtCDHGfb8D1GY/1MsTy5sio1rYkMt/T2VpNmJtZgzbyddGdHRzjAr
D97iEMi4Cj7DAAAAAAAA


--=-VL60HkL++nQvxB+aIC63--
