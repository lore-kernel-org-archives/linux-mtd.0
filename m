Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e86YM-0002WJ-8p
 for linux-mtd@lists.infradead.org; Fri, 27 Oct 2017 15:28:12 +0000
Received: by mail-qt0-x242.google.com with SMTP id p1so8873733qtg.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 Oct 2017 08:27:49 -0700 (PDT)
Date: Fri, 27 Oct 2017 11:27:46 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
cc: Richard Weinberger <richard@nod.at>,
 Chris Brandt <chris.brandt@renesas.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/5] unconfuse get_unmapped_area and point/unpoint
 driver methods
In-Reply-To: <20171027140651.4032744b@bbrezillon>
Message-ID: <nycvar.YSQ.7.76.1710271120070.3238@knanqh.ubzr>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
 <20171027140651.4032744b@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Oct 2017, Boris Brezillon wrote:

> Hi Nicolas,
> 
> Some of your commits do not have commit messages (just a subject and
> that's all). I know you're an experimented kernel developer and you
> might find this superfluous, but we try to push all MTD contributors to
> write a commit message, even if it's just a one line description that
> basically repeats what the subject line says. Would you mind adding a
> short description to patch 2 and 3.
> 
> Other than that, the changes look good to me, so
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

No problem.

I added a one-liner justification to those commits, and your ACK to the 
series.

This has been pushed here if you wish to pull it:

  http://git.linaro.org/people/nicolas.pitre/linux mtd_point

Or if you prefer that I repost the whole thing just say so and I'll 
oblige.

Thanks.


> On Tue, 17 Oct 2017 11:28:21 -0400
> Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> 
> > This series improves or implements the point and unpoint driver methods
> > and reimplements mtd_get_unmapped_area() in terms of those. Because
> > mtd->_point() provides a superset of what mtd->_get_unmapped_area() does
> > then there is no reason for having both. Or worse: having one but not
> > the other.
> > 
> > This is motivated by my work on XIP cramfs for both MMU and !MMU systems
> > where I do need the more complete point functionality. And it just looks
> > like the right thing to do.
> > 
> > This is also available on top of Linux v4.14-rc3 via git here:
> > 
> >   http://git.linaro.org/people/nicolas.pitre/linux mtd_point
> > 
> > 
> > Changes from v1:
> > 
> > - Fix retlen computation in mtdram.c:ram_point().
> > 
> > - Added Richard Weinberger's REviewd-by tags.
> > 
> > 
> > diffstat:
> > 
> >  drivers/mtd/chips/map_ram.c  | 34 ++++++++++++++++++++--------------
> >  drivers/mtd/chips/map_rom.c  | 34 +++++++++++++++++++++-------------
> >  drivers/mtd/devices/mtdram.c | 36 ++++++++++++++++++++++--------------
> >  drivers/mtd/mtdconcat.c      | 27 ---------------------------
> >  drivers/mtd/mtdcore.c        | 17 ++++++++++++-----
> >  drivers/mtd/mtdpart.c        | 14 --------------
> >  include/linux/mtd/mtd.h      |  4 ----
> >  7 files changed, 75 insertions(+), 91 deletions(-)
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
