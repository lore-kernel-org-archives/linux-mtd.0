Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTiGQ-000338-JB
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 02:13:07 +0000
Date: Tue, 16 Sep 2014 11:11:58 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 0/7] mtd: denali: A collection of trivial coding style
 fixes
In-Reply-To: <20140916003620.GA1193@ld-irv-0074>
References: <1410228117-14820-1-git-send-email-yamada.m@jp.panasonic.com>
 <20140916003620.GA1193@ld-irv-0074>
Message-Id: <20140916111154.58F0.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
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

Hi Brian,




On Mon, 15 Sep 2014 17:36:20 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Tue, Sep 09, 2014 at 11:01:50AM +0900, Masahiro Yamada wrote:
> > Changes in v2:
> >   - Join quotes strings into a single line
> > 
> > Masahiro Yamada (7):
> >   mtd: denali: fix the format of comment blocks
> >   mtd: denali: remove unnecessary variable initializations
> >   mtd: denali: remove unnecessary casts
> >   mtd: denali: change the type of iterators to int
> >   mtd: denali: remove a set-but-unused variable
> >   mtd: denali: remove unnecessary parentheses
> >   mtd: denali: fix indents and other trivial things
> > 
> >  drivers/mtd/nand/denali.c | 562 +++++++++++++++++++++++++---------------------
> >  1 file changed, 303 insertions(+), 259 deletions(-)
> 
> Pushed patches 1 to 5 to l2-mtd.git. Thanks!
> 
> Patch 6 has a conflict with another fix already in l2-mtd.git. Can you
> rebase and resend?


Sorry for my ignorance, but where can I find l2-mtd.git?

In my understanding, the subsystem repositories should be documented
in MAINTAINERS, so I looked for it but just found
T:    git git://git.infradead.org/linux-mtd.git.
I do not think it is the one you mentioned.



> BTW, my automatic build tests show that there's at least one other
> 'unused' warning left, in case you want to tackle it too:
> 
>     drivers/mtd/nand/denali.c: In function ‘denali_read_page_raw’:
>     drivers/mtd/nand/denali.c:1221:11: warning: variable ‘irq_status’ set but not used [-Wunused-but-set-variable]
>           uint32_t irq_status;
> 

You are right.
(What is odd enough is this warning was not displayed on my build test.
I do not know why.)

Is there a chance for me to resend 5/7 to include this fix?
Or is it too late?


Best Regards
Masahiro Yamada
