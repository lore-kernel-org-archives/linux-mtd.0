Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCijL-0001Dp-Ue
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 07:58:05 +0000
Date: Fri, 2 Dec 2016 08:57:42 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Richard Weinberger <richard@nod.at>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH 09/39] mtd: nand: denali: fix erased page check code
Message-ID: <20161202085742.06cff892@bbrezillon>
In-Reply-To: <CAK7LNAS8RFs6iLNObj=HESUqWyEr8CO7B=LCCCbZ6Ki8Em96wg@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-10-git-send-email-yamada.masahiro@socionext.com>
 <20161127162129.67bb8e00@bbrezillon>
 <CAK7LNAS8RFs6iLNObj=HESUqWyEr8CO7B=LCCCbZ6Ki8Em96wg@mail.gmail.com>
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

On Fri, 2 Dec 2016 13:33:58 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2016-11-28 0:21 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Sun, 27 Nov 2016 03:05:55 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> Currently, is_erased() is called against "buf" twice, so the second
> >> call is meaningless.  The second one should be checked against
> >> chip->oob_poi.
> >>  
> >
> > IMO, patch 9 to 12 should be squashed in a single patch. All you're
> > doing in these patch is fixing the check_erased_page logic.
> >
> > You can describe the different broken thing in the commit message, but
> > splitting things as you do does not help much.  
> 
> 
> OK. I will do so.
> 
> I realized some mistakes in this part
> (both in my patches and in the current mainline code),
> so I will rework it in a more sensible chunk.
> 
> 
> > Also, please have at nand_check_erased_ecc_chunk() [1] instead of using
> > a private method (is_erased()) to check if the page is erased.
> > With this method you get bitflips in erased pages correction for free.  
> 
> I will use this helper, thanks!
> 
> 
> 
> 
> With this, I think I answered all of your questions to v1.

You did. I'm waiting for the v2 now ;)

> 
> (Please tell me if there is something I missed to answer.)
> 
> Thanks a lot for your review.
> 
> 
> 
