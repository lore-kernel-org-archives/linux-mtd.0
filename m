Received: from conssluserg003.nifty.com ([202.248.44.41]
 helo=conssluserg003-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abKOI-0007WN-1g
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 03:57:30 +0000
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180]) (authenticated)
 by conssluserg003-v.nifty.com with ESMTP id u233v0LB012865
 for <linux-mtd@lists.infradead.org>; Thu, 3 Mar 2016 12:57:01 +0900
Received: by mail-yw0-f180.google.com with SMTP id h129so8572966ywb.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2016 19:57:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160208213757.GA3223@rob-hp-laptop>
References: <1454916702-20982-1-git-send-email-yamada.masahiro@socionext.com>
 <5298318.0qJ9fLYbSx@wuerfel>
 <CAK7LNAS2r=_RL6dmj1xhCzGtvMP=emC=_bW4Ot5SMe6ij-WpBQ@mail.gmail.com>
 <20160208213757.GA3223@rob-hp-laptop>
Date: Thu, 3 Mar 2016 12:56:59 +0900
Message-ID: <CAK7LNAT4qvp0DcevLXtGyGUn2kDjHWOH42Yn5yR9xGZkJ8Qdvw@mail.gmail.com>
Subject: Re: [PATCH] mtd: denali: fix property name for Denali DT binding
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
 Dinh Nguyen <dinguyen@altera.com>, devicetree@vger.kernel.org,
 Kumar Gala <galak@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rob,


2016-02-09 6:37 GMT+09:00 Rob Herring <robh@kernel.org>:
> On Mon, Feb 08, 2016 at 05:41:33PM +0900, Masahiro Yamada wrote:
>> Hi Arnd,
>>
>>
>> 2016-02-08 17:29 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> > On Monday 08 February 2016 16:31:42 Masahiro Yamada wrote:
>> >> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> index b04d03a..785b825 100644
>> >> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> @@ -5,7 +5,7 @@ Required properties:
>> >>    - reg : should contain registers location and length for data and reg.
>> >>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>> >>    - interrupts : The interrupt number.
>> >> -  - dm-mask : DMA bit mask
>> >> +  - dma-mask : DMA bit mask
>> >>
>> >>  The device tree may optionally contain sub-nodes describing partitions of the
>> >>  address space. See partition.txt for more detail.
>> >>
>> >
>> > It looks like this binding is wrong in multiple ways, and it doesn't seem to
>> > be used in any .dts files. Is this actually being shipped anywhere or
>> > could we try to fix the binding properly?
>> >
>>
>> Looks like it is locally used in Altera's Rocketboard tree now.
>>
>> See this:
>>
>> https://github.com/altera-opensource/linux-socfpga/blob/socfpga-4.3/arch/arm/boot/dts/socfpga.dtsi
>>
>>
>> I hope Dinh can comment on the status.
>
> From the looks of it, this property should be dropped and the driver
> should be updated to not touch dev->dma_mask. The core sets it up
> correctly now.


I am still a newbie as for DMA.
Could you help me to understand what we should do and/or what we should not do
for the DMA mask.


Documentation/DMA-API-HOWTO.txt says as follows:

-------------------->8-----------------------
For correct operation, you must interrogate the kernel in your device
probe routine to see if the DMA controller on the machine can properly
support the DMA addressing limitation your device has.  It is good
style to do this even if your device holds the default setting,
because this shows that you did think about these issues wrt. your
device.
--------------------<8----------------------


>From your statement, low-level drivers should no longer touch dma-mask
(i.e., the quoted paragraph above no longer applies to the latest
driver implementation),
is this correct?



-- 
Best Regards
Masahiro Yamada
