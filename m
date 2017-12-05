MIME-Version: 1.0
In-Reply-To: <1512463636-28934-3-git-send-email-yamada.masahiro@socionext.com>
References: <1512463636-28934-1-git-send-email-yamada.masahiro@socionext.com>
 <1512463636-28934-3-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Dec 2017 20:49:28 +0900
Message-ID: <CAK7LNATKBO=eNHdL_P2MOh7+uRcCjkq+v8+O3DXC5UF3-NGh2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: nand: squash struct nand_buffers into struct
 nand_chip
To: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-12-05 17:47 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> struct nand_buffers is malloc'ed in nand_scan_tail() just for
> containing three pointers.  Squash this struct into nand_chip.
>
> Move and rename as follows:
>
>   chip->buffers->ecccalc   ->  chip->ecc.calc_buf
>   chip->buffers->ecccode   ->  chip->ecc.code_buf
>   chip->buffers->databuf   ->  chip->data_buf
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>




> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index dad438c..7870cb1 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1530,7 +1530,7 @@ static int omap_write_page_bch(struct mtd_info *mtd, struct nand_chip *chip,
>                                const uint8_t *buf, int oob_required, int page)
>  {
>         int ret;
> -       uint8_t *ecc_calc = chip->buffers->ecccalc;
> +       uint8_t *ecc_calc = chip->ecccalc;
>
>         /* Enable GPMC ecc engine */
>         chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
> @@ -1568,7 +1568,7 @@ static int omap_write_subpage_bch(struct mtd_info *mtd,
>                                   u32 data_len, const u8 *buf,
>                                   int oob_required, int page)
>  {
> -       u8 *ecc_calc = chip->buffers->ecccalc;
> +       u8 *ecc_calc = chip->ecccalc;
>         int ecc_size      = chip->ecc.size;
>         int ecc_bytes     = chip->ecc.bytes;
>         int ecc_steps     = chip->ecc.steps;
> @@ -1605,7 +1605,7 @@ static int omap_write_subpage_bch(struct mtd_info *mtd,
>
>         /* copy calculated ECC for whole page to chip->buffer->oob */
>         /* this include masked-value(0xFF) for unwritten subpages */
> -       ecc_calc = chip->buffers->ecccalc;
> +       ecc_calc = chip->ecccalc;
>         ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi, 0,
>                                          chip->ecc.total);
>         if (ret)
> @@ -1635,8 +1635,8 @@ static int omap_write_subpage_bch(struct mtd_info *mtd,
>  static int omap_read_page_bch(struct mtd_info *mtd, struct nand_chip *chip,
>                                 uint8_t *buf, int oob_required, int page)
>  {
> -       uint8_t *ecc_calc = chip->buffers->ecccalc;
> -       uint8_t *ecc_code = chip->buffers->ecccode;
> +       uint8_t *ecc_calc = chip->ecccalc;
> +       uint8_t *ecc_code = chip->ecccode;
>         int stat, ret;
>         unsigned int max_bitflips = 0;
>



Sorry, I missed to update omap2.c

I will send v3.
