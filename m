Received: from mailsec108.isp.belgacom.be ([195.238.20.104])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXna9-0007vW-NT
 for linux-mtd@lists.infradead.org; Sat, 27 Sep 2014 08:42:23 +0000
Date: Sat, 27 Sep 2014 10:41:55 +0200 (CEST)
From: Fabian Frederick <fabf@skynet.be>
Reply-To: Fabian Frederick <fabf@skynet.be>
To: josh@joshtriplett.org, Brian Norris <computersforpeace@gmail.com>
Message-ID: <1745266822.710655.1411807315752.open-xchange@webmail.nmp.skynet.be>
In-Reply-To: <20140926231727.GD20917@cloud>
References: <1411065976-20386-1-git-send-email-fabf@skynet.be>
 <20140922181250.GN1193@ld-irv-0074> <20140926231727.GD20917@cloud>
Subject: Re: [PATCH 1/1] jffs2: fix sparse warning: unexpected unlock
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-sparse@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> On 27 September 2014 at 01:17 josh@joshtriplett.org wrote:
>
>
> On Mon, Sep 22, 2014 at 11:12:50AM -0700, Brian Norris wrote:
> > + linux-sparse
> >
> > On Thu, Sep 18, 2014 at 08:46:16PM +0200, Fabian Frederick wrote:
> > > fs/jffs2/summary.c:846:5: warning: context imbalance in
> > > 'jffs2_sum_write_sumnode' - unexpected unlock
> > >
> > > Signed-off-by: Fabian Frederick <fabf@skynet.be>
> > > ---
> > >=C2=A0 fs/jffs2/summary.c | 2 ++
> > >=C2=A0 1 file changed, 2 insertions(+)
> > >
> > > diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
> > > index c522d09..a0bac7b 100644
> > > --- a/fs/jffs2/summary.c
> > > +++ b/fs/jffs2/summary.c
> > > @@ -844,6 +844,8 @@ static int jffs2_sum_write_data(struct jffs2_sb_i=
nfo
> > > *c, struct jffs2_eraseblock
> > >=C2=A0 /* Write out summary information - called from jffs2_do_reserve=
_space */
> > >=C2=A0
> > >=C2=A0 int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
> > > + __releases(&c->erase_completion_lock)
> > > + __acquires(&c->erase_completion_lock)
> >
> > I'm not too familiar with sparse notations, but Documentation/sparse.tx=
t
> > suggests the above is wrong, and the following is more accurate:
> >
> >=C2=A0 =C2=A0 =C2=A0__must_hold(&c->erase_completion_lock)
> >
> > But it looks like there are several other examples which do this.
> > Anyway, here's the relevant doc text, in case someone wants to clarify
> > it for me, or else tell me the documentation is wrong:
> >
> >=C2=A0 =C2=A0 =C2=A0__must_hold - The specified lock is held on function=
 entry and exit.
> >
> >=C2=A0 =C2=A0 =C2=A0__acquires - The specified lock is held on function =
exit, but not entry.
> >
> >=C2=A0 =C2=A0 =C2=A0__releases - The specified lock is held on function =
entry, but not exit.
> >
> > So __acquires and __releases look mutually exclusive, but it's not clea=
r
> > if __must_hold will actually cover what we want. (I haven't tested it.)
>
> __must_hold is indeed the correct annotation.=C2=A0 (There isn't currentl=
y
> anything enforcing that, though.)
>
> - Josh Triplett

There are 137 __releases && __acquires annotated functions in stable.

AFAICS those are based on lock held on function entry / lock held on exit

See
fs/fuse/file.c:1527
fs/kernfs/dir.c:341
drivers/block/nbd.c:564

Does it mean that all of these should be updated to __must_hold ?

Fabian
