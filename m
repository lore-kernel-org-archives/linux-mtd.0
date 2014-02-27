Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIvcN-0003n4-21
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2014 07:42:56 +0000
Received: by mail-pa0-f41.google.com with SMTP id fa1so2158935pad.0
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 23:42:33 -0800 (PST)
Date: Wed, 26 Feb 2014 23:42:30 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Denis Carikli <denis@eukrea.com>
Subject: Re: [PATCHv3][ 1/2] mtd: nand: mxc_nand: Enforce a minimum mtd_info
 writesize default value.
Message-ID: <20140227074230.GE13420@norris-Latitude-E6410>
References: <1389024157-19279-1-git-send-email-denis@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1389024157-19279-1-git-send-email-denis@eukrea.com>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 06, 2014 at 05:02:36PM +0100, Denis Carikli wrote:
> The linux/mtd/mtd.h header has a comment in the
>   mtd_info struct definition that says that
>   having a writesize of 0 is illegal.
> 
> When nand_flash_detect_onfi is called (in the case
>   of an ONFI flash), it will call the function
>   pointed by read_buf in order to get some parameters
>   of the flash chip, including its writesize.

Note that (for fixing buswidth issues when using x16 vs. x8)
nand_flash_detect_onfi() no longer uses read_buf(). So this shouldn't
actually be an issue any more, I don't think. But we still might want to
set some value, due to the strange implementation of read_buf() in this
driver.

> Before decoding the writesize value that was retrived
>   with that read, the mxc_nand's mtd_info struct had
>   a writesize set to zero.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Eric Bénard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
> ChangeLog v2->v3:
> New patch in this serie.
> ---
>  drivers/mtd/nand/mxc_nand.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 567a5e5..d4d8d66 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1415,6 +1415,9 @@ static int mxcnd_probe(struct platform_device *pdev)
>  	mtd->dev.parent = &pdev->dev;
>  	mtd->name = DRIVER_NAME;
>  
> +	/* Enforce a minimum writesize */
> +	mtd->writesize = 512;
> +

Is this "initial" writesize just needed for the bounds checking in
read_buf() (and write_buf())? Then wouldn't it make sense to match the
buffer size allocated initially? See:

	/* allocate a temporary buffer for the nand_scan_ident() */
	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);

Also, I don't think you actually need the bounds checks in
read_buf()/write_buf(), although I guess there's no real harm...

>  	/* 50 us command delay time */
>  	this->chip_delay = 5;
>  

Brian
