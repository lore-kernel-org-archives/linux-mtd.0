Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQTcW-0004pK-4I
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 05:35:23 +0000
Date: Tue, 02 Feb 2016 13:33:23 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Bean Huo <jackyard88@gmail.com>
Cc: peterpandong@micron.com, zszubbocsev@micron.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 beanhuo@micron.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, adrian.hunter@intel.com,
 dedekind1@gmail.com, richard@nod.at
Subject: [linux-review:Bean-Huo/Add-a-bakvol-module-in-UBI-layer-for-MLC-paired-page-power-loss-issue/20160202-104450]
 2078d3920abf1d89be7eaf087100b4482dd532dc BUILD DONE
Message-ID: <56b03fa3.ILQE1YeQksZswJXk%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

https://github.com/0day-ci/linux  Bean-Huo/Add-a-bakvol-module-in-UBI-layer-for-MLC-paired-page-power-loss-issue/20160202-104450
2078d3920abf1d89be7eaf087100b4482dd532dc  drivers:mtd:ubi: Kconfig Makefile

drivers/mtd/mtdpart.c:213:26: error: implicit declaration of function 'PART' [-Werror=implicit-function-declaration]
drivers/mtd/mtdpart.c:213:26: warning: initialization makes pointer from integer without a cast
drivers/mtd/mtdpart.c:213:26: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/mtd/mtdpart.c:213:26: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/mtd/mtdpart.c:213:9: error: implicit declaration of function 'PART'
drivers/mtd/mtdpart.c:213:9: error: implicit declaration of function 'PART' [-Werror=implicit-function-declaration]
drivers/mtd/mtdpart.c:213: error: implicit declaration of function 'PART'
drivers/mtd/mtdpart.c:213: warning: initialization makes pointer from integer without a cast
drivers/mtd/nand/nand_base.c:2463:12: error: too few arguments to function 'chip->ecc.write_page_raw'
drivers/mtd/nand/nand_base.c:2463:50: sparse: not enough arguments for function write_page_raw
drivers/mtd/nand/nand_base.c:2464:8: error: too few arguments to function 'chip->ecc.write_page_raw'
drivers/mtd/nand/nand_base.c:2464: error: too few arguments to function 'chip->ecc.write_page_raw'
drivers/mtd/nand/nand_base.c:2466:12: error: too few arguments to function 'chip->ecc.write_subpage'
drivers/mtd/nand/nand_base.c:2466:49: sparse: not enough arguments for function write_subpage
drivers/mtd/nand/nand_base.c:2467:8: error: too few arguments to function 'chip->ecc.write_subpage'
drivers/mtd/nand/nand_base.c:2467: error: too few arguments to function 'chip->ecc.write_subpage'
drivers/mtd/nand/nand_base.c:2469:12: error: too few arguments to function 'chip->ecc.write_page'
drivers/mtd/nand/nand_base.c:2469:3: error: too few arguments to function 'chip->ecc.write_page'
drivers/mtd/nand/nand_base.c:2469:46: sparse: not enough arguments for function write_page
drivers/mtd/nand/nand_base.c:2469: error: too few arguments to function 'chip->ecc.write_page'
drivers/mtd/ubi/bakvol.c:1211:1-15: ERROR: reference preceded by free on line 1210
drivers/mtd/ubi/bakvol.c:651:3: note: in expansion of macro 'ubi_err'
drivers/mtd/ubi/bakvol.c:862:17-28: ERROR: ubi -> bkblk_tbl is NULL but dereferenced.
drivers/mtd/ubi/eba.c:607:8: error: too few arguments to function 'ubi_io_write_data'
drivers/mtd/ubi/fastmap.c:1315:9: error: too few arguments to function 'ubi_io_write'
drivers/mtd/ubi/io.c:235:5: error: conflicting types for 'ubi_io_write'
drivers/mtd/ubi/io.c:242:6: warning: unused variable 'skip' [-Wunused-variable]
drivers/mtd/ubi/io.c:242: warning: unused variable 'skip'
drivers/mtd/ubi/io.c:321:5: note: in expansion of macro 'ubi_err'
drivers/mtd/ubi/io.c:321:5: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
drivers/mtd/ubi/io.c:321:5: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
drivers/mtd/ubi/ubi.h:59:32: note: in expansion of macro 'pr_err'
include/linux/mtd/nand.h:739: warning: No description found for parameter 'write_plane_page'

Error ids grouped by kconfigs:

recent_errors
├── alpha-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-size_t
├── arm-at91_dt_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── arm-efm32_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── arm-ep93xx_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── arm-multi_v5_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── arm-multi_v7_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── arm-realview_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── arm-shmobile_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── arm-spear6xx_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── avr32-atngw100_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── avr32-atstk1006_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── blackfin-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-size_t
├── blackfin-BF526-EZBRD_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── blackfin-BF533-EZKIT_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── blackfin-BF561-EZKIT-SMP_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── blackfin-TCM-BF537_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── cris-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── cris-etrax-100lx_v2_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── i386-allmodconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   ├── drivers-mtd-ubi-bakvol.c:ERROR:reference-preceded-by-free-on-line
│   └── drivers-mtd-ubi-bakvol.c:ERROR:ubi-bkblk_tbl-is-NULL-but-dereferenced.
├── i386-allnoconfig
│   └── include-linux-mtd-nand.h:warning:No-description-found-for-parameter-write_plane_page
├── i386-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── i386-randconfig-a0-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── i386-randconfig-h0-02021003
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── i386-randconfig-i0-01311849
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── i386-randconfig-i1-01311849
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── i386-randconfig-n0-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── i386-randconfig-r0-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── i386-randconfig-s0-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── i386-randconfig-s1-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── i386-randconfig-x000-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── i386-randconfig-x001-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── i386-randconfig-x002-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── i386-randconfig-x003-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── i386-randconfig-x004-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── i386-randconfig-x006-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── i386-randconfig-x007-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── i386-randconfig-x008-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── i386-randconfig-x009-02010231
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── ia64-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-size_t
├── m32r-mappi3.smp_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── m32r-usrv_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── m68k-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── m68k-m5475evb_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── microblaze-mmu_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── microblaze-nommu_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── mips-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── mips-fuloong2e_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── mips-txx9
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── mn10300-asb2364_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── parisc-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── powerpc-ksi8560_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── sh-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── sh-apsh4ad0a_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── sh-sh7785lcr_32bit_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── sh-titan_defconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── sparc64-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-size_t
├── sparc-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-size_t
├── tile-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-size_t
├── x86_64-acpi-redef
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── x86_64-allmodconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   ├── drivers-mtd-nand-nand_base.c:sparse:not-enough-arguments-for-function-write_page
│   ├── drivers-mtd-nand-nand_base.c:sparse:not-enough-arguments-for-function-write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:sparse:not-enough-arguments-for-function-write_subpage
│   └── drivers-mtd-ubi-bakvol.c:note:in-expansion-of-macro-ubi_err
├── x86_64-allyesconfig
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   ├── drivers-mtd-ubi-io.c:note:in-expansion-of-macro-ubi_err
│   └── drivers-mtd-ubi-ubi.h:note:in-expansion-of-macro-pr_err
├── x86_64-allyesdebian
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── x86_64-randconfig-i0-01311808
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── x86_64-randconfig-s4-02021106
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
├── x86_64-randconfig-s5-02021106
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── x86_64-randconfig-x001-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── x86_64-randconfig-x004-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── x86_64-randconfig-x005-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── x86_64-randconfig-x007-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── x86_64-randconfig-x009-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   └── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
├── x86_64-randconfig-x012-201605
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
│   ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage
│   ├── drivers-mtd-ubi-eba.c:error:too-few-arguments-to-function-ubi_io_write_data
│   ├── drivers-mtd-ubi-io.c:error:conflicting-types-for-ubi_io_write
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
├── x86_64-randconfig-x018-201605
│   └── drivers-mtd-ubi-fastmap.c:error:too-few-arguments-to-function-ubi_io_write
├── x86_64-rhel
│   ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
│   ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
│   └── drivers-mtd-ubi-io.c:warning:unused-variable-skip
└── xtensa-allyesconfig
    ├── drivers-mtd-mtdpart.c:error:implicit-declaration-of-function-PART
    ├── drivers-mtd-mtdpart.c:warning:initialization-makes-pointer-from-integer-without-a-cast
    ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page
    ├── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_page_raw
    └── drivers-mtd-nand-nand_base.c:error:too-few-arguments-to-function-chip-ecc.write_subpage

elapsed time: 167m

configs tested: 121

i386                     randconfig-a0-201605
x86_64                 randconfig-a0-02021019
blackfin                BF526-EZBRD_defconfig
blackfin                BF533-EZKIT_defconfig
blackfin            BF561-EZKIT-SMP_defconfig
blackfin                  TCM-BF537_defconfig
cris                 etrax-100lx_v2_defconfig
i386                               tinyconfig
arm                              allmodconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
x86_64                             acpi-redef
x86_64                           allyesdebian
x86_64                                nfsroot
alpha                               defconfig
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
i386                             allmodconfig
arm                        spear6xx_defconfig
blackfin                BF609-EZKIT_defconfig
m68k                            mac_defconfig
tile                                defconfig
x86_64                 randconfig-x012-201605
x86_64                 randconfig-x014-201605
x86_64                 randconfig-x017-201605
x86_64                 randconfig-x011-201605
x86_64                 randconfig-x019-201605
x86_64                 randconfig-x013-201605
x86_64                 randconfig-x015-201605
x86_64                 randconfig-x016-201605
x86_64                 randconfig-x010-201605
x86_64                 randconfig-x018-201605
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
i386                     randconfig-s0-201605
i386                     randconfig-s1-201605
x86_64                           allmodconfig
x86_64                 randconfig-s3-02021106
x86_64                 randconfig-s4-02021106
x86_64                 randconfig-s5-02021106
avr32                      atngw100_defconfig
avr32                     atstk1006_defconfig
frv                                 defconfig
mn10300                     asb2364_defconfig
openrisc                    or1ksim_defconfig
tile                         tilegx_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                                   jz4740
mips                                     txx9
x86_64                 randconfig-i0-01311808
sparc                               defconfig
sparc64                           allnoconfig
sparc64                             defconfig
arm                          ep93xx_defconfig
arm                        realview_defconfig
mips                             alldefconfig
powerpc                     ksi8560_defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
i386                   randconfig-i0-01311849
i386                   randconfig-i1-01311849
m32r                       m32104ut_defconfig
m32r                     mappi3.smp_defconfig
m32r                         opsput_defconfig
m32r                           usrv_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
x86_64                                    lkp
x86_64                                   rhel
i386                     randconfig-n0-201605
i386                             allyesconfig
i386                   randconfig-h0-02021003
i386                   randconfig-h1-02021003
sh                        apsh4ad0a_defconfig
x86_64                 randconfig-n0-02021102
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
x86_64                 randconfig-x004-201605
x86_64                 randconfig-x002-201605
x86_64                 randconfig-x000-201605
x86_64                 randconfig-x009-201605
x86_64                 randconfig-x006-201605
x86_64                 randconfig-x005-201605
x86_64                 randconfig-x003-201605
x86_64                 randconfig-x001-201605
x86_64                 randconfig-x007-201605
x86_64                 randconfig-x008-201605
ia64                             alldefconfig
ia64                              allnoconfig
ia64                                defconfig
i386                     randconfig-r0-201605
i386                 randconfig-x003-02010231
i386                 randconfig-x009-02010231
i386                 randconfig-x002-02010231
i386                 randconfig-x004-02010231
i386                 randconfig-x007-02010231
i386                 randconfig-x001-02010231
i386                 randconfig-x006-02010231
i386                 randconfig-x008-02010231
i386                 randconfig-x005-02010231
i386                 randconfig-x000-02010231

Thanks,
Fengguang
