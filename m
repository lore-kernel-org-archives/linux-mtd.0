Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkU0p-0006Jj-IS
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2015 08:58:36 +0000
Date: Tue, 21 Apr 2015 11:58:08 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: i.MX25 NFC with 8 bit ecc strength
Message-ID: <20150421085808.GL5428@tarshish>
References: <20150420045614.GC5428@tarshish>
 <20150420073702.GA2552@pengutronix.de>
 <20150420091130.GD5428@tarshish>
 <20150420154818.GE2552@pengutronix.de>
 <20150421062428.GJ5428@tarshish>
 <20150421073936.GI2552@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150421073936.GI2552@pengutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Uwe,

On Tue, Apr 21, 2015 at 09:39:36AM +0200, Uwe Kleine-König wrote:
> On Tue, Apr 21, 2015 at 09:24:28AM +0300, Baruch Siach wrote:
> > On Mon, Apr 20, 2015 at 05:48:18PM +0200, Uwe Kleine-König wrote:
> > > This is more or less expected. The "more" part is: Matching the hardware
> > > description the (virtual) spare area is sorted into the spare area
> > > buffers, so the first spare area is written to 0xbb001000, the 2nd to
> > > 0xbb001040 etc. (See table 36-3 in the manual.) So probably it's the
> > > driver who doesn't get the sorting right. 
> > 
> > OK. I see what you mean. The 28 bytes interval has noting to do with hardware. 
> > It comes from this line in copy_spare():
> > 
> > 	j = (mtd->oobsize / n >> 1) << 1;
> > 
> > In my case oobsize = 224, and n = 8 (512 bytes steps), so j == 28. This means 
> > that we must generate nand_ecclayout at run time according to the actual 
> > oobsize. This is probably also true for the 4 bit ecc case.
> I think you're only partly right here. The NFC only supports 128 or 218
> bytes spare area for 4k NAND flashes (initialized by BT_SPARE_SIZE). For
> you chip the controller uses the 218 bytes setting, so 26 bytes are read
> for the first 7 oob chunks each (last one: 36) As the driver assumes the
> real oob size of 224 bytes you get that offset of 28 instead.
> 
> So looking again on your hexdump:
> 
> 	00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 	*
> This is the data part, everything in order
> 
> 	00001000  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
> 	00001010  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
> Up to the 26th byte --------------------------^^ this is data coming
> from the flash. The following two 0xff are just what happened to be
> written in the NFC buffer. Starting with the four last 0xff in that line
> we have real data again.
> 
> 	00001020  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
> which makes the first ecc byte again the 8th of the oob chunk similar to
> the one above.

Thanks for your explanation.

[...]

> While understanding the problem I produced the following (untested)
> patch:
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index dca63a70e783..fc835d352e1c 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -807,32 +807,49 @@ static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
>  }
>  
>  /*
> - * Function to transfer data to/from spare area.
> + * The controller splits a page into data chunks of 512 bytes + partial oob.
> + * There are writesize / 512 such chunks, the size of the partial oob parts is
> + * oobsize / #chunks rounded down to a multiple of 2. The last oob chunk then
> + * contains additionally the byte lost by rounding (if any).
> + * This function handles the needed shuffling between host->data_buf (which
> + * holds a page in natural order, i.e. writesize bytes data + oobsize bytes
> + * spare) and the NFC buffer.
>   */
>  static void copy_spare(struct mtd_info *mtd, bool bfrom)
>  {
>  	struct nand_chip *this = mtd->priv;
>  	struct mxc_nand_host *host = this->priv;
>  	u16 i, j;
> -	u16 n = mtd->writesize >> 9;
> +
> +	u16 num_chunks = mtd->writesize / 512;
> +
>  	u8 *d = host->data_buf + mtd->writesize;
>  	u8 __iomem *s = host->spare0;
> -	u16 t = host->devtype_data->spare_len;
> +	u16 sparebuf_size = host->devtype_data->spare_len;
>  
> -	j = (mtd->oobsize / n >> 1) << 1;
> +	/* size of oob chunk for all but possibly the last one */
> +	oob_chunk_size = (mtd->oobsize / num_chunks >> 1) << 1;
>  
>  	if (bfrom) {
> -		for (i = 0; i < n - 1; i++)
> -			memcpy32_fromio(d + i * j, s + i * t, j);
> +		for (i = 0; i < num_chunks - 1; i++)
> +			memcpy32_fromio(d + i * oob_chunk_size,
> +					s + i * sparebuf_size,
> +					oob_chunk_size);
>  
>  		/* the last section */
> -		memcpy32_fromio(d + i * j, s + i * t, mtd->oobsize - i * j);
> +		memcpy32_fromio(d + i * oob_chunk_size,
> +				s + i * sparebuf_size,
> +				mtd->oobsize - i * oob_chunk_size);
>  	} else {
> -		for (i = 0; i < n - 1; i++)
> -			memcpy32_toio(&s[i * t], &d[i * j], j);
> +		for (i = 0; i < num_chunks - 1; i++)
> +			memcpy32_toio(&s[i * sparebuf_size],
> +				      &d[i * oob_chunk_size],
> +				      oob_chunk_size);
>  
>  		/* the last section */
> -		memcpy32_toio(&s[i * t], &d[i * j], mtd->oobsize - i * j);
> +		memcpy32_toio(&s[oob_chunk_size * sparebuf_size],
> +			      &d[i * oob_chunk_size],
> +			      mtd->oobsize - i * oob_chunk_size);
>  	}
>  }
> 
> What is needed now on top of this (untested and noop) change is to use
> the oob size the controller assumes instead of the real one and somehow
> explain that to the mtd layer and maintainers :-)

Can't we just limit oobsize to 128 or 218? Something like (on top of your 
patch):

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index cc0eb79a177c..ae63f06fe99e 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -819,7 +819,7 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
 {
 	struct nand_chip *this = mtd->priv;
 	struct mxc_nand_host *host = this->priv;
-	u16 i, j;
+	u16 i, oob_chunk_size, used_oobsize;
 
 	u16 num_chunks = mtd->writesize / 512;
 
@@ -828,7 +828,13 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
 	u16 sparebuf_size = host->devtype_data->spare_len;
 
 	/* size of oob chunk for all but possibly the last one */
-	oob_chunk_size = (mtd->oobsize / num_chunks >> 1) << 1;
+	if (mtd->oobsize >= 218)
+		used_oobsize = 218;
+	else if (mtd->oobsize >= 128)
+		used_oobsize = 128;
+	else
+		used_oobsize = mtd->oobsize;
+	oob_chunk_size = (used_oobsize / num_chunks >> 1) << 1;
 
 	if (bfrom) {
 		for (i = 0; i < num_chunks - 1; i++)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
