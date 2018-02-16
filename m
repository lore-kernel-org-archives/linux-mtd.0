Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emk4z-0006PR-3G
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 17:46:11 +0000
Date: Fri, 16 Feb 2018 18:45:37 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Shreeya Patel <shreeya.patel23498@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, outreachy-kernel
 <outreachy-kernel@googlegroups.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH NAND 0/5] Replace printk statements with pr_*macros
Message-ID: <20180216184537.3cd1e414@bbrezillon>
In-Reply-To: <CAAEAJfAg_hei2PF37_oX2tf+Mv43ye-nEOt+KRVFerp1Jfzn2Q@mail.gmail.com>
References: <cover.1518797480.git.shreeya.patel23498@gmail.com>
 <CAAEAJfAg_hei2PF37_oX2tf+Mv43ye-nEOt+KRVFerp1Jfzn2Q@mail.gmail.com>
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

On Fri, 16 Feb 2018 14:19:41 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> Hi Shreeya,
> 
> Thanks for the contribution.
> 
> On 16 February 2018 at 13:50, Shreeya Patel
> <shreeya.patel23498@gmail.com> wrote:
> > This patchset removes all the log levels i.e. KERN_WARN,
> > KERN_NOTICE, KERN_ERR, KERN_INFO, KERN_DEBUG used in the printk
> > statements and replaces the printk statements with appropriate
> > pr_*macros.
> > According to the kernel coding style, pr_*macro is the preferred
> > way to print the message.
> >  
> 
> So, two things to begin with.
> 
> First of all, despite this contribution being part of outreachy,
> I believe you can include mailing lists in your case.
> 
> In other words, don't use the "nol" option in get_maintainer
> script and Cc the MTD mailing list: linux-mtd at lists.infradead.org.
> 
> >
> > Shreeya Patel (5):
> >   mtd/nand: Replace printk with pr_warn
> >   mtd/nand: Replace printk with pr_notice
> >   mtd/nand: Replace printk with pr_err
> >   mtd/nand: Replace printk with pr_info
> >   mtd/nand: Replace printk with pr_debug

Nitpick: prefix should be "mtd: nand: ".

> >  
> 
> This is a non-usual split. We usually split patches per-driver,
> instead of grouping all the pr_{} of a given type together.

I agree.

> 
> Can you re-do the series? Grouping the changes per-driver,
> i.e. all the pr_{} changes in cafe_nand.c together, and so on.

Actually, for such simple/automatic changes you can even group things
in a single patch. I'm fine either way.

> 
> >  drivers/mtd/nand/ams-delta.c     |  4 +--
> >  drivers/mtd/nand/cafe_nand.c     |  4 +--
> >  drivers/mtd/nand/cs553x_nand.c   |  8 ++---
> >  drivers/mtd/nand/diskonchip.c    | 76 +++++++++++++++++++++-------------------
> >  drivers/mtd/nand/fsl_elbc_nand.c |  4 +--
> >  drivers/mtd/nand/fsl_ifc_nand.c  |  2 +-
> >  drivers/mtd/nand/mxc_nand.c      |  2 +-
> >  drivers/mtd/nand/nand_bch.c      | 12 +++----
> >  drivers/mtd/nand/nandsim.c       | 10 +++---
> >  drivers/mtd/nand/r852.c          |  2 +-
> >  drivers/mtd/nand/r852.h          |  6 ++--
> >  drivers/mtd/nand/sh_flctl.c      |  2 +-
> >  drivers/mtd/nand/sm_common.c     |  5 ++-
> >  13 files changed, 70 insertions(+), 67 deletions(-)
> >
> > --
> > 2.7.4
> >  
> 
> 
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
