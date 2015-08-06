Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNITJ-0004Ro-8g
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 10:32:26 +0000
Received: by wibxm9 with SMTP id xm9so17830353wib.1
 for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2015 03:32:02 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Richard Weinberger <richard@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at> <55ADE0F1.9090809@gmail.com>
 <55ADE35F.6050808@nod.at> <55AF41DD.2060902@gmail.com>
 <55AF4447.50500@nod.at> <55B24F2F.9020705@gmail.com>
 <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55BC68D6.2070008@nod.at>
Cc: linux-mtd@lists.infradead.org
Message-ID: <55C3379E.50000@gmail.com>
Date: Thu, 6 Aug 2015 12:31:58 +0200
MIME-Version: 1.0
In-Reply-To: <55BC68D6.2070008@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 08/01/2015 08:36 AM, Richard Weinberger wrote:

> Am 31.07.2015 um 18:47 schrieb Bhuvanchandra DV:
>> On 07/24/2015 06:51 PM, Richard Weinberger wrote:
>>
>>> Hi!
>>>
>>> Am 24.07.2015 um 16:43 schrieb Bhuvanchandra DV:
>>>> Disabled fastmap in U-Boot, still the corruption is persistent when using
>>>> U-Boot to mount rootfs and load kernel.
>>> Can you please describe your boot setup in detail?
>>> Why does U-Boot _mount_ an UBIFS? Install the kernel on an UBI static volume.
>> U-Boot mounts UBIFS for loading the kernel and device tree blobs availabel in rootfs.
>> Since approximately around ~3-5 % of spare blocks are reserverd for wear leveling
>> (according to the NAND manufacturer). Initially we had a separate UBI partition of 8MB
>> for Kenrel, but after few times of re-writing the kernel to that volume kernel fails
>> with no available free space. Due to that reason we made a single big ubi volume and
>> moved the kernel and device tree blobs to rootfs.
> UBI partition? You mean UBI volume?

Sorry, UBI volume.

> Just install kernel, initrd and dtb on UBI static volumes.
>
> If U-Boot has to mount UBIFS it has to do that in RW mode.
> So, no fastmap for you.

Okay

>> Seems the mtd-utils are not really cross-compile friendly, some how managed to build the ubi-tests
>> tweeking the Makefiles.
> Seeing forward to receive patches or at least a bug report.

Sure will do it.

>
>> The tests ran on ubi partition after isolating it from U-Boot completly.
>> Formatted the ubi partition and then boot with SD card (4.1.2 kernel fastmap enabled/disabled, fm_debug enabled).
>> Please find the below log of ubi-tests:
>>
>> [io_paral] write_thread():222: written and read data are different
> *blink*

Tried to run the io_paral test multiple times seperately with few debug prints added to see what exact
differences with read and write buffers, so far we could see one complete page is read twice even though
it is written once. I'm now confused is the issue happen while reading or while writing. Can you give us
some pointers so that we can narrow down the cause for this failure.

>
> Thanks,
> //richard

Best regards,
Bhuvan
