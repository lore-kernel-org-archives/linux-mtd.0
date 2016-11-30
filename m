Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBzca-0000y0-9u
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 07:48:05 +0000
Date: Wed, 30 Nov 2016 08:47:42 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 04/39] mtd: nand: denali: remove more unused struct members
Message-ID: <20161130084742.2fca0da1@bbrezillon>
In-Reply-To: <CAK7LNATbm0nyh668oMHvsC1vG+SQt6tLhCk1qU+xnRL+5SzRxg@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-5-git-send-email-yamada.masahiro@socionext.com>
 <20161127161238.750ca39a@bbrezillon>
 <CAK7LNATbm0nyh668oMHvsC1vG+SQt6tLhCk1qU+xnRL+5SzRxg@mail.gmail.com>
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

On Wed, 30 Nov 2016 16:16:35 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2016-11-28 0:12 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Sun, 27 Nov 2016 03:05:50 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
> > Please add a description here.
> >
> > Also, this commit tends to validate my fears: you should have wait for
> > the full rework/cleanup to be done before submitting the first round of
> > cleanups. Indeed, commit c4ae0977f57d ("mtd: nand: denali: remove unused
> > struct member denali_nand_info::idx") was removing one of these unused
> > fields, leaving 2 of them behind.  
> 
> Right.
> No difference except that
> denali->idx was initialized to zero(, but not referenced).
> 
> I could squash the two patches.

That's not a big deal.

> 
> 
> > While I like when things I clearly separated in different commits, when
> > you push the logic too far, you end up with big series which are not
> > necessarily easier to review, and several commits that are achieving
> > the same goal...  
> 
> 
> I must admit that I hurried up in posting the first round.
> But, please note I did not ask you to pick it up for v4.10-rc1.
> After all, it was your choice whether you picked it soon or
> waited until you saw the big picture.
> You could have postponed it until v4.11-rc1 if you had wanted.

That's true. But it was not clear from your cover letter that you
were posting this series just to get feedback and not necessarily to
get them applied.

> 
> My idea was, I'd like to get feedback earlier
> (especially from Intel engineers).
> 
> I fear that I do not reveal anything until I complete my work.
> If I am doing wrong in the early patches in my big series,
> I might end up with lots of effort to turn around.
> 
> I dropped various Intel-specific things,
> for example commit c9e025843242 ("mtd: nand: denali: remove
> detect_partition_feature()")
> removed the whole function I do not understand.
> There was possibility that it might be locally used by Intel platforms.
> 
> If I had gotten negative comments for removal, I'd have needed more efforts
> to not break any old functions.
> 
> As a result, nobody was opposed to delete such things.
> So, I can confidently continue my work on cleaner and more *stable* base.
> 
> 

Okay, got it. So, I should not apply any patches from this series until
you've completed your rework (round2+3 posted).
I think I'll still apply patch 1 early, because it's not directly
related to the denali rework, and the fix looks good.

Regards,

Boris
