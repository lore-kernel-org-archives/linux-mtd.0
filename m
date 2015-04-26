Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YmSqC-0006hV-Ub
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2015 20:07:49 +0000
Date: Sun, 26 Apr 2015 22:07:25 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 2/4] mtd: mxc_nand: limit the size of used oob
Message-ID: <20150426200725.GC19431@pengutronix.de>
References: <cover.1430034929.git.baruch@tkos.co.il>
 <4bd5da1f7d57aa32c5682297f7aa0c768e8c6e49.1430034929.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd5da1f7d57aa32c5682297f7aa0c768e8c6e49.1430034929.git.baruch@tkos.co.il>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 26, 2015 at 11:16:49AM +0300, Baruch Siach wrote:
> For 4k pages the i.MX NFC hardware uses exactly 218 or 128 bytes for 4bit or
> 8bit ECC data, respectively. Larger oobsize confuses the logic of copy_spare().
> Limit the size of used oob size to avoid that.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/nand/mxc_nand.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 33b22b9c0b30..c650f0950b20 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -819,15 +819,22 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
>  {
>  	struct nand_chip *this = mtd->priv;
>  	struct mxc_nand_host *host = this->priv;
> -	u16 i, oob_chunk_size;
> +	u16 i, oob_chunk_size, used_oobsize;
>  	u16 num_chunks = mtd->writesize / 512;
>  
>  	u8 *d = host->data_buf + mtd->writesize;
>  	u8 __iomem *s = host->spare0;
>  	u16 sparebuf_size = host->devtype_data->spare_len;
>  
> +	/* hardware can only use 218 or 128 oob bytes for ecc */
> +	if (mtd->oobsize >= 218)
IMHO this is the wrong check. What if your part (with 224 bytes spare)
is used but the machine only uses the small layout e.g. for booting?
(That would work, wouldn't it?) Moreover the comment is misleading as it
only applies to 4K flashes. At least the driver works well with (2ki +
128) bytes pages (while there are only 64 bytes spare used?? Maybe there
are still more bugs?).

> +		used_oobsize = 218;
> +	else if (mtd->oobsize >= 128)
> +		used_oobsize = 128;
> +	else
> +		used_oobsize = mtd->oobsize;
Is it worth to put this check into _probe and put the used size into
driver data?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
