Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyHzR-0002Ns-Hs
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 14:44:08 +0000
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id w87EhYkR030561
 for <linux-mtd@lists.infradead.org>; Fri, 7 Sep 2018 23:43:34 +0900
Received: by mail-vk1-f173.google.com with SMTP id e139-v6so922447vkf.6
 for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2018 07:43:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180907160822.319047c8@bbrezillon>
References: <1536317783-4942-1-git-send-email-yamada.masahiro@socionext.com>
 <20180907160822.319047c8@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 7 Sep 2018 23:42:53 +0900
Message-ID: <CAK7LNAQJOD3mxwbiOSn5wpDsU23DhZcx9QB_ufFZB8LUnh1KdQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: denali: add DT property to specify skipped
 bytes in OOB
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

2018-09-07 23:08 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> Hi Masahiro,
>
> On Fri,  7 Sep 2018 19:56:23 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> NAND devices need additional data area (OOB) for error correction,
>> but it is also used for Bad Block Marker (BBM).  In many cases, the
>> first byte in OOB is used for BBM, but the location actually depends
>> on chip vendors.  The NAND controller should preserve the precious
>> BBM to keep track of bad blocks.
>>
>> In Denali IP, the SPARE_AREA_SKIP_BYTES register is used to specify
>> the number of bytes to skip from the start of OOB.  The ECC engine
>> will automatically skip the specified number of bytes when it gets
>> access to OOB area.
>>
>> The same value for SPARE_AREA_SKIP_BYTES should be used between
>> firmware and the operating system if you intend to use the NAND
>> device across the control hand-off.
>>
>> In fact, the current denali.c code expects firmware to have already
>> set the SPARE_AREA_SKIP_BYTES register, then reads the value out.
>>
>> If no firmware (or bootloader) has initialized the controller, the
>> register value is zero, which is the default after power-on-reset.
>>
>> In other words, the Linux driver cannot initialize the controller
>> by itself.  You cannot support the reset control either because
>> resetting the controller will get register values lost.
>>
>> This commit adds a way to specify it via DT.  If the property
>> "denali,oob-skip-bytes" exists, the value will be set to the register.
>
> Hm, do we really need to make this config customizable? I mean, either
> you have a large-page NAND (page > 512 bytes) and the 2 first bytes
> must be reserved for the BBM or you have a small-page NAND and the BBM
> is at position 4 and 5. Are you sure people configure that differently?
> Don't you always have SPARE_AREA_SKIP_BYTES set to 6 or 2?


As I said in the patch description,
I need to use the same SPARE_AREA_SKIP_BYTES value
across firmware, boot-loader, Linux, and whatever.

I want to set the value to 8 for my platform
because the on-chip boot ROM expects 8.
I cannot change it since the boot ROM is hard-wired.


The boot ROM skips 8 bytes in OOB
when it loads images from the on-board NAND device.

So, when I update the image from U-Boot or Linux,
I need to make sure to set the register to 8.

If I update the image with a different value,
the Boot ROM fails to boot.



When the system has booted from NAND,
the register is already set to 8.  It works.

However, when the system has booted from eMMC,
the register is not initialized by anyone.
I am searching for a way to set the register to 8
in this case.


The boot ROM in SOCFPGA might expect a different value,
I am not sure.



Thanks.



> Regards,
>
> Boris
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Best Regards
Masahiro Yamada
