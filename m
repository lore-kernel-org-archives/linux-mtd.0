Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V83oc-00014M-9w
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 07:42:24 +0000
Received: by mail-pb0-f45.google.com with SMTP id mc17so5234462pbc.32
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 00:42:00 -0700 (PDT)
Date: Sat, 10 Aug 2013 00:41:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 4/4] mtd: gpmi: update the ecc step size for mtd_info{}
Message-ID: <20130810074156.GB3467@norris.computersforpeace.net>
References: <1368607606-4344-1-git-send-email-b32955@freescale.com>
 <1368607606-4344-5-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1368607606-4344-5-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 15, 2013 at 04:46:46PM +0800, Huang Shijie wrote:
> update the ecc step size when we have already get the right value.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 53180da..bc598e6 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1598,6 +1598,7 @@ static int gpmi_pre_bbt_scan(struct gpmi_nand_data  *this)
>  	/* Adjust the ECC strength according to the chip. */
>  	this->nand.ecc.strength = this->bch_geometry.ecc_strength;
>  	this->mtd.ecc_strength = this->bch_geometry.ecc_strength;
> +	this->mtd.ecc_step = this->bch_geometry.ecc_chunk_size;

Why do you need a special case here for gpmi-nand? GPMI should be
initializing nand_ecc_ctrl.size (this->ecc.size) to something meaningful
instead of directly setting to 1. Then nand_base will take care of
setting mtd.ecc_step.

Along the same line, you shouldn't need to directly override
mtd.ecc_strength here; you should be setting this->ecc.strength
appropriately.

I see several instances here where gpmi-nand is hacking around
nand_base, rather than using its intended infrastructure.

The right way seems to be to avoid nand_scan() directly but instead to
use nand_scan_ident() and nand_scan_tail() separately (that's what
they're exported for) so that you can initialize any geometry-related
options before nand_scan_tail() does the last steps.

In the end, you shouldn't be needing to override this->scan_bbt at all,
since you really intend to use the default implementation; you just are
doing this to hack around your issues. In fact, I think every use of
nand_default_bbt() outside of nand_base is a design mistake.

>  	this->mtd.bitflip_threshold = this->bch_geometry.ecc_strength;
>  
>  	/* NAND boot init, depends on the gpmi_set_geometry(). */
> 

Brian
