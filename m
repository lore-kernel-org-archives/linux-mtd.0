Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bM3vg-0002Rm-LL
 for linux-mtd@lists.infradead.org; Sun, 10 Jul 2016 01:53:09 +0000
Received: by mail-pf0-x242.google.com with SMTP id c74so11116776pfb.0
 for <linux-mtd@lists.infradead.org>; Sat, 09 Jul 2016 18:52:48 -0700 (PDT)
Date: Sat, 9 Jul 2016 18:52:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Amitoj Kaur Chawla <amitoj1606@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: Replace if and BUG with BUG_ON
Message-ID: <20160710015244.GB7547@localhost>
References: <20160528164117.GA31101@amitoj-Inspiron-3542>
 <CAAEAJfBgR61_UqFBW4JinkE4wSRzCqNg95PxBcaXrhEZS=2grg@mail.gmail.com>
 <alpine.DEB.2.02.1605310737170.2205@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1605310737170.2205@localhost6.localdomain6>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, May 31, 2016 at 07:41:23AM +0200, Julia Lawall wrote:
> On Mon, 30 May 2016, Ezequiel Garcia wrote:
> > On 28 May 2016 at 13:41, Amitoj Kaur Chawla <amitoj1606@gmail.com> wrote:
> > > Replace if condition and BUG() with a BUG_ON having the conditional
> > > expression of the if statement as argument.
[...]

> > > diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
> > > index daf82ba..41b13d1 100644
> > > --- a/drivers/mtd/ssfdc.c
> > > +++ b/drivers/mtd/ssfdc.c
> > > @@ -380,8 +380,7 @@ static int ssfdcr_readsect(struct mtd_blktrans_dev *dev,
> > >                 " block_addr=%d\n", logic_sect_no, sectors_per_block, offset,
> > >                 block_address);
> > >
> > > -       if (block_address >= ssfdc->map_len)
> > > -               BUG();
> > > +       BUG_ON(block_address >= ssfdc->map_len);
> > >
> > 
> > I don't want to be rude, but I wonder if there's any value at all in
> > such a patch. It barely improves readability, it barely reduces the
> > LoC, yet it consumes developer time, maintainer time, and changes git
> > per-line authorship (used in git blame).
> 
> Actually, I think that this particular patch does improve readability a 
> bit.  Scanning straight down the code is easier than looking under an if.
> Also, git blame now has a way to go back in history (although I don't 
> remember what it is), so the argument that cleaning up the code makes it 
> very difficult to find why the nontrivial part of the code is as it is 
> doesn't completely hold any more.

I agree it's a small improvement. Not sure I'd worry too much about
git-blame. Applied to l2-mtd.git.

Brian
