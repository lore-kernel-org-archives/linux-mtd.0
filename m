Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY9z3-0000VL-2Q
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 13:27:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id c14so8001015wrr.0
 for <linux-mtd@lists.infradead.org>; Sat, 15 Dec 2018 05:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20181209062133.106781-1-houtao1@huawei.com>
 <ae0156e3-82f7-1ae1-c8dc-2ccf4648fc57@huawei.com>
In-Reply-To: <ae0156e3-82f7-1ae1-c8dc-2ccf4648fc57@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 15 Dec 2018 14:27:33 +0100
Message-ID: <CAFLxGvyR+WNfYPn8Yj_i-1mtvwde4zwiS9he1M8iczEFhZZhjA@mail.gmail.com>
Subject: Re: [PATCH] jffs2: make the overwritten xattr invisible after remount
To: houtao1@huawei.com
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 boris.brezillon@bootlin.com, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 15, 2018 at 2:23 PM Hou Tao <houtao1@huawei.com> wrote:
>
> ping ?

Sorry for the delay.
I'll try now to review all the pending jffs2 patches.

> On 2018/12/9 14:21, Hou Tao wrote:
> > For xattr modification, we do not write a new jffs2_raw_xref with
> > delete marker into flash, so if a xattr is modified then removed,
> > and the old xref & xdatum are not erased by GC, after reboot or
> > remount, the new xattr xref will be dead but the old xattr xref
> > will be alive, and we will get the overwritten xattr instead of
> > non-existent error when reading the removed xattr.
> >
> > Fix it by writing the deletion mark for xattr overwrite.
> >
> > Fixes: 8a13695cbe4e ("[JFFS2][XATTR] rid unnecessary writing of delete marker.")
> > Signed-off-by: Hou Tao <houtao1@huawei.com>
> > ---
> >  fs/jffs2/xattr.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 49 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
> > index da3e18503c65..b2d6072f34af 100644
> > --- a/fs/jffs2/xattr.c
> > +++ b/fs/jffs2/xattr.c
> > @@ -573,6 +573,15 @@ static struct jffs2_xattr_ref *create_xattr_ref(struct jffs2_sb_info *c, struct
> >       return ref; /* success */
> >  }
> >
> > +static void move_xattr_ref_to_dead_list(struct jffs2_sb_info *c,
> > +             struct jffs2_xattr_ref *ref)
> > +{
> > +     spin_lock(&c->erase_completion_lock);
> > +     ref->next = c->xref_dead_list;
> > +     c->xref_dead_list = ref;
> > +     spin_unlock(&c->erase_completion_lock);
> > +}
> > +
> >  static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
> >  {
> >       /* must be called under down_write(xattr_sem) */
> > @@ -582,10 +591,7 @@ static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *re
> >       ref->xseqno |= XREF_DELETE_MARKER;
> >       ref->ino = ref->ic->ino;
> >       ref->xid = ref->xd->xid;
> > -     spin_lock(&c->erase_completion_lock);
> > -     ref->next = c->xref_dead_list;
> > -     c->xref_dead_list = ref;
> > -     spin_unlock(&c->erase_completion_lock);
> > +     move_xattr_ref_to_dead_list(c, ref);
> >
> >       dbg_xattr("xref(ino=%u, xid=%u, xseqno=%u) was removed.\n",
> >                 ref->ino, ref->xid, ref->xseqno);
> > @@ -1090,6 +1096,40 @@ int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
> >       return rc;
> >  }
> >
> > +static void do_jffs2_delete_xattr_ref(struct jffs2_sb_info *c,
> > +             struct jffs2_xattr_ref *ref)
> > +{
> > +     uint32_t request, length;
> > +     int err;
> > +     struct jffs2_xattr_datum *xd;
> > +
> > +     request = PAD(sizeof(struct jffs2_raw_xref));
> > +     err = jffs2_reserve_space(c, request, &length,
> > +                     ALLOC_NORMAL, JFFS2_SUMMARY_XREF_SIZE);
> > +     down_write(&c->xattr_sem);
> > +     if (err) {
> > +             JFFS2_WARNING("jffs2_reserve_space()=%d, request=%u\n",
> > +                             err, request);
> > +             delete_xattr_ref(c, ref);
> > +             up_write(&c->xattr_sem);
> > +             return;
> > +     }
> > +
> > +     xd = ref->xd;
> > +     ref->ino = ref->ic->ino;
> > +     ref->xid = xd->xid;
> > +     ref->xseqno |= XREF_DELETE_MARKER;
> > +     save_xattr_ref(c, ref);
> > +
> > +     move_xattr_ref_to_dead_list(c, ref);
> > +     dbg_xattr("xref(ino=%u, xid=%u, xseqno=%u) was removed.\n",
> > +               ref->ino, ref->xid, ref->xseqno);
> > +     unrefer_xattr_datum(c, xd);
> > +
> > +     up_write(&c->xattr_sem);
> > +     jffs2_complete_reservation(c);
> > +}
> > +
> >  int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
> >                     const char *buffer, size_t size, int flags)
> >  {
> > @@ -1097,7 +1137,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
> >       struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
> >       struct jffs2_inode_cache *ic = f->inocache;
> >       struct jffs2_xattr_datum *xd;
> > -     struct jffs2_xattr_ref *ref, *newref, **pref;
> > +     struct jffs2_xattr_ref *ref, *newref, *oldref, **pref;
> >       uint32_t length, request;
> >       int rc;
> >
> > @@ -1113,6 +1153,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
> >               return rc;
> >       }
> >
> > +     oldref = NULL;
> >       /* Find existing xattr */
> >       down_write(&c->xattr_sem);
> >   retry:
> > @@ -1196,11 +1237,13 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
> >               rc = PTR_ERR(newref);
> >               unrefer_xattr_datum(c, xd);
> >       } else if (ref) {
> > -             delete_xattr_ref(c, ref);
> > +             oldref = ref;
> >       }
> >   out:
> >       up_write(&c->xattr_sem);
> >       jffs2_complete_reservation(c);
> > +     if (oldref)
> > +             do_jffs2_delete_xattr_ref(c, oldref);
> >       return rc;
> >  }
> >
> >
>


-- 
Thanks,
//richard
