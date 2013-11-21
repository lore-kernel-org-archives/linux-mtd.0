Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjZf9-0004YH-RI
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 19:11:40 +0000
Date: Thu, 21 Nov 2013 16:11:18 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: Add NAND device drivers to MAINTAINERS
Message-ID: <20131121191117.GB3241@localhost>
References: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1384950009-13767-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131121185314.GK9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131121185314.GK9468@ld-irv-0074.broadcom.com>
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

On Thu, Nov 21, 2013 at 10:53:14AM -0800, Brian Norris wrote:
> On Wed, Nov 20, 2013 at 09:20:08AM -0300, Ezequiel Garcia wrote:
> > Add drivers/mtd/nand/ to MAINTAINERS file with Brian Norris
> > as the subsystem maintainer.
> > 
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  MAINTAINERS | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 167e188..d4145f7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5554,6 +5554,18 @@ F:	drivers/mtd/
> >  F:	include/linux/mtd/
> >  F:	include/uapi/mtd/
> >  
> > +NAND DEVICE DRIVERS
> 
> While it would be nice for MTD and NAND to be listed together, I think
> this file is in alphabetical order ("NAND" doesn't come between "MTD"
> and "MEN").
> 

Right, I haven't noticed order.

> Also, I might recommend including "FLASH" in the title: NAND FLASH
> DEVICE DRIVERS.
> 

Sure...

> > +M:	Brian Norris <computersforpeace@gmail.com>
> > +L:	linux-mtd@lists.infradead.org
> > +W:	http://www.linux-mtd.infradead.org/
> > +Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> > +T:	git http://git.infradead.org/l2-mtd.git
> 
> The git tree is an interesting case. l2-mtd.git was really only set up
> as a secondary tree, not as the official tree. It has moved to being the
> primary place for development, though, so your entry does reflect
> reality...
> 

Maybe create a new git repository, specially for this?

> > +S:	Maintained
> > +F:	drivers/mtd/nand/
> > +F:	include/linux/mtd/nand.h
> > +F:	include/linux/mtd/nand_ecc.h
> > +F:	include/linux/mtd/nand_bch.h
> 
> include/linux/mtd/nand*.h?
> include/linux/mtd/bbm.h?
> 

Yes, that's probably better.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
