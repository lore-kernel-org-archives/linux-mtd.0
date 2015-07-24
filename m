Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIgCm-0004yy-Eb
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 16:52:17 +0000
Message-ID: <55B26D24.3060006@nod.at>
Date: Fri, 24 Jul 2015 18:51:48 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: UBIFS errors when file-system is full
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
In-Reply-To: <55B24F2F.9020705@gmail.com>
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

Hi!

Am 24.07.2015 um 16:43 schrieb Bhuvanchandra DV:
> Disabled fastmap in U-Boot, still the corruption is persistent when using
> U-Boot to mount rootfs and load kernel.

Can you please describe your boot setup in detail?
Why does U-Boot _mount_ an UBIFS? Install the kernel on an UBI static volume.

If U-Boot mounts UBIFS it has to use UBI in RW mode and therefore it has to process
fastmap or _delete_ it.

>>> The same power cut tests are done by skipping the U-Boot to mount the UBIFS. Loaded
>>> the kernel via tftp and mount the rootfs with kernel. The power cut test passed.
>>> I think U-Boot might have some issues, but not very sure.
>> To my knowledge U-Boot's fastmap support is incomplete.
>> If you *really* need fastmap in U-Boot make sure that they have backported
>> all recent fastmap changes. Fastmap is still experimental and faced a lot of fixes
>> recently.
> 
> Tested with mainline U-Boot along with few downstream patches for boot config block
> support applied, the ubifs corruption is persistant.
> 
>>
>>>> Anyway, we need to sort out what is going on.
>>>> As fm_debug does not trigger it could also be a non-fastmap issue.
>>>> Did you try your test without fastmap being enabled?
>>>>
>>>> Does your target pass UBI tests too?
>>> I'm not aware of UBI tests so far the driver passed all MTD tests.
>>> Can you please provide some pointers for UBI tests. Will run the UBI tests with
>>> driver.
>> They are in the mtd-utils source.
> 
> Not yet ran the ubi-tests. Will run the tests and share the results.

Please do so. :-)

Thanks,
//richard
