Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSMNu-00084a-Fw
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2015 09:11:30 +0000
Date: Mon, 2 Mar 2015 12:10:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/7] mtd: docg3: drop dead code
Message-ID: <20150302091050.GC5386@mwanda>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
 <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 28, 2015 at 02:02:24AM -0800, Brian Norris wrote:
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 448ce42f951e..01eddea1f0d9 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -2079,8 +2079,6 @@ static int __init docg3_probe(struct platform_device *pdev)
>  	ret = doc_register_sysfs(pdev, cascade);
>  	if (ret)
>  		goto err_probe;
> -	if (!found)
> -		goto notfound;

Just delete the "found" variable because there are no other uses.

regards,
dan carpenter
