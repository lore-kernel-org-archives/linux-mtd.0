Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
 xiaolei li <xiaolei.li@mediatek.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <f887fa30-2205-c102-bade-0071b3ee6b1f@openwrt.org>
 <1462165406.8414.196.camel@mhfsdcap03>
 <676c2485-e176-4182-2400-201074b36ca3@openwrt.org>
 <57273C40.6000407@linaro.org>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 robh@kernel.org, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
From: John Crispin <blogic@openwrt.org>
Message-ID: <f33d40d2-42a5-8c43-037a-aee197ee1ce9@openwrt.org>
Date: Mon, 2 May 2016 19:43:08 +0200
MIME-Version: 1.0
In-Reply-To: <57273C40.6000407@linaro.org>
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



On 02/05/2016 13:38, Jorge Ramirez wrote:
> 
> 
> On 05/02/2016 02:13 AM, John Crispin wrote:
>> Hi,
>>
>>> Your ecc-strength setting is wrong, because your nand device's OOB size
>>> is not enough to store 24 bit ecc parity data.
>>> For this nand, its ecc-strength is max 12 bit per 1024B for our
>>> controller.
>>> You can get the setting as mtk-nand DT Documentation description.
>> i tried 12 aswell and it also gives an error. the problem with the
>> documentation is that FDM is unknown to me.
>>
>>
>>> Because the ecc-size and ecc-strength settings are optional, so if you
>>> are not sure how to set them, you can remove the setting from DT file.
>> tried that just now, the driver defaults to 12 and problem remains
> 
> can you send the boot log letting the driver use its own calculated values?
> ie, just don't specify any of the controller optional values in the
> device tree and let the driver calculate them for you.
> 
> Also instead of a read operation, can you try the oobtest?
> you will have to insmod or modprobe "mtd_oobtest dev="
> 
> I don't have the spec for the MT7623 but maybe also worth checking the
> configuration for the NFI_ACCON settings (timing control register).

Hi,

i changed the 2 timing registers to those present in the atags for this
specific chip. i also verified them with the ones used by uboot.
unfortunately that did not fix the problem

+       nfi_writel(nfc, 0x30c77fff, NFI_ACCCON);
+       nfi_writel(nfc, 0xC03222, NFI_ACCCON1);

the bootlog without any properties in the devicetree is

[    1.914168] nand: device found, Manufacturer ID: 0xef, Chip ID: 0xda
[    1.920476] nand: Unknown W29N02GV
[    1.923909] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048,
OOB size: 64
[    1.931424] mtk-nand 1100d000.nfi: eccsize 1024 eccstrength 12
[    1.937237] Scanning device for bad blocks
[    1.943547] Bad eraseblock 1 at 0x000000020000
[    1.949066] Bad eraseblock 2 at 0x000000040000
[    1.954614] Bad eraseblock 3 at 0x000000060000
[    1.960128] Bad eraseblock 4 at 0x000000080000
[    1.966766] Bad eraseblock 6 at 0x0000000c0000
[    1.975604] Bad eraseblock 10 at 0x000000140000
[    1.981204] Bad eraseblock 11 at 0x000000160000
[    1.986819] Bad eraseblock 12 at 0x000000180000
[    1.992422] Bad eraseblock 13 at 0x0000001a0000
[    1.998022] Bad eraseblock 14 at 0x0000001c0000
[    2.003638] Bad eraseblock 15 at 0x0000001e0000
[    2.009237] Bad eraseblock 16 at 0x000000200000
[    2.014852] Bad eraseblock 17 at 0x000000220000
[    2.020452] Bad eraseblock 18 at 0x000000240000
[    2.026066] Bad eraseblock 19 at 0x000000260000
[    2.031666] Bad eraseblock 20 at 0x000000280000
[    2.037283] Bad eraseblock 21 at 0x0000002a0000
[    2.042897] Bad eraseblock 22 at 0x0000002c0000
[    2.048497] Bad eraseblock 23 at 0x0000002e0000
[    2.054113] Bad eraseblock 24 at 0x000000300000
[    2.059713] Bad eraseblock 25 at 0x000000320000
[    2.065324] Bad eraseblock 26 at 0x000000340000
[    2.070920] Bad eraseblock 27 at 0x000000360000
[    2.076582] Bad eraseblock 28 at 0x000000380000
[    2.082188] Bad eraseblock 29 at 0x0000003a0000
[    2.087788] Bad eraseblock 30 at 0x0000003c0000
[    2.093406] Bad eraseblock 31 at 0x0000003e0000
[    2.099007] Bad eraseblock 32 at 0x000000400000
[    2.104623] Bad eraseblock 33 at 0x000000420000
[    2.110223] Bad eraseblock 34 at 0x000000440000
[    2.115838] Bad eraseblock 35 at 0x000000460000
[    2.121438] Bad eraseblock 36 at 0x000000480000
[    2.127053] Bad eraseblock 37 at 0x0000004a0000
[    2.132657] Bad eraseblock 38 at 0x0000004c0000
[    2.138257] Bad eraseblock 39 at 0x0000004e0000
[    2.143872] Bad eraseblock 40 at 0x000000500000
[    2.149472] Bad eraseblock 41 at 0x000000520000
[    2.155088] Bad eraseblock 42 at 0x000000540000
[    2.160688] Bad eraseblock 43 at 0x000000560000
[    2.166302] Bad eraseblock 44 at 0x000000580000
[    2.171906] Bad eraseblock 45 at 0x0000005a0000
[    2.177505] Bad eraseblock 46 at 0x0000005c0000
[    2.183127] Bad eraseblock 47 at 0x0000005e0000
[    2.188726] Bad eraseblock 48 at 0x000000600000
[    2.194341] Bad eraseblock 49 at 0x000000620000
[    2.199941] Bad eraseblock 50 at 0x000000640000
[    2.205556] Bad eraseblock 51 at 0x000000660000
[    2.211155] Bad eraseblock 52 at 0x000000680000
[    2.216770] Bad eraseblock 53 at 0x0000006a0000
[    2.222373] Bad eraseblock 54 at 0x0000006c0000
[    2.227972] Bad eraseblock 55 at 0x0000006e0000
[    2.233588] Bad eraseblock 56 at 0x000000700000
[    2.239188] Bad eraseblock 57 at 0x000000720000
[    2.244803] Bad eraseblock 58 at 0x000000740000
[    2.250402] Bad eraseblock 59 at 0x000000760000
[    2.256017] Bad eraseblock 60 at 0x000000780000
[    2.261616] Bad eraseblock 61 at 0x0000007a0000
[    2.267235] Bad eraseblock 62 at 0x0000007c0000
[    2.272840] Bad eraseblock 63 at 0x0000007e0000
[    2.278439] Bad eraseblock 64 at 0x000000800000
[    2.284054] Bad eraseblock 65 at 0x000000820000
[    2.289653] Bad eraseblock 66 at 0x000000840000
[    2.295268] Bad eraseblock 67 at 0x000000860000
[    2.300867] Bad eraseblock 68 at 0x000000880000
[    2.306482] Bad eraseblock 69 at 0x0000008a0000
[    2.312086] Bad eraseblock 70 at 0x0000008c0000
[    2.317685] Bad eraseblock 71 at 0x0000008e0000
[    2.323301] Bad eraseblock 72 at 0x000000900000
[    2.328901] Bad eraseblock 73 at 0x000000920000
[    2.334516] Bad eraseblock 74 at 0x000000940000
[    2.340115] Bad eraseblock 75 at 0x000000960000
[    2.345731] Bad eraseblock 76 at 0x000000980000
[    2.351330] Bad eraseblock 77 at 0x0000009a0000
[    2.356945] Bad eraseblock 78 at 0x0000009c0000
[    2.362548] Bad eraseblock 79 at 0x0000009e0000
[    2.368147] Bad eraseblock 80 at 0x000000a00000
[    2.373763] Bad eraseblock 81 at 0x000000a20000
[    2.379362] Bad eraseblock 82 at 0x000000a40000
[    2.384977] Bad eraseblock 83 at 0x000000a60000
[    2.390576] Bad eraseblock 84 at 0x000000a80000
[    2.396192] Bad eraseblock 85 at 0x000000aa0000
[    2.401807] Bad eraseblock 86 at 0x000000ac0000
[    2.407406] Bad eraseblock 87 at 0x000000ae0000
[    3.859664] mt7623-gsw switch@1b100000: port 3 link up
[    4.452341] Bad eraseblock 1927 at 0x00000f0e0000
[    4.590029] 5 ofpart partitions found on MTD device mtk-nand
[    4.595671] Creating 5 MTD partitions on "mtk-nand":
[    4.600599] 0x0000000c0000-0x000000100000 : "uboot-env"
[    4.606846] 0x000000100000-0x000000140000 : "factory"
[    4.612807] 0x000000140000-0x000002140000 : "kernel"
[    4.618843] 0x000002140000-0x000004140000 : "recovery"
[    4.625035] 0x000004140000-0x000005140000 : "rootfs"


and oobtest gives the following output

[  167.892722]
[  167.894212] =================================================
[  167.899909] mtd_oobtest: MTD device: 2
[  167.903675] mtd_oobtest: MTD device size 33554432, eraseblock size
131072, page size 2048, count of eraseblocks 256, pages per eraseblock
64, OOB size 64
[  167.917340] mtd_test: scanning for bad eraseblocks
[  167.922123] mtd_test: block 0 is bad
[  167.925668] mtd_test: block 1 is bad
[  167.929210] mtd_test: block 2 is bad
[  167.932775] mtd_test: block 3 is bad
[  167.936346] mtd_test: block 4 is bad
[  167.939888] mtd_test: block 5 is bad
[  167.943451] mtd_test: block 6 is bad
[  167.946995] mtd_test: block 7 is bad
[  167.950537] mtd_test: block 8 is bad
[  167.954100] mtd_test: block 9 is bad
[  167.957643] mtd_test: block 10 is bad
[  167.961271] mtd_test: block 11 is bad
[  167.964917] mtd_test: block 12 is bad
[  167.968547] mtd_test: block 13 is bad
[  167.972191] mtd_test: block 14 is bad
[  167.975821] mtd_test: block 15 is bad
[  167.979449] mtd_test: block 16 is bad
[  167.983094] mtd_test: block 17 is bad
[  167.986724] mtd_test: block 18 is bad
[  167.990352] mtd_test: block 19 is bad
[  167.993997] mtd_test: block 20 is bad
[  167.997626] mtd_test: block 21 is bad
[  168.001254] mtd_test: block 22 is bad
[  168.004899] mtd_test: block 23 is bad
[  168.008529] mtd_test: block 24 is bad
[  168.012171] mtd_test: block 25 is bad
[  168.015800] mtd_test: block 26 is bad
[  168.019429] mtd_test: block 27 is bad
[  168.023080] mtd_test: block 28 is bad
[  168.026713] mtd_test: block 29 is bad
[  168.030342] mtd_test: block 30 is bad
[  168.033987] mtd_test: block 31 is bad
[  168.037617] mtd_test: block 32 is bad
[  168.041245] mtd_test: block 33 is bad
[  168.044886] mtd_test: block 34 is bad
[  168.048516] mtd_test: block 35 is bad
[  168.052161] mtd_test: block 36 is bad
[  168.055790] mtd_test: block 37 is bad
[  168.059419] mtd_test: block 38 is bad
[  168.063064] mtd_test: block 39 is bad
[  168.066692] mtd_test: block 40 is bad
[  168.070321] mtd_test: block 41 is bad
[  168.074015] mtd_test: block 42 is bad
[  168.077648] mtd_test: block 43 is bad
[  168.081276] mtd_test: block 44 is bad
[  168.084927] mtd_test: block 45 is bad
[  168.088556] mtd_test: block 46 is bad
[  168.092200] mtd_test: block 47 is bad
[  168.095829] mtd_test: block 48 is bad
[  168.099458] mtd_test: block 49 is bad
[  168.103103] mtd_test: block 50 is bad
[  168.106732] mtd_test: block 51 is bad
[  168.110360] mtd_test: block 52 is bad
[  168.114005] mtd_test: block 53 is bad
[  168.117635] mtd_test: block 54 is bad
[  168.121263] mtd_test: block 55 is bad
[  168.124907] mtd_test: block 56 is bad
[  168.128536] mtd_test: block 57 is bad
[  168.132179] mtd_test: block 58 is bad
[  168.135808] mtd_test: block 59 is bad
[  168.139437] mtd_test: block 60 is bad
[  168.143113] mtd_test: block 61 is bad
[  168.146743] mtd_test: block 62 is bad
[  168.150372] mtd_test: block 63 is bad
[  168.154020] mtd_test: block 64 is bad
[  168.157649] mtd_test: block 65 is bad
[  168.161278] mtd_test: block 66 is bad
[  168.164924] mtd_test: block 67 is bad
[  168.168553] mtd_test: block 68 is bad
[  168.172197] mtd_test: block 69 is bad
[  168.175826] mtd_test: block 70 is bad
[  168.179455] mtd_test: block 71 is bad
[  168.183100] mtd_test: block 72 is bad
[  168.186729] mtd_test: block 73 is bad
[  168.190357] mtd_test: block 74 is bad
[  168.194002] mtd_test: block 75 is bad
[  168.197632] mtd_test: block 76 is bad
[  168.201260] mtd_test: block 77 is bad
[  168.205077] mtd_test: scanned 256 eraseblocks, 78 are bad
[  168.210428] mtd_oobtest: test 1 of 5
[  168.714011] mtk-nand 1100d000.nfi: data not ready
[  168.718679] mtd_test: error -5 while erasing EB 78
[  168.723489] mtd_oobtest: error -5 occurred
[  168.727548] =================================================
failed to insert /mtd_oobtest.ko

thanks for your help !
	John
