Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4kcc-0005TL-DO
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 07:17:39 +0000
Received: by wmww144 with SMTP id w144so50189882wmw.1
 for <linux-mtd@lists.infradead.org>; Thu, 03 Dec 2015 23:17:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56613747.8040907@denx.de>
References: <56613747.8040907@denx.de>
Date: Fri, 4 Dec 2015 08:17:16 +0100
Message-ID: <CAH6sp9M=vSQbVa7exRvHF+5o9dPz=wLrN3a1cL2O1kkcuDZGHg@mail.gmail.com>
Subject: Re: mtd, nand, omap2: parse cmdline partition fail
From: Frans Klaver <fransklaver@gmail.com>
To: hs@denx.de
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Pekon Gupta <pekon@pek-sem.com>,
 Roger Quadros <rogerq@ti.com>, Nicholas Mc Guire <hofrat@osadl.org>,
 linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefano Babic <sbabic@denx.de>,
 "Stahl Martin (Helbling Technik)" <Martin.Stahl@helbling.ch>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 4, 2015 at 7:48 AM, Heiko Schocher <hs@denx.de> wrote:
> Hello Frans,
>
> I just tried current mainline kernel:
> commit 2255702db4014d1c69d6037ed7bdad2d2e271985
> Merge: 9e5d25e c86576e
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Mon Nov 30 16:06:44 2015 -0800
>
>     Merge tag 'mn10300-for-linus-v4.4-rc4' of
> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
>
> on an am3517 based board (mainlining soon). And with your commit:
> commit 853f1c58c4b2: mtd: nand: omap2: show parent device structure in sysfs
>
> MTD partitions from cmdline are not longer detected:
>
> [    2.087305] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
> [    2.094097] nand: Micron MT29F4G16ABADAWP
> [    2.098303] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB
> size: 64
> [    2.106296] nand: WARNING: MT29F4G16ABADAWP: the ECC used on your system
> is too weak compared to the one required by the NAND chip
> [    2.118674] MT29F4G16ABADAWP: 'partitions' subnode not found on
> /ocp/gpmc@6e000000/nand@0,0. Trying to parse direct subnodes as partitions.
> [...]
>
> before this patch it worked:
> [    2.307444] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
> [    2.314092] nand: Micron MT29F4G16ABADAWP
> [    2.318348] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB
> size: 64
> [    2.326331] nand: WARNING: omap2-nand.0: the ECC used on your system is
> too weak compared to the one required by the NAND chip
> [    2.338336] 5 cmdlinepart partitions found on MTD device omap2-nand.0
> [    2.345129] Creating 5 MTD partitions on "omap2-nand.0":
> [    2.350704] 0x000000000000-0x000000080000 : "MLO"
> [    2.366877] 0x000000080000-0x000000180000 : "u-boot"
> [    2.379179] 0x000000180000-0x0000001c0000 : "env1"
> [    2.390627] 0x0000001c0000-0x000000200000 : "env2"
> [    2.402255] 0x000000200000-0x000020000000 : "common_data"
>
> Reason is taht the mtd->name has changed from "omap2-nand.0" to the
> nand chip name ...
>
> If I revert this part from the patch
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 93f664c..28dcf66 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1685,6 +1685,7 @@ static int omap_nand_probe(struct platform_device
> *pdev)
>         info->ecc_opt           = pdata->ecc_opt;
>         mtd                     = &info->mtd;
>         mtd->priv               = &info->nand;
> +       mtd->name               = dev_name(&pdev->dev);
>         mtd->dev.parent         = &pdev->dev;
>         nand_chip               = &info->nand;
>         nand_chip->ecc.priv     = NULL;
>
> It works again ...
>
> So the question is, is it intended to change the "mtd->name"?

That's definitely not intended. The expectation with this patch is
that nothing really changes, except that a parent device link is
available in sysfs. For the name this patch depends on 807f16d4db956
("mtd: core: set some defaults when dev.parent is set") which does
something like:

if (mtd->dev.parent) {
        if (!mtd->name)
                mtd->name = dev_name(mtd->dev.parent);
}

The fact that this produces different names for you is slightly
surprising to me, unless mtd->name is already set to something by the
time it reaches add_mtd_device(). Or I overlooked something, which is
entirely plausible as well.

So effectively this should be the same as doing:

  mtd->dev.parent = &pdev->dev;
  mtd->name = dev_name(mtd->dev.parent);


> But wondering, if there are two or more identical nand chips in the
> system, they will have the same mtd->name ... which seems buggy to me...

Agree.

Thanks,
Frans
