Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vbf3N-000216-Mo
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 23:19:58 +0000
Received: by mail-ob0-f171.google.com with SMTP id wn1so2240175obc.30
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2013 16:19:36 -0700 (PDT)
Date: Wed, 30 Oct 2013 19:19:31 -0400
From: Brian Norris <computersforpeace@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
Message-ID: <20131030231930.GD20059@norris.computersforpeace.net>
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 30, 2013 at 02:50:02PM +0530, Sourav Poddar wrote:
> Some flash also support quad read mode.
> Adding support for adding quad mode in m25p80
> for spansion and macronix flash.
> 
> Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
> ---
> Rebase this on latest l2mtd.
> v1->v2:
> Small dev_err message fix to make it
> mode appropriate.
> v1: http://patchwork.ozlabs.org/patch/286109/
> 
> There is one cleanup suggestion from Marek Vasut on read_sr
> value. I will take that up as a seperate patch, once this 
> patch gets done.
> 
> 
>  drivers/mtd/devices/m25p80.c |  160 ++++++++++++++++++++++++++++++++++++++++--
>  1 files changed, 155 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 5897889..ba4dd8b 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c

[...]

> @@ -76,6 +79,10 @@
>  #define	SR_BP2			0x10	/* Block protect 2 */
>  #define	SR_SRWD			0x80	/* SR write protect */
>  
> +/* Configuration Register bits. */
> +#define CR_QUAD_EN_SPAN		0x2     /* Spansion Quad I/O */
> +#define SR_QUAD_EN_MX		0x40    /* Macronix Quad I/O */

Two little bits of style here:
 - The other bitfields have a tab after #define (although this comes out
   to 1 character-width of whitespace, so it looks like a space)
 - We already have a listing for several Status Register (SR_*)
   bitfields; I think it makes some sense to group the SR_QUAD_EN_MX
   with the other SR_* bits and keep the CR_* macro separate. That could
   help with keeping the difference between CR and SR clearer.

> +
>  /* Define max times to check status register before we give up. */
>  #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
>  #define	MAX_CMD_SIZE		6
> @@ -95,6 +102,7 @@ struct m25p {
>  	u8			program_opcode;
>  	u8			*command;
>  	bool			fast_read;
> +	bool                    quad_read;

Did you have a response to my earlier suggestion that the fast_read and
quad_read fields be combined to a single field? This could easily be an
enum, and I think it could help some of the other code. It also wouldn't
require us to remember that quad_read takes precedence over fast_read
(which you do implicitly in this patch). And we can already foresee
additional switches needed if we add the DDR command types (Huang was
looking at this?), so we should just get it right now.

You could, perhaps, make this two patches: one for converting the bool
to an enum, and the other for supporting quad-read.

Or if you're having trouble, I could cook the first patch up.

>  };
>  
>  static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)

[...]

> @@ -1077,6 +1221,12 @@ static int m25p_probe(struct spi_device *spi)
>  		flash->addr_width = 4;
>  		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
>  			/* Dedicated 4-byte command set */
> +			if (flash->quad_read)
> +				flash->read_opcode = OPCODE_QUAD_READ_4B;
> +			else
> +				flash->read_opcode = flash->fast_read ?
> +					OPCODE_FAST_READ_4B :
> +					OPCODE_NORM_READ_4B;

Besides the repetition below (already mentioned by Huang), the above
assignment is kind of ugly again, mixing ?: and if/else. If we're
keeping the fast_read/quad_read bools, it should be:

	if (flash->quad_read)
		flash->read_opcode = OPCODE_QUAD_READ_4B;
	else if (flash->fast_read)
		flash->read_opcode = OPCODE_FAST_READ_4B;
	else
		flash->read_opcode = OPCODE_NORM_READ_4B;

(or if we use an enum, it's just a switch statement...)

>  			flash->read_opcode = flash->fast_read ?
>  				OPCODE_FAST_READ_4B :
>  				OPCODE_NORM_READ_4B;

Brian
