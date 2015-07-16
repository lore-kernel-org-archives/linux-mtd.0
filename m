Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFdhR-0006Q7-5a
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2015 07:35:22 +0000
Received: by pactm7 with SMTP id tm7so38606766pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2015 00:34:59 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Fwd: Re: UBIFS errors when file-system is full
References: <55A4F970.9030402@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Message-ID: <55A75EA0.5080008@gmail.com>
Date: Thu, 16 Jul 2015 13:04:56 +0530
MIME-Version: 1.0
In-Reply-To: <55A4F970.9030402@gmail.com>
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

-------- Forwarded Message --------

Subject: 	

Re: UBIFS errors when file-system is full

Date: 	

Tue, 14 Jul 2015 17:28:40 +0530

From: 	

Bhuvanchandra DV <bhuvanchandra.dv@gmail.com>

To: 	

Richard Weinberger <richard@nod.at>

On 07/14/2015 04:36 PM, Richard Weinberger wrote:

> Am 14.07.2015 um 12:08 schrieb Bhuvanchandra DV:
>> On 07/14/2015 02:12 PM, Richard Weinberger wrote:
>>
>>> Am 14.07.2015 um 10:29 schrieb Bhuvanchandra DV:
>>>> On 07/14/2015 12:02 PM, Richard Weinberger wrote:
>>>>
>>>>> Am 14.07.2015 um 08:30 schrieb Bhuvanchandra DV:
>>>>>> Reproduced the issue with a clean UBI image.
>>>>> On 4.1?
>>>>> How can you reproduce?
>>>> Flashed a clean UBI image with 4.1.
>>>> I can reproduce it by amost filling up the flash and doing a power resets for around ~200 cycles.
>>> And it really happens only if you're filling up the UBIFS?
>> The only thing observed so far during this tests is when the journactl log starts filling up the flash
>> memory and at some point of time fails to mount the ubifs.
> You mean filling up the filesystem? How and when does the power cut happen?

Actually one of our customer reported this issue with ubifs corruption after several power cuts.

Tried to replicate the same by automatically cutting down the power after every successful boot around ~500 cycles.
During the tests we also observed the journalctl fills the logs in filesystem. Since the limit for journalctl by default
set to 16MB it starts filling up filesystem with journal logs.

>
>> Flashed an Image which occupies less flash ~40-50%. Run the same tests for around 1200 power cycles
>> no issues observed during mounting but still there are few error messages:
>> ..
>> [    6.879643] ubi0 error: __wl_get_peb: no free eraseblocks
> This message cannot come from a recent kernel.

Yes, this is observed with 4.0 kernel.

>
>> So came to an assumption that filling the flash to max lead to this issue.
>>
>> Could there be any other possibility for this issue apart from filling up the flash ?
>>
>>> If you set the UBI module parameter "fm_debug", does the EBA selfcheck trigger?
>> Yes, EBA selfcheck got triggered. Atleast i could see the debug printks added
>> in 'self_check_eba' method after setting the fm_debug parameter.
>>
>>>> During some point U-Boot cannot mount the ubifs partition and fails with:
>>>> "Error reading superblock on volume 'ubi0:rootfs' errno=-22!"
>>> How exactly is U-Boot involved? Does U-Boot touch UBI in any way?
>> kernel, device tree blobs are available in rootfs /boot. U-Boot mounts the ubi partition
>> and loads the kernel and device tree blob.
>>
>> Also U-Boot is involved during flashing the UBI image to flash.
> In you last mail you wrote
> "During some point U-Boot cannot mount the ubifs partition and fails with"..
>
> So, please reproduce from scratch(!) with a recent kernel (4.1 or newer) and provide all needed infos.
> Otherwise I see no way howto help you.

Sorry! for the confusion.

When running the automated power cut test with 4.0 and 4.1separately  from scratch, after several power cuts,
U-Boot fails mounting with -22 error. We though might be an issue with U-Boot and tried booting the kernel via tftp
and tried to mount the ubifs with kernel, mounting fails with a stack trace. The debug logs are shared in our
previous mail conversation.

The tests with 4.0, 4.1 are doneseparately  from scratch. Will try to reproduce again from scratch with 4.1.2 and will
share all the needed information.

>
> Thanks,
> //richard
>
Best regards,
Bhuvan
