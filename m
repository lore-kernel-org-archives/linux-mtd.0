Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBzfm-0003QZ-PV
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 07:51:23 +0000
Date: Wed, 30 Nov 2016 08:51:01 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 17/39] mtd: nand: denali: support HW_ECC_FIXUP capability
Message-ID: <20161130085101.483520ae@bbrezillon>
In-Reply-To: <CAK7LNASsn8esF6UsCmc-Pv+ED_ukvtMO7nOWLs+u6H0UgcsHTw@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-18-git-send-email-yamada.masahiro@socionext.com>
 <20161127170907.002e6ab4@bbrezillon>
 <CAK7LNASsn8esF6UsCmc-Pv+ED_ukvtMO7nOWLs+u6H0UgcsHTw@mail.gmail.com>
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

On Wed, 30 Nov 2016 15:20:10 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2016-11-28 1:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>                                         &max_bitflips);
> >
> > Okay, so you currently have two ways of handling ECC errors. What if a
> > new revision introduces yet another way to do it?
> >
> > How about making denali_caps a structure where you have one (or several)
> > function pointers to implement operations differently depending on the
> > IP revision?
> >
> > struct denali_caps {
> >         u32 feature_flags; /* If needed. */
> >         bool (*handle_ecc)(...);
> >         ...
> > };
> >  
> 
> I think a problem is the difference of function arguments:
> 
> static bool denali_hw_ecc_fixup(struct denali_nand_info *denali,
>                                 unsigned int *max_bitflips)
> 
>      vs
> 
> static bool denali_sw_ecc_fixup(struct denali_nand_info *denali, u8 *buf,
>                                 u32 irq_status, unsigned int *max_bitflips)
> 
> 
> I do not want to pass redundant arguments,
> which are used for one, but not used for the other.
> 

We do that all the time when defining generic interfaces.

> 
> We do not need to think about the situation that may not happen.
> If happens, we can refactor the code any time.
> 

Well, as I said in my other reply, I still think it's better to plan
for this now, rather than having to change a lot things when we appear
to need this. But that's only my POV, and I don't care enough to fight.
