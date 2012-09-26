Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TH0KP-0007HM-Kl
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 22:43:38 +0000
Received: by wgbdt14 with SMTP id dt14so612995wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 15:43:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1347931697.19543.24@snotra>
References: <CAN8TOE9QCnq7AKT9t8VKc2iQE9VXT7USDQjJ7vR640FMweqJDQ@mail.gmail.com>
 <1347931697.19543.24@snotra>
Date: Wed, 26 Sep 2012 15:43:35 -0700
Message-ID: <CAN8TOE_D=rHRqpdkrAvtKL2-6x7UB3exfP587D_MZwqP=a=arg@mail.gmail.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 17, 2012 at 6:28 PM, Scott Wood <scottwood@freescale.com> wrote:
> On 09/17/2012 08:06:54 PM, Brian Norris wrote:
>> On Mon, Aug 6, 2012 at 3:21 PM, Brian Norris <computersforpeace@gmail.com> wrote:
...
>> The following files use badblock_pattern to varying degrees. Some are
>> just duplicating some nand_base stuff, where we can replace the
>> badblock_pattern with something simple like "chip->badblockpos = 0" or
>> setting a few "chip->bbt_options |= NAND_BBT_SCAN*" options. But it's
>> not all so simple:
>>
>> arch/arm/mach-pxa/corgi.c
>> arch/arm/mach-pxa/eseries.c
>> arch/arm/mach-pxa/poodle.c
>> arch/arm/mach-pxa/spitz.c
>> arch/arm/mach-pxa/tosa.c
>> drivers/mtd/nand/bcm_umi_nand.c
>> drivers/mtd/nand/docg4.c
>> drivers/mtd/nand/fsl_elbc_nand.c
>> drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> drivers/mtd/nand/nand_base.c
>> drivers/mtd/nand/omap2.c
>> drivers/mtd/nand/sh_flctl.c
>> drivers/mtd/nand/sharpsl.c
>> drivers/mtd/nand/tmio_nand.c
>> drivers/mtd/onenand/onenand_bbt.c
>> include/linux/mfd/tmio.h
>> include/linux/mtd/sharpsl.h
>>
>> Any thoughts on how to tackle this? Or is it even worth doing
>> properly? Is there a policy for dealing with old/unmaintained drivers
>> here, if I can't get a response from driver authors?
>
> fsl_elbc_nand uses this for historical reasons, to retain compatibility with
> the original OOB layout which only reserved one byte for the bad block
> marker and let users write to the second byte.  This controller only
> supports 8-bit chips.

OK. Could this be fixed up by forcing nand_chip.badblockpos=0 in
fsl_elbc_nand? I think nand_base/nand_bbt are configured to read/write
only a single byte for 8-bit chips now.

Also, if done properly, this change could still support other legacy
layouts by allowing them to provide their own nand_chip.block_markbad
and nand_chip.block_bad implementations.

> See commit 97ae023648e764f794ffb9c52da109d6caf09c47

I can't find such a commit in upstream. Perhaps you're referring to a
private git tree?

Brian
