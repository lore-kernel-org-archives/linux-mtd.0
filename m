Received: from mail1.bemta12.messagelabs.com ([216.82.251.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMgrR-0001cn-Nf
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:13:47 +0000
Message-ID: <523B2293.8070808@digi.com>
Date: Thu, 19 Sep 2013 18:13:07 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <201309151618.52045.marex@denx.de>
 <52366E5B.1010508@freescale.com> <201309191807.21140.marex@denx.de>
In-Reply-To: <201309191807.21140.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Fabio Estevam <festevam@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "scottwood@freescale.com" <scottwood@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Marek Vasut,

On 09/19/2013 06:07 PM, Marek Vasut wrote:
> btw Hector, I managed to verify JFFS2 mounting doesn't work on 3.10 , now I'm
> trying to backport patches from -next and apply the GPMI NAND patchset, without
> much luck yet.

If it helps, to make it work on v3.10 I had to apply lots of commits (listed in 
reverse order, from most recent to oldest):

53a9abf27213154d1ebaa54d111533f1e69d8ef3 mtd: mtd-abi: add a helper to detect the nand 
type
44aabd5fe3423f5b2071379bd55e708d523a1b4c mtd: add a helper to detect the nand type
2a2d49314b6a36eca80947ad021d01f7e6294291 mtd: add MTD_MLCNANDFLASH case for 
mtd_type_show()
576c9744f0f62d0b8d207d74b9066f00f4bdd347 jffs2: do not support the MLC nand
654b09629a50fd1680afcce46514e9ffc6723418 mtd: fix the wrong mtd->type for nand chip
95bc60491c394174cdbd1b24b0940fa61b6f2aec mtd: add more comment for 
MTD_NANDFLASH/MTD_MLCNANDFLASH
b9032012d68cf881e48237336e79d783b69f2a1b mtd: gpmi: rewrite the gpmi_ecc_write_oob() 
to support the jffs2
2c92e6f5e6a61020443ec3dbb7d51c6a84170f36 mtd: print out the cell information for nand chip
01e1b2c398952ead5d8b3eb370dc7a31560e9c00 mtd: set the cell information for ONFI nand
2dcd73d5c96067342fafeb088cc08872f68558d5 mtd: nand: rename the cellinfo to bits_per_cell
40f5c3f65f9f2151ae5cdd9293af6d62f551d51a mtd: add a new field to mtd_info{}
a0181739d881f3e973ebfbe29769f0d4f08b26a4 mtd: add ECC info for nand_flash_dev{}
247db5b42147d0b764c6096e1b55c7f01439b9a5 mtd: add a helper to get the supported 
features for ONFI nand
0db74df18a1dbd9814637ba891cc123f3b7a4bba mtd: add data structures for Extended 
Parameter Page
f4ead19a666581c78a7f9d27379e4ee4850d38ae mtd: add datasheet's ECC information to 
nand_chip{}
b47e2aa8f044092ea63a2b28d1ead0ff6bc54ac3 mtd: nand: remove NAND_BBT_SCANEMPTY
91eae06eb963ad7f5faf8f585f21d34921cb7830 mtd: nand: hide in-memory BBT implementation 
details
4b8c49529b49e84a9472e52ffa2b452b48779563 mtd: nand_base: Only use GET/SET FEATURES 
command on chips that support them.
8babb2385cfcd9ee24b62e2dd1577a1e05ef2f1f mtd: nand: fsmc: update of OF support
34b182c94acfc08e851af3500d8f3fa8b1d073e5 mtd: increase max OOB size to 744
b726168414d1ce3cff143e4bdc3f944459894388 mtd: nand: reword nand_chip bad block 
interface comments
36b46f044704df158078beaa368284fdc435f34a mtd: mpc5121_nfc: cleanup clock API use
5afbc047077a88c38181b9d4de6bea70a140b5a0 mtd cs553x_nand: use kzalloc() instead of memset
247f500f0903c084fa04f96e41aed049a3ec0709 mtd: atmel_nand: fix error return code in 
atmel_nand_probe()
573f505290ac60920d2e4d4c39323acb14b7b0c4 mtd: remove alauda driver
240ca8e6f0f5689bc34130c5843fc7df40fc994a mtd: nand: mxc_nand: mark 'const' properly
fdd0ddf7fac3ae18b8cbaf64a60a3f9591e124ac mtd: r852: Staticize local symbols
e979054e90b480bb62ac8ac2d69bbe13418f6514 mtd: nandsim: Staticize local symbols
cfa8de169b47502e0ce8b30b9a79b615b68af6b1 mtd: MTD_NAND_DENALI should depend on HAS_DMA
d322e0477e11fdd9bdec1040a7c8d4e14ec3e188 mtd: fsmc_nand: simplify 
platform_get_resource_byname/devm_ioremap_resource
f09f9d2061572d858856085d57d2f580fb60db0d mtd: atmel_nand: pmecc: fix bug fail to 
correct bit error in 1024-bytes sector
8a7f3dbd96350bc1d3f012c14da682049eb89530 mtd: nand: fixup kerneldoc, rename parameter
69d75957804c0cc214b705fee8c618bcca6c1671 mtd: gpmi: remove the nand_scan()
6aa28d55ddaf7ce5e245f835bfd0871ef3db492c mtd: set ONFI nand's default hooks in 
nand_set_defaults()
3320916b8845e06d04cea7b492920829ce49ac0e mtd: set the ecc step size for master/slave 
mtd_info
8d6a288d8b950b08a150f96781d365f770669898 mtd: nand: silence some shift wrap warnings
38cd6478fb2b38b12525fbede22cf549e1581a3e mtd: simplify use of devm_ioremap_resource
7b900eb9f497da080c3a46a50fe33ffa14e093aa mtd: nand: Allow to build pxa3xx_nand on 
Orion platforms
2cd4ce5d72919da4a5eb48f63d50ccbb38d96b19 mtd: nand: pxa3xx: Allow devices with no dma 
resources
383b9edf4a14193c819cb5f1cf841206da064095 mtd: nand: pxa3xx: Add __maybe_unused keyword 
to enable_int()
4552440a0c279fac04e4a7216c36a537956a2acc mtd: nand: pxa3xx: Make dma code dependent on 
dma capable platforms
475e1ad93c4bc100ad8ed82013669f8569471a96 mtd: nand: pxa3xx: Move cached registers to 
info structure
8270cfd39ae136c10082287f612f825414a01950 mtd: nand: pxa3xx: Remove uneeded internal cmdset
234f82f9269e2a96c4b6f3802121d8e307d29580 mtd: nand: pxa3xx: Remove hardcoded mtd name
afa5a8a3750f428fe4c9f9a5840dfddfe4f7d503 mtd: nand: pxa3xx: Add a local loop variable
dc33d8fcfc245dab443ef1a5172864bb6d3d2c94 mtd: nand: pxa3xx: Use 'length override' in 
ONFI paramater page read
1b3334cf50d40eb1ef7f39d6e3396b30d5d085f0 mtd: nand: pxa3xx: Support command buffer #3
33275c59dab511acd0fbb988519bd8dba670b7ff mtd: nand: pxa3xx: Allow to set/clear the 
'spare enable' field
08f509aac14a0c7120f2885ac543c9758b00a518 mtd: nand: pxa3xx: Handle ECC and DMA 
enable/disable properly
00187c3a76b6e3da79ef495ce2a6c68fe96ee0de mtd: nand: pxa3xx: Introduce 
'marvell,armada370-nand' compatible string
58fd0eb5d7fa386ff2ef23490d69b8a7699ed85b mtd: nand: pxa3xx: Remove unneeded ifdef 
CONFIG_OF
3a60185cc775357153f52804f61d0a271a5f0696 fs: create file_readable() and 
file_writable() functions
35d0c403f8df90eb53f8b3d7058435a5971cf843 mtd: gpmi: set the BCH's geometry with the 
ecc info
e9f731bd91a0b0de671f2c786152913d77aa37b3 mtd: add the ecc info for some full-id nand chips
2574dd936a6039a9e0c64e598e728384fc5d1fb5 mtd: parse out the ECC info for the full-id 
nand chips
7f9da59d3ce36590295543d4b59e0f8b7d68ca0d mtd: replace the hardcode with the onfi_feature()
26b275a4f4ed1191f1be7c4489f568c8604de641 mtd: get the ECC info from the Extended 
Parameter Page
77788a73eab5c6a8cbda30b8797a269c1f8e3480 mtd: get the ECC info from the parameter page 
for ONFI nand
c8daf04b75e1cee55a81cc47c28daca921e8ce15 mtd: atmel_nand: move the sanity check to the 
beginning of pmecc_enable()
67f6dd67d69b9d018411a2e34b10a192edb2aeaf mtd: nand: use dev_get_platdata()
7120499942b95c88e8273bef557906e14742911f mtd: denali: use NAND_CI_CELLTYPE_MSK instead 
of hardcoded constant
6105c5fc8cbfab44c80fc2ff24d3de89edca8946 mtd: nand: gpmi-nand: use more sensible error 
codes at various places
fbecc4c137f70f1d7d8f43de600f08242c75934b mtd: nand: gpmi-nand: janitorial cleanup: 
(commas after last element of struct initializ
77ba056a60d8ace805410002129036cff4bf5c52 mtd: atmel_nand: fix the warning when 
CONFIG_OF is not defined
f889dd6aec3fd3041d650b3b4ba32a1f167836c1 mtd: nand: remove NAND_BBT_SCANEMPTY
01b5773bb02cc534a073272e45f2d75928aabbdb mtd: nand: hide in-memory BBT implementation 
details
3f61aa34c884cc1fa67f97d5a25772112b0147a8 mtd: nand: refactor chip->block_markbad interface
d15973ed747ce28d129f0f08cbcf7248f83ce7b0 mtd: nand: eliminate cast
d5ec22b16799f05f222ce949df9f7c7788c9a388 mtd: nand: remove multiplied-by-2 block logic
ff4ef6b2faf909227c06b1c7494f9e9b009d0711 mtd: nand: add accessors, macros for 
in-memory BBT
572acb4aec443d9b07ca62dcd2e321aff64c2058 mtd: atmel_nand: enable Nand Flash Controller 
(NFC) write via sram
7fdd5e2555451c9646303f87001f33a2b180d3a5 mtd: atmel_nand: enable Nand Flash Controller 
(NFC) read data via sram
f3c0fc1870a4ac21ebda77b69477e35ee2345fab mtd: atmel_nand: add Nand Flash Controller 
(NFC) support
f9be6c059590d55b16000353bd25180fb3524060 mtd: atmel_nand: replace pmecc enable code 
with one function.
995979747c758d0618a5999b72e4e9645126996a mtd: atmel_nand: use devm_xxx gpio kzalloc, 
gpio and ioremap
d8b351cb3f380345eeaa6de0911568ebd083f763 mtd: nandsim: remove unused ns->geom.oobshift
6250f5a5b534e8840eafb6773e1d1fe4aa337096 mtd: nandsim: remove unused code
414d34c448779edc1ea9517fc9f75cb740091fd2 mtd: nandsim: use NS_RAW_OFFSET()
32ed63c74fdc9c11b5a744f2d846d9ff3dc690c8 mtd: nandsim: simplify NS_RAW_OFFSET()
0361bb75b2d75efcd30ca79531862e6799e6e3a0 mtd: nandsim: use kasprintf()
c50761be2b4c278247d4ef198d2120043cb96083 mtd: nandsim: convert pages_written[] to bitmap
b0430eb26dbcff68528a48ad55865c25cb8e7dce mtd: nand: detect OOB size for Toshiba 24nm 
raw SLC
af1f55ae90e1e8060318b1e16b9a2c1cb55c6956 mtd: atmel_nand: fix pmecc selction for ecc 
requirement typo
d05debb658fd8ff72e570e04ea1950b6980f229d mtd: nand: fix NAND_BUSWIDTH_AUTO for x16 devices
d8f855a6961028909032d617fb35bb440dd7ad33 mtd: diskonchip: remove unused entries in Kconfig
861ef3fb9819f5b3688836ff7e4c44180b9982df mtd: atmel_nand: don't use 
devm_pinctrl_get_select_default() in probe
c7babfbc49aa6f903e66b93b88dd8736279df2c9 mtd: gpmi-nand: don't use 
devm_pinctrl_get_select_default() in probe
84c9313cacdbc8d8e7bfbca5e1f94569dfd94a5f mtd: nand: mxc_nand: Remove unneeded check 
for platform_get_resource()
7f62a0169b724684e4cf33ecb782134359271919 mtd: atmel_nand: using a stronger ECC is not 
dangerous
b3be64643c39f91401e017d67182dd1089be1a14 mtd: nand: txx9ndfmc: remove unnecessary 
platform_set_drvdata()
3d74b88ef09bcf3538dad9e16c35bd4133897fed mtd: nand: sharpsl: remove unnecessary 
platform_set_drvdata()
62f78268fe22bd4116715dc3a0a063789786e532 mtd: nand: s3c2410: remove unnecessary 
platform_set_drvdata()
f11ce2b3680b5491973b5592195c4a3e49292191 mtd: nand: pxa3xx_nand: remove unnecessary 
platform_set_drvdata()
ccc3fab23551b0f737066f1c3d15105f768779f5 mtd: nand: plat_nand: remove unnecessary 
platform_set_drvdata()
3e6c8f5e62d48ea2a97e60a5d57a2e4df2b8c8bd mtd: nand: orion_nand: remove unnecessary 
platform_set_drvdata()
284ec293b80ce08ceb2677bbd15cfda2fd4d9794 mtd: nand: omap2: remove unnecessary 
platform_set_drvdata()
9315d116a80429c9ce2f9378079b6a829b523c10 mtd: nand: nuc900_nand: remove unnecessary 
platform_set_drvdata()
1a35df39fb4f948f4fbc7908033ec9c122567166 mtd: nand: mxc_nand: remove unnecessary 
platform_set_drvdata()
da4ed680a5530367f672cdfaf1860a71a7c8185e mtd: nand: lpc32xx: remove unnecessary 
platform_set_drvdata()
294824698f8267788a381928fe1818f1d695e258 mtd: nand: jz4740_nand: remove unnecessary 
platform_set_drvdata()
5e72ee56f9113d60cabb4f8adc2c1fa4f15f82a9 mtd: nand: gpmi-nand: remove unnecessary 
platform_set_drvdata()
63d5c5167c38967ded910c74b2190c368957c4ee mtd: nand: fsmc_nand: remove unnecessary 
platform_set_drvdata()
0c45084c9b2ab66af282193d43f736d02f5dcb1e mtd: nand: docg4: remove unnecessary 
platform_set_drvdata()
385f9c1ef89efaf4bd4d4f3236e81c755b8caddf mtd: nand: bf5xx_nand: remove unnecessary 
platform_set_drvdata()
65a561c4335f598a2e33239d25f4d1a1a4e0fcf1 mtd: nand: atmel_nand: remove unnecessary 
platform_set_drvdata()
c27ed888870c52292fc322050ddf80e84aa0de4f mtd: nand: ams-delta: remove unnecessary 
platform_set_drvdata()
49649863a7dd1f3ee0c46320ff78856974e9772a mtd: nand: pxa3xx: Add support for Read 
parameter page command
caa75d26a05fa5155855a86b58acb74e916c2328 mtd: nand: pxa3xx: Add address support for 
READID command
a456431d85b37365bb324c48300781ec940fff99 mtd: nand: pxa3xx: Fix MODULE_DEVICE_TABLE 
declaration
a6ab4f906eb96cfbaa8823e6668bb840020c3252 mtd: nand: pxa3xx: Use of_machine_is_compatible()
c6bf90f74720c76ddededb035d335827b55e9c87 mtd: nand: pxa3xx: Set info->use_dma properly
98dde6f6ec74e855a206904c6e4f82baa041ca9a mtd: atmel_nand: add a new dt binding item 
for nand dma support
4df160fe6b080116a37ac90d4619983b71a3d21d mtd: atmel_nand: replace cpu_is_at32ap7000() 
with a nand platform data
40aeefd2d7b15037141a36bb99ee8ac0fc192d77 mtd: gpmi-nand: fix error return from 
gpmi_get_clks()
359a1df828b36e9a9994a23418544bc88c28074f mtd: nand: davinci: use devm_ioremap_resource()
6e0efb855af64ab8322a9eb523027fc8f6bc43f6 mtd: nand_base: Only use GET/SET FEATURES 
command on chips that support them.
9ab677c6bb897ef2108292996e66530cce66c2b9 mtd: nand: fsmc: update of OF support
ff59928a191e881df9e267b93506ed016ac15a1a mtd: nand: pxa3xx: Move buffer release code 
to its own function
0c0412495b9b3481220ca2b550254749efcca2b9 mtd: nand: pxa3xx: Check for 
clk_prepare_enable() return value
9ecbf288af72b90c141dcfdd41a1159a41ca2992 mtd: nand: pxa3xx: Use clk_prepare_enable and 
clk_disable_unprepare
62f822b04664f2bb5259013dc033da773e6e47b8 mtd: nand: pxa3xx: Use devm_clk_get
9b948fb5b989ac8faf387968dd9e1de4b4fb2cb1 mtd: nand: pxa3xx: Use devm_ioremap_resource
7e4dd5c37fa010dd55c243e58e9c22a03d73687d mtd: nand: pxa3xx: Use devm_kzalloc
57646f659a8a9cdc52f1ad561efbe8df653ccba6 mtd: nand_base: Use io{read, write}*_rep 
functions for transfer
b426958cc7b80a7bc82e2d93e2ad9324876fe982 mtd: nand-gpio: Add missing "owner" field in 
platform_driver struct
9822c3457e6664f6b7476fc0ccee242204b95272 mtd: nand-gpio: Rename internal variables to 
match functionality
c9906128d056e743e0f207147e0f880b2242c047 mtd: nand-gpio: Unneeded dependency on ARM 
removed
38af907581d9397d41ee8237f3e67a7d1319a8ce mtd: nand-gpio: Use default nand_base 
{read/write}_buf functions
dd6ca7acd8bebf280dbdb1d675732fa7f9cac8bd mtd: nand-gpio: Do not override GPIOs if 
driver uses platform_data but OF is enabled in
45078431a6ea64791ad8a72ac5860c0671ac53d4 mtd: nand-gpio: Use default dev_ready 
function if RDY is missing in configuration
055deba61df0a1e34d7682701babb62678f9ab9e mtd: nand-gpio: Convert driver to using 
resource-managed functions
b6eec0dada833875d85a3c0917a394ad57dfb54b mtd: fsl_ifc_nand: set NAND_NO_SUBPAGE_WRITE
892bccd8efae6175dc9d8628627e347c526564d2 mtd: fsmc_nand: add CONFIG_PM_SLEEP to 
suspend/resume functions
18c40318889629ad2f767603b0f4b51ebb71e4de mtd: r852: add CONFIG_PM_SLEEP to 
suspend/resume functions
42def8ab25ecd8a81f1bd4b452445ed3636d159f mtd: fsl_ifc_nand: remove incorrect kfree()
d855bd95ad35568b109f1b4587b68f0c950011f5 mtd: omap2: allow bulding as a module



Best regards,
--
Hector Palacios
