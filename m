Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwpGz-00033T-Gn
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 10:38:34 +0000
Received: by obdgf3 with SMTP id gf3so43414917obd.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 02:38:10 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1447324339.31665.120.camel@linux.intel.com>
References: <1446691741-8393-1-git-send-email-punnaia@xilinx.com>
 <1447077023.31665.72.camel@linux.intel.com>
 <CAGnW=BYBRfVhuj-jFpe8BYTTg=n4ZqDsbfYDprapf538R=wZ9w@mail.gmail.com>
 <1447324339.31665.120.camel@linux.intel.com>
Date: Thu, 12 Nov 2015 11:38:10 +0100
Message-ID: <CAMuHMdXDizMgNvgZdNCzDuTXSTBwswBN6QvxEmgqqD=VxUgkQw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] mtd: nand: Add support for Arasan Nand Flash
 Controller
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: punnaiah choudary kalluri <punnaia@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "michals@xilinx.com" <michals@xilinx.com>, wangzhou1@hisilicon.com,
 Florian Fainelli <f.fainelli@gmail.com>, Gerhard Sittig <gsi@denx.de>,
 haokexin@gmail.com, Roger Quadros <rogerq@ti.com>,
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

On Thu, Nov 12, 2015 at 11:32 AM, Andy Shevchenko
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

#3: Module filenames must be unique, too. "modprobe arasan_nfc.ko" won't
know which module to load.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
