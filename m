Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzLaF-0005J8-66
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2012 05:47:01 +0000
Received: by ghbf20 with SMTP id f20so71436ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2012 22:46:57 -0700 (PDT)
Message-ID: <50234ECA.3070409@gmail.com>
Date: Thu, 09 Aug 2012 13:46:50 +0800
From: Warrick <warrick.jiang@gmail.com>
MIME-Version: 1.0
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] UBI:Force ubi driver load after mtd device drivers
References: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
 <CAFLxGvzoXrOhmG=0Jd5My_sEowsUXrG3=HWHR8JUYkCFs-cWHg@mail.gmail.com>
In-Reply-To: <CAFLxGvzoXrOhmG=0Jd5My_sEowsUXrG3=HWHR8JUYkCFs-cWHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Jiang Lu <lu.jiang@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2012年08月09日 05:52, richard -rw- weinberger 写道:
> On Wed, Aug 8, 2012 at 4:31 AM, Jiang Lu <lu.jiang@windriver.com> wrote:
>> To implement rootfs on mtd device with UBIFS, kernel need create a
>> UBIFS device when booting:
>>
>> drivers/mtd/ubi/build.c ubi_init()
>> for (i = 0; i < mtd_devs; i++) {
>>          ...
>>          mtd = open_mtd_device(p->name);
>>          if (IS_ERR(mtd)) {
>>                  err = PTR_ERR(mtd);
>>                  goto out_detach;
>>          }
>>
>>          ubi_attach_mtd_dev()
>>          ...
>> }
>> module_init(ubi_init);
>>
>> Kernel can not create the UBIFS device without corresponding mtd
>> partiton.
>>
>> Some NAND device can not guarenteen the mtd patition created before
>> UBIFS deivce driver loading. Such as SPI NAND deivce, the mtd partition
>> will create after SPI bus driver loaded.
>>
>> UBI device driver must load after other mtd device drivers to make sure
>> the mtd partition already exist when creating UBI deivce.
>>
>> The patch updates the UBI device driver's initial routine to
>> late_initcall level.
>>
>> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
>> ---
>>   drivers/mtd/ubi/build.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>> index 0fde9fc..efbcaef 100644
>> --- a/drivers/mtd/ubi/build.c
>> +++ b/drivers/mtd/ubi/build.c
>> @@ -1275,7 +1275,7 @@ out:
>>          ubi_err("UBI error: cannot initialize UBI, error %d", err);
>>          return err;
>>   }
>> -module_init(ubi_init);
>> +late_initcall(ubi_init);
> Cant we use a simple initrd in such a case?
> Within the initrd you can load the ubi module after your SPI NAND is done.
>
This could be a workround. But for the ubi device driver, kernel should 
invoke ubi_init() after all mtd partition ready.
