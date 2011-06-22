Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZGPH-0003jc-5S
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 05:55:20 +0000
Received: by pzk28 with SMTP id 28so341004pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 22:54:25 -0700 (PDT)
Subject: Re: [PATCH upstream] nand: nand_base: Always initialise oob_poi
	before writing OOB data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
Date: Wed, 22 Jun 2011 08:55:08 +0300
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AACE12D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AACE12D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308722112.18119.36.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-14 at 16:52 +0200, THOMSON, Adam (Adam) wrote:
> In nand_do_write_ops() code it is possible for a caller to provide
> ops.oobbuf populated and ops.mode == MTD_OOB_AUTO, which currently
> means that the chip->oob_poi buffer isn't initialised to all 0xFF.
> The nand_fill_oob() method then carries out the task of copying
> the provided OOB data to oob_poi, but with MTD_OOB_AUTO it skips
> areas marked as unavailable by the layout struct, including the
> bad block marker bytes.
> 
> An example of this causing issues is when the last OOB data read
> was from the start of a bad block where the markers are not 0xFF,
> and the caller wishes to write new OOB data at the beginning of
> another block. In this scenario the caller would provide OOB data,
> but nand_fill_oob() would skip the bad block marker bytes in
> oob_poi before copying the OOB data provided by the caller.
> This means that when the OOB data is written back to NAND,
> the block is inadvertently marked as bad without the caller knowing.
> This has been witnessed when using YAFFS2 where tags are stored
> in the OOB.
> 
> To avoid this oob_poi is always initialised to 0xFF to make sure
> no left over data is inadvertently written back to the OOB area.
> 
> Signed-off-by: Adam Thomson <adam.thomson@alcatel-lucent.com>

Added the -stable CC here and pushed to l2-mtd-2.6.git with some
modifications.

>   * nand_fill_oob - [Internal] Transfer client buffer to oob
>   * @chip:	nand chip structure
> + * @mtd:	MTD device structure
>   * @oob:	oob data buffer
>   * @len:	oob data write length
>   * @ops:	oob ops structure
>   */
> -static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
> -						struct mtd_oob_ops *ops)
> +static uint8_t *nand_fill_oob(struct nand_chip *chip, struct mtd_info *mtd,
> +			      uint8_t *oob, size_t len,	struct mtd_oob_ops *ops)
>  {

Since we can get chip from mtd->prive, it is not necessary to pass both
chip and mtd to this function, it is enough to only pass mtd.

I've done this modification, the resulting patch is here:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/6a146696fdcf383d90753145dfb367e499790940

Would you please take a look and even better - give it a try?

Thanks!

-- 
Best Regards,
Artem Bityutskiy
