Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drx9V-0003rQ-5P
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 02:11:47 +0000
Received: by mail-wm0-x22c.google.com with SMTP id i189so6829284wmf.1
 for <linux-mtd@lists.infradead.org>; Tue, 12 Sep 2017 19:11:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1505151868.31322.98.camel@infinera.com>
References: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
 <1505151868.31322.98.camel@infinera.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Sep 2017 10:11:21 +0800
Message-ID: <CAEUhbmXOiEKx736ht6pku31nuHVJgEK=wigdpeJAd678Mx3sPA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] spi-nor: intel-spi: Various fixes and
 enhancements
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "sr@denx.de" <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joakim,

On Tue, Sep 12, 2017 at 1:44 AM, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> On Mon, 2017-09-11 at 02:41 -0700, Bin Meng wrote:
>> This series does several bug fixes and clean ups against the intel-spi
>> spi-nor driver, as well as enhancements to make the driver independent
>> on the underlying BIOS/bootloader.
>>
>> At present the driver uses the HW sequencer for the read/write/erase on
>> all supported platforms, read_reg/write_reg for BXT, and the SW sequencer
>> for read_reg/write_reg for BYT/LPT. The way the driver uses the HW and SW
>> sequencer relies on some programmed register settings and hence creates
>> unneeded dependencies with the underlying BIOS/bootloader. For example,
>> the driver unfortunately does not work as expected when booting from
>> Intel Baytrail FSP based bootloaders like U-Boot, as the Baytrail FSP
>> does not set up some SPI controller settings to make the driver happy.
>> Now such limitation has been removed with this series.
>
> Hi Bin
>
> Just starting to test these on Rangeley and got a question: We have two SPI flashes on CS0 resp. CS1
> and the mtd driver seems to only map the first of those flashes. Is this intentional or
> are we missing something?
>

All the boards I have tested only have one SPI flash. Mika, any comments?

Regards,
Bin
