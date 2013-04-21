Received: from mail-da0-x232.google.com ([2607:f8b0:400e:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTjDr-0004tH-GA
 for linux-mtd@lists.infradead.org; Sun, 21 Apr 2013 01:37:44 +0000
Received: by mail-da0-f50.google.com with SMTP id a4so1009223dad.9
 for <linux-mtd@lists.infradead.org>; Sat, 20 Apr 2013 18:37:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366487439.1993.9.camel@dabdike>
References: <1366389602-19313-1-git-send-email-linkinjeon@gmail.com>
 <1366487439.1993.9.camel@dabdike>
Date: Sun, 21 Apr 2013 10:37:39 +0900
Message-ID: <CAKYAXd95xE1S4J-kuGzKYxWHZMZrKh6=-iSgkNakmGe15_AF=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] fix max discard sectors limit
From: Namjae Jeon <linkinjeon@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset=UTF-8
Cc: axboe@kernel.dk, nbd-general@lists.sourceforge.net, npiggin@kernel.dk,
 linux-scsi@vger.kernel.org, neilb@suse.de, dwmw2@infradead.org,
 Namjae Jeon <namjae.jeon@samsung.com>, Paul.Clements@steeleye.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, jcmvbkbc@gmail.com, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, cjb@laptop.org, shli@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/4/21 James Bottomley <James.Bottomley@hansenpartnership.com>:
> On Sat, 2013-04-20 at 01:40 +0900, Namjae Jeon wrote:
>> From: Namjae Jeon <namjae.jeon@samsung.com>
>>
>> linux-v3.8-rc1 and later support for plug for blkdev_issue_discard with
>> commit 0cfbcafcae8b7364b5fa96c2b26ccde7a3a296a9
>> (block: add plug for blkdev_issue_discard )
>>
>> For example,
>> 1) DISCARD rq-1 with size size 4GB
>> 2) DISCARD rq-2 with size size 1GB
>>
>> If these 2 discard requests get merged, final request size will be 5GB.
>>
>> In this case, request's __data_len field may overflow as it can store
>> max 4GB(unsigned int).
>>
>> This issue was observed while doing mkfs.f2fs on 5GB SD card:
>> https://lkml.org/lkml/2013/4/1/292
>>
>> # mkfs.f2fs /dev/mmcblk0p3
>> Info: sector size = 512
>> Info: total sectors = 11370496 (in 512bytes)
>> Info: zone aligned segment0 blkaddr: 512
>> [  257.789764] blk_update_request: bio idx 0 >= vcnt 0
>>
>> mkfs process gets stuck in D state and I see the following in the dmesg:
>>
>> [  257.789733] __end_that: dev mmcblk0: type=1, flags=122c8081
>> [  257.789764]   sector 4194304, nr/cnr 2981888/4294959104
>> [  257.789764]   bio df3840c0, biotail df3848c0, buffer   (null), len 1526726656
>> [  257.789764] blk_update_request: bio idx 0 >= vcnt 0
>> [  257.794921] request botched: dev mmcblk0: type=1, flags=122c8081
>> [  257.794921]   sector 4194304, nr/cnr 2981888/4294959104
>> [  257.794921]   bio df3840c0, biotail df3848c0, buffer   (null), len 1526726656
>>
>> Few drivers(e.g. mmc, mtd..) set q->limits.max_discard_sectors
>> more than UINT_MAX >> 9 sectors which is incorrect and it may lead to overflow
>> of request's __data_len field if merged discard request's size exceeds 4GB.
>>
>> This patchset fixes this issue by updating helper function
>> blk_queue_max_discard_sectors which is used to set max_discard_sectors limit.
>>
>> This patchset also replaces "q->limits.max_discard_sector = max_discard_sectors"
>> with blk_queue_max_discard_sectors call in other drivers like mmc, mtd etc.
>
Hi. James.
> I really don't understand this explanation.  How can you be affected by
> the incorrect setting of q->limits.max_discard sectors when  n the
> blkdev_issue_discard() code you see:
>
>         max_discard_sectors = min(q->limits.max_discard_sectors, UINT_MAX >>
> 9);
>
> ?
>
> The problem is not that we issue discards bigger than __data_len can
> allow, the problem is that we merge them larger than __data_len will
> allow.  That means the merge code needs fixing to pay attention to
> max_discard_sectors, so isn't this the correct fix:
Yes, I agree. And the below patch looks good to fix this issue.
Thanks for your comment.

>
> James
>
> ---
>
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 78feda9..33f358f 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -838,7 +838,7 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
>                                                      unsigned int cmd_flags)
>  {
>         if (unlikely(cmd_flags & REQ_DISCARD))
> -               return q->limits.max_discard_sectors;
> +               return min(q->limits.max_discard_sectors, UINT_MAX >> 9);
>
>         if (unlikely(cmd_flags & REQ_WRITE_SAME))
>                 return q->limits.max_write_same_sectors;
>
>
