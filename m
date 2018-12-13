Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXYv8-00023z-7i
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 21:53:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id x10so3519082wrs.8
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 13:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20181020110753.98407-1-houtao1@huawei.com>
 <20181209075256.43ca759f@bbrezillon>
In-Reply-To: <20181209075256.43ca759f@bbrezillon>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 13 Dec 2018 22:53:02 +0100
Message-ID: <CAFLxGvyfM4tKH8hVoWDuYcojcHOQABvvDKZd1Mwbc8TMC5R5Jw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix invocations of dbg_xattr() for dead
 jffs2_xattr_ref
To: boris.brezillon@bootlin.com
Cc: houtao1@huawei.com, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 9, 2018 at 7:52 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Sat, 20 Oct 2018 19:07:53 +0800
> Hou Tao <houtao1@huawei.com> wrote:
>
> > When jffs2_xattr_ref is dead, xref->ic or xref->xd will be invalid
> > because these fields will be reused as xref->ino or xref->xid,
> > so access xref->ic->ino or xref->xd->xid will lead to Oops.
> >
> > Fix the problem by checking whether or not it is a dead xref.
> >
> > Signed-off-by: Hou Tao <houtao1@huawei.com>
> > ---
> >  fs/jffs2/xattr.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
> > index 3d40fe02b003..0c4c7891556d 100644
> > --- a/fs/jffs2/xattr.c
> > +++ b/fs/jffs2/xattr.c
> > @@ -550,7 +550,8 @@ static int save_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
> >       ref->xseqno = xseqno;
> >       jffs2_add_physical_node_ref(c, phys_ofs | REF_PRISTINE, PAD(sizeof(rr)), (void *)ref);
> >
> > -     dbg_xattr("success on saving xref (ino=%u, xid=%u)\n", ref->ic->ino, ref->xd->xid);
> > +     dbg_xattr("success on saving xref (ino=%u, xid=%u)\n",
> > +                     je32_to_cpu(rr.ino), je32_to_cpu(rr.xid));
>
> Nit: align the second line on the open parens (same applies to the
> other chunk).
>
> Sorry, I can't comment on the actual change. I'll let Richard look
> at it.
>
> >
> >       return 0;
> >  }
> > @@ -1329,7 +1330,11 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
> >       rc = save_xattr_ref(c, ref);
> >       if (!rc)
> >               dbg_xattr("xref (ino=%u, xid=%u) GC'ed from %#08x to %08x\n",
> > -                       ref->ic->ino, ref->xd->xid, old_ofs, ref_offset(ref->node));
> > +                             is_xattr_ref_dead(ref) ?
> > +                                     ref->ino : ref->ic->ino,
> > +                             is_xattr_ref_dead(ref) ?
> > +                                     ref->xid : ref->xd->xid,
> > +                             old_ofs, ref_offset(ref->node));
> >   out:
> >       if (!rc)
> >               jffs2_mark_node_obsolete(c, raw);
>

Since is_xattr_ref_dead() is cheap, can you please add two macros.
Something like:
static inline uint32_t xattr_ref_ino(struct jffs2_xattr_ref *ref) {
 if (is_xattr_ref_dead(ref))
  return ref>ino;
 else
  return ref->ic->ino;
}

Same for xid.
-- 
Thanks,
//richard
