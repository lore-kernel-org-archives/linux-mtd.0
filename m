Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEx8b-00039G-14
 for linux-mtd@lists.infradead.org; Tue, 14 Jul 2015 10:08:33 +0000
Received: by pactm7 with SMTP id tm7so389144pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jul 2015 03:08:12 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Richard Weinberger <richard@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <55A4DF83.5080505@gmail.com>
Date: Tue, 14 Jul 2015 15:38:03 +0530
MIME-Version: 1.0
In-Reply-To: <55A4CB60.2080505@nod.at>
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

On 07/14/2015 02:12 PM, Richard Weinberger wrote:

> Am 14.07.2015 um 10:29 schrieb Bhuvanchandra DV:
>> On 07/14/2015 12:02 PM, Richard Weinberger wrote:
>>
>>> Am 14.07.2015 um 08:30 schrieb Bhuvanchandra DV:
>>>> Reproduced the issue with a clean UBI image.
>>> On 4.1?
>>> How can you reproduce?
>> Flashed a clean UBI image with 4.1.
>> I can reproduce it by amost filling up the flash and doing a power resets for around ~200 cycles.
> And it really happens only if you're filling up the UBIFS?

The only thing observed so far during this tests is when the journactl log starts filling up the flash
memory and at some point of time fails to mount the ubifs.

Flashed an Image which occupies less flash ~40-50%. Run the same tests for around 1200 power cycles
no issues observed during mounting but still there are few error messages:
..
[    6.879643] ubi0 error: __wl_get_peb: no free eraseblocks
..
So came to an assumption that filling the flash to max lead to this issue.

Could there be any other possibility for this issue apart from filling up the flash ?

> If you set the UBI module parameter "fm_debug", does the EBA selfcheck trigger?

Yes, EBA selfcheck got triggered. Atleast i could see the debug printks added
in 'self_check_eba' method after setting the fm_debug parameter.

>
>> During some point U-Boot cannot mount the ubifs partition and fails with:
>> "Error reading superblock on volume 'ubi0:rootfs' errno=-22!"
> How exactly is U-Boot involved? Does U-Boot touch UBI in any way?

kernel, device tree blobs are available in rootfs /boot. U-Boot mounts the ubi partition
and loads the kernel and device tree blob.

Also U-Boot is involved during flashing the UBI image to flash.

>
> Thanks,
> //richard
>
Best regards,
Bhuvan
