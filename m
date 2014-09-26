Received: from relay3-d.mail.gandi.net ([2001:4b98:c:538::195])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXelx-0005q6-Nl
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 23:17:59 +0000
Date: Fri, 26 Sep 2014 16:17:27 -0700
From: josh@joshtriplett.org
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/1] jffs2: fix sparse warning: unexpected unlock
Message-ID: <20140926231727.GD20917@cloud>
References: <1411065976-20386-1-git-send-email-fabf@skynet.be>
 <20140922181250.GN1193@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140922181250.GN1193@ld-irv-0074>
Cc: Fabian Frederick <fabf@skynet.be>, David Woodhouse <dwmw2@infradead.org>,
 linux-sparse@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 22, 2014 at 11:12:50AM -0700, Brian Norris wrote:
> + linux-sparse
> 
> On Thu, Sep 18, 2014 at 08:46:16PM +0200, Fabian Frederick wrote:
> > fs/jffs2/summary.c:846:5: warning: context imbalance in 'jffs2_sum_write_sumnode' - unexpected unlock
> > 
> > Signed-off-by: Fabian Frederick <fabf@skynet.be>
> > ---
> >  fs/jffs2/summary.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
> > index c522d09..a0bac7b 100644
> > --- a/fs/jffs2/summary.c
> > +++ b/fs/jffs2/summary.c
> > @@ -844,6 +844,8 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
> >  /* Write out summary information - called from jffs2_do_reserve_space */
> >  
> >  int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
> > +	__releases(&c->erase_completion_lock)
> > +	__acquires(&c->erase_completion_lock)
> 
> I'm not too familiar with sparse notations, but Documentation/sparse.txt
> suggests the above is wrong, and the following is more accurate:
> 
> 	__must_hold(&c->erase_completion_lock)
> 
> But it looks like there are several other examples which do this.
> Anyway, here's the relevant doc text, in case someone wants to clarify
> it for me, or else tell me the documentation is wrong:
> 
>     __must_hold - The specified lock is held on function entry and exit.
> 
>     __acquires - The specified lock is held on function exit, but not entry.
> 
>     __releases - The specified lock is held on function entry, but not exit.
> 
> So __acquires and __releases look mutually exclusive, but it's not clear
> if __must_hold will actually cover what we want. (I haven't tested it.)

__must_hold is indeed the correct annotation.  (There isn't currently
anything enforcing that, though.)

- Josh Triplett
