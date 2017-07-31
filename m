Received: from mail.thorsis.com ([213.211.200.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dc9G7-0004h0-Gp
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 11:53:18 +0000
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: Fix timing setup for NANDs that do not support
 SET FEATURES
Date: Mon, 31 Jul 2017 13:52:42 +0200
Message-ID: <2195899.FJTP3fP8xy@ada>
In-Reply-To: <1501489796-7264-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1501489796-7264-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Tested-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

Am Montag, 31. Juli 2017, 10:29:56 schrieb Boris Brezillon:
> Some ONFI NANDs do not support the SET/GET FEATURES commands, which,
> according to the spec, is perfectly valid.
> 
> On these NANDs we can't set a specific timing mode using the "timing
> mode" feature, and we should assume the NAND does not require any
> setup to enter a specific timing mode.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: d8e725dd8311 ("mtd: nand: automate NAND timings selection")
> Reported-by: Alexander Dahl <ada@thorsis.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/mtd/nand/nand_base.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c
> b/drivers/mtd/nand/nand_base.c index 7b3826b42447..f2bd2c00a8a1
> 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1131,7 +1131,9 @@ static int nand_setup_data_interface(struct
> nand_chip *chip, int chipnr) * Ensure the timing mode has been
> changed on the chip side * before changing timings on the controller
> side.
>  	 */
> -	if (chip->onfi_version) {
> +	if (chip->onfi_version &&
> +	    (le16_to_cpu(chip->onfi_params.opt_cmd) &
> +	     ONFI_OPT_CMD_SET_GET_FEATURES)) {
>  		u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
>  			chip->onfi_timing_mode_default,
>  		};
