Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeKoJ-0000PH-EJ
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 08:19:28 +0000
Received: by mail-pa0-f47.google.com with SMTP id lf10so258332pab.6
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 00:19:05 -0800 (PST)
Date: Thu, 7 Nov 2013 00:19:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: use a local variable to simplify the
 nand_scan_tail
Message-ID: <20131107081901.GI3805@norris.computersforpeace.net>
References: <1382077253-21709-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2866E@DBDE04.ent.ti.com>
 <20131019130846.GB2470@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA28EB9@DBDE04.ent.ti.com>
 <20131020105359.GA2465@localhost>
 <CAN8TOE8btxKEhKGX-wVD5Bo2UcsouHSWSLZjYPqn+R-jiXj5Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE8btxKEhKGX-wVD5Bo2UcsouHSWSLZjYPqn+R-jiXj5Zw@mail.gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 21, 2013 at 10:48:03AM -0700, Brian Norris wrote:
> On Sun, Oct 20, 2013 at 3:54 AM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
> > On Sun, Oct 20, 2013 at 07:01:11AM +0000, Gupta, Pekon wrote:
> >> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> >> > > On Fri, Oct 18, 2013 at 02:11:19PM +0000, Gupta, Pekon wrote:
> >> > > Personally I won't prefer such stand-alone cleanup  _unless_ there is
> >> > > major driver re-write of the code, because this breaks the traceability
> >> > > via 'git blame'. And even in that case, this change should be applied first,
> >> > > and the other functional updates later.
> >> > >
> >> >
> >> > Hm.. I'm not sure I agree here. I like this patch and I like the effect
> >> > it has on nand_scan_tail().
> >> >
> >> > On a personal note, I hardly ever use git blame at all (because it's dead
> >> > slow). Instead, I just run git log ${file} and get the latest changes on
> >> > that file.
> >> >
> >> Its rather difficult to use 'git log' especially when you are tracing or debugging
> >> a generic driver, and want to know why this piece of code was introduced,
> >> and the idea behind it. 'git log' won’t show line by line commit details.
> >
> > Quite the opposite 'git log --patch' shows the commit details.
> > Or maybe you need something that I'm not aware of?
> >
> > I really don't think we should dis-encourage cleanups -in what ever form
> > and time they might come- just to preserve the last 'major' author of a file.
> 
> I'm fairly neutral regarding the value of this particular patch (it
> doesn't add a lot of value to me) but I agree with Ezequiel's
> sentiment. Unless we have a stronger reason for avoiding this change,
> I will probably take it.

There are some thoughts from others in the development community on this
very topic. See:

  http://lwn.net/Articles/571980/

Particularly this portion:

  Linus added that the reformatting of files to fix coding-style issues
  before applying small changes is "really nasty," leading to "conflicts
  from hell." It would be better to separate things like white-space
  changes from real work by a full release - or to not do the trivial
  changes at all. Ben Herrenschmidt suggested that white-space changes
  could be done at the end of a series, making them easy to drop, but
  Linus said that doesn't help, that the conflicts still come about. The
  best way to do white-space changes if they must be done, he said, is
  to do them to otherwise quiescent code. 

So this actually contradicts Pekon's claim :)

Anyway, I took the patch. Let people yell at me if this really causes
big problems.

Brian
