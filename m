Date: Thu, 11 Sep 2014 22:29:32 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: gpmi: add proper raw access support
Message-ID: <20140911142930.GB2543@localhost.localdomain>
References: <1410339339-25561-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410339339-25561-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Mike Voytovich <mvoytovich@paypal.com>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Roy Lee <roylee@paypal.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 10, 2014 at 10:55:39AM +0200, Boris BREZILLON wrote:
 +static int gpmi_ecc_read_page_raw(struct mtd_info *mtd,
> +				  struct nand_chip *chip, uint8_t *buf,
> +				  int oob_required, int page)
> +{
> +	struct gpmi_nand_data *this = chip->priv;
> +	struct bch_geometry *nfc_geo = &this->bch_geometry;
> +	int eccsize = nfc_geo->ecc_chunk_size;
> +	int eccbytes = DIV_ROUND_UP(nfc_geo->ecc_strength * nfc_geo->gf_len,
> +				    8);

In actually, the ECC can be _NOT_ bytes aligned.
you should not round up to byte.

it's hard to implement this hook.

thanks
Huang Shijie
	
> +	uint8_t *oob = chip->oob_poi;
> +	int step;
> +	int column = 0;
> +	uint8_t *orig_buf = buf;
> +
> +	chip->read_buf(mtd, oob, nfc_geo->metadata_size);
> +	oob += nfc_geo->metadata_size;
> +
> +	column += nfc_geo->metadata_size;
> +	for (step = 0; step < nfc_geo->ecc_chunk_count; step++) {
> +		chip->read_buf(mtd, buf, eccsize);
> +		buf += eccsize;
> +		column += eccsize;
> +		chip->read_buf(mtd, oob, eccbytes);
> +		oob += eccbytes;
> +		column += eccbytes;
> +	}
> +
> +	if (column < mtd->writesize + mtd->oobsize)
> +		chip->read_buf(mtd, oob,
> +			       mtd->writesize + mtd->oobsize - column);
> +
> +	block_mark_swapping(this, orig_buf, chip->oob_poi);
> +
> +	return 0;
> +}
