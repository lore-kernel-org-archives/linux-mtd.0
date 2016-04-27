To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erin.lo@mediatek.com,
 =?UTF-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
 =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>
From: John Crispin <blogic@openwrt.org>
Subject: MTK Smart Device Gen1 NAND Driver - Testing on MT7623
Message-ID: <e397161c-2fe8-7e9d-c34f-adf5e91a99d7@openwrt.org>
Date: Wed, 27 Apr 2016 08:36:21 +0200
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

Hi Jorge,

I have been testing version 3 of the driver on the MT7623 with limited
success and was hoping you could shed some light on the problems I am seeing

the driver loads

[    1.924633] nand: device found, Manufacturer ID: 0xef, Chip ID: 0xda
[    1.930941] nand: Unknown W29N02GV
[    1.934386] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048,
OOB size: 64
[    1.942869] Bad block table not found for chip 0
[    1.948320] Bad block table not found for chip 0
[    1.952926] Scanning device for bad blocks
[    2.411339] Bad eraseblock 2046 at 0x00000ffc0000
[    2.416251] Bad eraseblock 2047 at 0x00000ffe0000
[    2.422096] Bad block table written to 0x00000ffa0000, version 0x01
[    2.429426] Bad block table written to 0x00000ff80000, version 0x01
[    2.435966] 6 ofpart partitions found on MTD device mtk-nand
[    2.441578] Creating 6 MTD partitions on "mtk-nand":
[    2.446523] 0x000000000000-0x000000400000 : "pl"
[    2.452256] 0x0000000c0000-0x000000100000 : "uboot-env"
[    2.458381] 0x000000100000-0x000000140000 : "factory"
[    2.464300] 0x000000140000-0x000002140000 : "kernel"
[    2.470419] 0x000002140000-0x000004140000 : "recovery"
[    2.476780] 0x000004140000-0x000005140000 : "rootfs"

but when i try to access the mtd devices i get an error

root@OpenWrt:/# hexdump -C /dev/mtd1
[  165.752134] mtk-ecc 1100e000.ecc: decoder NOT idle
[  166.251999] mtk-nand 1100d000.nfi: read ahb/dma done timeout
[  166.757624] mtk-nand 1100d000.nfi: subpage done timeout
[  167.262834] mtk-ecc 1100e000.ecc: decoder NOT idle
hexdump: /dev/mtd1: I/O error

the devicetree i am using is this

&nandc {
        status = "okay";
        pinctrl-names = "default";
        pinctrl-0 = <&nand_pins_default>;
        nand@0 {
                reg = <0>;
                spare_per_sector = <64>;
                nand-on-flash-bbt;
                nand-ecc-mode = "hw";
                nand-ecc-strength = <12>;
                nand-ecc-step-size = <1024>;
                partitions {
                        compatible = "fixed-partitions";
                        #address-cells = <1>;
                        #size-cells = <1>;

                        partition@C0000 {
                                label = "uboot-env";
                                reg = <0xC0000 0x40000>;
                        };

                        partition@100000 {
                                label = "factory";
                                reg = <0x100000 0x40000>;
                        };

                        partition@140000 {
                                label = "kernel";
                                reg = <0x140000 0x2000000>;
                        };

                        partition@2140000 {
                                label = "recovery";
                                reg = <0x2140000 0x2000000>;
                        };

                        partition@4140000 {
                                label = "rootfs";
                                reg = <0x4140000 0x1000000>;
                        };
                };
        };
};

&bch {
        status = "okay";
};

and the relevant part of the bootlog from the SDK kernel is this one

[    7.387419] (3)[1:swapper/0]flash_number: 0xb ,then print the flashtable
[    7.394249] (3)[1:swapper/0]gen_FlashTable_p[0].devciename: W29N01GV
[    7.400541] (3)[1:swapper/0]gen_FlashTable_p[1].devciename: W29N02GV
[    7.406890] (3)[1:swapper/0]gen_FlashTable_p[2].devciename: W29N04GV
[    7.413276] (3)[1:swapper/0]gen_FlashTable_p[3].devciename: MX30LF1G18AC
[    7.419985] (3)[1:swapper/0]gen_FlashTable_p[4].devciename: MX30LF2G18AC
[    7.426716] (3)[1:swapper/0]gen_FlashTable_p[5].devciename: MX30LF4G18AC
[    7.433436] (3)[1:swapper/0]gen_FlashTable_p[6].devciename: MX60LF8G18AC
[    7.440145] (3)[1:swapper/0]gen_FlashTable_p[7].devciename:
S34ML01G200TFI
[    7.447048] (3)[1:swapper/0]gen_FlashTable_p[8].devciename:
S34ML02G200TFI
[    7.453940] (3)[1:swapper/0]gen_FlashTable_p[9].devciename:
S34ML04G200TFI
[    7.460833] (3)[1:swapper/0]gen_FlashTable_p[10].devciename:
S34ML08G201TFI
[    7.467797]Recognize NAND: ID [ef da 90 95 4 ], Device Name
[W29N02GV], Page Size [2048]B Spare Size [64]B Total Size [256]MB
[    7.479008] (3)[1:swapper/0]Nand cs[1] not support(0,0)
[    7.484204] (3)[1:swapper/0][NAND]EFUSE RANDOM CFG is OFF
[    7.489511] (3)[1:swapper/0]SLC NAND
[    7.493137] (3)[1:swapper/0][NAND]select ecc bit:12, sparesize :64
[    7.499175] (3)[1:swapper/0][NSS] idx: 0, buf: 0xC25F7000
[    7.504525] (3)[1:swapper/0][NSS] idx: 1, buf: 0xC4541000
[    7.509849] (3)[1:swapper/0][NSS] idx: 2, buf: 0xC4542000
[    7.515199] (3)[1:swapper/0][NSS] idx: 3, buf: 0xC4543000
[    7.520550] (3)[1:swapper/0][NSS] Init OK, cnt: 4, aligned size: 64
[    7.526739] (3)[1:swapper/0][Bean]nand_chip->chipsize : 256MB
[    7.532429] (3)[1:swapper/0][bayi]0x78
[    7.536207] (3)[1:swapper/0][mtk_nand_interface_config] legacy interface
[    7.542938] (3)[1:swapper/0]Init bmt table, size: 120
[    7.547924] (3)[1:swapper/0]mtd_bmt: c4540a40, nand_chip_bmt: c4540800
[    7.554395] (3)[1:swapper/0]bmt count: 120, system count: 1928
[    7.560161] (3)[1:swapper/0][load_bmt_data]: begin to search BMT from
block 0x7ff
[    7.568168] (3)[1:swapper/0]Bad block detected at 0x1ffc0, oob_buf[0]
is 0xaa
[    7.575096] (3)[1:swapper/0]Skip bad block: 2047
[    7.580213] (3)[1:swapper/0]Bad block detected at 0x1ff80, oob_buf[0]
is 0x0
[    7.587052] (3)[1:swapper/0]Skip bad block: 2046
[    7.593258] (3)[1:swapper/0]Match bmt signature @ block: 0x7fd
[    7.598883] (3)[1:swapper/0]BMT Checksum is: 0x1
[    7.603458] (3)[1:swapper/0]Valid BMT, version v1
[    7.608098] (3)[1:swapper/0]bmt found at block: 2045, mapped block: 0
[    7.614484] (3)[1:swapper/0]Load bmt data success @ block 0x7fd
[    7.620331] (3)[1:swapper/0]BMT v1. total 0 mapping:
[    7.626402] (3)[1:swapper/0]partition PRELOADER Preloader size 0
[    7.632213] (3)[1:swapper/0]partition UBOOT Uboot size 40000
[    7.637795] (3)[1:swapper/0]partition CONFIG Config size c0000
[    7.643580] (3)[1:swapper/0]partition FACTORY Factory size 100000
[    7.649599] (3)[1:swapper/0]partition BOOTIMG Bootimg size 140000
[    7.655640] (3)[1:swapper/0]partition RECOVERY Recovery size 2140000
[    7.661929] (3)[1:swapper/0]partition ROOTFS Rootfs size 4140000
[    7.667863] (3)[1:swapper/0]partition USRDATA Usrdata size 5140000
[    7.674651] (3)[1:swapper/0]Creating 8 MTD partitions on "MTK-Nand":
[    7.680817] (3)[1:swapper/0]0x000000000000-0x000000040000 : "Preloader"
[    7.689127] (3)[1:swapper/0]0x000000040000-0x0000000c0000 : "Uboot"
[    7.698060] (3)[1:swapper/0]0x0000000c0000-0x000000100000 : "Config"
[    7.705942] (3)[1:swapper/0]0x000000100000-0x000000140000 : "Factory"
[    7.713858] (3)[1:swapper/0]0x000000140000-0x000002140000 : "boot"
[    7.867105] (3)[1:swapper/0]0x000002140000-0x000004140000 : "Recovery"
[    8.022024] (3)[1:swapper/0]0x000004140000-0x000005140000 : "Rootfs"
[    8.102713] (3)[1:swapper/0]0x000005140000-0x00000f0c0000 : "userdata"
[    8.847181] (3)[1:swapper/0][mtk_nand] probe successfully!

looking at the code, it seems that the ecc core is not idle, and this is
also what the error messges tell us. I compared the registers between
the driver and those present on the MT7623 and they are identical by the
look of things. I am told by MTK that the core is identical to MT2701 in
regards to NAND, even IRQ, clocks, pins are the same.

i had to fiddle with nand-ecc-strength and spare_per_sector to make the
driver load and am not sure if the changes are correct and might be
causing these issues.

do you have any idea what might be wrong ?

	John
