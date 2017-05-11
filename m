Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8ctv-0003VH-Nn
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 01:28:21 +0000
Received: by mail-pf0-x243.google.com with SMTP id w69so1339673pfk.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 May 2017 18:27:59 -0700 (PDT)
Date: Wed, 10 May 2017 18:27:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Update NAND subsystem git repositories
Message-ID: <20170511012756.GD70297@google.com>
References: <1493794135-23074-1-git-send-email-boris.brezillon@free-electrons.com>
 <20170504165116.GA50116@google.com>
 <20170504192814.78798af4@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170504192814.78798af4@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 04, 2017 at 07:28:14PM +0200, Boris Brezillon wrote:
> On Thu, 4 May 2017 09:51:16 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > On Wed, May 03, 2017 at 08:48:55AM +0200, Boris Brezillon wrote:
> > > NAND branches are now hosted on MTD repos, nand/next is on l2-mtd and
> > > nand/fixes will be on linux-mtd.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > ---
> > >  MAINTAINERS | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 9a84d0022d57..4aa9ca992ad4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -8605,7 +8605,8 @@ R:	Richard Weinberger <richard@nod.at>
> > >  L:	linux-mtd@lists.infradead.org
> > >  W:	http://www.linux-mtd.infradead.org/
> > >  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> > > -T:	git git://github.com/linux-nand/linux.git
> > > +T:	git git://git.infradead.org/linux-mtd.git
> > > +T:	git git://git.infradead.org/l2-mtd.git  
> > 
> > Do you want to include the branch names there?
> 
> Yep, we could do that. Do you plan to take the patch in your tree? If
> you do, can you fix that when applying?

Applied, with branch names added. (Holler if I got something wrong.)
