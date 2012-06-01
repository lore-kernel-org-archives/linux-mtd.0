Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaXpp-0005Qp-Ch
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 19:48:34 +0000
From: "Woodhouse, David" <david.woodhouse@intel.com>
To: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: [GIT *] MTD tree for 3.5
Date: Fri, 1 Jun 2012 19:48:28 +0000
Message-ID: <1338580106.10884.40.camel@shinybook.infradead.org>
Content-Language: en-GB
Content-Type: multipart/signed; micalg=sha1;
 protocol="application/x-pkcs7-signature"; boundary="=-jtwiRi9alod0dPbCCSCY"
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-jtwiRi9alod0dPbCCSCY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus, please pull from
 git://git.infradead.org/linux-mtd.git for-linus-3.5-20120601

 - More robust parsing especially of xattr data in JFFS2
 - Updates to mxc_nand and gpmi drivers to support new boards and device tr=
ee
 - Improve consistency of information about ECC strength in NAND devices
 - Clean up partition handling of plat_nand
 - Support NAND drivers without dedicated access to OOB area
 - BCH hardware ECC support for OMAP
 - Other fixes and cleanups, and a few new device IDs

 Documentation/ABI/testing/sysfs-class-mtd          |   51 ++
 Documentation/DocBook/mtdnand.tmpl                 |    2 -
 .../devicetree/bindings/mtd/gpmi-nand.txt          |   33 +
 Documentation/devicetree/bindings/mtd/mxc-nand.txt |   19 +
 arch/arm/boot/dts/imx27.dtsi                       |    9 +
 arch/arm/mach-ep93xx/snappercl15.c                 |    4 -
 arch/arm/mach-ep93xx/ts72xx.c                      |    3 -
 arch/arm/mach-imx/imx27-dt.c                       |    1 +
 arch/arm/mach-ixp4xx/ixdp425-setup.c               |    4 -
 arch/arm/mach-nomadik/board-nhk8815.c              |    2 +-
 arch/arm/mach-omap1/board-fsample.c                |    3 -
 arch/arm/mach-omap1/board-h2.c                     |    3 -
 arch/arm/mach-omap1/board-h3.c                     |    3 -
 arch/arm/mach-omap1/board-perseus2.c               |    3 -
 arch/arm/mach-omap2/gpmc.c                         |  184 ++++++
 arch/arm/mach-orion5x/ts78xx-setup.c               |    3 -
 arch/arm/mach-pxa/balloon3.c                       |    3 -
 arch/arm/mach-pxa/em-x270.c                        |    3 -
 arch/arm/mach-pxa/palmtx.c                         |    3 -
 arch/arm/plat-omap/include/plat/gpmc.h             |   11 +
 arch/blackfin/mach-bf561/boards/acvilon.c          |    3 -
 arch/mips/alchemy/devboards/db1200.c               |    3 -
 arch/mips/alchemy/devboards/db1300.c               |    3 -
 arch/mips/alchemy/devboards/db1550.c               |    3 -
 arch/mips/pnx833x/common/platform.c                |    6 -
 arch/mips/rb532/devices.c                          |    1 -
 arch/sh/boards/mach-migor/setup.c                  |    1 -
 drivers/mtd/Kconfig                                |    2 +-
 drivers/mtd/bcm63xxpart.c                          |   41 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                |   18 +-
 drivers/mtd/cmdlinepart.c                          |    2 +-
 drivers/mtd/devices/block2mtd.c                    |    7 -
 drivers/mtd/devices/docg3.c                        |   40 +-
 drivers/mtd/devices/m25p80.c                       |    5 +
 drivers/mtd/devices/spear_smi.c                    |   14 +-
 drivers/mtd/lpddr/qinfo_probe.c                    |    2 +-
 drivers/mtd/maps/Kconfig                           |    2 +-
 drivers/mtd/maps/intel_vr_nor.c                    |   13 +-
 drivers/mtd/maps/pci.c                             |   13 +-
 drivers/mtd/maps/scb2_flash.c                      |   15 +-
 drivers/mtd/maps/wr_sbc82xx_flash.c                |    2 +-
 drivers/mtd/mtdcore.c                              |   57 ++-
 drivers/mtd/mtdpart.c                              |   14 +-
 drivers/mtd/nand/Kconfig                           |   42 ++-
 drivers/mtd/nand/alauda.c                          |    4 +-
 drivers/mtd/nand/atmel_nand.c                      |   14 +-
 drivers/mtd/nand/au1550nd.c                        |    2 -
 drivers/mtd/nand/bcm_umi_bch.c                     |   14 +-
 drivers/mtd/nand/bcm_umi_nand.c                    |    9 +-
 drivers/mtd/nand/bf5xx_nand.c                      |    4 +-
 drivers/mtd/nand/cafe_nand.c                       |   35 +-
 drivers/mtd/nand/cs553x_nand.c                     |    1 -
 drivers/mtd/nand/denali.c                          |   38 +-
 drivers/mtd/nand/docg4.c                           |   22 +-
 drivers/mtd/nand/fsl_elbc_nand.c                   |   37 +-
 drivers/mtd/nand/fsl_ifc_nand.c                    |   47 +-
 drivers/mtd/nand/fsmc_nand.c                       |   26 +-
 drivers/mtd/nand/gpmi-nand/bch-regs.h              |   42 +-
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              |   27 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |  184 +++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |    6 +-
 drivers/mtd/nand/h1910.c                           |    1 -
 drivers/mtd/nand/jz4740_nand.c                     |    6 +-
 drivers/mtd/nand/mpc5121_nfc.c                     |    1 -
 drivers/mtd/nand/mxc_nand.c                        |  636 ++++++++++++++--=
----
 drivers/mtd/nand/nand_base.c                       |  233 ++++----
 drivers/mtd/nand/nand_bbt.c                        |    1 +
 drivers/mtd/nand/nand_ids.c                        |    6 +-
 drivers/mtd/nand/nandsim.c                         |   28 +-
 drivers/mtd/nand/omap2.c                           |  253 ++++++++-
 drivers/mtd/nand/pasemi_nand.c                     |    1 -
 drivers/mtd/nand/plat_nand.c                       |   28 +-
 drivers/mtd/nand/pxa3xx_nand.c                     |    6 +-
 drivers/mtd/nand/r852.c                            |   22 +-
 drivers/mtd/nand/sh_flctl.c                        |    8 +-
 drivers/mtd/nand/sm_common.c                       |    9 +-
 drivers/mtd/onenand/onenand_base.c                 |    6 +-
 fs/jffs2/jffs2_fs_sb.h                             |   11 +
 fs/jffs2/nodemgmt.c                                |   42 ++
 fs/jffs2/os-linux.h                                |    7 +-
 fs/jffs2/readinode.c                               |   19 +-
 fs/jffs2/super.c                                   |   38 +-
 fs/jffs2/wbuf.c                                    |   55 ++-
 fs/jffs2/xattr.c                                   |   23 +-
 fs/jffs2/xattr.h                                   |    2 +
 include/linux/mtd/gpmi-nand.h                      |    8 +-
 include/linux/mtd/mtd.h                            |   11 +-
 include/linux/mtd/nand.h                           |   25 +-
 88 files changed, 1833 insertions(+), 821 deletions(-)

Artem Bityutskiy (4):
      jffs2: remove lock_super
      jffs2: remove unnecessary GC pass on umount
      jffs2: remove unnecessary GC pass on sync
      jffs2: get rid of jffs2_sync_super

Axel Lin (1):
      mtd: use module_pci_driver

Bastian Hecht (1):
      mtd: nand: Add a NAND_CMD_STATUS when using write verification

Brian Norris (9):
      mtd: nandsim: remove autoincrement code
      mtd: nand: remove autoincrement 'sndcmd' code
      mtd: nand: kill NAND_NO_AUTOINCR option
      mtd: nand: add 'oob_required' argument to NAND {read,write}_page inte=
rfaces
      mtd: nand: pass proper 'oob_required' parameter
      mtd: eLBC NAND: utilize oob_required parameter
      mtd: IFC NAND: utilize oob_required parameter
      mtd: gpmi-nand: utilize oob_requested parameter
      mtd: nand: utilize oob_required parameter

Daniel Drake (1):
      JFFS2: Add parameter to reserve disk space for root

David Woodhouse (1):
      mtd: cfi_cmdset_0002: Slight cleanup of fixup messages

Dmitry Maluka (1):
      mtd: nand: fix scan_read_raw_oob

Frank Svendsboe (1):
      mtd: of_parts: fix breakage in Kconfig

Gabor Juhos (1):
      mtd: block2mtd: fix recursive call of mtd_writev

Grazvydas Ignotas (1):
      mtd: omap2: fix resource leak in prefetch-busy path

H Hartley Sweeten (5):
      mtd: plat_nand: Add default partition parser to driver
      arm: Use the plat_nand default partition parser
      blackfin: Use the plat_nand default partition parser
      mips: Use the plat_nand default partition parser
      sh: Use the plat_nand default partition parser

Huang Shijie (4):
      mtd: gpmi: do not include the mxs.h
      mtd: print out the page size and oob size after parsing out the nand
      mtd: gpmi: add device tree support to gpmi-nand
      mtd: gpmi: add gpmi support for mx6q

Ivan Djelic (3):
      mtd: nand: omap: fix race condition in omap_wait()
      ARM: OMAP3: gpmc: add BCH ecc api and modes
      mtd: nand: omap: add support for hardware BCH ecc

Javier Martin (1):
      mtd: add fixup for S29NS512P NOR flash.

Jean-Christophe DUBOIS (2):
      jffs2: allow to discriminate between recoverable and non-recoverable =
errors
      jffs2: allow to complete xattr integrity check on first GC scan

Jim Cromie (1):
      mtd: lpddr: replace open-coded ARRAY_SIZE with macro

John Crispin (3):
      mtd: add m25p80 id for mx25l2005a
      OF: MTD: make plat_nand loadable from DT
      mtd: add read_byte support to plat_nand

Jonas Gorski (1):
      mtd: bcm63xxpart: handle Broadcom partition order

Marek Vasut (2):
      mtd: m25p80: add support for Everspin MR25H256 MRAM chip
      mtd: gpmi-nand: define ecc.strength

Mike Dunn (7):
      mtd: ecc_strength is at ecc step granularity
      mtd: nand: fix incorrect ecc strength values
      mtd: expose ecc_strength through sysfs
      mtd: bitflip_threshold added to mtd_info and sysfs
      mtd: nand: read_page() returns max_bitflips
      mtd: nand: add sanity check of ecc strength to nand_scan_tail()
      mtd: driver _read() returns max_bitflips; mtd_read() returns -EUCLEAN

Peter Meerwald (1):
      mtd: cmdlinepart: fix commentary

Prabhakar Kushwaha (1):
      mtd: IFC NAND: Add support of ONFI NAND flash

Randy Dunlap (1):
      mtd: fix scb2_flash build when PCI is not enabled

Robert Jarzmik (1):
      mtd: docg3 fix in-middle of blocks reads

Ryosuke Saito (1):
      mtd: block2mtd: page_read() never returns NULL

Sascha Hauer (1):
      mtd: mxc_nand: move ecc strengh setup before nand_scan_tail

Shmulik Ladkani (2):
      mtd: nand: remove 'sndcmd' parameter of 'read_oob/read_oob_raw'
      mtd: nand: check the return code of 'read_oob/read_oob_raw'

Thomas Abraham (1):
      mtd: m25p80: Add support for Winbond W25Q80BW

Uwe Kleine-K=C3=B6nig (12):
      mtd: mark const init data with __initconst instead of __initdata
      mtd: mxc_nand: set owner field to prevent module unloading when in us=
e
      mtd: mxc_nand: use a flag to detect if the mx21 quirk is necessary
      mtd: mxc_nand: move function pointers to a per-SOC struct
      mtd: mxc_nand: split some functions to get rid of more nfc_is_vX()
      mtd: mxc_nand: put ecc layout into devtype structs
      mtd: mxc_nand: split chip_select function and put it into devtype str=
uct
      mtd: mxc_nand: put callback for data correction into devtype struct
      mtd: mxc_nand: put several more fields into devtype_data
      mtd: mxc_nand: implement device tree probing
      ARM: imx: add mxc_nand to imx27 device tree
      mtd: mxc_nand: fix several sparse warnings about incorrect address sp=
ace

Viresh Kumar (2):
      mtd: spear_smi: Add clk_{un}prepare() support
      mtd: fsmc_nand: Add clk_{un}prepare() support

Xi Wang (2):
      jffs2: validate symlink size in jffs2_do_read_inode_internal()
      jffs2: refactor csize usage in jffs2_do_read_inode_internal()


--=20
                   Sent with MeeGo's ActiveSync support.

David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation



--=-jtwiRi9alod0dPbCCSCY
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIO6jCCAz0w
ggKmoAMCAQICAwWw/zANBgkqhkiG9w0BAQUFADBOMQswCQYDVQQGEwJVUzEQMA4GA1UEChMHRXF1
aWZheDEtMCsGA1UECxMkRXF1aWZheCBTZWN1cmUgQ2VydGlmaWNhdGUgQXV0aG9yaXR5MB4XDTA2
MDIxNjE4MDEzMFoXDTE2MDIxOTE4MDEzMFowUjELMAkGA1UEBhMCVVMxGjAYBgNVBAoTEUludGVs
IENvcnBvcmF0aW9uMScwJQYDVQQDEx5JbnRlbCBFeHRlcm5hbCBCYXNpYyBQb2xpY3kgQ0EwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDBpd/XOb9QVqEZ8mQ1042TdOIq3ATDIsV2xDyt
30yLyMR5Wjtus0bn3B+he89BiNO/LP6+rFzEwlD55PlX+HLGIKeNNG97dqyc30FElEUjZzTZFq2N
4e3kVJ/XAEEgANzV8v9qp7qWwxugPgfc3z9BkYot+CifozexHLb/hEZj+yISCU61kRZvuSQ0E11y
YL4dRgcglJeaHo3oX57rvIckaLsYV5/1Aj+R8DM1Ppk965XQAKsHfnyT7C4S50T4lVn4lz36wOdN
Zn/zegG1zp41lnoTFfT4KuKVJH5x7YD1p6KbgJCKLovnujGuohquBNfdXKpZkvz6pGv+iC1HawJd
AgMBAAGjgaAwgZ0wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBQaxgxKxEdvqNutK/D0Vgaj7TdU
DDA6BgNVHR8EMzAxMC+gLaArhilodHRwOi8vY3JsLmdlb3RydXN0LmNvbS9jcmxzL3NlY3VyZWNh
LmNybDAfBgNVHSMEGDAWgBRI5mj5K9KylddH2CMgEE8zmJCf1DAPBgNVHRMBAf8EBTADAQH/MA0G
CSqGSIb3DQEBBQUAA4GBABMQOK2kVKVIlUWwLTdywJ+e2O+PC/uQltK2F3lRyrPfBn69tOkIP4Sg
DJOfsxyobIrPLe75kBLw+Dom13OBDp/EMZJZ1CglQfVV8co9mT3aZMjSGGQiMgkJLR3jMfr900fX
ZKj5XeqCJ+JP0mEhJGEdVCY+FFlksJjV86fDrq1QMIIFijCCBHKgAwIBAgIKYR6AtwAAAAAABzAN
BgkqhkiG9w0BAQUFADBSMQswCQYDVQQGEwJVUzEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24x
JzAlBgNVBAMTHkludGVsIEV4dGVybmFsIEJhc2ljIFBvbGljeSBDQTAeFw0wOTA1MTUxOTI1MTNa
Fw0xNTA1MTUxOTM1MTNaMFYxCzAJBgNVBAYTAlVTMRowGAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlv
bjErMCkGA1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFzaWMgSXNzdWluZyBDQSAzQTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAMGPgGLnOO5IOzlHRfr1XfCVb97V4BR2QVpPZ7CrcIQ+FGa2
KHD/6dPjwxOIrtFTdfW4BYikdFmxUZVBWRWZ5Vye2cCdGzFWqIEOE1e17nNx1jM8Z6GZEqbDUS+v
BuPlBFHKQoVm5BaNIHpyn2XZxqwjV9j5/crIfPrCGstk+2ztUhVS8OHEgzO784PgD9pOgBnnAbZH
mEM1FYYmQ6ibS+gVCHzobDYG+YReRiHpFKWBxpUuP+X0WYFw/Ja1JW7N8pELAFDw0UFBWFgiv1QI
usdLvSy8mcsLJ5wy050OVcxShqoUxhw/wvyuuoQxvmEPjhRa1C2oSCmGN0003GMhQWMCAwEAAaOC
AlwwggJYMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFKoWZq+3PVZTYK4Nwu3z7gfLUWB+MAsG
A1UdDwQEAwIBhjASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQWBBTCKwhTx+hdMsKC
gOmWwLgjQsAV+TAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAfBgNVHSMEGDAWgBQaxgxKxEdv
qNutK/D0Vgaj7TdUDDCBvQYDVR0fBIG1MIGyMIGvoIGsoIGphk5odHRwOi8vd3d3LmludGVsLmNv
bS9yZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBQb2xpY3klMjBDQS5j
cmyGV2h0dHA6Ly9jZXJ0aWZpY2F0ZXMuaW50ZWwuY29tL3JlcG9zaXRvcnkvQ1JML0ludGVsJTIw
RXh0ZXJuYWwlMjBCYXNpYyUyMFBvbGljeSUyMENBLmNybDCB4wYIKwYBBQUHAQEEgdYwgdMwYwYI
KwYBBQUHMAKGV2h0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9zaXRvcnkvY2VydGlmaWNhdGVzL0lu
dGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMFBvbGljeSUyMENBLmNydDBsBggrBgEFBQcwAoZgaHR0
cDovL2NlcnRpZmljYXRlcy5pbnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0aWZpY2F0ZXMvSW50ZWwl
MjBFeHRlcm5hbCUyMEJhc2ljJTIwUG9saWN5JTIwQ0EuY3J0MA0GCSqGSIb3DQEBBQUAA4IBAQCU
Y/1d0MS6VPTlIcOho1XWh193PD5kJDJSPdphLHQdM1oKA+whMdIBoY1VzTDDK+C+Ey4Jcyna7fpC
8uVmn/Rz/i9MZtyc7qezPtZTn9UyORvJmddH+Ox/RycGwe3ags8jUdspECorYOkJyZksnDIlTVUv
bR7wyY+gGJYqxWXqrcVFEiMsWu8/OIlf7F2gAYMBw1kZ55dn4lWBIM0WqvReWpPvhYeN7Y+3MKEd
SMkQ7TZiNbfdZ5D/8KfWNMTJ4VHltOgCL1lA5tx/F4R1920skpL5eu3Sj650RUe3rOXsaV5NyJzB
wB31+1zsmleVdFD0k/Fw9HxXbAQE35ucN/7CMIIGFzCCBP+gAwIBAgIKEIhPUAABAABfaTANBgkq
hkiG9w0BAQUFADBWMQswCQYDVQQGEwJVUzEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24xKzAp
BgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3VpbmcgQ0EgM0EwHhcNMTEwNDEyMTIzMzQx
WhcNMTQwMzI3MTIzMzQxWjBFMRkwFwYDVQQDExBXb29kaG91c2UsIERhdmlkMSgwJgYJKoZIhvcN
AQkBFhlkYXZpZC53b29kaG91c2VAaW50ZWwuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAvxW1JMLaZUeM6Cg2OVV1nfsZOt9x/CjVJ7SBlapefSjUoNT48n58zLK+Q00YxPkIxnwl
m57dAxSUf/Dqg+C6DOdLknVQILrGeWNSZdC8GQ8HlHz+D5ldgTDY9L1vDM65p1wbXW4R5QfMbooZ
IQKlyUivGkggwBUpTeeXDOfz5f4m2UW5aCnyG8yhiBUHISAQyXLwQg+iVhBpTqsVvvojybQY8lGF
Z7U+kgbgBY0HCqOuEmT7Iz/tm4W3dpfh8mFluZUn1fMBvCaC+cdKVV/1lpeUdtMNREH+jKUU49lt
BblH1qXmEViOvMT4itbfkUSWeWgeI9umMOK4eL31LLepCQIDAQABo4IC9jCCAvIwCwYDVR0PBAQD
AgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWOn1OCkcAJZ4HevTmV
8EMCAWQCAQgwHQYDVR0OBBYEFMcuq9ocKJ7EbWcVlAWTYVXwOsrHMB8GA1UdIwQYMBaAFKoWZq+3
PVZTYK4Nwu3z7gfLUWB+MIHPBgNVHR8EgccwgcQwgcGggb6ggbuGV2h0dHA6Ly93d3cuaW50ZWwu
Y29tL3JlcG9zaXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBD
QSUyMDNBKDEpLmNybIZgaHR0cDovL2NlcnRpZmljYXRlcy5pbnRlbC5jb20vcmVwb3NpdG9yeS9D
UkwvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwM0EoMSkuY3JsMIH1
BggrBgEFBQcBAQSB6DCB5TBsBggrBgEFBQcwAoZgaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3Np
dG9yeS9jZXJ0aWZpY2F0ZXMvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENB
JTIwM0EoMSkuY3J0MHUGCCsGAQUFBzAChmlodHRwOi8vY2VydGlmaWNhdGVzLmludGVsLmNvbS9y
ZXBvc2l0b3J5L2NlcnRpZmljYXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5n
JTIwQ0ElMjAzQSgxKS5jcnQwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJKwYB
BAGCNxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMME8GA1UdEQRIMEagKQYKKwYBBAGC
NxQCA6AbDBlkYXZpZC53b29kaG91c2VAaW50ZWwuY29tgRlkYXZpZC53b29kaG91c2VAaW50ZWwu
Y29tMA0GCSqGSIb3DQEBBQUAA4IBAQBxLiiAAGnWEDYYtUaje48WjSbMx8O+TsKX2x1sgi/ilnUR
evhznvvFGx9hRrTtQ4Sz+hU7nWvoxbSLDVx6vDQ7+wyGo6SzE0MYqwB3EzwO/P8MnpgZTlEmgDeP
GjYX2IFzp5fG7NNvc6byf8pLjXgn+2wqRLUqrh2PZZ5KKIiicVNT+UOlRIbB2T1WuSVHBMQxhQBr
rzwwYuyoawJCHHo+eKUE51cSSzkT95K+m0Q6XYGC8tQ3i94nBIaLMIg/GM6K2cYKH3vdu/otvGPl
j9/HEKo+mktp2A2S5sIwCKlw8nYOaYKe1dpmYtXKfVoOIIZ/LaVEB/XEIEC1x/oPbrH/MYIB6jCC
AeYCAQEwZDBWMQswCQYDVQQGEwJVUzEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24xKzApBgNV
BAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3VpbmcgQ0EgM0ECChCIT1AAAQAAX2kwCQYFKw4D
AhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEyMDYwMTE5
NDgyNlowIwYJKoZIhvcNAQkEMRYEFJPPdD3mmDaTuT0Ltuv9cy7sNdZFMA0GCSqGSIb3DQEBAQUA
BIIBAH/WdpIfJSqbkU05OXMy4teejOXKQQpjo4+107ZaxLazS/INVv5Pq+O3BQCJPpgNYahKXd3S
bKMZqlkErZSKeZNDJ/FydfVMGGCjP6EqwXmhdDKg16ho9fxLANwhkiPgNFS9ZIVlI5rFYxVcN6de
ymYMmjaZO3/FN8dXR1YWtr+Z9bY79AF95gqojZo+dCYGtWIvwt2V+GG5hJvKG1+BY4lOgTU3wbs2
8fLndswrgaB6/lpkSlrhvnf7UTm1cAvv+yy0OLYLJC2JrTpbaTvSH9GcHHBA+suf7f2a+UsnYPJa
Im8foD8Q6GG8FlQ78tPFVmM7CgBO/vXRDGl5xxgQMoEAAAAAAAA=


--=-jtwiRi9alod0dPbCCSCY--
