Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqxcI-000415-PO
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 07:57:09 +0000
Date: Thu, 23 Mar 2017 08:56:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Laurent Monat
 <laurent.monat@idquantique.com>, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>, Jason Roberts
 <jason.e.roberts@intel.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Weinberger
 <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v2 10/53] mtd: nand: denali: fix erased page checking
Message-ID: <20170323085644.338a3a81@bbrezillon>
In-Reply-To: <CAK7LNAT-7XHTYYfXCQCwk3za=juAEFuGBWxa4XG6Zm+g8=04Yw@mail.gmail.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-11-git-send-email-yamada.masahiro@socionext.com>
 <20170322215623.531e9690@bbrezillon>
 <CAK7LNAT-7XHTYYfXCQCwk3za=juAEFuGBWxa4XG6Zm+g8=04Yw@mail.gmail.com>
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

On Thu, 23 Mar 2017 14:04:44 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 2017-03-23 5:56 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Wed, 22 Mar 2017 23:07:17 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:  
> >>               dev_err(denali->dev,
> >> @@ -1148,12 +1136,15 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >>       if (check_erased_page) {
> >>               read_oob_data(mtd, chip->oob_poi, denali->page);
> >>
> >> -             /* check ECC failures that may have occurred on erased pages */
> >> -             if (check_erased_page) {
> >> -                     if (!is_erased(buf, mtd->writesize))
> >> -                             mtd->ecc_stats.failed++;
> >> -                     if (!is_erased(buf, mtd->oobsize))
> >> -                             mtd->ecc_stats.failed++;
> >> +             stat = nand_check_erased_ecc_chunk(
> >> +                                     buf, mtd->writesize,
> >> +                                     chip->oob_poi, mtd->oobsize,
> >> +                                     NULL, 0,
> >> +                                     chip->ecc.strength * chip->ecc.steps);  
> >
> > That's not how it's supposed to be done. Each chunk should be checked
> > independently. Here is a simple example explaining why this is
> > important:
> >
> > Let's consider the following setup:
> > - 4k pages
> > - 16bits/1024bytes ECC
> >
> > With your approach, you turn this into:
> > - 4k pages
> > - 64bits/4096bytes ECC
> >
> > Now suppose you have 32 bitflips in the first 1024 bytes. The real ECC
> > config is expected to report uncorrectable errors, but your approach
> > will just report that 32 bits have been fixed, which is wrong.  
> 
> 
> OK.  How about adding a helper like follows:
> 
> static int denali_check_erased_page(struct mtd_info *mtd,
>                                     struct nand_chip *chip, uint8_t *buf)
> {
>         uint8_t *ecc_code = chip->buffers->ecccode;
>         int ecc_steps = chip->ecc.steps;
>         int ecc_size = chip->ecc.size;
>         int ecc_bytes = chip->ecc.bytes;
>         int i, ret;
> 
>         ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
>                                          chip->ecc.total);
>         if (ret)
>                 return ret;
> 
>         for (i = 0; i < ecc_steps; i++) {
>                 ret = nand_check_erased_ecc_chunk(buf, ecc_size,
>                                                   ecc_code, ecc_bytes,
>                                                   NULL, 0,
>                                                   chip->ecc.strength);
>                 if (ret < 0)
>                         return ret;
>                 buf += ecc_size;
>                 ecc_code += ecc_bytes;
>         }
> 
>         return 0;
> }
> 
> 
> 
> Then,
> 
>                 stat = denali_check_erased_page(mtd, chip, buf);
>                 if (stat < 0) {
>                         mtd->ecc_stats.failed++;
>                         /* return 0 for uncorrectable bitflips */
>                         stat = 0;
>                 }

What's the point of checking all ECC chunks if only one contains ECC
errors? I really recommend to put the nand_check_erased_ecc_chunk()
call next to the per-ECC-block correction test.

Also, mtd->ecc_stats.failed is supposed to be incremented each time an
uncorrectable error is detected. In your denali_sw_ecc_fixup()
implementation you can detect errors at the ECC chunk level, so you
should increment ecc_stats.failed for each failure and not once if at
least one chunk is faulty.
