Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBFZj-0006Cz-N4
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 07:10:21 +0000
Date: Thu, 18 May 2017 09:09:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 1/2] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
Message-ID: <20170518090957.227954c1@bbrezillon>
In-Reply-To: <CAK7LNAQzPcM6T+3yG8=ezd0vRetW-vcibHWYSw5yJC5TorPKVQ@mail.gmail.com>
References: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
 <1492585618-13655-2-git-send-email-yamada.masahiro@socionext.com>
 <20170428183250.4c43e107@bbrezillon>
 <CAK7LNAQZyMoKJjzPjr12TE9s=G8GJbHGgfequtLE4h+meJT03w@mail.gmail.com>
 <20170515135433.2edda630@bbrezillon>
 <CAK7LNAQzPcM6T+3yG8=ezd0vRetW-vcibHWYSw5yJC5TorPKVQ@mail.gmail.com>
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

On Thu, 18 May 2017 15:27:11 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 
> 2017-05-15 20:54 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > Hi Masahiro,
> >
> > Sorry for the late reply.
> >
> > On Mon, 8 May 2017 12:40:47 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> Hi Boris,
> >>
> >>
> >> 2017-04-29 1:32 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> >>  
> >> >> +     for (setting = caps->ecc_settings; setting->step; setting++) {
> >> >> +             /* If chip->ecc.size is already set, respect it. */
> >> >> +             if (chip->ecc.size && setting->step != chip->ecc.size)
> >> >> +                     continue;
> >> >> +
> >> >> +             /* If chip->ecc.strength is already set, respect it. */
> >> >> +             if (chip->ecc.strength &&
> >> >> +                 setting->strength != chip->ecc.strength)
> >> >> +                     continue;  
> >> >
> >> > Hm, I don't get it. If chip->ecc.strength and chip->ecc.size are
> >> > explicitly set, you should just call nand_check_ecc_caps() and skip
> >> > nand_try_to_match_ecc_req(). Why would you call
> >> > nand_try_to_match_ecc_req() in this case?  
> >>
> >>
> >> I want to call this function if
> >> ecc.size is specified but ecc.strength is not
> >> (or vice versa).  
> >
> > That's not a valid combination. I accepted the case where
> > nand-ecc-step-size is not defined in the DT just because sometime you
> > only have one possible setting which is imposed by the controller. In
> > this case ecc.size should be explicitly set by the driver not left to 0.
> >  
> >>
> >>
> >> If both ecc.size and ecc.strength are already specified,
> >> you are right, no need to call this function.
> >> This function can check the sanity of the specified
> >> combination of (step, strength), but this is the same
> >> as what nand_check_ecc_caps() does.  
> 
> 
> I am working on the next version because I really need to
> merge all of my Denali controller patches for my SoCs.

Okay.

> 
> 
> One question about this part.
> 
> 
>        /* If chip->ecc.size is already set, respect it. */
>        if (chip->ecc.size && step_size != chip->ecc.size)
>                continue;
> 
> Does this make sense for nand_try_to_maximize_ecc()?
> 
> (In other words, can nand-ecc-maximize stand together with nand-ecc-step-size?)

It could make sense if one wants to maximize the strength for a
specific step-size, but most of the time the user will let the driver
choose the best step-size+strength pair.
