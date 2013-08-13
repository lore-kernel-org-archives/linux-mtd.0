Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V935r-0002Eu-7E
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 01:08:16 +0000
Received: by mail-pa0-f44.google.com with SMTP id fz6so3762259pac.17
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 18:07:53 -0700 (PDT)
Date: Mon, 12 Aug 2013 18:07:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 09/10] mtd: add more information for the MTD_NANDFLASH case
Message-ID: <20130813010750.GG7267@brian-ubuntu>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-10-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376286173-12581-10-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 01:42:52PM +0800, Huang Shijie wrote:
> In mtd_type_show(), the MTD_NANDFLASH case shows "nand".
> In actually, the printed information is not accurate enough.
> The MTD_NANDFLASH stands for SLC nand now.
> 
> This patch adds the SLC information for the MTD_NANDFLASH case.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/mtdcore.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c7cee29..78b8f2e 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -149,7 +149,7 @@ static ssize_t mtd_type_show(struct device *dev,
>  		type = "nor";
>  		break;
>  	case MTD_NANDFLASH:
> -		type = "nand";
> +		type = "SLC nand";

Nak. This is clearly an ABI change, doesn't follow the existing naming
convention, and isn't even necessary (just differentiating the
"mlc-nand" case in the prior patch is sufficient).

>  		break;
>  	case MTD_DATAFLASH:
>  		type = "dataflash";

Brian
