Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDmHF-0002U8-6J
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2012 01:07:01 +0000
Received: by wgbdt14 with SMTP id dt14so1415378wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2012 18:06:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE9fxLbYCc2MeLaqV2WA2ch9Dm9xnyPvY7LBOZ0guB-d0Q@mail.gmail.com>
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
 <20120628213146.7d929204@halley> <4FED6A2E.9010603@parrot.com>
 <20120630230252.58ca6bb4@halley> <4FF15BD1.9010109@parrot.com>
 <CAN8TOE8GMMn+sPu4trUH_iT3=5uh_Of=bsYzXX50E3dyPfKitg@mail.gmail.com>
 <20120725140233.7dc4ca8a@pixies.home.jungo.com>
 <CAN8TOE9fxLbYCc2MeLaqV2WA2ch9Dm9xnyPvY7LBOZ0guB-d0Q@mail.gmail.com>
Date: Mon, 17 Sep 2012 18:06:54 -0700
Message-ID: <CAN8TOE9QCnq7AKT9t8VKc2iQE9VXT7USDQjJ7vR640FMweqJDQ@mail.gmail.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shmulik, Matthieu, and others,

On Mon, Aug 6, 2012 at 3:21 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jul 25, 2012 at 4:02 AM, Shmulik Ladkani
>> I guess utilizing badblockbits may provide good coverage to that
>> condition.
>
> Yes, I agree that badblockbits is a good solution. I'm still not sure
> that any of the above arguments really suggest that we *can't* apply
> ECC, but for any important case, badblockbits would be more robust. I
> think I will look into fleshing out Matthieu's RFC at some point,
> unless he's already working on it.

I've done a little work at trying to flesh out this RFC, as I'm
thinking that we should more cleanly separate NAND BBT code and NAND
BBM code - i.e., bad block *table* vs. bad block *marker*. Markers
should be handled in a standard way in nand_base.c
(nand_default_block_markbad and nand_block_bad) and then nand_bbt.c
can be left the generic, focused job of handling the table. Now, that
all sounds nice, but I've run across at least one difficulty... This
approach should lead to the removal of nand_chip.badblock_pattern
entirely, as we would only be supporting the nand_base.c badblock
marker pattern, using nand_chip.badblockpos and a few
nand_chip.bbt_options flags. This leads me to analyzing all the
strange forms of badblock_pattern seen in various drivers. I'm not
sure all of them are even well thought out...

The following files use badblock_pattern to varying degrees. Some are
just duplicating some nand_base stuff, where we can replace the
badblock_pattern with something simple like "chip->badblockpos = 0" or
setting a few "chip->bbt_options |= NAND_BBT_SCAN*" options. But it's
not all so simple:

arch/arm/mach-pxa/corgi.c
arch/arm/mach-pxa/eseries.c
arch/arm/mach-pxa/poodle.c
arch/arm/mach-pxa/spitz.c
arch/arm/mach-pxa/tosa.c
drivers/mtd/nand/bcm_umi_nand.c
drivers/mtd/nand/docg4.c
drivers/mtd/nand/fsl_elbc_nand.c
drivers/mtd/nand/gpmi-nand/gpmi-nand.c
drivers/mtd/nand/nand_base.c
drivers/mtd/nand/omap2.c
drivers/mtd/nand/sh_flctl.c
drivers/mtd/nand/sharpsl.c
drivers/mtd/nand/tmio_nand.c
drivers/mtd/onenand/onenand_bbt.c
include/linux/mfd/tmio.h
include/linux/mtd/sharpsl.h

Any thoughts on how to tackle this? Or is it even worth doing
properly? Is there a policy for dealing with old/unmaintained drivers
here, if I can't get a response from driver authors?

Thanks,
Brian
