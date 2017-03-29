Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctF8v-0007ur-SE
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 15:04:15 +0000
Date: Wed, 29 Mar 2017 17:03:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sekhar Nori <nsekhar@ti.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Muralidharan Karicheri <m-karicheri2@ti.com>, Franklin S Cooper Jr
 <fcooper@ti.com>
Subject: Re: [PATCH] Revert "mtd: davinci-nand: disable subpage write for
 keystone-nand"
Message-ID: <20170329170352.2d6c0721@bbrezillon>
In-Reply-To: <9d21903d38de6685c9bf45d6eb8e32ab0e8c65c5.1490609415.git.nsekhar@ti.com>
References: <9d21903d38de6685c9bf45d6eb8e32ab0e8c65c5.1490609415.git.nsekhar@ti.com>
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

On Mon, 27 Mar 2017 15:56:55 +0530
Sekhar Nori <nsekhar@ti.com> wrote:

> This partly reverts commit 28c015a9daabe4ed3aeb0ccf669a3f1c2b8b81d5.
> 
> Since f6d7c1b5598b ("mtd: nand: davinci: Reinitialize the HW ECC
> engine in 4bit hwctl") using subpage and 4bit HWECC works.
> 
> Revert the original workaround made for this. Tested with
> mtd_subpagetest and UBIFS on K2E, K2HK, K2L EVMs.
> 
> The addition of keystone specific compatible to davinci_nand_of_match[]
> contained in original commit is retained.

Hm, it sounds like a bad idea to re-enable sub-page writes afterwards.
You might break existing systems using UBI, because UBI detects the
sub-page write feature and decides to place the VID header at a
different position depending on that.
To sum-up, you're likely to break users that have already flashed a UBI
image with the old driver.

If you want to re-enable sub-page writes, just switch back to the
"ti,davinci-nand" compatible.

> 
> Cc: Muralidharan Karicheri <m-karicheri2@ti.com>
> Cc: Franklin S Cooper Jr <fcooper@ti.com>
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
>  drivers/mtd/nand/davinci_nand.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 27fa8b87cd5f..56c4afed8d74 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -580,11 +580,6 @@ static struct davinci_nand_pdata
>  		if (of_property_read_bool(pdev->dev.of_node,
>  			"ti,davinci-nand-use-bbt"))
>  			pdata->bbt_options = NAND_BBT_USE_FLASH;
> -
> -		if (of_device_is_compatible(pdev->dev.of_node,
> -					    "ti,keystone-nand")) {
> -			pdata->options |= NAND_NO_SUBPAGE_WRITE;
> -		}
>  	}
>  
>  	return dev_get_platdata(&pdev->dev);
