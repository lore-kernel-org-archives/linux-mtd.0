Received: from mail-yh0-f53.google.com ([209.85.213.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgBD0-0005UB-T3
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 11:33:08 +0000
Received: by mail-yh0-f53.google.com with SMTP id b6so2913387yha.26
 for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2014 04:32:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5444ECD2.2010107@nod.at>
References: <1413750419-7020-1-git-send-email-amurray@embedded-bits.co.uk>
 <5444ECD2.2010107@nod.at>
Date: Mon, 20 Oct 2014 12:32:45 +0100
Message-ID: <CAPcvp5FhtmD3s+4goCCET5wxJtcvzoWkNcNg_PvCpBgprv5RJA@mail.gmail.com>
Subject: Re: [PATCH] mtd: ubi: Use UBI_METAONLY constraint for renames
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 October 2014 12:06, Richard Weinberger <richard@nod.at> wrote:
> Am 19.10.2014 um 22:26 schrieb Andrew Murray:
>> Renaming a volume does not alter nor read volume data - thus the existing
>> UBI_READWRITE constraint can be weakened. This patch provides a new
>> UBI_METAONLY constraint and updates the UBI rename logic to use it.
>>
>> This change permits the rename of a mounted volume which enables support
>> for additional methods of firmware upgrade - see discussion at
>> https://patchwork.ozlabs.org/patch/398784
>>
>> This patch differs from that of the original discussion through the addition
>> on an additional 'break' statement.
>
> Thanks for pointing out. I fat-fingered that.
>
>> Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>> Tested-by: Andrew Murray <amurray@embedded-bits.co.uk>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> Signed-off-by: Andrew Murray <amurray@embedded-bits.co.uk>
>
> This is not a valid SoB chain. You are not the author of this patch
> nor went it thought me. Please don't resend patches as your work.
>

Apologies that wasn't my intention - I got this wrong. I attempted to
clearly attribute the author through the patch description and
patchwork history and through the signed-off (I'll ask next time). I
added my sign-off due to my (very trivial) addition.

> While the patch works it needs some more thoughts.
> So far I had no time to review all code paths.
> Also the naming might need an update we have to differentiate between
> touching volume data and the volume metadata.
> i.e. exclusive access currently touches both. Maybe we need to interfere
> with UBI_METAONLY too.

Yes I can see this now as well.

Thanks,

Andrew Murray

>
> Thanks,
> //richard
>
>> ---
>>  drivers/mtd/ubi/cdev.c  |  2 +-
>>  drivers/mtd/ubi/kapi.c  | 12 +++++++++++-
>>  drivers/mtd/ubi/ubi.h   |  5 ++++-
>>  include/linux/mtd/ubi.h |  3 ++-
>>  4 files changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
>> index 7646220..4c4c455 100644
>> --- a/drivers/mtd/ubi/cdev.c
>> +++ b/drivers/mtd/ubi/cdev.c
>> @@ -731,7 +731,7 @@ static int rename_volumes(struct ubi_device *ubi,
>>                       goto out_free;
>>               }
>>
>> -             re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_READWRITE);
>> +             re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_METAONLY);
>>               if (IS_ERR(re->desc)) {
>>                       err = PTR_ERR(re->desc);
>>                       ubi_err("cannot open volume %d, error %d", vol_id, err);
>> diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
>> index 3aac1ac..b470619 100644
>> --- a/drivers/mtd/ubi/kapi.c
>> +++ b/drivers/mtd/ubi/kapi.c
>> @@ -137,7 +137,7 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
>>               return ERR_PTR(-EINVAL);
>>
>>       if (mode != UBI_READONLY && mode != UBI_READWRITE &&
>> -         mode != UBI_EXCLUSIVE)
>> +         mode != UBI_EXCLUSIVE && mode != UBI_METAONLY)
>>               return ERR_PTR(-EINVAL);
>>
>>       /*
>> @@ -186,6 +186,12 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
>>                       goto out_unlock;
>>               vol->exclusive = 1;
>>               break;
>> +
>> +     case UBI_METAONLY:
>> +             if (vol->metaonly)
>> +                     goto out_unlock;
>> +             vol->metaonly = 1;
>> +             break;
>>       }
>>       get_device(&vol->dev);
>>       vol->ref_count += 1;
>> @@ -343,6 +349,10 @@ void ubi_close_volume(struct ubi_volume_desc *desc)
>>               break;
>>       case UBI_EXCLUSIVE:
>>               vol->exclusive = 0;
>> +             break;
>> +     case UBI_METAONLY:
>> +             vol->metaonly = 0;
>> +             break;
>>       }
>>       vol->ref_count -= 1;
>>       spin_unlock(&ubi->volumes_lock);
>> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
>> index 7bf4163..629973f 100644
>> --- a/drivers/mtd/ubi/ubi.h
>> +++ b/drivers/mtd/ubi/ubi.h
>> @@ -260,6 +260,7 @@ struct ubi_fm_pool {
>>   * @readers: number of users holding this volume in read-only mode
>>   * @writers: number of users holding this volume in read-write mode
>>   * @exclusive: whether somebody holds this volume in exclusive mode
>> + * @metaonly: whether somebody is altering only meta data of this volume
>>   *
>>   * @reserved_pebs: how many physical eraseblocks are reserved for this volume
>>   * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
>> @@ -308,6 +309,7 @@ struct ubi_volume {
>>       int readers;
>>       int writers;
>>       int exclusive;
>> +     int metaonly;
>>
>>       int reserved_pebs;
>>       int vol_type;
>> @@ -389,7 +391,8 @@ struct ubi_debug_info {
>>   * @volumes_lock: protects @volumes, @rsvd_pebs, @avail_pebs, beb_rsvd_pebs,
>>   *                @beb_rsvd_level, @bad_peb_count, @good_peb_count, @vol_count,
>>   *                @vol->readers, @vol->writers, @vol->exclusive,
>> - *                @vol->ref_count, @vol->mapping and @vol->eba_tbl.
>> + *                @vol->metaonly, @vol->ref_count, @vol->mapping and
>> + *                @vol->eba_tbl.
>>   * @ref_count: count of references on the UBI device
>>   * @image_seq: image sequence number recorded on EC headers
>>   *
>> diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
>> index c3918a0..1ace519 100644
>> --- a/include/linux/mtd/ubi.h
>> +++ b/include/linux/mtd/ubi.h
>> @@ -38,7 +38,8 @@
>>  enum {
>>       UBI_READONLY = 1,
>>       UBI_READWRITE,
>> -     UBI_EXCLUSIVE
>> +     UBI_EXCLUSIVE,
>> +     UBI_METAONLY
>>  };
>>
>>  /**
>>



-- 
Andrew Murray, Director
Embedded Bits Limited
www.embedded-bits.co.uk

Embedded Bits Limited is a company registered in England and Wales
with company number 08178608 and VAT number 140658911. Registered
office: Embedded Bits Limited c/o InTouch Accounting Ltd. Bristol and
West House Post Office Road Bournemouth Dorset BH1 1BL
