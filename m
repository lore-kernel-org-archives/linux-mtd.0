Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLoWD-0000NT-2X
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 06:44:29 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so3597172pdi.5
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 22:44:06 -0800 (PST)
Date: Thu, 6 Mar 2014 22:44:02 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Roman Pen <r.peniaev@gmail.com>
Subject: Re: [PATCH 1/1] mtd: mtd_blkdevs: handle REQ_FLUSH request and do
 explicit flush of writeback buffer
Message-ID: <20140307064402.GA13420@norris-Latitude-E6410>
References: <1388593281-22613-1-git-send-email-r.peniaev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388593281-22613-1-git-send-email-r.peniaev@gmail.com>
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

On Thu, Jan 02, 2014 at 01:21:21AM +0900, Roman Pen wrote:
> From: Roman Peniaev <r.peniaev@gmail.com>
> 
> mtd_blkdevs is device with volatile cache (writeback buffer), so it should support
> REQ_FLUSH to do explicit flush.
> 
> Without this patch 'sync' does not guarantee that writeback buffer will be flushed
> on disk in case of power off, e.g.:
> 
>   $ cp some_file /mnt
>   $ sync
> 
>   ### POWER OFF
> 
> In case of this sequence writeback buffer will not be flushed on disk.
> 
> This patch fixes this behaviour and explicitly reports to block layer that flush
> requests are being supported.
> 
> Signed-off-by: Roman Peniaev <r.peniaev@gmail.com>
> CC: David Woodhouse <dwmw2@infradead.org>
> CC: linux-mtd@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/mtd/mtd_blkdevs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 5073cbc..feafe5c 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -89,6 +89,12 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
>  	if (req->cmd_type != REQ_TYPE_FS)
>  		return -EIO;
>  
> +	if (req->cmd_flags & REQ_FLUSH) {
> +		if (tr->flush)
> +			return tr->flush(dev);
> +		return 0;
> +	}
> +
>  	if (blk_rq_pos(req) + blk_rq_cur_sectors(req) >
>  	    get_capacity(req->rq_disk))
>  		return -EIO;
> @@ -409,6 +415,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>  	if (!new->rq)
>  		goto error3;
>  
> +	blk_queue_flush(new->rq, REQ_FLUSH);

How about only registering the flush command if we support it? So:

	if (tr->flush)
		blk_queue_flush(new->rq, REQ_FLUSH);

Then you can probably also change the earlier hunk to the following, no?

	if (req->cmd_flags & REQ_FLUSH)
		return tr->flush(dev);

> +
>  	new->rq->queuedata = new;
>  	blk_queue_logical_block_size(new->rq, tr->blksize);
>  

Brian
