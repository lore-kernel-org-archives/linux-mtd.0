Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TH0pl-0007vP-9C
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 23:16:02 +0000
Received: by wibhj13 with SMTP id hj13so2033739wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 16:15:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348700266.9030.26@snotra>
References: <CAN8TOE_D=rHRqpdkrAvtKL2-6x7UB3exfP587D_MZwqP=a=arg@mail.gmail.com>
 <1348700266.9030.26@snotra>
Date: Wed, 26 Sep 2012 16:15:58 -0700
Message-ID: <CAN8TOE9YgCB8bAuQyLNU_YZSvW2_GpA8EvYfT=CEQQyP5RQFZg@mail.gmail.com>
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

Hi Scott,

On Wed, Sep 26, 2012 at 3:57 PM, Scott Wood <scottwood@freescale.com> wrote:
> On 09/26/2012 05:43:35 PM, Brian Norris wrote:
>>
>> On Mon, Sep 17, 2012 at 6:28 PM, Scott Wood <scottwood@freescale.com>
>> wrote:
>> > On 09/17/2012 08:06:54 PM, Brian Norris wrote:
>> >> On Mon, Aug 6, 2012 at 3:21 PM, Brian Norris
>> >> <computersforpeace@gmail.com> wrote:
>> ...
>> >> The following files use badblock_pattern to varying degrees. Some are
>> >> just duplicating some nand_base stuff, where we can replace the
>> >> badblock_pattern with something simple like "chip->badblockpos = 0" or
>> >> setting a few "chip->bbt_options |= NAND_BBT_SCAN*" options. But it's
>> >> not all so simple:
>> >>
>> >> arch/arm/mach-pxa/corgi.c
>> >> arch/arm/mach-pxa/eseries.c
>> >> arch/arm/mach-pxa/poodle.c
>> >> arch/arm/mach-pxa/spitz.c
>> >> arch/arm/mach-pxa/tosa.c
>> >> drivers/mtd/nand/bcm_umi_nand.c
>> >> drivers/mtd/nand/docg4.c
>> >> drivers/mtd/nand/fsl_elbc_nand.c
>> >> drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> >> drivers/mtd/nand/nand_base.c
>> >> drivers/mtd/nand/omap2.c
>> >> drivers/mtd/nand/sh_flctl.c
>> >> drivers/mtd/nand/sharpsl.c
>> >> drivers/mtd/nand/tmio_nand.c
>> >> drivers/mtd/onenand/onenand_bbt.c
>> >> include/linux/mfd/tmio.h
>> >> include/linux/mtd/sharpsl.h
>> >>
>> >> Any thoughts on how to tackle this? Or is it even worth doing
>> >> properly? Is there a policy for dealing with old/unmaintained drivers
>> >> here, if I can't get a response from driver authors?
>> >
>> > fsl_elbc_nand uses this for historical reasons, to retain compatibility
>> > with
>> > the original OOB layout which only reserved one byte for the bad block
>> > marker and let users write to the second byte.  This controller only
>> > supports 8-bit chips.
>>
>> OK. Could this be fixed up by forcing nand_chip.badblockpos=0 in
>> fsl_elbc_nand? I think nand_base/nand_bbt are configured to read/write
>> only a single byte for 8-bit chips now.
>
>
> Good, in that case I think we can just drop it.  No need to override
> nand_chip.badblockpos; it's only the size that we were overriding.

Yep. I just figured that out myself.

>> > See commit 97ae023648e764f794ffb9c52da109d6caf09c47
>>
>> I can't find such a commit in upstream. Perhaps you're referring to a
>> private git tree?
>
>
> Oops, that was the U-Boot tree. :-P
>
> The Linux commit is 452db2724351ff3d9416a183a7955e00ab4e6ab4

Found that as well. I should just put a few minute delay on the "send"
button, then I'd have my answers :)

Thanks for the help, I'll send a patch shortly; your testing (if
possible) and Ack would be appreciated.

Brian
