Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewWtJ-0000sv-IJ
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 17:42:15 +0000
Received: by mail-pl0-x241.google.com with SMTP id m22-v6so4206710pls.5
 for <linux-mtd@lists.infradead.org>; Thu, 15 Mar 2018 10:42:03 -0700 (PDT)
Subject: Re: [PATCH 2/2 v2] mtd: ubi: use put_device() if device_register fail
To: Richard Weinberger <richard@nod.at>
References: <1521098431-29565-1-git-send-email-arvind.yadav.cs@gmail.com>
 <5296799.FRhcbj8Hd9@blindfold>
 <11250cfc-f092-b299-1044-50334c518bf1@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: arvindY <arvind.yadav.cs@gmail.com>
Message-ID: <5AAAB066.90900@gmail.com>
Date: Thu, 15 Mar 2018 23:11:58 +0530
MIME-Version: 1.0
In-Reply-To: <11250cfc-f092-b299-1044-50334c518bf1@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thursday 15 March 2018 02:17 PM, Arvind Yadav wrote:
>
>
> On Thursday 15 March 2018 01:25 PM, Richard Weinberger wrote:
>> Am Donnerstag, 15. März 2018, 08:20:31 CET schrieb Arvind Yadav:
>>> if device_register() returned an error! Always use put_device()
>>> to give up the reference initialized.
>> Like DaveM said, there is no need to shout and use "!".
>
> I will fix this and send you update patch.
>>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>>> ---
>>> change in v2:
>>>          Fix use-after-free bug. move put_device() after cdev_del().
>>>
>>>   drivers/mtd/ubi/vmt.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
>>> index 3fd8d7f..93c6163 100644
>>> --- a/drivers/mtd/ubi/vmt.c
>>> +++ b/drivers/mtd/ubi/vmt.c
>>> @@ -610,6 +610,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct
>>> ubi_volume *vol)
>>>
>>>   out_cdev:
>>>       cdev_del(&vol->cdev);
>>> +    put_device(&vol->dev);
>>>       return err;
>> The more I dig into device code, the more questions I have.
>> Why is cdev_del() not part of the release function?
>>
>> Thanks,
>> //richard
>
> Yes, It's should be a part release function.
>
> ~arvind

I was wrong, We can not add cdev_del() in release(vol_release)
function.
Function's ubi_create_volume and ubi_add_volume both are using
same release function to release a volume devices.
ubi_add_volume is registering character device for the volume.
So we will have to release character device here.

~arvind
