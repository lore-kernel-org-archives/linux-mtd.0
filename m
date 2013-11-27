Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlVgG-0007sg-IF
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 03:20:49 +0000
Received: by mail-ie0-f182.google.com with SMTP id as1so11091161iec.13
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 19:20:24 -0800 (PST)
Date: Tue, 26 Nov 2013 19:20:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: Add NAND device drivers to MAINTAINERS
Message-ID: <20131127032019.GX9468@ld-irv-0074.broadcom.com>
References: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1384950009-13767-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131121185314.GK9468@ld-irv-0074.broadcom.com>
 <20131121191117.GB3241@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131121191117.GB3241@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 21, 2013 at 04:11:18PM -0300, Ezequiel Garcia wrote:
> On Thu, Nov 21, 2013 at 10:53:14AM -0800, Brian Norris wrote:
> > On Wed, Nov 20, 2013 at 09:20:08AM -0300, Ezequiel Garcia wrote:
> > > Add drivers/mtd/nand/ to MAINTAINERS file with Brian Norris
> > > as the subsystem maintainer.
> > > 
> > > Cc: Brian Norris <computersforpeace@gmail.com>
> > > Cc: David Woodhouse <dwmw2@infradead.org>
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > ---
> > >  MAINTAINERS | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 167e188..d4145f7 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -5554,6 +5554,18 @@ F:	drivers/mtd/
...
> > > +M:	Brian Norris <computersforpeace@gmail.com>
> > > +L:	linux-mtd@lists.infradead.org
> > > +W:	http://www.linux-mtd.infradead.org/
> > > +Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> > > +T:	git http://git.infradead.org/l2-mtd.git
> > 
> > The git tree is an interesting case. l2-mtd.git was really only set up
> > as a secondary tree, not as the official tree. It has moved to being the
> > primary place for development, though, so your entry does reflect
> > reality...
> > 
> 
> Maybe create a new git repository, specially for this?

I think we're due for more consolidation rather than adding new git
trees, so I'd still list linux-mtd.git as the official NAND repo. Plus,
David has previously mentioned that I could eventually just be
committing straight to linux-mtd.git in the future. As it stands now, I
have commit access to it, and for 3.13-rc1, I just pushed l2-mtd.git
straight into linux-mtd.git and then to Linus. So the multi-repository
make-up may eventually make less sense.

> > > +S:	Maintained
> > > +F:	drivers/mtd/nand/
> > > +F:	include/linux/mtd/nand.h
> > > +F:	include/linux/mtd/nand_ecc.h
> > > +F:	include/linux/mtd/nand_bch.h

Brian
