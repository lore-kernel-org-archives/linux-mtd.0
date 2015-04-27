Date: Mon, 27 Apr 2015 16:35:58 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
Message-ID: <20150427213558.GA22780@bshelton-desktop>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
In-Reply-To: <1427292151-3835-2-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: punnaiah.choudary.kalluri@xilinx.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 03/25, Richard Weinberger wrote:
> Some Micron NAND chips offer an on-die ECC (AKA internal ECC)
> feature. It is useful when the host-platform does not offer
> multi-bit ECC and software ECC is not feasible.
> 
> Based on original work by David Mosberger <davidm@egauge.net>
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---

[...]

> +
> +static int check_read_status_on_die(struct mtd_info *mtd, int page)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	int max_bitflips = 0;
> +	uint8_t status;
> +
> +	/* Check ECC status of page just transferred into NAND's page buffer */
> +	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +	status = chip->read_byte(mtd);
> +
> +	/* Switch back to data reading */
> +	chip->cmd_ctrl(mtd, NAND_CMD_READ0, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);

I tested this against the latest version of the PL353 NAND driver that Punnaiah
has been working to upstream (copying her on this message).  With a few changes
to that driver, I got it most of the way through initialization with on-die ECC
enabled, but it segfaults here with a null pointer dereference because the
PL353 driver does not implement chip->cmd_ctrl.  Instead, it implements a
custom override of cmd->cmdfunc that does not call cmd_ctrl.  Looking through
the other in-tree NAND drivers, it looks like most of them do implement
cmd_ctrl, but quite a few of them do not (e.g. au1550nd, denali, docg4).

What do you think would be the best way to handle this?  It seems like this gap
could be bridged from either side -- either the PL353 driver could implement
cmd_ctrl, at least as a stub version that provides the expected behavior in
this case; or the on-die framework could break this out into a callback
function with a default implementation that the driver could override to
perform this behavior in the manner of its choosing.

> +
> +	if (status & NAND_STATUS_FAIL) {
> +		/* Page has invalid ECC */
> +		mtd->ecc_stats.failed++;
> +	} else if (status & NAND_STATUS_REWRITE) {
> +		/*
> +		 * Micron on-die ECC doesn't report the number of
> +		 * bitflips, so we have to count them ourself to see
> +		 * if the error rate is too high.  This is
> +		 * particularly important for pages with stuck bits.
> +		 */
> +		max_bitflips = check_for_bitflips(mtd, page);
> +	}
> +	return max_bitflips;
> +}
> +

[...]

> +#else /* !CONFIG_MTD_NAND_ECC_ON_DIE */
> +static inline int mtd_nand_has_on_die(void) { return 0; }
> +static inline int nand_read_subpage_on_die(struct mtd_info *mtd,
> +					   struct nand_chip *chip,
> +					   uint32_t data_offs,
> +					   uint32_t readlen,
> +					   uint8_t *bufpoi, int page)
> +{
> +	BUG();

When I build this without CONFIG_MTD_NAND_ECC_ON_DIE enabled, I get the
following warning here:

In file included from drivers/mtd/nand/nand_base.c:46:0:
include/linux/mtd/nand_ondie.h: In function 'nand_read_subpage_on_die':
include/linux/mtd/nand_ondie.h:28:1: warning: no return statement in function returning non-void [-Wreturn-type]
include/linux/mtd/nand_ondie.h: In function 'nand_read_page_on_die':
include/linux/mtd/nand_ondie.h:34:1: warning: no return statement in function returning non-void [-Wreturn-type]

Perhaps return an error code here, even though you'll never get past the BUG()?

> +}
> +
> +static inline int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
> +					uint8_t *buf, int oob_required, int page)
> +{
> +	BUG();

Same here.

> +}

Thanks,
Ben
