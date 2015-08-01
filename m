Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLQPJ-0004Rd-Pa
 for linux-mtd@lists.infradead.org; Sat, 01 Aug 2015 06:36:35 +0000
Subject: Re: UBIFS errors when file-system is full
To: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
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
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BC68D6.2070008@nod.at>
Date: Sat, 1 Aug 2015 08:36:06 +0200
MIME-Version: 1.0
In-Reply-To: <55BBA6A5.9020701@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 31.07.2015 um 18:47 schrieb Bhuvanchandra DV:
> On 07/24/2015 06:51 PM, Richard Weinberger wrote:
> 
>> Hi!
>>
>> Am 24.07.2015 um 16:43 schrieb Bhuvanchandra DV:
>>> Disabled fastmap in U-Boot, still the corruption is persistent when using
>>> U-Boot to mount rootfs and load kernel.
>> Can you please describe your boot setup in detail?
>> Why does U-Boot _mount_ an UBIFS? Install the kernel on an UBI static volume.
> 
> U-Boot mounts UBIFS for loading the kernel and device tree blobs availabel in rootfs.
> Since approximately around ~3-5 % of spare blocks are reserverd for wear leveling
> (according to the NAND manufacturer). Initially we had a separate UBI partition of 8MB
> for Kenrel, but after few times of re-writing the kernel to that volume kernel fails
> with no available free space. Due to that reason we made a single big ubi volume and
> moved the kernel and device tree blobs to rootfs.

UBI partition? You mean UBI volume?
Just install kernel, initrd and dtb on UBI static volumes.

If U-Boot has to mount UBIFS it has to do that in RW mode.
So, no fastmap for you.

> Seems the mtd-utils are not really cross-compile friendly, some how managed to build the ubi-tests
> tweeking the Makefiles.

Seeing forward to receive patches or at least a bug report.

> The tests ran on ubi partition after isolating it from U-Boot completly.
> Formatted the ubi partition and then boot with SD card (4.1.2 kernel fastmap enabled/disabled, fm_debug enabled).
> Please find the below log of ubi-tests:
> 

> [io_paral] write_thread():222: written and read data are different

*blink*

Thanks,
//richard
