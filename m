Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7ce6-0006qa-QT
 for linux-mtd@lists.infradead.org; Tue, 31 May 2016 05:55:21 +0000
Date: Tue, 31 May 2016 07:41:23 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
cc: Amitoj Kaur Chawla <amitoj1606@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: Replace if and BUG with BUG_ON
In-Reply-To: <CAAEAJfBgR61_UqFBW4JinkE4wSRzCqNg95PxBcaXrhEZS=2grg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1605310737170.2205@localhost6.localdomain6>
References: <20160528164117.GA31101@amitoj-Inspiron-3542>
 <CAAEAJfBgR61_UqFBW4JinkE4wSRzCqNg95PxBcaXrhEZS=2grg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Mon, 30 May 2016, Ezequiel Garcia wrote:

> Hi Amitoj,
> 
> Thanks for your patch.
> 
> On 28 May 2016 at 13:41, Amitoj Kaur Chawla <amitoj1606@gmail.com> wrote:
> > Replace if condition and BUG() with a BUG_ON having the conditional
> > expression of the if statement as argument.
> >
> 
> We usually want commit messages that tell us *why* you are doing the
> change: what are you fixing, or what are you improving, and what
> possible side-effects it may have.
> 
> This commit log explains what the code does, but we can clearly see
> that, so it's not useful.
> 
> > The Coccinelle semantic patch used to make this change is as follows:
> > @@ expression E,f; @@
> >
> > (
> >   if (<+... f(...) ...+>) { BUG(); }
> > |
> > - if (E) { BUG(); }
> > + BUG_ON(E);
> > )
> >
> > Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
> > ---
> >  drivers/mtd/ssfdc.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
> > index daf82ba..41b13d1 100644
> > --- a/drivers/mtd/ssfdc.c
> > +++ b/drivers/mtd/ssfdc.c
> > @@ -380,8 +380,7 @@ static int ssfdcr_readsect(struct mtd_blktrans_dev *dev,
> >                 " block_addr=%d\n", logic_sect_no, sectors_per_block, offset,
> >                 block_address);
> >
> > -       if (block_address >= ssfdc->map_len)
> > -               BUG();
> > +       BUG_ON(block_address >= ssfdc->map_len);
> >
> 
> I don't want to be rude, but I wonder if there's any value at all in
> such a patch. It barely improves readability, it barely reduces the
> LoC, yet it consumes developer time, maintainer time, and changes git
> per-line authorship (used in git blame).

Actually, I think that this particular patch does improve readability a 
bit.  Scanning straight down the code is easier than looking under an if.
Also, git blame now has a way to go back in history (although I don't 
remember what it is), so the argument that cleaning up the code makes it 
very difficult to find why the nontrivial part of the code is as it is 
doesn't completely hold any more.

julia
