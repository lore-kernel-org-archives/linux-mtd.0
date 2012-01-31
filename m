Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rs9fE-0004Hh-Pv
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 09:06:09 +0000
Date: Tue, 31 Jan 2012 10:05:20 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Hong Xu <hong.xu@atmel.com>
Subject: Re: [PATCH] MTD: atmel_nand: Update driver to support Programmable
 HW ECC controller
Message-ID: <20120131090520.GA4993@parrot.com>
References: <1327979470-11522-1-git-send-email-hong.xu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1327979470-11522-1-git-send-email-hong.xu@atmel.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 03:11:10AM +0000, Hong Xu wrote:
(...)
> +static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf,
> +               int extra_bytes, int err_nbr)
> +{
> +       int                     i = 0;
> +       int                     byte_pos, bit_pos;
> +       int                     sector_size, ecc_size;
> +       uint32_t                tmp;
> +       struct nand_chip        *nand_chip = mtd->priv;
> +       struct atmel_nand_host  *host = nand_chip->priv;
> +
> +       sector_size = host->board->sector_size;
> +       ecc_size = nand_chip->ecc.bytes;
> +
> +       while (err_nbr) {
> +               byte_pos = (pmerrloc_readl_el(host->pmerrloc_base, i) - 1) / 8;
> +               bit_pos = (pmerrloc_readl_el(host->pmerrloc_base, i) - 1) % 8;

Hello,
do you really need to read this register twice?

> +               dev_info(host->dev, "PMECC correction, byte_pos: %d "
> +                       "bit_pos: %d\n", byte_pos, bit_pos);
> +
> +               if (byte_pos < (sector_size + extra_bytes)) {
> +                       tmp = sector_size + pmecc_readl(host->ecc, SADDR);
> +                       if (byte_pos < tmp) {

> +                               if (*(buf + byte_pos) & (1 << bit_pos))
> +                                       *(buf + byte_pos) &=
> +                                               (0xFF ^ (1 << bit_pos));
> +                               else
> +                                       *(buf + byte_pos) |= (1 << bit_pos);

why not replace the 5 lines above with:  *(buf + byte_pos) ^= 1 << bit_pos;

> +                       } else {
> +                               if (*(buf + byte_pos + ecc_size) &
> +                                    (1 << bit_pos))
> +                                       *(buf + byte_pos + ecc_size) &=
> +                                               (0xFF ^ (1 << bit_pos));
> +                               else
> +                                       *(buf + byte_pos + ecc_size) |=
> +                                               (1 << bit_pos);

same idea:   *(buf + byte_pos + ecc_size) ^= 1 << bit_pos;

BR,
--
Ivan
