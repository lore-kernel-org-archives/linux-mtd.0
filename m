Message-ID: <1378737717.4210.65.camel@i7.infradead.org>
Subject: [GIT] MTD for 3.12
From: David Woodhouse <dwmw2@infradead.org>
To: torvalds@linux-foundation.org
Date: Mon, 09 Sep 2013 15:41:57 +0100
Content-Type: multipart/signed; micalg="sha-1";
 protocol="application/x-pkcs7-signature";
 boundary="=-R6Z2TyHUVzjYWVrmi/vS"
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


--=-R6Z2TyHUVzjYWVrmi/vS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus, please pull from
	git://git.infradead.org/linux-mtd.git for-linus-20130909

 - factor out common code from MTD tests
 - nand-gpio cleanup and portability to non-ARM
 - m25p80 support for 4-byte addressing chips, other new chips
 - pxa3xx cleanup and support for new platforms
 - remove obsolete alauda, octagon-5066 drivers
 - erase/write support for bcm47xxsflash
 - improve detection of ECC requirements for NAND, controller setup
 - NFC acceleration support for atmel-nand, read/write via SRAM
 - etc.


Akinobu Mita (19):
      mtd: nandsim: convert pages_written[] to bitmap
      mtd: nandsim: use kasprintf()
      mtd: nandsim: simplify NS_RAW_OFFSET()
      mtd: nandsim: use NS_RAW_OFFSET()
      mtd: nandsim: remove unused code
      mtd: nandsim: remove unused ns->geom.oobshift
      mtd: tests: introduce helper functions
      mtd: tests: rename sources in order to link a helper object
      mtd: mtd_oobtest: use mtd_test helpers
      mtd: mtd_pagetest: use mtd_test helpers
      mtd: mtd_readtest: use mtd_test helpers
      mtd: mtd_speedtest: use mtd_test helpers
      mtd: mtd_stresstest: use mtd_test helpers
      mtd: mtd_subpagetest: use mtd_test helpers
      mtd: mtd_torturetest: use mtd_test helpers
      mtd: mtd_nandbiterrs: use mtd_test helpers
      mtd: denali: use NAND_CI_CELLTYPE_MSK instead of hardcoded constant
      mtd: tests: incorporate error message for mtdtest_read()
      mtd: tests: incorporate error message for mtdtest_write()

Alexander Shiyan (8):
      mtd: nand-gpio: Convert driver to using resource-managed functions
      mtd: nand-gpio: Use default dev_ready function if RDY is missing in c=
onfiguration
      mtd: nand-gpio: Do not override GPIOs if driver uses platform_data bu=
t OF is enabled in kernel config
      mtd: nand-gpio: Use default nand_base {read/write}_buf functions
      mtd: nand-gpio: Unneeded dependency on ARM removed
      mtd: nand-gpio: Rename internal variables to match functionality
      mtd: nand-gpio: Add missing "owner" field in platform_driver struct
      mtd: nand_base: Use io{read, write}*_rep functions for transfer

Andrea Adami (1):
      mtd: jedec_probe: fix LH28F640BF definition

Brian Norris (15):
      mtd: fsl_ifc_nand: remove incorrect kfree()
      mtd: m25p80: utilize dedicated 4-byte addressing commands
      mtd: m25p80: correct EN4B/EX4B comment
      mtd: nand: reword nand_chip bad block interface comments
      mtd: tests: don't print error messages when out-of-memory
      mtd: nand: fix NAND_BUSWIDTH_AUTO for x16 devices
      mtd: nand: detect OOB size for Toshiba 24nm raw SLC
      mtd: nand: add accessors, macros for in-memory BBT
      mtd: nand: remove multiplied-by-2 block logic
      mtd: nand: eliminate cast
      mtd: nand: refactor chip->block_markbad interface
      mtd: nand: hide in-memory BBT implementation details
      mtd: nand: remove NAND_BBT_SCANEMPTY
      mtd: nand: fixup kerneldoc, rename parameter
      mtd: m25p80: Micron SPI uses Macronix-style 4-byte addressing

Dan Carpenter (3):
      mtd: create_freezable_workqueue() doesn't return an ERR_PTR
      mtd: nand: silence some shift wrap warnings
      mtd cs553x_nand: use kzalloc() instead of memset

David Mosberger (1):
      mtd: nand_base: Only use GET/SET FEATURES command on chips that suppo=
rt them.

Ezequiel Garcia (24):
      mtd: nand: pxa3xx: Use devm_kzalloc
      mtd: nand: pxa3xx: Use devm_ioremap_resource
      mtd: nand: pxa3xx: Use devm_clk_get
      mtd: nand: pxa3xx: Use clk_prepare_enable and clk_disable_unprepare
      mtd: nand: pxa3xx: Check for clk_prepare_enable() return value
      mtd: nand: pxa3xx: Move buffer release code to its own function
      mtd: nand: pxa3xx: Set info->use_dma properly
      mtd: nand: pxa3xx: Use of_machine_is_compatible()
      mtd: nand: pxa3xx: Fix MODULE_DEVICE_TABLE declaration
      mtd: nand: pxa3xx: Add address support for READID command
      mtd: nand: pxa3xx: Add support for Read parameter page command
      mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible stri=
ng
      mtd: nand: pxa3xx: Handle ECC and DMA enable/disable properly
      mtd: nand: pxa3xx: Allow to set/clear the 'spare enable' field
      mtd: nand: pxa3xx: Support command buffer #3
      mtd: nand: pxa3xx: Use 'length override' in ONFI paramater page read
      mtd: nand: pxa3xx: Add a local loop variable
      mtd: nand: pxa3xx: Remove hardcoded mtd name
      mtd: nand: pxa3xx: Remove unneeded internal cmdset
      mtd: nand: pxa3xx: Move cached registers to info structure
      mtd: nand: pxa3xx: Make dma code dependent on dma capable platforms
      mtd: nand: pxa3xx: Add __maybe_unused keyword to enable_int()
      mtd: nand: pxa3xx: Allow devices with no dma resources
      mtd: nand: Allow to build pxa3xx_nand on Orion platforms

Fabio Estevam (1):
      mtd: nand: mxc_nand: Remove unneeded check for platform_get_resource(=
)

Geert Uytterhoeven (1):
      mtd: MTD_NAND_DENALI should depend on HAS_DMA

Girish K S (1):
      mtd: devices: added the 16MiB winbond device

Huang Shijie (18):
      mtd: cfi_cmdset_0002: print @adr when write timeout occurs
      mtd: increase max OOB size to 744
      mtd: add datasheet's ECC information to nand_chip{}
      mtd: get the ECC info from the parameter page for ONFI nand
      mtd: add data structures for Extended Parameter Page
      mtd: add a helper to get the supported features for ONFI nand
      mtd: get the ECC info from the Extended Parameter Page
      mtd: replace the hardcode with the onfi_feature()
      mtd: add ECC info for nand_flash_dev{}
      mtd: parse out the ECC info for the full-id nand chips
      mtd: add the ecc info for some full-id nand chips
      mtd: gpmi: set the BCH's geometry with the ecc info
      mtd: add a new ecc_step_size field to mtd_info{}
      mtd: add a new sys node to show the ecc step size
      mtd: set the ecc step size for master/slave mtd_info
      mtd: set ONFI nand's default hooks in nand_set_defaults()
      mtd: gpmi: remove the nand_scan()
      mtd: update the ABI document about the ecc step size

Jean-Christophe PLAGNIOL-VILLARD (1):
      mtd: atmel_nand: use devm_xxx gpio kzalloc, gpio and ioremap

Jingoo Han (44):
      mtd: r852: add CONFIG_PM_SLEEP to suspend/resume functions
      mtd: fsmc_nand: add CONFIG_PM_SLEEP to suspend/resume functions
      mtd: spear_smi: add CONFIG_PM_SLEEP to suspend/resume functions
      mtd: sst25l: use spi_get_drvdata() and spi_set_drvdata()
      mtd: dataflash: use spi_get_drvdata() and spi_set_drvdata()
      mtd: m25p80: use spi_get_drvdata() and spi_set_drvdata()
      mtd: nand: ams-delta: remove unnecessary platform_set_drvdata()
      mtd: nand: atmel_nand: remove unnecessary platform_set_drvdata()
      mtd: nand: bf5xx_nand: remove unnecessary platform_set_drvdata()
      mtd: nand: docg4: remove unnecessary platform_set_drvdata()
      mtd: nand: fsmc_nand: remove unnecessary platform_set_drvdata()
      mtd: nand: gpmi-nand: remove unnecessary platform_set_drvdata()
      mtd: nand: jz4740_nand: remove unnecessary platform_set_drvdata()
      mtd: nand: lpc32xx: remove unnecessary platform_set_drvdata()
      mtd: nand: mxc_nand: remove unnecessary platform_set_drvdata()
      mtd: nand: nuc900_nand: remove unnecessary platform_set_drvdata()
      mtd: devices: spear_smi: remove unnecessary platform_set_drvdata()
      mtd: nand: omap2: remove unnecessary platform_set_drvdata()
      mtd: nand: orion_nand: remove unnecessary platform_set_drvdata()
      mtd: nand: plat_nand: remove unnecessary platform_set_drvdata()
      mtd: nand: pxa3xx_nand: remove unnecessary platform_set_drvdata()
      mtd: nand: s3c2410: remove unnecessary platform_set_drvdata()
      mtd: nand: sharpsl: remove unnecessary platform_set_drvdata()
      mtd: nand: txx9ndfmc: remove unnecessary platform_set_drvdata()
      mtd: devices: elm: remove unnecessary platform_set_drvdata()
      mtd: maps: plat-ram: remove unnecessary platform_set_drvdata()
      mtd: maps: sa1100-flash: remove unnecessary platform_set_drvdata()
      mtd: maps: latch-addr-flash: remove unnecessary platform_set_drvdata(=
)
      mtd: maps: pxa2xx-flash: remove unnecessary platform_set_drvdata()
      mtd: maps: physmap: remove unnecessary platform_set_drvdata()
      mtd: maps: ixp4xx: remove unnecessary platform_set_drvdata()
      mtd: maps: rbtx4939-flash: remove unnecessary platform_set_drvdata()
      mtd: devices: use dev_get_platdata()
      mtd: maps: use dev_get_platdata()
      mtd: nand: use dev_get_platdata()
      mtd: onenand: use dev_get_platdata()
      mtd: sm_ftl: Staticize local symbols
      mtd: impa7: add missing __iomem annotation
      mtd: nandsim: Staticize local symbols
      mtd: r852: Staticize local symbols
      mtd: spear_smi: add missing __iomem annotation
      mtd: maps: cfi_flagadm: add missing __iomem annotation
      mtd: nand: mxc_nand: mark 'const' properly
      mtd: mtdswap: replace strict_strtoul() with kstrtoul()

Joe Perches (1):
      mtd: Convert logging messages

Jonas Gorski (3):
      mtd: bcm63xxpart: use size macro for CFE block size
      MIPS: BCM63XX: export PSI size from nvram
      mtd: bcm63xxpart: use nvram for PSI size

Josh Wu (11):
      mtd: atmel_nand: replace cpu_is_at32ap7000() with a nand platform dat=
a
      mtd: atmel_nand: add a new dt binding item for nand dma support
      mtd: atmel_nand: fix pmecc selction for ecc requirement typo
      mtd: atmel_nand: replace pmecc enable code with one function.
      mtd: atmel_nand: add Nand Flash Controller (NFC) support
      mtd: atmel_nand: enable Nand Flash Controller (NFC) read data via sra=
m
      mtd: atmel_nand: enable Nand Flash Controller (NFC) write via sram
      mtd: ofpart: add compatible check for child nodes
      mtd: atmel_nand: fix the warning when CONFIG_OF is not defined
      mtd: atmel_nand: move the sanity check to the beginning of pmecc_enab=
le()
      mtd: atmel_nand: pmecc: fix failure to correct bit error in 1024-byte=
s sector

Julia Lawall (2):
      mtd: simplify use of devm_ioremap_resource
      mtd: fsmc_nand: simplify platform_get_resource_byname/devm_ioremap_re=
source

Jussi Kivilinna (1):
      mtd: remove alauda driver

Kees Cook (1):
      mtd: refactor call to request_module

Laurent Navet (1):
      mtd: nand: davinci: use devm_ioremap_resource()

Libo Chen (2):
      mtd: bcm47xxsflash: convert kzalloc to avoid invalid access
      mtd: bcm47xxsflash: convert to module_platform_driver instead of init=
/exit

Lothar Wa=C3=9Fmann (1):
      mtd: nand: gpmi-nand: use more sensible error codes at various places

Markus Niebel (1):
      mtd: m25p80: add support for mr25h10

Mian Yousaf Kaukab (1):
      mtd: nand: fsmc: update of OF support

Michael Opdenacker (1):
      mtd: diskonchip: remove unused entries in Kconfig

Micha=C5=82 Miros=C5=82aw (1):
      mtd: gpmi-nand: fix error return from gpmi_get_clks()

Michel Stempin (1):
      mtd: chips: Add support for PMC SPI Flash chips in m25p80.c

Paul Bolle (1):
      mtd: remove obsolete JEDEC mapping drivers

Rafa=C5=82 Mi=C5=82ecki (4):
      mtd: bcm47xxsflash: implement ChipCommon R/W ops
      mtd: bcm47xxsflash: implement polling chip status
      mtd: bcm47xxsflash: implement erasing support
      mtd: bcm47xxsflash: writing support

Richard Genoud (1):
      mtd: atmel_nand: using a stronger ECC is not dangerous

Sachin Kamat (3):
      mtd: onenand/generic: Remove redundant platform_set_drvdata()
      mtd: onenand/omap2: Remove redundant platform_set_drvdata()
      mtd: onenand/samsung: Remove redundant platform_set_drvdata()

Sascha Hauer (3):
      mtd: m25p80: remove unnecessary ifdef
      mtd: m25p80: Pass flags through CAT25_INFO macro
      mtd: m25p80: make CONFIG_M25PXX_USE_FAST_READ safe to enable

Scott Wood (1):
      mtd: fsl_ifc_nand: set NAND_NO_SUBPAGE_WRITE

Silviu-Mihai Popescu (1):
      mtd: devices: convert OMAP BCH to devm_ioremap_resource()

Wei Yongjun (2):
      mtd: atmel_nand: fix error return code in atmel_nand_probe()
      mtd: ofpart: use for_each_child_of_node() macro

Wolfram Sang (2):
      mtd: gpmi-nand: don't use devm_pinctrl_get_select_default() in probe
      mtd: atmel_nand: don't use devm_pinctrl_get_select_default() in probe

avinash philip (1):
      mtd: devices: elm: Low power transition support

 Documentation/ABI/testing/sysfs-class-mtd          |  17 +-
 Documentation/DocBook/mtdnand.tmpl                 |   2 -
 .../devicetree/bindings/mtd/atmel-nand.txt         |  28 +
 .../devicetree/bindings/mtd/fsmc-nand.txt          |  25 +-
 .../devicetree/bindings/mtd/partition.txt          |   1 +
 arch/avr32/mach-at32ap/at32ap700x.c                |   3 +
 arch/mips/bcm63xx/nvram.c                          |  11 +
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |   2 +
 drivers/mtd/bcm63xxpart.c                          |   9 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                |   4 +-
 drivers/mtd/chips/gen_probe.c                      |   4 +-
 drivers/mtd/chips/jedec_probe.c                    |  13 +-
 drivers/mtd/devices/Kconfig                        |  55 --
 drivers/mtd/devices/bcm47xxsflash.c                | 275 +++++-
 drivers/mtd/devices/bcm47xxsflash.h                |   2 +
 drivers/mtd/devices/block2mtd.c                    |  58 +-
 drivers/mtd/devices/elm.c                          | 129 ++-
 drivers/mtd/devices/m25p80.c                       |  81 +-
 drivers/mtd/devices/mtd_dataflash.c                |  10 +-
 drivers/mtd/devices/spear_smi.c                    |  19 +-
 drivers/mtd/devices/sst25l.c                       |   8 +-
 drivers/mtd/maps/Kconfig                           |  18 -
 drivers/mtd/maps/Makefile                          |   2 -
 drivers/mtd/maps/bfin-async-flash.c                |   2 +-
 drivers/mtd/maps/cfi_flagadm.c                     |  10 +-
 drivers/mtd/maps/gpio-addr-flash.c                 |   2 +-
 drivers/mtd/maps/impa7.c                           |  10 +-
 drivers/mtd/maps/ixp4xx.c                          |   6 +-
 drivers/mtd/maps/latch-addr-flash.c                |   5 +-
 drivers/mtd/maps/octagon-5066.c                    | 246 ------
 drivers/mtd/maps/physmap.c                         |   7 +-
 drivers/mtd/maps/plat-ram.c                        |   6 +-
 drivers/mtd/maps/pxa2xx-flash.c                    |   4 +-
 drivers/mtd/maps/rbtx4939-flash.c                  |   5 +-
 drivers/mtd/maps/sa1100-flash.c                    |   5 +-
 drivers/mtd/maps/vmax301.c                         | 196 -----
 drivers/mtd/mtdcore.c                              |  11 +
 drivers/mtd/mtdpart.c                              |   1 +
 drivers/mtd/mtdswap.c                              |   2 +-
 drivers/mtd/nand/Kconfig                           |  12 +-
 drivers/mtd/nand/Makefile                          |   1 -
 drivers/mtd/nand/alauda.c                          | 723 ----------------
 drivers/mtd/nand/ams-delta.c                       |   1 -
 drivers/mtd/nand/atmel_nand.c                      | 923 ++++++++++++++++-=
----
 drivers/mtd/nand/atmel_nand_nfc.h                  |  98 +++
 drivers/mtd/nand/au1550nd.c                        |   2 +-
 drivers/mtd/nand/bf5xx_nand.c                      |   5 +-
 drivers/mtd/nand/cs553x_nand.c                     |   6 +-
 drivers/mtd/nand/davinci_nand.c                    |  19 +-
 drivers/mtd/nand/denali.c                          |   2 +-
 drivers/mtd/nand/diskonchip.c                      |   4 +-
 drivers/mtd/nand/docg4.c                           |   8 -
 drivers/mtd/nand/fsl_ifc_nand.c                    |   3 +-
 drivers/mtd/nand/fsmc_nand.c                       |  38 +-
 drivers/mtd/nand/gpio.c                            | 231 ++----
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 268 ++++--
 drivers/mtd/nand/jz4740_nand.c                     |   6 +-
 drivers/mtd/nand/lpc32xx_mlc.c                     |   4 +-
 drivers/mtd/nand/lpc32xx_slc.c                     |   4 +-
 drivers/mtd/nand/mxc_nand.c                        |  12 +-
 drivers/mtd/nand/nand_base.c                       | 296 +++++--
 drivers/mtd/nand/nand_bbt.c                        | 194 +++--
 drivers/mtd/nand/nand_ids.c                        |   8 +-
 drivers/mtd/nand/nandsim.c                         |  39 +-
 drivers/mtd/nand/nuc900_nand.c                     |   2 -
 drivers/mtd/nand/omap2.c                           |   5 +-
 drivers/mtd/nand/orion_nand.c                      |   6 +-
 drivers/mtd/nand/plat_nand.c                       |   5 +-
 drivers/mtd/nand/pxa3xx_nand.c                     | 384 +++++----
 drivers/mtd/nand/r852.c                            |  49 +-
 drivers/mtd/nand/s3c2410.c                         |   4 +-
 drivers/mtd/nand/sh_flctl.c                        |   4 +-
 drivers/mtd/nand/sharpsl.c                         |   5 +-
 drivers/mtd/nand/sm_common.c                       |   9 +-
 drivers/mtd/nand/tmio_nand.c                       |   2 +-
 drivers/mtd/nand/txx9ndfmc.c                       |  13 +-
 drivers/mtd/ofpart.c                               |  18 +-
 drivers/mtd/onenand/generic.c                      |   4 +-
 drivers/mtd/onenand/omap2.c                        |   3 +-
 drivers/mtd/onenand/onenand_bbt.c                  |   1 -
 drivers/mtd/onenand/samsung.c                      |   3 +-
 drivers/mtd/sm_ftl.c                               |  26 +-
 drivers/mtd/tests/Makefile                         |   9 +
 drivers/mtd/tests/mtd_test.c                       | 114 +++
 drivers/mtd/tests/mtd_test.h                       |  11 +
 .../mtd/tests/{mtd_nandbiterrs.c =3D> nandbiterrs.c} |  41 +-
 drivers/mtd/tests/{mtd_oobtest.c =3D> oobtest.c}     | 102 +--
 drivers/mtd/tests/{mtd_pagetest.c =3D> pagetest.c}   | 271 ++----
 drivers/mtd/tests/{mtd_readtest.c =3D> readtest.c}   |  61 +-
 drivers/mtd/tests/{mtd_speedtest.c =3D> speedtest.c} | 210 +----
 .../mtd/tests/{mtd_stresstest.c =3D> stresstest.c}   | 101 +--
 .../mtd/tests/{mtd_subpagetest.c =3D> subpagetest.c} |  97 +--
 .../mtd/tests/{mtd_torturetest.c =3D> torturetest.c} |  66 +-
 include/linux/mtd/bbm.h                            |   2 -
 include/linux/mtd/fsmc.h                           |   1 +
 include/linux/mtd/mtd.h                            |   3 +
 include/linux/mtd/nand.h                           |  83 +-
 include/linux/platform_data/atmel.h                |   4 +
 include/linux/platform_data/mtd-nand-pxa3xx.h      |  13 -
 99 files changed, 2732 insertions(+), 3201 deletions(-)



--=20
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

--=-R6Z2TyHUVzjYWVrmi/vS
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIISxDCCBjQw
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
9mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIGQjCCBSqg
AwIBAgIDBoXOMA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYG
A1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcN
MTMwNTAyMDYyMDQ2WhcNMTQwNTAzMTIxNDAyWjBdMRkwFwYDVQQNExBNd0k3ODIxNTRpV21lZVkw
MRwwGgYDVQQDDBNkd213MkBpbmZyYWRlYWQub3JnMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZy
YWRlYWQub3JnMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvWGuRDHiXVpOgaFkBaz8
c3jQTfiEw7j0iKZnktCQi0xjY29QJ7GwL+fgQlbofXgYTm8E9fWERvw2tAy2BxHzAPguBzziS7JN
hsGP9lf3L8hFJBvmdyyyj8b9A6Oi7s3JLtMRWIvyvE+DbuTkP+htuT4+XuTJr8Y5yIqd1WXr2gJk
ANr77vTyjeNxceevP58Tqr0f+4v5g6+vNARO3bk3SaVQPDUTwGrpoPtLh3d+mQzZ4iiW3MwQS7Wr
UVT3l2aTVHCpgtAaBs3zHWarvmIqhbWj8zdcnELNzwqTrOjaoWxuWY4k05GGfzmdjOBUiL7FDNvI
ZwweJEPwJAQI72YhUwIDAQABo4IC2TCCAtUwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBSs0hZhUgQwqGVXzLuH6pJH0hMZwTAf
BgNVHSMEGDAWgBRTcu2SnODaywFcfH6WNU7y1LhRgjAeBgNVHREEFzAVgRNkd213MkBpbmZyYWRl
YWQub3JnMIIBTAYDVR0gBIIBQzCCAT8wggE7BgsrBgEEAYG1NwECAzCCASowLgYIKwYBBQUHAgEW
Imh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwgfcGCCsGAQUFBwICMIHqMCcWIFN0
YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmljYXRlIHdh
cyBpc3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAxIFZhbGlkYXRpb24gcmVxdWlyZW1lbnRz
IG9mIHRoZSBTdGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRl
ZCBwdXJwb3NlIGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMu
MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUxLWNybC5jcmww
gY4GCCsGAQUFBwEBBIGBMH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9z
dWIvY2xhc3MxL2NsaWVudC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNzbC5jb20v
Y2VydHMvc3ViLmNsYXNzMS5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93d3cuc3Rh
cnRzc2wuY29tLzANBgkqhkiG9w0BAQUFAAOCAQEACFLDQnyO8+XA/TiTltjJ/ZAvM+qmBEKN43Vd
+Wio2lM/Wq/scJpkupXGHrl9CueobkDxMAogXbMxqLZYO13PvgjMh+PHxDPnQv8EGxOig+k/Hqvc
qEdTlm9YEHcbXbWS6XB+zRO7VVIpGMYQ1f1qCOcukxmwIm6iMSHXbOr/7paQm4bO0ULptjBotfiO
Zo6q8No6SroQlOSyc6v8FYSxTNIAXMaM2FYkjqrxgdnJmSIAfr11gROuF69WuOICxP0zTEjJle+7
aO9lUWNaWMWPMyFSNCxF6kkRuvUCami7vlhLOTRC1kb+OMhx7keN9At3tdTI3rtuFeSB1Pa3VXVs
0DCCBkIwggUqoAMCAQICAwaFzjANBgkqhkiG9w0BAQUFADCBjDELMAkGA1UEBhMCSUwxFjAUBgNV
BAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNp
Z25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xp
ZW50IENBMB4XDTEzMDUwMjA2MjA0NloXDTE0MDUwMzEyMTQwMlowXTEZMBcGA1UEDRMQTXdJNzgy
MTU0aVdtZWVZMDEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzEiMCAGCSqGSIb3DQEJARYT
ZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL1hrkQx
4l1aToGhZAWs/HN40E34hMO49IimZ5LQkItMY2NvUCexsC/n4EJW6H14GE5vBPX1hEb8NrQMtgcR
8wD4Lgc84kuyTYbBj/ZX9y/IRSQb5ncsso/G/QOjou7NyS7TEViL8rxPg27k5D/obbk+Pl7kya/G
OciKndVl69oCZADa++708o3jcXHnrz+fE6q9H/uL+YOvrzQETt25N0mlUDw1E8Bq6aD7S4d3fpkM
2eIoltzMEEu1q1FU95dmk1RwqYLQGgbN8x1mq75iKoW1o/M3XJxCzc8Kk6zo2qFsblmOJNORhn85
nYzgVIi+xQzbyGcMHiRD8CQECO9mIVMCAwEAAaOCAtkwggLVMAkGA1UdEwQCMAAwCwYDVR0PBAQD
AgSwMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUrNIWYVIEMKhlV8y7
h+qSR9ITGcEwHwYDVR0jBBgwFoAUU3Ltkpzg2ssBXHx+ljVO8tS4UYIwHgYDVR0RBBcwFYETZHdt
dzJAaW5mcmFkZWFkLm9yZzCCAUwGA1UdIASCAUMwggE/MIIBOwYLKwYBBAGBtTcBAgMwggEqMC4G
CCsGAQUFBwIBFiJodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9wb2xpY3kucGRmMIH3BggrBgEFBQcC
AjCB6jAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgEBGoG+VGhpcyBjZXJ0
aWZpY2F0ZSB3YXMgaXNzdWVkIGFjY29yZGluZyB0byB0aGUgQ2xhc3MgMSBWYWxpZGF0aW9uIHJl
cXVpcmVtZW50cyBvZiB0aGUgU3RhcnRDb20gQ0EgcG9saWN5LCByZWxpYW5jZSBvbmx5IGZvciB0
aGUgaW50ZW5kZWQgcHVycG9zZSBpbiBjb21wbGlhbmNlIG9mIHRoZSByZWx5aW5nIHBhcnR5IG9i
bGlnYXRpb25zLjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLnN0YXJ0c3NsLmNvbS9jcnR1
MS1jcmwuY3JsMIGOBggrBgEFBQcBAQSBgTB/MDkGCCsGAQUFBzABhi1odHRwOi8vb2NzcC5zdGFy
dHNzbC5jb20vc3ViL2NsYXNzMS9jbGllbnQvY2EwQgYIKwYBBQUHMAKGNmh0dHA6Ly9haWEuc3Rh
cnRzc2wuY29tL2NlcnRzL3N1Yi5jbGFzczEuY2xpZW50LmNhLmNydDAjBgNVHRIEHDAahhhodHRw
Oi8vd3d3LnN0YXJ0c3NsLmNvbS8wDQYJKoZIhvcNAQEFBQADggEBAAhSw0J8jvPlwP04k5bYyf2Q
LzPqpgRCjeN1XfloqNpTP1qv7HCaZLqVxh65fQrnqG5A8TAKIF2zMai2WDtdz74IzIfjx8Qz50L/
BBsTooPpPx6r3KhHU5ZvWBB3G121kulwfs0Tu1VSKRjGENX9agjnLpMZsCJuojEh12zq/+6WkJuG
ztFC6bYwaLX4jmaOqvDaOkq6EJTksnOr/BWEsUzSAFzGjNhWJI6q8YHZyZkiAH69dYETrhevVrji
AsT9M0xIyZXvu2jvZVFjWljFjzMhUjQsRepJEbr1Ampou75YSzk0QtZG/jjIce5HjfQLd7XUyN67
bhXkgdT2t1V1bNAxggNvMIIDawIBATCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2
BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMG
hc4wCQYFKw4DAhoFAKCCAa8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUx
DxcNMTMwOTA5MTQ0MTU3WjAjBgkqhkiG9w0BCQQxFgQUVbvNB74r7fo8jxZMCQ2M6UG9TRkwgaUG
CSsGAQQBgjcQBDGBlzCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4x
KzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0
YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMGhc4wgacGCyqG
SIb3DQEJEAILMYGXoIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjEr
MCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3Rh
cnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwaFzjANBgkqhkiG
9w0BAQEFAASCAQCvMW0Wz2qJq9Pg6fGkt3x504JMWvYLf+t8TXIwHVS10CieigcHdKyzodODcj34
OLOoALxHwXv7bCs+CY8X36S8ZnaHyifBpIDDu/5njFzg+4T9O9KGOCCU3fur4+wE4KojShSR+KLY
0JBrpskEg+VaWHOzHnWBasQ4RyK6QGzSUpWvJEQcoFuVis62G1b4tgpSsmQY1M8spSbiV59uYEMt
UZMEe31vMYEwWXXKAwvC81DV/x15ZJV0s69KIF9qTlfGEyZH6ii0oNbivzzsy4TRIToKaw2P0DwU
UXuQAqavJvLM1roo6iwOr8Mb1YOKPeI8mKBMUMkTx19k5diwmgeuAAAAAAAA


--=-R6Z2TyHUVzjYWVrmi/vS--
