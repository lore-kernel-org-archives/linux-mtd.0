Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lcmni-0002Wt-Ht
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 20:25:49 +0000
Date: Thu, 26 Feb 2009 12:25:43 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: dbrownell@users.sourceforge.net
Subject: Re: [patch/RESEND 2.6.29-rc6] NAND:  fix "raw" reads with ECC
	syndrome layouts
Message-Id: <20090226122543.797eac77.akpm@linux-foundation.org>
In-Reply-To: <200902241508.13835.david-b@pacbell.net>
References: <200902241508.13835.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Feb 2009 15:08:13 -0800
David Brownell <david-b@pacbell.net> wrote:

> +static void nand_write_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
> +				const uint8_t *buf)
> +{
> +	int eccsize = chip->ecc.size;
> +	int eccbytes = chip->ecc.bytes;
> +	uint8_t *oob = chip->oob_poi;
> +	int temp;

Please don't create variables called "temp" or "tmp".

> +	temp = chip->ecc.steps;
> +	do {
> +		chip->write_buf(mtd, buf, eccsize);
> +		buf += eccsize;
> +
> +		if (chip->ecc.prepad) {
> +			chip->write_buf(mtd, oob, chip->ecc.prepad);
> +			oob += chip->ecc.prepad;
> +		}
> +
> +		chip->read_buf(mtd, oob, eccbytes);
> +		oob += eccbytes;
> +
> +		if (chip->ecc.postpad) {
> +			chip->write_buf(mtd, oob, chip->ecc.postpad);
> +			oob += chip->ecc.postpad;
> +		}
> +	} while (--temp);

It would be clearer to code this as a plain old up-counting for loop.

> +	temp = mtd->oobsize - (oob - chip->oob_poi);
> +	if (temp)
> +		chip->write_buf(mtd, oob, temp);

Here the same woefully-named variable appears to be reemployed for some
semantically quite different purpose.

> +}
