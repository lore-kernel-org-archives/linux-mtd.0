Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMCV1-00005n-3H
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 12:39:01 +0000
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
 [209.85.217.175]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id vB5CcQd7021297
 for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2017 21:38:27 +0900
Received: by mail-ua0-f175.google.com with SMTP id q13so54164uaq.8
 for <linux-mtd@lists.infradead.org>; Tue, 05 Dec 2017 04:38:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171205110929.6820-1-boris.brezillon@free-electrons.com>
References: <20171205110929.6820-1-boris.brezillon@free-electrons.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Dec 2017 21:37:45 +0900
Message-ID: <CAK7LNARq_TPmkBZ_EkiWpze=-4QmCbUCb_KHdJhm2XSXVAqLzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: denali: Avoid using ecc->code_buf as a
 temporary buffer
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-12-05 20:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> ECC bytes are contiguous in the ->oob_poi buffer, which means we don't
> have to copy them into the ->code_buf (here used as a temporary buffer)
> before passing them to the nand_check_erased_ecc_chunk() function.
>
> This change will allow us to allocate ecc->{code,calc}_buf only when
> ecc->calculate() or ecc->correct() is specified.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks!




-- 
Best Regards
Masahiro Yamada
