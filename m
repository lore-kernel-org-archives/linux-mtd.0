Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAIo4-0002lL-HH
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 17:29:46 +0000
Date: Sun, 22 Apr 2018 19:29:21 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 kernel-janitors@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 30/61] mtd: nand: onenand: simplify getting .drvdata
Message-ID: <20180422192921.61a6b28b@bbrezillon>
In-Reply-To: <20180419140641.27926-31-wsa+renesas@sang-engineering.com>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-31-wsa+renesas@sang-engineering.com>
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

On Thu, 19 Apr 2018 16:06:00 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to nand/next.

Thanks,

Boris

> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/mtd/nand/onenand/samsung.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/onenand/samsung.c b/drivers/mtd/nand/onenand/samsung.c
> index 2e9d076e445a..4cce4c0311ca 100644
> --- a/drivers/mtd/nand/onenand/samsung.c
> +++ b/drivers/mtd/nand/onenand/samsung.c
> @@ -958,8 +958,7 @@ static int s3c_onenand_remove(struct platform_device *pdev)
>  
>  static int s3c_pm_ops_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct mtd_info *mtd = platform_get_drvdata(pdev);
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
>  	struct onenand_chip *this = mtd->priv;
>  
>  	this->wait(mtd, FL_PM_SUSPENDED);
> @@ -968,8 +967,7 @@ static int s3c_pm_ops_suspend(struct device *dev)
>  
>  static  int s3c_pm_ops_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct mtd_info *mtd = platform_get_drvdata(pdev);
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
>  	struct onenand_chip *this = mtd->priv;
>  
>  	this->unlock_all(mtd);
