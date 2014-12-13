Received: from mail-la0-f54.google.com ([209.85.215.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzgYq-0004YQ-AU
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 06:52:17 +0000
Received: by mail-la0-f54.google.com with SMTP id pv20so7144323lab.27
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 22:51:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141213031151.GP21347@ld-irv-0074>
References: <1417351863-3812-1-git-send-email-ard.biesheuvel@linaro.org>
 <20141213031151.GP21347@ld-irv-0074>
Date: Sat, 13 Dec 2014 07:44:51 +0100
Message-ID: <CAKv+Gu_gpS6e_wuE-Jj19dq52mZJpUf6fgxJXTmHjOcXTo+1+A@mail.gmail.com>
Subject: Re: [PATCH] mtd: physmap_of: fix potential NULL dereference
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13 December 2014 at 04:11, Brian Norris <computersforpeace@gmail.com> wrote:
> On Sun, Nov 30, 2014 at 01:51:03PM +0100, Ard Biesheuvel wrote:
>> On device remove, when testing the cmtd field of an of_flash
>> struct to decide whether it is a concatenated device or not,
>> we get a false positive on cmtd == NULL, and dereference it
>> subsequently. This may occur if of_flash_remove() is called
>> from the cleanup path of of_flash_probe().
>
> Did you catch this on real hardware, or just by inspection? Just
> wondering if this should be marked for -stable.
>

I am not aware of this issue occurring in the field, but I caught it
while working on the EFI support for arm64 in the kernel. One of the
changes I am making is ensuring all iomem ranges owned by the firmware
are properly marked as busy in the iomem resource map. Once the NOR
flash holding the EFI variable store is reserved in the iomem resource
map, this issue will be triggered because the probe fails and has to
clean up after itself. Those changes are aimed for 3.20, so it would
be nice if this fix could have made it in by then.

Cheers,
Ard.

>> Instead, test for NULL first, and only then perform the test
>> for a concatenated device.
>>
>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>> ---
>>  drivers/mtd/maps/physmap_of.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
>> index c1d21cb501ca..e48930424091 100644
>> --- a/drivers/mtd/maps/physmap_of.c
>> +++ b/drivers/mtd/maps/physmap_of.c
>> @@ -47,14 +47,12 @@ static int of_flash_remove(struct platform_device *dev)
>>               return 0;
>>       dev_set_drvdata(&dev->dev, NULL);
>>
>> -     if (info->cmtd != info->list[0].mtd) {
>> +     if (info->cmtd) {
>>               mtd_device_unregister(info->cmtd);
>> -             mtd_concat_destroy(info->cmtd);
>> +             if (info->cmtd != info->list[0].mtd)
>> +                     mtd_concat_destroy(info->cmtd);
>>       }
>>
>> -     if (info->cmtd)
>> -             mtd_device_unregister(info->cmtd);
>> -
>>       for (i = 0; i < info->list_size; i++) {
>>               if (info->list[i].mtd)
>>                       map_destroy(info->list[i].mtd);
>
> Brian
