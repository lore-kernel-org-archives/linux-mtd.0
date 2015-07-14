Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEy3M-0008GQ-0D
 for linux-mtd@lists.infradead.org; Tue, 14 Jul 2015 11:07:13 +0000
Message-ID: <55A4ED47.4060802@nod.at>
Date: Tue, 14 Jul 2015 13:06:47 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS errors when file-system is full
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com>
In-Reply-To: <55A4DF83.5080505@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 14.07.2015 um 12:08 schrieb Bhuvanchandra DV:
> On 07/14/2015 02:12 PM, Richard Weinberger wrote:
> 
>> Am 14.07.2015 um 10:29 schrieb Bhuvanchandra DV:
>>> On 07/14/2015 12:02 PM, Richard Weinberger wrote:
>>>
>>>> Am 14.07.2015 um 08:30 schrieb Bhuvanchandra DV:
>>>>> Reproduced the issue with a clean UBI image.
>>>> On 4.1?
>>>> How can you reproduce?
>>> Flashed a clean UBI image with 4.1.
>>> I can reproduce it by amost filling up the flash and doing a power resets for around ~200 cycles.
>> And it really happens only if you're filling up the UBIFS?
> 
> The only thing observed so far during this tests is when the journactl log starts filling up the flash
> memory and at some point of time fails to mount the ubifs.

You mean filling up the filesystem? How and when does the power cut happen?

> Flashed an Image which occupies less flash ~40-50%. Run the same tests for around 1200 power cycles
> no issues observed during mounting but still there are few error messages:
> ..
> [    6.879643] ubi0 error: __wl_get_peb: no free eraseblocks

This message cannot come from a recent kernel.

> So came to an assumption that filling the flash to max lead to this issue.
> 
> Could there be any other possibility for this issue apart from filling up the flash ?
> 
>> If you set the UBI module parameter "fm_debug", does the EBA selfcheck trigger?
> 
> Yes, EBA selfcheck got triggered. Atleast i could see the debug printks added
> in 'self_check_eba' method after setting the fm_debug parameter.
> 
>>
>>> During some point U-Boot cannot mount the ubifs partition and fails with:
>>> "Error reading superblock on volume 'ubi0:rootfs' errno=-22!"
>> How exactly is U-Boot involved? Does U-Boot touch UBI in any way?
> 
> kernel, device tree blobs are available in rootfs /boot. U-Boot mounts the ubi partition
> and loads the kernel and device tree blob.
> 
> Also U-Boot is involved during flashing the UBI image to flash.

In you last mail you wrote
"During some point U-Boot cannot mount the ubifs partition and fails with"..

So, please reproduce from scratch(!) with a recent kernel (4.1 or newer) and provide all needed infos.
Otherwise I see no way howto help you.

Thanks,
//richard
