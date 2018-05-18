Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJZJ0-0001c2-LB
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 06:56:00 +0000
Date: Fri, 18 May 2018 08:55:47 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Bean Huo <beanhuo@micron.com>,
 Peter Pan <peterpandong@micron.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Do not check FAIL bit when executing a
 SET_FEATURES op
Message-ID: <20180518085547.0384f405@bbrezillon>
In-Reply-To: <20180511124407.7314-1-boris.brezillon@bootlin.com>
References: <20180511124407.7314-1-boris.brezillon@bootlin.com>
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

On Fri, 11 May 2018 14:44:07 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> The ONFI spec clearly says that FAIL bit is only valid for PROGRAM,
> ERASE and READ-with-on-die-ECC operations, and should be ignored
> otherwise.
> 
> It seems that checking it after sending a SET_FEATURES is a bad idea
> because a previous READ, PROGRAM or ERASE op may have failed, and
> depending on the implementation, the FAIL bit is not cleared until a
> new READ, PROGRAM or ERASE is started.
> 
> This leads to ->set_features() returning -EIO while it actually worked,
> which can sometimes stop a batch of READ/PROGRAM ops.
> 
> Note that we only fix the ->exec_op() path here, because some drivers
> are abusing the NAND_STATUS_FAIL flag in their ->waitfunc()
> implementation to propagate other kind of errors, like
> wait-ready-timeout or controller-related errors. Let's not try to fix
> those drivers since they worked fine so far.
> 
> Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Applied to nand/next.

> ---
> This patch is fixing a problem we had with on-die ECC on Micron
> NANDs [1].
> On these chips, when you have an ECC failure, the FAIL bit is set and
> it's not cleared until the next READ operation, which led the following
> SET_FEATURES (used to re-enable on-die ECC) to fail with -EIO and
> stopped the batch of page reads started by UBIFS, which in turn led to
> unmountable FS.
> 
> [1]http://patchwork.ozlabs.org/patch/907874/
> 
> Changes in v2:
> - Fix the subject prefix
> ---
>  drivers/mtd/nand/raw/nand_base.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index f28c3a555861..ee29f34562ab 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -2174,7 +2174,6 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	const u8 *params = data;
>  	int i, ret;
> -	u8 status;
>  
>  	if (chip->exec_op) {
>  		const struct nand_sdr_timings *sdr =
> @@ -2188,26 +2187,18 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
>  		};
>  		struct nand_operation op = NAND_OPERATION(instrs);
>  
> -		ret = nand_exec_op(chip, &op);
> -		if (ret)
> -			return ret;
> -
> -		ret = nand_status_op(chip, &status);
> -		if (ret)
> -			return ret;
> -	} else {
> -		chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, feature, -1);
> -		for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
> -			chip->write_byte(mtd, params[i]);
> +		return nand_exec_op(chip, &op);
> +	}
>  
> -		ret = chip->waitfunc(mtd, chip);
> -		if (ret < 0)
> -			return ret;
> +	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, feature, -1);
> +	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
> +		chip->write_byte(mtd, params[i]);
>  
> -		status = ret;
> -	}
> +	ret = chip->waitfunc(mtd, chip);
> +	if (ret < 0)
> +		return ret;
>  
> -	if (status & NAND_STATUS_FAIL)
> +	if (ret & NAND_STATUS_FAIL)
>  		return -EIO;
>  
>  	return 0;
