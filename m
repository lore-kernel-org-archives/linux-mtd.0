Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcSod-0006bF-L5
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 03:55:49 +0000
Message-ID: <51930702.7040208@huawei.com>
Date: Wed, 15 May 2013 11:54:42 +0800
From: Libo Chen <clbchenlibo.chen@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: fix kfree bcm47xxsflash
References: <1367743225-3484-1-git-send-email-libo.chen@huawei.com>
In-Reply-To: <1367743225-3484-1-git-send-email-libo.chen@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 lizefan@huawei.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,
	what do you think of this patch ?

On 2013/5/5 16:40, chenlibo.3@gmail.com wrote:
> From: Libo Chen <libo.chen@huawei.com>
> 
> mtd is just member of bcm47xxsflash, so we should free bcm47xxsflash  not its member.
> 
> Signed-off-by: Libo Chen <libo.chen@huawei.com>
> ---
>  drivers/mtd/devices/bcm47xxsflash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
> index 9526628..4aa9141 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -76,7 +76,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_dev_reg:
> -	kfree(&b47s->mtd);
> +	kfree(b47s);
>  out:
>  	return err;
>  }
> 
