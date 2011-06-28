Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbTCt-0002tZ-JD
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 07:59:40 +0000
Received: by pzk28 with SMTP id 28so3774108pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 00:59:36 -0700 (PDT)
Subject: Re: [PATCH 3/6] refactor mtd wait code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Tue, 28 Jun 2011 11:00:27 +0300
In-Reply-To: <1309105616-3609-3-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309105616-3609-3-git-send-email-matthieu.castet@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309248031.23597.45.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
> +/**
> +  * This is call after sending a read command, or for autoincrement
> +  * chip that need it (!NAND_NO_READRDY).
> +  *
> +  * We can't call NAND_CMD_STATUS here, because the read command
> +  * is not finished
> +  */
> +static void nand_wait_read(struct mtd_info *mtd, struct nand_chip *chip)
> +{
> +	/*
> +	 * If we don't have access to the busy pin, we apply the given
> +	 * command delay
> +	 */
> +	if (!chip->dev_ready) {
> +		udelay(chip->chip_delay);
> +	}
> +	else {
> +		/* Apply this short delay always to ensure that we do wait tWB in
> +		 * any case on any machine. */
> +		ndelay(100);

Please, all these hard-coded numbers should be hidden in the specific
driver.

> +		nand_wait_ready(mtd);
> +	}
> +}
> +
> +/**
>   * __nand_unlock - [REPLACEABLE] unlocks specified locked blocks
>   *
>   * @mtd: mtd info
> @@ -1526,10 +1540,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  				 * increment is marked as NOAUTOINCR by the
>  				 * board driver.
>  				 */
> -				if (!chip->dev_ready)
> -					udelay(chip->chip_delay);
> -				else
> -					nand_wait_ready(mtd);
> +				nand_wait_read(mtd, chip);
>  			}
>  		} else {
>  			memcpy(buf, chip->buffers->databuf + col, bytes);
> @@ -1811,10 +1822,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
>  			 * chip which does auto increment is marked as
>  			 * NOAUTOINCR by the board driver.
>  			 */
> -			if (!chip->dev_ready)
> -				udelay(chip->chip_delay);
> -			else
> -				nand_wait_ready(mtd);
> +			nand_wait_read(mtd, chip);

I think one thing which you should do as part of this series is to get
rid of all the if (!chip->dev_ready) checks. Instead, you should
introduce something like default_chip_ready and make it do the job.
Also, make sure nand_wait_ready() works in that case.

-- 
Best Regards,
Artem Bityutskiy
