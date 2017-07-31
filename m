Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dcDYk-0007bi-TV
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 16:28:51 +0000
Date: Mon, 31 Jul 2017 18:28:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Alexander Dahl <ada@thorsis.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix timing setup for NANDs that do not
 support SET FEATURES
Message-ID: <20170731182826.7c2a45a6@bbrezillon>
In-Reply-To: <1501489796-7264-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1501489796-7264-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Mon, 31 Jul 2017 10:29:56 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Some ONFI NANDs do not support the SET/GET FEATURES commands, which,
> according to the spec, is perfectly valid.
> 
> On these NANDs we can't set a specific timing mode using the "timing
> mode" feature, and we should assume the NAND does not require any setup
> to enter a specific timing mode.

Applied to nand/fixes.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: d8e725dd8311 ("mtd: nand: automate NAND timings selection")
> Reported-by: Alexander Dahl <ada@thorsis.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/mtd/nand/nand_base.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 7b3826b42447..f2bd2c00a8a1 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1131,7 +1131,9 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>  	 * Ensure the timing mode has been changed on the chip side
>  	 * before changing timings on the controller side.
>  	 */
> -	if (chip->onfi_version) {
> +	if (chip->onfi_version &&
> +	    (le16_to_cpu(chip->onfi_params.opt_cmd) &
> +	     ONFI_OPT_CMD_SET_GET_FEATURES)) {
>  		u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
>  			chip->onfi_timing_mode_default,
>  		};
