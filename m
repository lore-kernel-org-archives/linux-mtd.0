Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP652-00055N-3G
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 07:33:45 +0000
Received: by mail-la0-f43.google.com with SMTP id ep20so615640lab.16
 for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2013 00:33:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5243E130.3040200@nod.at>
References: <1380141125-11063-1-git-send-email-richard@nod.at>
 <5243E033.7010403@gmail.com> <5243E130.3040200@nod.at>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 26 Sep 2013 09:33:01 +0200
Message-ID: <CACQ1gAgqfHXwLjxhy9RrzFWe93Vmnc0chOg6uRKyqb6sVVQKxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] UBI: Fix error path in scan_pool()
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/9/26 Richard Weinberger <richard@nod.at>:
> Am 26.09.2013 09:20, schrieb Richard Genoud:
>> On 25/09/2013 22:32, Richard Weinberger wrote:
>>> We have to set "ret", not "err" in case of an error.
>>>
>>> Reported-by: Richard Genoud <richard.genoud@gmail.com>
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>> ---
>>>  drivers/mtd/ubi/fastmap.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
>>> index f5aa4b0..9b42add 100644
>>> --- a/drivers/mtd/ubi/fastmap.c
>>> +++ b/drivers/mtd/ubi/fastmap.c
>>> @@ -428,7 +428,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
>>>              if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
>>>                      ubi_err("bad image seq: 0x%x, expected: 0x%x",
>>>                              be32_to_cpu(ech->image_seq), ubi->image_seq);
>>> -                    err = UBI_BAD_FASTMAP;
>>> +                    ret = UBI_BAD_FASTMAP;
>>>                      goto out;
>>>              }
>>>
>>>
>>
>> Tested-by: Richard Genoud <richard.genoud@gmail.com>
>>
>> It reveals another bug though.
>>
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    0.914062] UBI error: scan_pool: bad image seq: 0x0, expected: 0x352a9728
>
> This worries me more...
> The fastmap is corrupted, now we have to find out why.
> Broken driver? Powercut? IO errors?
I guess this is caused by u-boot when it deletes the UBI fastmap
internal volume.
I'm replaying the whole scenario with debug to see when it happens.

>
>> [    0.921875] UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!
>> [    0.929687] kmem_cache_destroy ubi_ainf_peb_slab: Slab cache still has objects
>
> I see.
>
> Thanks,
> //richard



-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
