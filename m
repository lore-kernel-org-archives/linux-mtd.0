Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddizf-0007k9-6V
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 20:14:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 05 Aug 2017 01:44:26 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: blkdevs: Fix mtd block write failure
In-Reply-To: <20170803171004.3fbab4a7@bbrezillon>
References: <1501677185-1308-1-git-send-email-absahu@codeaurora.org>
 <20170803171004.3fbab4a7@bbrezillon>
Message-ID: <58e5bfdfe27ac2f4aacacd40328772bf@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-08-03 20:40, Boris Brezillon wrote:
> On Wed,  2 Aug 2017 18:03:05 +0530
> Abhishek Sahu <absahu@codeaurora.org> wrote:
> 
>> All the MTD block write requests are failing with
>> following error messages
>> 
>>     mkfs.ext4  /dev/mtdblock0
>> 
>>     print_req_error: I/O error, dev mtdblock0, sector 0
>>     Buffer I/O error on dev mtdblock0, logical block 0,
>>     lost async page write
>> 
>> The control is going to default case after block write request
>> because of missing return.
>> 
>> Fixes: commit 2a842acab109 ("block: introduce new block status code 
>> type")
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 

  Shall this patch be included for next RC since the MTD block
  write is broken in 4.13 and without this, all the writes to
  MTD block device will return failure.

>> ---
>>  drivers/mtd/mtd_blkdevs.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
>> index f336a9b..9ec8f03 100644
>> --- a/drivers/mtd/mtd_blkdevs.c
>> +++ b/drivers/mtd/mtd_blkdevs.c
>> @@ -113,6 +113,7 @@ static blk_status_t do_blktrans_request(struct 
>> mtd_blktrans_ops *tr,
>>  		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
>>  			if (tr->writesect(dev, block, buf))
>>  				return BLK_STS_IOERR;
>> +		return BLK_STS_OK;
>>  	default:
>>  		return BLK_STS_IOERR;
>>  	}
