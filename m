Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwrtH-00087u-JP
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 13:26:17 +0000
Received: by oies6 with SMTP id s6so3176005oie.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 05:25:54 -0800 (PST)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <1447324339.31665.120.camel@linux.intel.com>
References: <1446691741-8393-1-git-send-email-punnaia@xilinx.com>
 <1447077023.31665.72.camel@linux.intel.com>
 <CAGnW=BYBRfVhuj-jFpe8BYTTg=n4ZqDsbfYDprapf538R=wZ9w@mail.gmail.com>
 <1447324339.31665.120.camel@linux.intel.com>
Date: Thu, 12 Nov 2015 18:55:53 +0530
Message-ID: <CAGnW=BZJ55QinPMjQ_gRy724pprRSy47OCFmMLfeM4mfhe0T7g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] mtd: nand: Add support for Arasan Nand Flash
 Controller
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, geert@linux-m68k.org,
 "michals@xilinx.com" <michals@xilinx.com>, wangzhou1@hisilicon.com,
 Florian Fainelli <f.fainelli@gmail.com>, gsi@denx.de,
 Kevin Hao <haokexin@gmail.com>, rogerq@ti.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Punnaiah Choudary <kpc528@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 4:02 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, 2015-11-12 at 10:18 +0530, punnaiah choudary kalluri wrote:
>> On Mon, Nov 9, 2015 at 7:20 PM, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>> > On Thu, 2015-11-05 at 08:19 +0530, Punnaiah Choudary Kalluri wrote:
>> > > Added the basic driver for Arasan Nand Flash Controller used in
>> > > Zynq UltraScale+ MPSoC. It supports only Hw Ecc and upto 24bit
>> > > correction.
>> > >
>> >
>> > > +config MTD_NAND_ARASAN
>> > > +     tristate "Support for Arasan Nand Flash controller"
>> > > +     depends on MTD_NAND
>> >
>> > This looks useless since you can't see the item without MTD_NAND is
>> > chosen.
>> >
>> > > +     help
>> > > +       Enables the driver for the Arasan Nand Flash controller
>> > > on
>> > > +       Zynq UltraScale+ MPSoC.
>> > > +
>> > >  endif # MTD_NAND
>> > >
>> >
>> > +obj-$(CONFIG_MTD_NAND_ARASAN)          += arasan_nfc.o
>> >
>> > "nfc" part a bit ambiguous since NFC might be Near Field
>> > Communication.
>>
>> This driver is under mtd/nand so, there is no point of confusion and
>> in this context nfc is nand flash controller.
>
> Imagine that at some point arasan (whatever) releases NFC chip, and
> someone puts the driver under corresponding folder but with the same
> file name (and driver name). Do you see a problem? I see two:
> - if you built-in both how you supply command line parameters?
> - some platform code may do request_module() or
> platform_driver_register() with the name you provided as DRIVER_NAME.
>
> So, I just suggest distinguishable name. But it's a call of NAND
> subsystem maintainer.
>

Ok. Thanks. I will rename this file.

>> >
>> > Perhaps "nand_fc" or something like that?
>> >
>
>> > > +#include <linux/platform_device.h>
>> > > +
>> > > +#define DRIVER_NAME                  "arasan_nfc"
>> >
>> > Ditto.
>> >
>> > > +static int anfc_device_ready(struct mtd_info *mtd,
>> > > +                          struct nand_chip *chip)
>> > > +{
>> > > +     u8 status;
>> > > +     unsigned long timeout = jiffies + STATUS_TIMEOUT;
>> > > +
>> > > +     do {
>> > > +             chip->cmdfunc(mtd, NAND_CMD_STATUS, 0, 0);
>> > > +             status = chip->read_byte(mtd);
>> > > +             if (status & ONFI_STATUS_READY) {
>> >
>> > > +                     if (status & ONFI_STATUS_FAIL)
>> > > +                             return NAND_STATUS_FAIL;
>> >
>> > This is invariant to the loop, perhaps move outside.
>>
>> Nand device is ready means it is ready to accept next command and
>> it is done with previous command. It doesn't mean that previous
>> command is success, it can fail also.
>
> This is style and logic comment. I do not object how NAND works.
>
>> >
>> > > +                     break;
>> > > +             }
>> > > +             cpu_relax();
>> > > +     } while (!time_after_eq(jiffies, timeout));
>
> Just move it here. It will be the same, but unload busy loop.
>

It can be done. I will modify accordingly


Thanks,
Punnaiah

> Did I miss something?
>
>> > > +
>> > > +     if (time_after_eq(jiffies, timeout)) {
>> > > +             pr_err("%s timed out\n", __func__);
>> >
>> > dev_err?
>> >
>
>> > > +static void anfc_read_buf(struct mtd_info *mtd, uint8_t *buf,
>> > > int
>> > > len)
>> > > +{
>> > > +     u32 i, pktcount, buf_rd_cnt = 0, pktsize;
>> >
>> > Type for i looks unsigned int, why u32? Same question for all
>> > variables
>> > that are not used to directly program HW.
>> >
>
> u32 and other derivatives mostly common when you program HW. Here for
> simple stuff better to use plain types, therefore unsigned int.
>
>> > > int len)
>> > > +{
>> > > +     u32 buf_wr_cnt = 0, pktcount = 1, i, pktsize;
>> >
>> > Useless assignment of pktcount. Check all your definition blocks
>> > for
>> > similar thing.
>>
>> what is the problem with u32 here ? may be i am missing something
>> here but
>> i really want to know the reason.
>
> Ditto.
>
>> > > +             writel(lower_32_bits(paddr), nfc->base +
>> > > DMA_ADDR0_OFST);
>> > > +             writel(upper_32_bits(paddr), nfc->base +
>> > > DMA_ADDR1_OFST);
>> >
>> > lo_hi_writeq();
>>
>> Ok. let me check if this function is available across all
>> the platforms.
>
> The same spread as for writel().
> If your HW allows you to do 64-bit writes on 64-bit platforms, just
> use writeq(), but still include io-64-nonatomic-lo-hi.h (or how it's
> called nowadays).
>
> --
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
