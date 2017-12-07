Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eN2da-0003Wm-8D
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 20:19:26 +0000
Date: Thu, 7 Dec 2017 21:18:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 1/2] mtd: nand: denali: Avoid using ecc->code_buf as a
 temporary buffer
Message-ID: <20171207211843.4fd4bbbd@bbrezillon>
In-Reply-To: <CAK7LNARq_TPmkBZ_EkiWpze=-4QmCbUCb_KHdJhm2XSXVAqLzg@mail.gmail.com>
References: <20171205110929.6820-1-boris.brezillon@free-electrons.com>
 <CAK7LNARq_TPmkBZ_EkiWpze=-4QmCbUCb_KHdJhm2XSXVAqLzg@mail.gmail.com>
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

On Tue, 5 Dec 2017 21:37:45 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2017-12-05 20:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > ECC bytes are contiguous in the ->oob_poi buffer, which means we don't
> > have to copy them into the ->code_buf (here used as a temporary buffer)
> > before passing them to the nand_check_erased_ecc_chunk() function.
> >
> > This change will allow us to allocate ecc->{code,calc}_buf only when
> > ecc->calculate() or ecc->correct() is specified.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>  
> 
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied those 2 patches.

Boris

> 
> Thanks!
> 
> 
> 
> 
