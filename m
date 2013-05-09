Message-ID: <1368115372.10172.17.camel@i7.infradead.org>
Subject: [GIT PULL] MTD for 3.10
From: David Woodhouse <dwmw2@infradead.org>
To: torvalds@linux-foundation.org
Date: Thu, 09 May 2013 17:02:52 +0100
Content-Type: multipart/signed; micalg="sha-1";
 protocol="application/x-pkcs7-signature";
 boundary="=-V3L6BuGpLxcKKjgQXUtT"
Mime-Version: 1.0
Cc: dedekind@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-V3L6BuGpLxcKKjgQXUtT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus, please pull from
	git://git.infradead.org/linux-mtd.git for-linus-20130509

- Lots of cleanups from Artem, including deletion of some obsolete drivers
- Support partitions larger than 4GiB in device tree
- Support for new SPI chips

There is a slight possibility that someone will scream that I've missed
out something important =E2=80=94 I haven't updated the tree since early Ap=
ril,
before going on paternity leave. But I'll handle that separately if it
happens; this is just the stuff that's been in linux-next for the last
few weeks in my own tree (ignoring Artem's tree).

Alexander Shiyan (2):
      mtd: nand_base: Removed unnecessary command masking
      mtd: nand_base: Removed unnecessary cleaning "onfi_version" variable

Arnd Bergmann (1):
      mtd: remove h720x flash support

Artem Bityutskiy (44):
      mtd: nand_ids: minor clean-ups
      mtd: decommission the NAND museum
      arm: defconfigs: lpc32xx_defconfig: remove the museum NAND option
      mtd: nand: remove the rtc_from4 driver support
      mtd: nand: remove AG-AND support
      mtd: nand: remove a bunch of unused commands
      mtd: nand: remove NAND_NO_PADDING macro
      mtd: nand: remove NAND_COPYBACK macro
      mtd: nand: use NAND_HAS_CACHEPROG
      mtd: nand: rename the id field of 'struct nand_flash_dev'
      mtd: nand: remove few tiny page NAND bits
      mtd: nand_ids: introduce helper macros
      mtd: nand: provision full ID support
      mtd: doc: remove support for DoC 2000/2001/2001+
      mtd: remove the dbox2-flash map driver
      mtd: remove the dmv182 map driver
      mtd: remove the mbx860 map driver
      mtd: maps: kill the rpxlite map driver
      mtd: remove the tqm8xxl map driver
      mtd: remove the dilnetpc map driver support
      mtd: remove the ixp2000 map driver
      mtd: add 'const' qualifier to a couple of register functions
      mtd: plat-ram: add const quilifiers
      mtd: physmap: add const qualifiers
      bcma_mips: add a const qualifier
      ssb: driver_mipscore: add a const qualifier
      mtd: physmap_of: add const qualifiers
      mtd: maps: add const qualifiers
      mtd: devices: add const qualifiers
      mtd: mtdcore: use const qualifier
      mtd: nand: use more reasonable integer types
      mtd: introduce a macro for max NAND ID sequence length
      mtd: remove the ppchameleonevb NAND driver
      mtd: remove the h1910 NAND driver
      mtd: mtdcore: remove few useless #ifdef's
      mtd: mtdchar: use proper kernel print level
      mtd: mtdcore: cleanup mtdcore.h a little
      mtd: merge mtdchar module with mtdcore
      Documentation: mtd: amend the sysfs docs after mtdchar merge
      arm: mach-pxa: amend Kconfig after mtdchar merge
      arch: cris: amend Kconfig after mtdchar merge
      mtd: onenand: remove OneNAND simulator
      mtd: nand_ids: improve LEGACY_ID_NAND macro a bit
      mtd: nand_ids: use size macros

Brian Norris (1):
      mtd: m25p80: n25q064 is Micron, not Intel/Numonyx

Daniel Mack (1):
      mtd: devices: elm: check for device's presence before configuration

Daniel Schwierzeck (2):
      mtd: m25p80: add support for Macronix MX66L51235L
      mtd: m25p80: add support for EON EN25QH256

Gupta, Pekon (1):
      mtd: nand: subpage write support for hardware based ECC schemes

Huang Shijie (3):
      mtd: add new fields to nand_flash_dev{}
      mtd: add the support to parse out the full-id nand type
      mtd: add 4 Toshiba nand chips for the full-id case

Jingoo Han (7):
      mtd: doc: use module_platform_driver_probe()
      mtd: orion_nand: use module_platform_driver_probe()
      mtd: atmel_nand: use module_platform_driver_probe()
      mtd: fsmc_nand: use module_platform_driver_probe()
      mtd: sh_flctl: use module_platform_driver_probe()
      mtd: txx9ndfmc: use module_platform_driver_probe()
      mtd: davinci_nand: use module_platform_driver_probe()

Joe Schaack (1):
      mtd: ofpart: support partitions of 4 GiB and larger

Krzysztof Mazur (2):
      mtd: m25p80: introduce SST_WRITE flag for SST byte programming
      mtd: m25p80: add support for SST25VF064C

Rafa=C5=82 Mi=C5=82ecki (4):
      mtd: m25p80: add entry for w25q128
      mtd: bcm47xxsflash: keep a reference to the BCMA
      mtd: bcm47xxsflash: store info about flash type
      mtd: bcm47xxsflash: define opcodes

Sachin Kamat (11):
      mtd: dataflash: Use of_match_ptr() macro
      mtd: davinci_nand: Use of_match_ptr()
      mtd: gpio: Use devm_kzalloc()
      mtd: gpio: Use of_match_ptr() macro
      mtd: sh_flctl: Use of_match_ptr() macro
      mtd: denali_dt: Fix incorrect error check
      mtd: denali_dt: Use module_platform_driver()
      mtd: denali_dt: Change return value to fix smatch warning
      mtd: denali_dt: Remove redundant use of of_match_ptr
      mtd: bf5xx_nand: Use module_platform_driver()
      mtd: omap2: Use module_platform_driver()

Syam Sidhardhan (1):
      mtd: maps: Remove redundant NULL check before kfree

Toan Pham (1):
      mtd: omap2: use msecs_to_jiffies()

Uwe Kleine-K=C3=B6nig (1):
      mtd: mtdchar: handle chips that have user otp but no factory otp

 Documentation/ABI/testing/sysfs-class-mtd          |    6 +-
 .../devicetree/bindings/mtd/partition.txt          |   36 +-
 arch/arm/configs/lpc32xx_defconfig                 |    1 -
 arch/arm/mach-pxa/Kconfig                          |    1 -
 arch/cris/Kconfig                                  |    1 -
 arch/cris/arch-v32/drivers/Kconfig                 |    1 -
 drivers/bcma/driver_mips.c                         |    2 +-
 drivers/mtd/Kconfig                                |   13 -
 drivers/mtd/Makefile                               |    3 +-
 drivers/mtd/chips/Kconfig                          |    1 -
 drivers/mtd/devices/Kconfig                        |   64 --
 drivers/mtd/devices/Makefile                       |    5 -
 drivers/mtd/devices/bcm47xxsflash.c                |   13 +-
 drivers/mtd/devices/bcm47xxsflash.h                |   59 +
 drivers/mtd/devices/doc2000.c                      | 1178 ----------------=
----
 drivers/mtd/devices/doc2001.c                      |  824 --------------
 drivers/mtd/devices/doc2001plus.c                  | 1080 ----------------=
--
 drivers/mtd/devices/docecc.c                       |  521 ---------
 drivers/mtd/devices/docg3.c                        |   15 +-
 drivers/mtd/devices/docprobe.c                     |  325 ------
 drivers/mtd/devices/elm.c                          |    9 +-
 drivers/mtd/devices/m25p80.c                       |   25 +-
 drivers/mtd/devices/mtd_dataflash.c                |    4 +-
 drivers/mtd/maps/Kconfig                           |   77 --
 drivers/mtd/maps/Makefile                          |    8 -
 drivers/mtd/maps/bfin-async-flash.c                |    3 +-
 drivers/mtd/maps/ck804xrom.c                       |    3 +-
 drivers/mtd/maps/dbox2-flash.c                     |  123 --
 drivers/mtd/maps/dc21285.c                         |    3 +-
 drivers/mtd/maps/dilnetpc.c                        |  496 ---------
 drivers/mtd/maps/dmv182.c                          |  146 ---
 drivers/mtd/maps/gpio-addr-flash.c                 |    3 +-
 drivers/mtd/maps/h720x-flash.c                     |  120 --
 drivers/mtd/maps/impa7.c                           |    7 +-
 drivers/mtd/maps/intel_vr_nor.c                    |    4 +-
 drivers/mtd/maps/ixp2000.c                         |  253 -----
 drivers/mtd/maps/ixp4xx.c                          |    2 +-
 drivers/mtd/maps/lantiq-flash.c                    |    3 +-
 drivers/mtd/maps/mbx860.c                          |   98 --
 drivers/mtd/maps/pci.c                             |    3 +-
 drivers/mtd/maps/physmap.c                         |   17 +-
 drivers/mtd/maps/physmap_of.c                      |   16 +-
 drivers/mtd/maps/plat-ram.c                        |    2 +-
 drivers/mtd/maps/pxa2xx-flash.c                    |    4 +-
 drivers/mtd/maps/rbtx4939-flash.c                  |    5 +-
 drivers/mtd/maps/rpxlite.c                         |   64 --
 drivers/mtd/maps/sa1100-flash.c                    |    2 +-
 drivers/mtd/maps/solutionengine.c                  |    2 +-
 drivers/mtd/maps/tqm8xxl.c                         |  249 -----
 drivers/mtd/maps/tsunami_flash.c                   |    5 +-
 drivers/mtd/mtdchar.c                              |   52 +-
 drivers/mtd/mtdcore.c                              |   26 +-
 drivers/mtd/mtdcore.h                              |   30 +-
 drivers/mtd/mtdpart.c                              |    4 +-
 drivers/mtd/nand/Kconfig                           |   30 -
 drivers/mtd/nand/Makefile                          |    3 -
 drivers/mtd/nand/atmel_nand.c                      |   15 +-
 drivers/mtd/nand/bf5xx_nand.c                      |   16 +-
 drivers/mtd/nand/cafe_nand.c                       |   10 +-
 drivers/mtd/nand/davinci_nand.c                    |   16 +-
 drivers/mtd/nand/denali_dt.c                       |   18 +-
 drivers/mtd/nand/docg4.c                           |   13 +-
 drivers/mtd/nand/fsmc_nand.c                       |   13 +-
 drivers/mtd/nand/gpio.c                            |    8 +-
 drivers/mtd/nand/h1910.c                           |  167 ---
 drivers/mtd/nand/lpc32xx_mlc.c                     |    4 +-
 drivers/mtd/nand/nand_base.c                       |  233 ++--
 drivers/mtd/nand/nand_bbt.c                        |   25 -
 drivers/mtd/nand/nand_ids.c                        |  242 ++--
 drivers/mtd/nand/nandsim.c                         |   24 +-
 drivers/mtd/nand/nuc900_nand.c                     |    9 -
 drivers/mtd/nand/omap2.c                           |    9 +-
 drivers/mtd/nand/orion_nand.c                      |   13 +-
 drivers/mtd/nand/ppchameleonevb.c                  |  403 -------
 drivers/mtd/nand/pxa3xx_nand.c                     |    2 +-
 drivers/mtd/nand/rtc_from4.c                       |  624 -----------
 drivers/mtd/nand/sh_flctl.c                        |   16 +-
 drivers/mtd/nand/sm_common.c                       |   62 +-
 drivers/mtd/nand/txx9ndfmc.c                       |   13 +-
 drivers/mtd/ofpart.c                               |    7 +-
 drivers/mtd/onenand/Kconfig                        |    7 -
 drivers/mtd/onenand/Makefile                       |    3 -
 drivers/mtd/onenand/omap2.c                        |   14 +-
 drivers/mtd/onenand/onenand_sim.c                  |  564 ----------
 drivers/ssb/driver_mipscore.c                      |    2 +-
 include/linux/mtd/mtd.h                            |    8 +-
 include/linux/mtd/nand.h                           |  121 +-
 include/linux/mtd/physmap.h                        |    2 +-
 include/linux/mtd/plat-ram.h                       |    4 +-
 include/linux/platform_data/elm.h                  |    2 +-
 90 files changed, 602 insertions(+), 8137 deletions(-)


--=20
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

--=-V3L6BuGpLxcKKjgQXUtT
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
DxcNMTMwNTA5MTYwMjUyWjAjBgkqhkiG9w0BCQQxFgQUD0fAmDSH1qTmttSKT8A46vUq8rUwgaUG
CSsGAQQBgjcQBDGBlzCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4x
KzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0
YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMGhc4wgacGCyqG
SIb3DQEJEAILMYGXoIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjEr
MCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3Rh
cnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwaFzjANBgkqhkiG
9w0BAQEFAASCAQCzwo2bi89WK5jABL8NcbCeQzz5s1EGgxXajN52k23eOtK3k15rqu3dWoAFrYUO
Pec9jtaBVia4gLfJe0JZ29sI/5RNoySnl+jH3aYeXwdrBClW1jWJW90iPnje96sm+3ShLDMLHDKQ
GLLyxC8CUTh49BZs3k3iRT0V/h1+p9OOuHE8+0pb4vvX+SDfrYTzgzRjDgSqTDXqrUek868kp4Wo
k77SeU2RxXBQdIDGg7KaA5gefxBe+ntG+IHofZvF6AOfScZIeZiRlBEzdazKQJk3iuy2Lj4v63YQ
io6SvkP6YH4qdUTzdEkf0w/0wuDvq00Y4wMYY2ehqbW4BN0ZqaZ/AAAAAAAA


--=-V3L6BuGpLxcKKjgQXUtT--
