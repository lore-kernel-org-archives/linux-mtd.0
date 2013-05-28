Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhJG7-0004lS-9A
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 12:44:12 +0000
Message-ID: <51A4A5C9.1010909@huawei.com>
Date: Tue, 28 May 2013 20:40:41 +0800
From: Libo Chen <clbchenlibo.chen@huawei.com>
MIME-Version: 1.0
To: <dwmw2@infradead.org>
Subject: Re: [PATCH RESEND] mtd: fix kfree bcm47xxsflash
References: <1367743225-3484-1-git-send-email-libo.chen@huawei.com>
 <519C40A8.1070506@huawei.com>
In-Reply-To: <519C40A8.1070506@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Li Zefan <lizefan@huawei.com>, Greg KH <gregkh@linuxfoundation.org>,
 artem.bityutskiy@linux.intel.com, zajec5@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, wfp5p@virginia.edu,
 linux-mtd@lists.infradead.org, hauke@hauke-m.de,
 Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping...

On 2013/5/22 11:51, Libo Chen wrote:
> 
> mtd is just member of bcm47xxsflash, so we should free bcm47xxsflash  not its member.
> 
> Signed-off-by: Libo Chen <libo.chen@huawei.com>
> Acked-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  drivers/mtd/devices/bcm47xxsflash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> * add Acked-by: Rafał Miłecki <zajec5@gmail.com>
> * change send list
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
