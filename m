Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arFSj-0004qr-I2
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2016 01:55:54 +0000
Received: by mail-lf0-x22f.google.com with SMTP id e190so164229562lfe.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 18:55:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyTg=i2RpGyuoCZBRwdANUYt3dJg08Hfgs2qohnGrCfYQ@mail.gmail.com>
References: <CAEVGjpo0J7nsoSX7LHqypUH=83unohxk5QTyP=dQevmZOLMq_w@mail.gmail.com>
 <CAFLxGvyTg=i2RpGyuoCZBRwdANUYt3dJg08Hfgs2qohnGrCfYQ@mail.gmail.com>
Date: Fri, 15 Apr 2016 22:55:30 -0300
Message-ID: <CAEVGjpoa+Gm8b=ubHE3NBUaAb1iXXCcSdT04eABWOcssMw44hA@mail.gmail.com>
Subject: Re: Bit flip detection after boot
From: Raphael Pereira <raphael@rmi.inf.br>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Raphael Derosso Pereira <raphaelpereira@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been able to produce 2 different kernel binaries that produces
different results.

On 3.10.98 I get NO bit-flip whatsoever AND I can write the bootable
image to block 0 and it works, in other words, CPU Boot ROM
understands written data AND ECC in block 0 and performs a successful
flash boot. Besides boot, the system is running perfectly with no
error message.

On 4.0.4 and 4.1.18, both kernels compiled with the same
configuration, bit flips occurs AND Boot ROM doesn't recognize written
image, so I cannot boot from flash. System runs fine (I didn't try
long runs) but it show a huge amount of bit-flips every time system is
booted.

It sounds like there is a problem in the low level drivers for kernels
above 3.10, not sure which version is the first to show this
behaviour. I notice also that the GPMI driver is quite different on
4.x. I think, IMHO, that in some point in GPMI development tests
stopped being done for mx23 architecture and there might be some kind
of bit swap in ECC writing. Maybe that particular differences between
mx28/mx6/etc.

It would be great to know when the driver got that massive change and
until which kernel version mx23 is/was supported.

Best Regards,

2016-04-14 5:51 GMT-03:00 Richard Weinberger <richard.weinberger@gmail.com>:
> On Wed, Apr 13, 2016 at 11:25 PM, Raphael Pereira <raphael@rmi.inf.br> wrote:
>> Hi,
>>
>> I have a custom board with a GPMI interface (Freescale i.MX233) with
>> kernel 4.1.18 using Micron MT29F4G08ABADAWP (nand: 512 MiB, SLC, erase
>> size: 128 KiB, page size: 2048, OOB size: 64).
>>
>> When I boot, the flash gets recognized and works flawless. I can
>> ubiformat, ubiattach, mount, copy a lot of files, umount, remount,
>> check and test in whatever way I need. No problem arrises.
>> The problem is that when I shut the system down (turn it off) and boot
>> again, all used blocks are marked as badblocks.
>
> Sounds like you have a massive bitflip problem.
> This is where you should start investigating.
> Are you facing so massive bitflips that the bad block marker is wrongly set?
>
>> I have used another flash (Toshiba with w/ erase size: 256KiB) and it
>> works perfectly, with no problem at all.
>>
>> Trying to find out what might be the problem, I found BBT DTS option,
>> so I enabled it and, instead of marking all blocks as bad, I end up
>> with UBI detecting bit-flips on all sectors, but correctable flips, so
>
> You've disabled the bad block scan and tried to paper over the root cause. ;)
>
>> I can use the flash normally (although it takes a lot of time to boot
>> because of the many messages "ubi0: fixable bit-flip detected at PEB
>> XXX".
>>
>> I have changed the chip a lot of times and have checked my hardware
>> and I am quite sure it is not a hardware problem. I think that some
>> structure detection of the flash is wrong in the kernel for this
>> particular case (i.MX233 BCH + MT29F4G08ABADAWP).
>>
>> Can someone guide me in debugging this problem?
>
> As I said, find out why you're facing so much bitflips.
>
> --
> Thanks,
> //richard



-- 
Raphael Derosso Pereira
raphael@rmi.inf.br
+55-41-8877-1762
