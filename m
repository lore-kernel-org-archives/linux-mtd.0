Received: from mail-wi0-f181.google.com ([209.85.212.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnkqC-00008N-3e
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 09:00:53 +0000
Received: by mail-wi0-f181.google.com with SMTP id n3so9678128wiv.8
 for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2014 01:00:25 -0800 (PST)
Message-ID: <54607EA4.6010709@invoxia.com>
Date: Mon, 10 Nov 2014 10:00:20 +0100
From: "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Marek Vasut <marex@denx.de>, dehrenberg@chromium.org,
 linux-mtd@lists.infradead.org, james.hartley@imgtec.com
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
References: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
 <20141106160548.GB21363@kroah.com> <545BB0BB.3040905@imgtec.com>
 <20141106174459.GA3945@kroah.com> <545BB7F1.5050400@imgtec.com>
 <545BBB26.2040207@imgtec.com> <20141106192041.GB23619@ld-irv-0074>
In-Reply-To: <20141106192041.GB23619@ld-irv-0074>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: abrestic@chromium.org, Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ionela Voinescu <ionela.voinescu@imgtec.com>,
 Kamlakant Patel <kamlakant.patel@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Le 06/11/2014 20:20, Brian Norris a écrit :
> On Thu, Nov 06, 2014 at 03:17:10PM -0300, Ezequiel Garcia wrote:
>> How about picking Sourav's v2 as a starting point:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2013-July/047434.html
> Completely irrelevant, but I found this amusing in that patch, a few
> lines into spinand.h:
>
> +/bin/bash: 4: command not found
>
> :)
>
>> And then try to use that to support Micron's MT29F and Gigadevice's GD5F ?
>>
>> Brian: Any ideas or suggestion on how to proceed?
> I'm not opposed to trying to build a proper SPI-NAND framework. But the
> linked v2 patch doesn't provide much to start from. It barely handles
> anything that is specific to SPI-NAND (pushing the details out to a
> flash-specific driver), and it doesn't address what I think the biggest
> question is: how similar will the various SPI-NAND implementations be?
> I've talked with a few flash vendors and seen that there were some
> growing pains with developing a first generation de-facto standard, so
> there is bound to be a bit of incompatibility if we try to support the
> earliest examples, but it seemed like there was some effort to keep
> things consistent across different manufacturers. I don't know the
> progress of any standardization effort there.
I was playing with spi nand devices (MT29F1G01AAADD and GD5F1GQ4x) 
starting from the linked v2 patch, and I have a some hardware with such 
devices.
As far as I could say, it was not a good idea to start from that patch. 
I had to rewrite a lot of things to make the devices working 
correctly... and the result is not very beautiful, despite spi nand is 
not really complicated.

Basically, spinand is really more similar to spi nor, than to standard 
raw nand device.
I even wonder if it is a good idea or not, to extend the spi nor 
framework for a spi nand support ... (add bad block scanning, write size 
different from 1, check the the status for ECC errors or bad blocks ...)
But I suspect that "spi nor" maintainers will  not be happy to allow 
such risky modifications.

If we are going to a specific spinand framework, my advise would be to 
read again the spi nor framework carefully first, and do something 
similar (especially for latests work on quad spi)

Arnaud
>
> Anyway, I think we really should look at whether any of the
> identification and command sequencing details can be abstracted into a
> drivers/mtd/spinand/spinand.c, with client drivers mostly handling the
> transport protocol differences (e.g., interfacing with the SPI layer,
> similar to what m25p80.c does for SPI NOR).
>
> I don't have any time to create such a framwork on my own, but I may be
> able to spare some limited resources for reviewing others' work. I'd
> really like to see some efforts from a few interested reviewers, as I
> haven't figured out how to squeeze more hours into my day yet.
>
> BTW, has there been any progress on whatever TODO items landed
> mt29f_spinand in staging in the first place?
>
> Brian
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
