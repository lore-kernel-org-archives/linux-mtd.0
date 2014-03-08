Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMGc9-0002GA-7f
 for linux-mtd@lists.infradead.org; Sat, 08 Mar 2014 12:44:29 +0000
Received: by mail-qg0-f49.google.com with SMTP id z60so14939713qgd.8
 for <linux-mtd@lists.infradead.org>; Sat, 08 Mar 2014 04:44:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140307064402.GA13420@norris-Latitude-E6410>
References: <1388593281-22613-1-git-send-email-r.peniaev@gmail.com>
 <20140307064402.GA13420@norris-Latitude-E6410>
Date: Sat, 8 Mar 2014 21:44:06 +0900
Message-ID: <CACZ9PQWbE4UF+1XydqEnpTVZiBmLDrPH6qHt-Lcfx+NnYrLLOQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: mtd_blkdevs: handle REQ_FLUSH request and do
 explicit flush of writeback buffer
From: Roman Peniaev <r.peniaev@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 7, 2014 at 3:44 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Thu, Jan 02, 2014 at 01:21:21AM +0900, Roman Pen wrote:
>> From: Roman Peniaev <r.peniaev@gmail.com>
>>
>> mtd_blkdevs is device with volatile cache (writeback buffer), so it should support
>> REQ_FLUSH to do explicit flush.
>>
>> Without this patch 'sync' does not guarantee that writeback buffer will be flushed
>> on disk in case of power off, e.g.:
>>
>>   $ cp some_file /mnt
>>   $ sync
>>
>>   ### POWER OFF
>>
>> In case of this sequence writeback buffer will not be flushed on disk.
>>
>> This patch fixes this behaviour and explicitly reports to block layer that flush
>> requests are being supported.
>>
>> Signed-off-by: Roman Peniaev <r.peniaev@gmail.com>
>> CC: David Woodhouse <dwmw2@infradead.org>
>> CC: linux-mtd@lists.infradead.org
>> CC: linux-kernel@vger.kernel.org
>> ---
>>  drivers/mtd/mtd_blkdevs.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
>> index 5073cbc..feafe5c 100644
>> --- a/drivers/mtd/mtd_blkdevs.c
>> +++ b/drivers/mtd/mtd_blkdevs.c
>> @@ -89,6 +89,12 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
>>       if (req->cmd_type != REQ_TYPE_FS)
>>               return -EIO;
>>
>> +     if (req->cmd_flags & REQ_FLUSH) {
>> +             if (tr->flush)
>> +                     return tr->flush(dev);
>> +             return 0;
>> +     }
>> +
>>       if (blk_rq_pos(req) + blk_rq_cur_sectors(req) >
>>           get_capacity(req->rq_disk))
>>               return -EIO;
>> @@ -409,6 +415,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>>       if (!new->rq)
>>               goto error3;
>>
>> +     blk_queue_flush(new->rq, REQ_FLUSH);
>
> How about only registering the flush command if we support it? So:
>
>         if (tr->flush)
>                 blk_queue_flush(new->rq, REQ_FLUSH);

Yep, that's better.
Will send v2.

--
Roman

>
> Then you can probably also change the earlier hunk to the following, no?
>
>         if (req->cmd_flags & REQ_FLUSH)
>                 return tr->flush(dev);
>
>> +
>>       new->rq->queuedata = new;
>>       blk_queue_logical_block_size(new->rq, tr->blksize);
>>
>
> Brian
