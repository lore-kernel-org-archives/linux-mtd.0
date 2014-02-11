Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDK4Y-0003J5-SP
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 20:36:51 +0000
Received: by mail-ie0-f181.google.com with SMTP id to1so4940402ieb.40
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 12:36:30 -0800 (PST)
Date: Tue, 11 Feb 2014 12:36:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 2/5] mtd: nand: add fields for JEDEC in nand_chip
Message-ID: <20140211203626.GK18440@ld-irv-0074>
References: <1391839441-21006-1-git-send-email-b32955@freescale.com>
 <1391839441-21006-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1391839441-21006-3-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 08, 2014 at 02:03:58PM +0800, Huang Shijie wrote:
> Add the jedec_version field, and add an anonymous union which
> contains the nand_onfi_params and nand_jedec_params.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  include/linux/mtd/nand.h |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 588f8a4..9686390 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -664,7 +664,11 @@ struct nand_chip {
>  	int badblockbits;
>  
>  	int onfi_version;
> -	struct nand_onfi_params	onfi_params;
> +	int jedec_version;
> +	union {
> +		struct nand_onfi_params	onfi_params;
> +		struct nand_jedec_params jedec_params;

Can you document the new fields in the kerneldoc comments above struct
nand_chip?

> +	};
>  
>  	int read_retries;
>  

Brian
