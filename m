Message-ID: <54B5A213.1090502@fb.com>
Date: Tue, 13 Jan 2015 15:54:11 -0700
From: Jens Axboe <axboe@fb.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/2 v2] UBI: Block: Add blk-mq support
References: <1420926734-16417-1-git-send-email-richard@nod.at>
 <1420926734-16417-2-git-send-email-richard@nod.at>
 <20150113162553.GA24351@infradead.org> <54B5A188.2000001@nod.at>
In-Reply-To: <54B5A188.2000001@nod.at>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, tom.leiming@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/13/2015 03:51 PM, Richard Weinberger wrote:
> Am 13.01.2015 um 17:25 schrieb Christoph Hellwig:
>>> +	struct ubi_sgl usgl;
>>
>> Btw, what's in struct ubi_sgl?  Can't find that in my tree.
> 
> "[PATCH 1/2] UBI: Add initial support for scatter gather" adds it.
> 
> /**
>  * struct ubi_sgl - UBI scatter gather list data structure.
>  * @list_pos: current position in @sg[]
>  * @page_pos: current position in @sg[@list_pos]
>  * @sg: the scatter gather list itself
>  *
>  * ubi_sgl is a wrapper around a scatter list which keeps track of the
>  * current position in the list and the current list item such that
>  * it can be used across multiple ubi_leb_read_sg() calls.
>  */
> struct ubi_sgl {
>         int list_pos;
>         int page_pos;
>         struct scatterlist sg[UBI_MAX_SG_COUNT];
> };
> 
>>> +static void ubiblock_do_work(struct work_struct *work)
>>> +{
>>> +	int ret;
>>> +	struct ubiblock_pdu *pdu = container_of(work, struct ubiblock_pdu, work);
>>> +	struct request *req = blk_mq_rq_from_pdu(pdu);
>>> +
>>> +	blk_mq_start_request(req);
>>> +	blk_rq_map_sg(req->q, req, pdu->usgl.sg);
>>
>> blk_rq_map_sg returns the number of entries actually mapped, which
>> might be smaller than the number passed in due to merging.
> 
> Yep, but the ubi_sql has a fixed number of scatterlist entries, UBI_MAX_SG_COUNT.
> And I limit it also to that using: blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
> 
> Is there another reason why I should use the return value of blk_rq_map_sg()?
> Please also note that the UBI block driver is read-only.

It can return less than what you asked for, if segments are coalesced.
Read/write, doesn't matter. You should always use the returned value as
the indication of how many segments to access in pdu->usgl.sg for data
transfer.

-- 
Jens Axboe
