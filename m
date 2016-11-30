Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBzw2-00063v-QF
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 08:08:12 +0000
Date: Wed, 30 Nov 2016 09:07:49 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 28/39] mtd: nand: denali: move multi NAND fixup code to
 a helper function
Message-ID: <20161130090749.37484fff@bbrezillon>
In-Reply-To: <CAK7LNAR_x0=jOWfkf=0X9f+OHnTSRDBiQZPG_FnFHEJda8fP_g@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-29-git-send-email-yamada.masahiro@socionext.com>
 <20161127172456.5dba79f2@bbrezillon>
 <CAK7LNAR_x0=jOWfkf=0X9f+OHnTSRDBiQZPG_FnFHEJda8fP_g@mail.gmail.com>
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

On Wed, 30 Nov 2016 15:09:27 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2016-11-28 1:24 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Sun, 27 Nov 2016 03:06:14 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> Collect multi NAND fixups into a helper function instead of
> >> scattering them in denali_init().  
> >
> > Can you tell me more about this multi-NAND feature?
> > The core is already able to detect multi-die NAND chips in a generic
> > way,  
> 
> This is not the case.
> 
> > but I fear this is something else, like "put two 8-bits chips on a
> > 16bits bus to emulate a single 16bits chip".  
> 
> Yes, it is.
> 
> (I have never used this controller like that.
> But, I am pretty sure it is
> from the code and the
> Denali's User Guide mentions such usage.)
> 
> 
> Just in case, I will clearly rephrase the comment block like follows in v2:
> 
>         /*
>          * Support for multi device:
>          * When the IP configuration is x16 capable and two x8 chips are
>          * connected in parallel, DEVICES_CONNECTED should be set to 2.
>          * In this case, the core framework knows nothing about this fact,
>          * so we should tell it the _logical_ pagesize and anything necessary.
>          */
> 

BTW, you should also set the NAND_BUSWIDTH_16 flag in this case.

> 
> 
> 
> > If that's a case, and this feature is actually used, then it's a bad
> > idea IMHO.
> > For example, how do you handle the case where one block is bad on a
> > chip but not on the other? And I fear this is not the only problem
> > with this approach :-/.  
> 
> As you expect, if one block is bad,
> the correspond block on the other chip can not be used.
> 

Hm, last time I thought about this usage I found others things that
could cause problems, but I can't remember exactly what.

Anyway, if this feature is already used, let's keep it.
