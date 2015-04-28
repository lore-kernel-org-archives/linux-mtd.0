Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmwRz-0005u6-J3
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 03:44:48 +0000
Received: by pacwv17 with SMTP id wv17so128802931pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2015 20:44:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <20150428032213.GI19571@brian-ubuntu>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
 <20150427232353.GD32500@ld-irv-0074>
 <CAGnW=BYVn5quNKooiB44CiCYtuYckWArTkft4BQLxs188FwUpg@mail.gmail.com>
 <20150428032213.GI19571@brian-ubuntu>
Date: Tue, 28 Apr 2015 09:14:26 +0530
Message-ID: <CAGnW=BYeJQyg8BYX0oOxrnT_VNUh9iUNPGPmioqV7Xrj3by92g@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ben Shelton <ben.shelton@ni.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 28, 2015 at 8:52 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Apr 28, 2015 at 08:18:12AM +0530, punnaiah choudary kalluri wrote:
>> On Tue, Apr 28, 2015 at 4:53 AM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > On Tue, Apr 28, 2015 at 12:19:16AM +0200, Richard Weinberger wrote:
>> >> Oh, I thought every driver has to implement that function. ;-\
>> >
>> > Nope.
>> >
>> >> But you're right there is a corner case.
>> >
>> > And it's not the only one! Right now, there's no guarantee even that
>> > read_buf() returns raw data, unmodified by the SoC's controller. Plenty
>> > of drivers actually have HW-enabled ECC turned on by default, and so
>> > they override the chip->ecc.read_page() (and sometimes
>> > chip->ecc.read_page_raw() functions, if we're lucky) with something
>> > that pokes the appropriate hardware instead. I expect anything
>> > comprehensive here is probably going to have to utilize
>> > chip->ecc.read_page_raw(), at least if it's provided by the hardware
>> > driver.
>>
>> Yes, overriding the chip->ecc.read_page_raw would solve this.
>
> I'm actually suggesting that (in this patch set, for on-die ECC
> support), maybe we *shouldn't* override chip->ecc.read_page_raw() and
> leave that to be defined by the driver, and then on-die ECC support
> should be added in a way that just calls chip->ecc.read_page_raw(). This
> should work for any driver that already properly supports the raw
> callbacks.

Ok. Understood.

>
>> Agree that
>> read_buf need not be returning raw data always including my new driver for
>> arasan nand flash controller.
>
> I agree with that. At the moment, chip->read_buf() really has very
> driver-specific meaning. Not sure if that's really a good thing, but
> it's the way things are...
>
>> http://lkml.iu.edu/hypermail/linux/kernel/1504.2/00313.html
>
> In the half a minute I just spent looking at this (I may review it
> properly later), I noted a few things:
>
> 1. you don't implement ecc.read_page_raw(); this means we'll probably
> have trouble supporting on-die ECC with your driver, among other things

On-die ECC is optional as long as the controller has better ecc coverage.
The arasan controller supports up to 24 bit ecc. There is no point to use
on-die ECC and will always use hw ecc even for On-die ecc devices.
This version of driver will not have the support for ecc.read_page_raw but
I will add based on the need in future.


>
> 2. your patch is all white-space mangled. Please use your favorite
> search engine to figure out how to get that right. git-send-email is
> your friend.

Oh sorry. Looks that was the web link issue. Here is the new one.
 https://lkml.org/lkml/2015/4/16/311

Also request your time for reviewing this driver.

Thanks,
Punnaiah

>
> Thanks,
> Brian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
