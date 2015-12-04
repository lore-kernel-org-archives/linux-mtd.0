Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4lwm-0004jK-21
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 08:42:33 +0000
Subject: Re: mtd, nand, omap2: parse cmdline partition fail
To: Frans Klaver <fransklaver@gmail.com>
References: <56613747.8040907@denx.de>
 <CAH6sp9M=vSQbVa7exRvHF+5o9dPz=wLrN3a1cL2O1kkcuDZGHg@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Pekon Gupta <pekon@pek-sem.com>, Roger Quadros <rogerq@ti.com>,
 Nicholas Mc Guire <hofrat@osadl.org>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefano Babic <sbabic@denx.de>,
 "Stahl Martin (Helbling Technik)" <Martin.Stahl@helbling.ch>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <566151DE.9070706@denx.de>
Date: Fri, 4 Dec 2015 09:42:06 +0100
MIME-Version: 1.0
In-Reply-To: <CAH6sp9M=vSQbVa7exRvHF+5o9dPz=wLrN3a1cL2O1kkcuDZGHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Frans,

Am 04.12.2015 um 08:17 schrieb Frans Klaver:
> On Fri, Dec 4, 2015 at 7:48 AM, Heiko Schocher <hs@denx.de> wrote:
>> Hello Frans,
>>
>> I just tried current mainline kernel:
>> commit 2255702db4014d1c69d6037ed7bdad2d2e271985
>> Merge: 9e5d25e c86576e
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Mon Nov 30 16:06:44 2015 -0800
>>
>>      Merge tag 'mn10300-for-linus-v4.4-rc4' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
>>
>> on an am3517 based board (mainlining soon). And with your commit:
>> commit 853f1c58c4b2: mtd: nand: omap2: show parent device structure in sysfs
>>
>> MTD partitions from cmdline are not longer detected:
>>
>> [    2.087305] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
>> [    2.094097] nand: Micron MT29F4G16ABADAWP
>> [    2.098303] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB
>> size: 64
>> [    2.106296] nand: WARNING: MT29F4G16ABADAWP: the ECC used on your system
>> is too weak compared to the one required by the NAND chip
>> [    2.118674] MT29F4G16ABADAWP: 'partitions' subnode not found on
>> /ocp/gpmc@6e000000/nand@0,0. Trying to parse direct subnodes as partitions.
>> [...]
>>
>> before this patch it worked:
>> [    2.307444] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
>> [    2.314092] nand: Micron MT29F4G16ABADAWP
>> [    2.318348] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB
>> size: 64
>> [    2.326331] nand: WARNING: omap2-nand.0: the ECC used on your system is
>> too weak compared to the one required by the NAND chip
>> [    2.338336] 5 cmdlinepart partitions found on MTD device omap2-nand.0
>> [    2.345129] Creating 5 MTD partitions on "omap2-nand.0":
>> [    2.350704] 0x000000000000-0x000000080000 : "MLO"
>> [    2.366877] 0x000000080000-0x000000180000 : "u-boot"
>> [    2.379179] 0x000000180000-0x0000001c0000 : "env1"
>> [    2.390627] 0x0000001c0000-0x000000200000 : "env2"
>> [    2.402255] 0x000000200000-0x000020000000 : "common_data"
>>
>> Reason is taht the mtd->name has changed from "omap2-nand.0" to the
>> nand chip name ...
>>
>> If I revert this part from the patch
>>
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index 93f664c..28dcf66 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
>> @@ -1685,6 +1685,7 @@ static int omap_nand_probe(struct platform_device
>> *pdev)
>>          info->ecc_opt           = pdata->ecc_opt;
>>          mtd                     = &info->mtd;
>>          mtd->priv               = &info->nand;
>> +       mtd->name               = dev_name(&pdev->dev);
>>          mtd->dev.parent         = &pdev->dev;
>>          nand_chip               = &info->nand;
>>          nand_chip->ecc.priv     = NULL;
>>
>> It works again ...
>>
>> So the question is, is it intended to change the "mtd->name"?
>
> That's definitely not intended. The expectation with this patch is
> that nothing really changes, except that a parent device link is
> available in sysfs. For the name this patch depends on 807f16d4db956
> ("mtd: core: set some defaults when dev.parent is set") which does
> something like:
>
> if (mtd->dev.parent) {
>          if (!mtd->name)
>                  mtd->name = dev_name(mtd->dev.parent);
> }

commit 807f16d4db956 is in the tree... ok.

Hmm... I see in drivers/mtd/nand/omap2.c omap_nand_probe()
info gets allocated with devm_kzalloc(), then info->mtd gets filled.

Without setting "mtd->name = dev_name(&pdev->dev);"
mtd->name never gets filled ... or?

It seems to me add_mtd_device() gets only called for the mtd partitions
parsed from the cmdline ...

I added to my patch above following debug printk:
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 95c13b2..f1a95eb 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -426,6 +426,9 @@ int add_mtd_device(struct mtd_info *mtd)
         mtd->erasesize_mask = (1 << mtd->erasesize_shift) - 1;
         mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;

+	printk("%s: ******* mtd->name: %s\n", __func__, mtd->name);
+	if (mtd->dev.parent)
+       	printk("%s: *******parent name: %s\n", __func__, dev_name(mtd->dev.parent));
         if (mtd->dev.parent) {
                 if (!mtd->owner && mtd->dev.parent->driver)
                         mtd->owner = mtd->dev.parent->driver->owner;

Log with them:
[    2.613797] mtdoops: mtd device (mtddev=name/number) must be supplied
[    2.623417] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
[    2.630077] nand: Micron MT29F4G16ABADAWP
[    2.634395] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    2.642402] nand: WARNING: omap2-nand.0: the ECC used on your system is too weak compared to the 
one required by the NAND chip
[    2.654412] 5 cmdlinepart partitions found on MTD device omap2-nand.0
[    2.661213] Creating 5 MTD partitions on "omap2-nand.0":
[    2.666785] 0x000000000000-0x000000080000 : "MLO"
[    2.672755] add_mtd_device: ******* mtd->name: MLO
[    2.677775] add_mtd_device: *******parent name: omap2-nand.0
[    2.693967] 0x000000080000-0x000000180000 : "u-boot"
[    2.700097] add_mtd_device: ******* mtd->name: u-boot
[    2.705490] add_mtd_device: *******parent name: omap2-nand.0
[    2.717487] 0x000000180000-0x0000001c0000 : "env1"
[    2.722902] add_mtd_device: ******* mtd->name: env1
[    2.728010] add_mtd_device: *******parent name: omap2-nand.0
[    2.739992] 0x0000001c0000-0x000000200000 : "env2"
[    2.745401] add_mtd_device: ******* mtd->name: env2
[    2.750505] add_mtd_device: *******parent name: omap2-nand.0
[    2.762875] 0x000000200000-0x000020000000 : "common_data"
[    3.218895] add_mtd_device: ******* mtd->name: common_data
[    3.224686] add_mtd_device: *******parent name: omap2-nand.0

No other "add_mtd_device:" output ...

> The fact that this produces different names for you is slightly
> surprising to me, unless mtd->name is already set to something by the
> time it reaches add_mtd_device(). Or I overlooked something, which is
> entirely plausible as well.
>
> So effectively this should be the same as doing:
>
>    mtd->dev.parent = &pdev->dev;
>    mtd->name = dev_name(mtd->dev.parent);
>
>
>> But wondering, if there are two or more identical nand chips in the
>> system, they will have the same mtd->name ... which seems buggy to me...
>
> Agree.

Good, so we must fix it ;-)

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
