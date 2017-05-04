Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d6KYY-0001j0-CE
 for linux-mtd@lists.infradead.org; Thu, 04 May 2017 17:28:48 +0000
Date: Thu, 4 May 2017 19:28:14 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Update NAND subsystem git repositories
Message-ID: <20170504192814.78798af4@bbrezillon>
In-Reply-To: <20170504165116.GA50116@google.com>
References: <1493794135-23074-1-git-send-email-boris.brezillon@free-electrons.com>
 <20170504165116.GA50116@google.com>
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

On Thu, 4 May 2017 09:51:16 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Wed, May 03, 2017 at 08:48:55AM +0200, Boris Brezillon wrote:
> > NAND branches are now hosted on MTD repos, nand/next is on l2-mtd and
> > nand/fixes will be on linux-mtd.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  MAINTAINERS | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9a84d0022d57..4aa9ca992ad4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8605,7 +8605,8 @@ R:	Richard Weinberger <richard@nod.at>
> >  L:	linux-mtd@lists.infradead.org
> >  W:	http://www.linux-mtd.infradead.org/
> >  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> > -T:	git git://github.com/linux-nand/linux.git
> > +T:	git git://git.infradead.org/linux-mtd.git
> > +T:	git git://git.infradead.org/l2-mtd.git  
> 
> Do you want to include the branch names there?

Yep, we could do that. Do you plan to take the patch in your tree? If
you do, can you fix that when applying?

Thanks,

Boris

> I suppose we could do the
> same for the main MTD entry too...
> 
> Brian
> 
> >  S:	Maintained
> >  F:	drivers/mtd/nand/
> >  F:	include/linux/mtd/nand*.h
> > -- 
> > 2.7.4
> >   
