Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBz9Y-0005fH-4D
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 07:18:04 +0000
Date: Wed, 30 Nov 2016 08:17:42 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 21/39] mtd: nand: denali: support 64bit capable DMA engine
Message-ID: <20161130081742.5ccad72b@bbrezillon>
In-Reply-To: <CAK7LNAR7FAH2i7i0iJGCXbrDgpD==b3Rcj6wRjaKuQ+voWTFLg@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-22-git-send-email-yamada.masahiro@socionext.com>
 <20161127171606.3acd2c54@bbrezillon>
 <CAK7LNAR7FAH2i7i0iJGCXbrDgpD==b3Rcj6wRjaKuQ+voWTFLg@mail.gmail.com>
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

On Wed, 30 Nov 2016 16:11:53 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 2016-11-28 1:16 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> >
> > If you follow my suggestions of definition function pointers, you'll
> > just have to add a function pointer to the denali_caps struct:
> >
> >         void (*setup_dma)(struct denali_nand_info *denali, int op);
> >  
> 
> 
> This is possible because both 32B and 64B variants have
> the same function prototype.
> 
> 
> However, I am not keen on doing so for ecc_handle(),
> so, at this moment, I am not keen on doing so only for setup_dma() either.
> 
> If I see more cases that fit in callback handler approach,
> I will think about switching to it with consistency.
> 

Pretty much all the flags you define in this series could be turned
into function pointers. I still think the function pointers approach is
more future-proof, but I won't fight on that, so do as you wish.
