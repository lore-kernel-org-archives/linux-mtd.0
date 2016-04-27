Date: Wed, 27 Apr 2016 10:06:27 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: John Crispin <blogic@openwrt.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 erin.lo@mediatek.com, "Steven Liu (=?UTF-8?B?5YqJ5Lq66LGq?=)"
 <steven.liu@mediatek.com>, "Sean Wang (=?UTF-8?B?546L5b+X5LqY?=)"
 <sean.wang@mediatek.com>
Subject: Re: MTK Smart Device Gen1 NAND Driver - Testing on MT7623
Message-ID: <20160427100627.63b148c3@bbrezillon>
In-Reply-To: <e397161c-2fe8-7e9d-c34f-adf5e91a99d7@openwrt.org>
References: <e397161c-2fe8-7e9d-c34f-adf5e91a99d7@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

On Wed, 27 Apr 2016 08:36:21 +0200
John Crispin <blogic@openwrt.org> wrote:

> Hi Jorge,
> 
> I have been testing version 3 of the driver on the MT7623 with limited
> success and was hoping you could shed some light on the problems I am seeing
> 
> the driver loads
> 
> [    1.924633] nand: device found, Manufacturer ID: 0xef, Chip ID: 0xda
> [    1.930941] nand: Unknown W29N02GV
> [    1.934386] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048,
> OOB size: 64
> [    1.942869] Bad block table not found for chip 0
> [    1.948320] Bad block table not found for chip 0
> [    1.952926] Scanning device for bad blocks
> [    2.411339] Bad eraseblock 2046 at 0x00000ffc0000
> [    2.416251] Bad eraseblock 2047 at 0x00000ffe0000
> [    2.422096] Bad block table written to 0x00000ffa0000, version 0x01
> [    2.429426] Bad block table written to 0x00000ff80000, version 0x01
> [    2.435966] 6 ofpart partitions found on MTD device mtk-nand
> [    2.441578] Creating 6 MTD partitions on "mtk-nand":
> [    2.446523] 0x000000000000-0x000000400000 : "pl"
> [    2.452256] 0x0000000c0000-0x000000100000 : "uboot-env"
> [    2.458381] 0x000000100000-0x000000140000 : "factory"
> [    2.464300] 0x000000140000-0x000002140000 : "kernel"
> [    2.470419] 0x000002140000-0x000004140000 : "recovery"
> [    2.476780] 0x000004140000-0x000005140000 : "rootfs"
> 
> but when i try to access the mtd devices i get an error
> 
> root@OpenWrt:/# hexdump -C /dev/mtd1
> [  165.752134] mtk-ecc 1100e000.ecc: decoder NOT idle
> [  166.251999] mtk-nand 1100d000.nfi: read ahb/dma done timeout
> [  166.757624] mtk-nand 1100d000.nfi: subpage done timeout
> [  167.262834] mtk-ecc 1100e000.ecc: decoder NOT idle
> hexdump: /dev/mtd1: I/O error
> 
> the devicetree i am using is this
> 
> &nandc {
>         status = "okay";
>         pinctrl-names = "default";
>         pinctrl-0 = <&nand_pins_default>;
>         nand@0 {
>                 reg = <0>;
>                 spare_per_sector = <64>;

If I understood the meaning of spare_per_sector correctly, this should
be 32 (you have 2K pages and 1024 bytes sectors, so you have 2 sectors
and want to equally assign the 64 OOB bytes to those sectors =>
64 / 2 = 32).

Anyway, hopefully all this complexity will be gone in the next version
along with the need to define nand-ecc-strength and nand-ecc-step-size
(which should be part of the NAND chip detection unless you really
need to overload them).

>                 nand-on-flash-bbt;
>                 nand-ecc-mode = "hw";
>                 nand-ecc-strength = <12>;
>                 nand-ecc-step-size = <1024>;
>                 partitions {
>                         compatible = "fixed-partitions";
>                         #address-cells = <1>;
>                         #size-cells = <1>;
> 
>                         partition@C0000 {
>                                 label = "uboot-env";
>                                 reg = <0xC0000 0x40000>;
>                         };
> 
>                         partition@100000 {
>                                 label = "factory";
>                                 reg = <0x100000 0x40000>;
>                         };
> 
>                         partition@140000 {
>                                 label = "kernel";
>                                 reg = <0x140000 0x2000000>;
>                         };
> 
>                         partition@2140000 {
>                                 label = "recovery";
>                                 reg = <0x2140000 0x2000000>;
>                         };
> 
>                         partition@4140000 {
>                                 label = "rootfs";
>                                 reg = <0x4140000 0x1000000>;
>                         };
>                 };
>         };
> };


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
