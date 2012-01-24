Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RpcL3-0000Du-JO
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2012 09:06:50 +0000
Date: Tue, 24 Jan 2012 09:06:30 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH RFC 2/2] mtd : Make the mtd_suspend return 0 if the
 suspend is not implemented
Message-ID: <20120124090630.GR16726@n2100.arm.linux.org.uk>
References: <1327306361-9803-1-git-send-email-shubhrajyoti@ti.com>
 <1327306361-9803-3-git-send-email-shubhrajyoti@ti.com>
 <CAN8TOE8i-g_QTsidqDW=TRfZMQ8u93+iP8V7rr4paek=7xZ7UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE8i-g_QTsidqDW=TRfZMQ8u93+iP8V7rr4paek=7xZ7UA@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Shubhrajyoti D <shubhrajyoti@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 24, 2012 at 12:09:04AM -0800, Brian Norris wrote:
> Hi,
> 
> On Mon, Jan 23, 2012 at 12:12 AM, Shubhrajyoti D <shubhrajyoti@ti.com> wrote:
> ...
> >  include/linux/mtd/mtd.h |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 1a81fde..c717bb6 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -427,9 +427,9 @@ static inline int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> >
> >  static inline int mtd_suspend(struct mtd_info *mtd)
> >  {
> > -       if (!mtd->suspend)
> > -               return -EOPNOTSUPP;
> > -       return mtd->suspend(mtd);
> > +       if (mtd->suspend)
> > +               return mtd->suspend(mtd);
> > +       return 0;
> >  }
> >
> >  static inline void mtd_resume(struct mtd_info *mtd)
> 
> I believe this fix is already accounted for in Artem Bityutskiy's
> l2-mtd-2.6 repository as:
> 
> commit 091a7fe219ee8d3e76be9e02221433af10c6f574
> mtd: fix MTD suspend
> (http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/091a7fe219ee8d3e76be9e02221433af10c6f574)
> 
> However, the bug made it into the 3.3 merge window, so shouldn't this
> bugfix be sent upstream immediately?

David is the MTD maintainer, and Artem just helps out.  I believe Artem
is waiting for David to finish travelling before asking David (last seen
at Hong Kong airport) to pull these fixes.  David in turn will pass them
onto Linus.  Plus, Linus only started adding to -rc1 yesterday, so its a
little early to expect this to be fixed.
