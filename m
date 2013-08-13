Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V933B-0002B1-VN
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 01:05:30 +0000
Received: by mail-pd0-f175.google.com with SMTP id q10so190766pdj.34
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 18:05:06 -0700 (PDT)
Date: Mon, 12 Aug 2013 18:05:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 08/10] mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
Message-ID: <20130813010502.GF7267@brian-ubuntu>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-9-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376286173-12581-9-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 01:42:51PM +0800, Huang Shijie wrote:
> The current mtd_type_show() misses the MTD_MLCNANDFLASH case.
> This patch adds the case for it.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/mtdcore.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 6aa952b..c7cee29 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -157,6 +157,9 @@ static ssize_t mtd_type_show(struct device *dev,
>  	case MTD_UBIVOLUME:
>  		type = "ubi";
>  		break;
> +	case MTD_MLCNANDFLASH:
> +		type = "MLC nand";

The current convention uses lower-case, single-word names. And your
selection isn't very consistent with the SLC NAND case (but I see that
you're trying to change the SLC NAND case). I'd go with "mlc-nand" or
just "mlc".

But more importantly, this is probably a break in ABI. At a minimum,
this needs documentation here in Documentation/ABI. I know tools which
currently check only for "nand", and if the name suddely becomes
different for MLC, that is a breakage.

But really, does user-space need to know SLC vs. MLC? If so, this needs
a clear argument for why in the patch description. Perhaps to
differentiate whether or not JFFS2 support is even possible? I'm not
opposed to adding a new name, especially since the MTD_MLCNANDFLASH
macro has existed in mtd/mtd-abi.h for a long time (but it was rotten).
Just do it sensibly (i.e., better name string, proper ABI documentation
inlcuded in this patch, explain the reason for the ABI addition in this
patch, etc.).

Brian
