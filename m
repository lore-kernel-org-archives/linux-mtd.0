Message-ID: <1442161613.2857.9.camel@plaes.org>
Subject: Re: [linux-sunxi] [PATCH] mtd: nand: sunxi: fix
 sunxi_nand_chips_cleanup()
From: Priit Laes <plaes@plaes.org>
To: boris.brezillon@free-electrons.com, David Woodhouse
 <dwmw2@infradead.org>,  Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org, Hans de
 Goede <hdegoede@redhat.com>, stable@vger.kernel.org
Date: Sun, 13 Sep 2015 19:26:53 +0300
In-Reply-To: <1442160883-29011-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1442160883-29011-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2015-09-13 at 18:14 +0200, Boris Brezillon wrote:
> The sunxi_nand_chips_cleanup() function is missing a call to
> list_del()
> which generates a double free error.

Tested-by: Priit Laes <plaes@plaes.org>
> 
> Reported-by: Priit Laes <plaes@plaes.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: <stable@vger.kernel.org> # 3.19+
> Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller
> support")
> ---
>  drivers/mtd/nand/sunxi_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c
> b/drivers/mtd/nand/sunxi_nand.c
> index f9b5a4c..0467917 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -1388,6 +1388,7 @@ static void sunxi_nand_chips_cleanup(struct
> sunxi_nfc *nfc)
>  					node);
>  		nand_release(&chip->mtd);
>  		sunxi_nand_ecc_cleanup(&chip->nand.ecc);
> +		list_del(&chip->node);
>  	}
>  }
>  
> -- 
> 1.9.1
> 
