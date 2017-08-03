Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddHld-00013s-4H
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 15:10:31 +0000
Date: Thu, 3 Aug 2017 17:10:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: blkdevs: Fix mtd block write failure
Message-ID: <20170803171004.3fbab4a7@bbrezillon>
In-Reply-To: <1501677185-1308-1-git-send-email-absahu@codeaurora.org>
References: <1501677185-1308-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed,  2 Aug 2017 18:03:05 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> All the MTD block write requests are failing with
> following error messages
> 
>     mkfs.ext4  /dev/mtdblock0
> 
>     print_req_error: I/O error, dev mtdblock0, sector 0
>     Buffer I/O error on dev mtdblock0, logical block 0,
>     lost async page write
> 
> The control is going to default case after block write request
> because of missing return.
> 
> Fixes: commit 2a842acab109 ("block: introduce new block status code type")
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/mtd_blkdevs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index f336a9b..9ec8f03 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -113,6 +113,7 @@ static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
>  		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
>  			if (tr->writesect(dev, block, buf))
>  				return BLK_STS_IOERR;
> +		return BLK_STS_OK;
>  	default:
>  		return BLK_STS_IOERR;
>  	}
