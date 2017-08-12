Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dgeN4-0005B9-Eb
 for linux-mtd@lists.infradead.org; Sat, 12 Aug 2017 21:55:08 +0000
Received: by mail-pg0-x243.google.com with SMTP id y192so5775640pgd.1
 for <linux-mtd@lists.infradead.org>; Sat, 12 Aug 2017 14:54:41 -0700 (PDT)
Date: Sat, 12 Aug 2017 14:54:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 dwmw2@infradead.org, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>
Subject: Re: [PATCH] mtd: blkdevs: Fix mtd block write failure
Message-ID: <20170812215438.GB90795@google.com>
References: <1501677185-1308-1-git-send-email-absahu@codeaurora.org>
 <20170803171004.3fbab4a7@bbrezillon>
 <58e5bfdfe27ac2f4aacacd40328772bf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58e5bfdfe27ac2f4aacacd40328772bf@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, Aug 05, 2017 at 01:44:26AM +0530, Abhishek Sahu wrote:
> On 2017-08-03 20:40, Boris Brezillon wrote:
> >On Wed,  2 Aug 2017 18:03:05 +0530
> >Abhishek Sahu <absahu@codeaurora.org> wrote:
> >
> >>All the MTD block write requests are failing with
> >>following error messages
> >>
> >>    mkfs.ext4  /dev/mtdblock0
> >>
> >>    print_req_error: I/O error, dev mtdblock0, sector 0
> >>    Buffer I/O error on dev mtdblock0, logical block 0,
> >>    lost async page write
> >>
> >>The control is going to default case after block write request
> >>because of missing return.
> >>
> >>Fixes: commit 2a842acab109 ("block: introduce new block status
> >>code type")

Looks like that never even went to the MTD list. Oh well, I still likely
wouldn't have reviewed it this closely :)

> >>Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >
> >Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> >
> 
>  Shall this patch be included for next RC since the MTD block
>  write is broken in 4.13 and without this, all the writes to
>  MTD block device will return failure.

Yes, applied to linux-mtd.git, and I'll try to get this out for 4.13.

> >>---
> >> drivers/mtd/mtd_blkdevs.c | 1 +
> >> 1 file changed, 1 insertion(+)
> >>
> >>diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> >>index f336a9b..9ec8f03 100644
> >>--- a/drivers/mtd/mtd_blkdevs.c
> >>+++ b/drivers/mtd/mtd_blkdevs.c
> >>@@ -113,6 +113,7 @@ static blk_status_t
> >>do_blktrans_request(struct mtd_blktrans_ops *tr,
> >> 		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
> >> 			if (tr->writesect(dev, block, buf))
> >> 				return BLK_STS_IOERR;
> >>+		return BLK_STS_OK;

Ooh, that's a nasty one. No compiler warning, because it just falls back
to the 'default' case :(

Brian

> >> 	default:
> >> 		return BLK_STS_IOERR;
> >> 	}
