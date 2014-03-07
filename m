Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpPy-0003f5-Hl
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:42:07 +0000
Received: by mail-pd0-f171.google.com with SMTP id r10so3693376pdi.30
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 23:41:45 -0800 (PST)
Date: Thu, 6 Mar 2014 23:41:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 1/3] mtd: nand: add a helper to parse the Hynix nand
Message-ID: <20140307074134.GE31517@norris-Latitude-E6410>
References: <1388736518-5934-1-git-send-email-b32955@freescale.com>
 <1388736518-5934-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388736518-5934-2-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 04:08:36PM +0800, Huang Shijie wrote:
> This patch adds a nand_parse_hynix() to parse the Hynix MLC nand
> whose ID length is 6 bytes.
> 
> This patch makes preparations for parsing other Hynix nand.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |   89 +++++++++++++++++++++++------------------
>  1 files changed, 50 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4ce8007..d6b7dc3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3198,6 +3198,55 @@ static int nand_get_bits_per_cell(u8 cellinfo)
>  	return bits + 1;
>  }
>  
> +/* Parse for the Hynix MLC nand which has 6-bytes ID */
> +static void nand_parse_hynix(struct mtd_info *mtd, struct nand_chip *chip,
> +			u8 id_data[8], int *busw)
> +{

Can you use 'decode' instead of 'parse', so the naming is like
nand_decode_id() and nand_decode_ext_id()?

Brian
