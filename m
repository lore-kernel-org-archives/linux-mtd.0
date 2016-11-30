Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBz4I-0002lf-7H
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 07:12:39 +0000
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id uAU7BwfQ018222
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 16:11:58 +0900
Received: by mail-yw0-f181.google.com with SMTP id t125so152169860ywc.1
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 23:11:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127171606.3acd2c54@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-22-git-send-email-yamada.masahiro@socionext.com>
 <20161127171606.3acd2c54@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 Nov 2016 16:11:53 +0900
Message-ID: <CAK7LNAR7FAH2i7i0iJGCXbrDgpD==b3Rcj6wRjaKuQ+voWTFLg@mail.gmail.com>
Subject: Re: [PATCH 21/39] mtd: nand: denali: support 64bit capable DMA engine
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

2016-11-28 1:16 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>
> If you follow my suggestions of definition function pointers, you'll
> just have to add a function pointer to the denali_caps struct:
>
>         void (*setup_dma)(struct denali_nand_info *denali, int op);
>


This is possible because both 32B and 64B variants have
the same function prototype.


However, I am not keen on doing so for ecc_handle(),
so, at this moment, I am not keen on doing so only for setup_dma() either.

If I see more cases that fit in callback handler approach,
I will think about switching to it with consistency.

-- 
Best Regards
Masahiro Yamada
