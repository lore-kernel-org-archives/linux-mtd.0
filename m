Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VuNRW-0003IJ-HL
 for linux-mtd@lists.infradead.org; Sat, 21 Dec 2013 14:22:17 +0000
Date: Sat, 21 Dec 2013 11:22:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 3/4] mtd: orion_nand: use dev_err() instead of printk()
Message-ID: <20131221142203.GA2810@localhost>
References: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
 <001901cefd5c$644dec50$2ce9c4f0$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001901cefd5c$644dec50$2ce9c4f0$%han@samsung.com>
Cc: 'David Woodhouse' <dwmw2@infradead.org>,
 'Brian Norris' <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 'Andrew Lunn' <andrew@lunn.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jingoo,

Thanks for the cleanup!

I have some extra requests :-)

On Fri, Dec 20, 2013 at 05:20:50PM +0900, Jingoo Han wrote:
[..]
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index a393a5b..7cd9aed 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -87,7 +87,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  
>  	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
>  	if (!nc) {
> -		printk(KERN_ERR "orion_nand: failed to allocate device structure.\n");
> +		dev_err(&pdev->dev, "orion_nand: failed to allocate device structure.\n");

Instead of this replacement, can you remove the error message entirely?
It's redundant for a driver to print anything after an allocation error, since an
out-of-memory condition will print quite enough information.

(Google for "Joe Perches OOM" and you'll find lots of patches removing this prints).

> @@ -110,7 +110,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  		board = devm_kzalloc(&pdev->dev, sizeof(struct orion_nand_data),
>  					GFP_KERNEL);
>  		if (!board) {
> -			printk(KERN_ERR "orion_nand: failed to allocate board structure.\n");
> +			dev_err(&pdev->dev, "orion_nand: failed to allocate board structure.\n");

Ditto.

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
