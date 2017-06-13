Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dKhEJ-0006GC-98
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 08:31:16 +0000
Date: Tue, 13 Jun 2017 10:30:43 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen
 <dinguyen@kernel.org>, linux-mtd@lists.infradead.org, Masami Hiramatsu
 <mhiramat@kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris
 <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>
Subject: Re: [PATCH v6 00/18] mtd: nand: denali: Denali NAND IP patch bomb
Message-ID: <20170613103043.622a2c98@bbrezillon>
In-Reply-To: <CAK7LNAQAjGJDZLKG7BAVizZgvxkir9V+R0rPTChegH=tKVdx=w@mail.gmail.com>
References: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
 <20170613090249.6a247389@bbrezillon>
 <CAK7LNAQAjGJDZLKG7BAVizZgvxkir9V+R0rPTChegH=tKVdx=w@mail.gmail.com>
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

On Tue, 13 Jun 2017 17:17:41 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2017-06-13 16:02 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> 
> >
> > BTW, I also implemented ->read/write_buf_word() since the core may one
> > day call these functions, and the default implementations used by the
> > core when these hooks are NULL are not appropriate in your case.
> >  
> 
> BTW, why doesn't the default hook in the core do like this?
> 
> 
> static uint8_t nand_read_byte(struct mtd_info *mtd)
> {
>         struct nand_chip *chip = mtd_to_nand(mtd);
>         uint8_t byte;
> 
>         chip->read_buf(chip, &byte, 1);
>         return byte;
> }
> 
> 
> ->read_byte() is a special case of ->read_buf() with length==1,  
> so this should work.

Not sure it works for all implementation. ->read_byte() is expected
to return the lower 8 bits when interacting with a 16-bits bus. If we do
what you suggest, and ->read_buf() appears to be caching data in an
intermediate buffer if the amount of data is not aligned on 2 bytes,
you might retrieve data you don't care about when ->read_byte() is
called several times.
