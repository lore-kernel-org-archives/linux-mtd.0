Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTkzd-0007Kt-MW
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 05:07:58 +0000
Received: by mail-pd0-f169.google.com with SMTP id fp1so7805152pdb.0
 for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2014 22:07:36 -0700 (PDT)
Date: Mon, 15 Sep 2014 22:07:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH v2 0/7] mtd: denali: A collection of trivial coding style
 fixes
Message-ID: <20140916050732.GB18093@brian-ubuntu>
References: <1410228117-14820-1-git-send-email-yamada.m@jp.panasonic.com>
 <20140916003620.GA1193@ld-irv-0074>
 <20140916111154.58F0.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140916111154.58F0.AA925319@jp.panasonic.com>
Cc: Jiri Kosina <trivial@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
 Rashika Kheria <rashika.kheria@gmail.com>, linux-mtd@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Masahiro,

On Tue, Sep 16, 2014 at 11:11:58AM +0900, Masahiro Yamada wrote:
> On Mon, 15 Sep 2014 17:36:20 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> > On Tue, Sep 09, 2014 at 11:01:50AM +0900, Masahiro Yamada wrote:
> > > Changes in v2:
> > >   - Join quotes strings into a single line
> > > 
> > > Masahiro Yamada (7):
> > >   mtd: denali: fix the format of comment blocks
> > >   mtd: denali: remove unnecessary variable initializations
> > >   mtd: denali: remove unnecessary casts
> > >   mtd: denali: change the type of iterators to int
> > >   mtd: denali: remove a set-but-unused variable
> > >   mtd: denali: remove unnecessary parentheses
> > >   mtd: denali: fix indents and other trivial things
> > > 
> > >  drivers/mtd/nand/denali.c | 562 +++++++++++++++++++++++++---------------------
> > >  1 file changed, 303 insertions(+), 259 deletions(-)
> > 
> > Pushed patches 1 to 5 to l2-mtd.git. Thanks!
> > 
> > Patch 6 has a conflict with another fix already in l2-mtd.git. Can you
> > rebase and resend?
> 
> Sorry for my ignorance, but where can I find l2-mtd.git?

git://git.infradead.org/l2-mtd.git

> In my understanding, the subsystem repositories should be documented
> in MAINTAINERS, so I looked for it but just found
> T:    git git://git.infradead.org/linux-mtd.git.
> I do not think it is the one you mentioned.

Sorry, apparently l2-mtd.git is not in MAINTAINERS. It historically has
been a kind of queue for the official repo (linux-mtd.git), especially
when work was split up between two people. I handle most of it now.

I guess it should be in MAINTAINERS, though, since most people will need
to base patches on it. I just sent a patch to add it.

> > BTW, my automatic build tests show that there's at least one other
> > 'unused' warning left, in case you want to tackle it too:
> > 
> >     drivers/mtd/nand/denali.c: In function ‘denali_read_page_raw’:
> >     drivers/mtd/nand/denali.c:1221:11: warning: variable ‘irq_status’ set but not used [-Wunused-but-set-variable]
> >           uint32_t irq_status;
> > 
> 
> You are right.
> (What is odd enough is this warning was not displayed on my build test.
> I do not know why.)

I enabled extra warnings. I think you can get most of those with 'make
W=1'.

> Is there a chance for me to resend 5/7 to include this fix?
> Or is it too late?

Just send a new patch, please.

Thanks,
Brian
