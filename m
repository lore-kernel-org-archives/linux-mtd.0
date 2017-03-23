Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqxrl-0004Qc-QN
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 08:13:07 +0000
Date: Thu, 23 Mar 2017 09:12:43 +0100
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
Subject: Re: [PATCH v2 11/53] mtd: nand: denali: fix bitflips calculation in
 handle_ecc()
Message-ID: <20170323091243.52994427@bbrezillon>
In-Reply-To: <CAK7LNASC8VvNgMV5CGq5BJGUknPEP51R_RBfCy+K2ZiVm2Qxtg@mail.gmail.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-12-git-send-email-yamada.masahiro@socionext.com>
 <20170322215728.69e8b566@bbrezillon>
 <CAK7LNASC8VvNgMV5CGq5BJGUknPEP51R_RBfCy+K2ZiVm2Qxtg@mail.gmail.com>
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

On Thu, 23 Mar 2017 16:02:02 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 2017-03-23 5:57 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Wed, 22 Mar 2017 23:07:18 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> +     do {
> >> +             err_addr = ioread32(denali->flash_reg + ECC_ERROR_ADDRESS);
> >> +             err_sector = ECC_SECTOR(err_addr);
> >> +             err_byte = ECC_BYTE(err_addr);
> >> +
> >> +             err_cor_info = ioread32(denali->flash_reg + ERR_CORRECTION_INFO);
> >> +             err_cor_value = ECC_CORRECTION_VALUE(err_cor_info);
> >> +             err_device = ECC_ERR_DEVICE(err_cor_info);
> >> +
> >> +             /* reset the bitflip counter when crossing ECC sector */
> >> +             if (err_sector != prev_sector)
> >> +                     bitflips = 0;
> >> +
> >> +             if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
> >> +                     /*
> >> +                      * if the error is not correctable, need to look at the
> >> +                      * page to see if it is an erased page. if so, then
> >> +                      * it's not a real ECC error
> >> +                      */
> >> +                     ret = -EBADMSG;  
> >
> > You should never return -EBADMSG directly. Just increment
> > ecc_stats.failed and let the core return -EBADMSG to the upper layer.
> >  
> 
> Here, -EBADMSG is used like that returned from  ->ecc.correct()
> 
> 
> Please notice denali_read_page() never returns -EBADMSG.
> 
>  -EBADMSG is used as a mark "we need erased page check".
> 
> 
> I think nand_read_page_syndrome() does similar;
> -EBADMSG is used internally.

That's not exactly what happens. nand_read_page_syndrome() calls
ecc->correct() for each chunk, and if this method returns -EBADMSG (and
nand_check_erased_ecc_chunk() returns -EBADMSG too) it increments the
ecc_stats.failed counter.

Here you check all chunks in the same function and only increment
ecc_stats.failed once in denali_read_page() even if several chunks are
uncorrectable.
You handle_ecc() should act like nand_read_page_syndrome() WRT ECC
checking: check each block one by one, call
nand_check_erased_ecc_chunk() if needed, increment ecc_stats.failed
when an uncorrectable error is detected, and return max_bitflips at the
end.
